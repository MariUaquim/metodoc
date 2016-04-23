require "rubygems"
require "builder"
require "nokogiri"
require 'open-uri'

class GlossaryController < ApplicationController
  before_filter :authenticate, :except => [:authenticate,:arquivo, :integracao]
  before_filter :check_permission, :except =>[:authenticate, :load_term_types, :arquivo, :manual, :integracao]
  before_filter :load_term_types, :only => [ :edit, :show, :manual, :integracao]
  before_filter :load_glossary, :only => [ :show]
  before_filter :load_artefact_status, :only =>  [:edit]
  before_filter :load_ontologias


def integracao
if params[:string]
pesquisa = params[:string]
doc = Nokogiri::HTML(open("http://prefix.cc/"+pesquisa))

@entries = doc.css('.namespace-link')
end
end

def product_xml

@types = TermType.find(:all)
@glossary = Term.find(:all, :conditions=>["version_id = ?", 1])
@ontology = Ontology.find(1)

builder = Nokogiri::XML::Builder.new do |xml|
  
  xml.Ontology(:xmlns=>"http://www.w3.org/2002/07/owl#",
               'xmlns:rdfs'=>"http://www.w3.org/2000/01/rdf-schema#",
               'xmlns:xsd'=>"http://www.w3.org/2001/XMLSchema#",
               'xmlns:rdf'=>"http://www.w3.org/1999/02/22-rdf-syntax-ns#",
               'xmlns:xml'=>"http://www.w3.org/XML/1998/namespace") do 

      xml.Prefix(:name=>"", :IRI=>"http://www.w3.org/2002/07/owl#")
      xml.Prefix(:name=>"owl", :IRI=>"http://www.w3.org/2002/07/owl#")
      xml.Prefix(:name=>"rdf", :IRI=>"http://www.w3.org/1999/02/22-rdf-syntax-ns#")
      xml.Prefix(:name=>"xsd", :IRI=>"http://www.w3.org/2001/XMLSchema#")
      xml.Prefix(:name=>"rdfs", :IRI=>"http://www.w3.org/2000/01/rdf-schema#")

      @glossary.each do |termo|
        case termo.term_type_id
        when 1..4
		xml.Declaration{
		   case termo.term_type_id
		        when 1
		          xml.Class_ (:IRI=>"#"+termo.name)
			when 2
			  xml.DataProperty_ (:IRI=>"#"+termo.name)
			when 3
			  xml.NamedIndividual_ (:IRI=>"#"+termo.name)
			else
			  xml.ObjectProperty_ (:IRI=>"#"+termo.name)
			end
		}
	when 5
	       #restrição de classe
	when 6
		#termo a definir
	when 7
		#termo abandonado
	when 8
		#função
	when 9
		#axioma
	end     
      end
  end
end
textxml = builder.to_xml
directory = "/home/mariana/Documentos/metodoc/app/views/glossary/arquivos/"+@ontology.name+".owl"
File.open(directory, "w") { 
|f| f.write(textxml) 
}

redirect_to :action=>'manual', :document_id=>26, :version_id=>1


end


  def manual
    @documento = Document.find(params[:document_id])
    @version = Version.find(params[:version_id])
    @glossary = Term.find(:all, :conditions=>["version_id = ?", @version.id])
    @types = TermType.find(:all)

    if request.post?
	@termo = Term.new
        @termo.attributes = params[:term]
        @termo.attributes = {:version_id => 1, :artefact_status_id=>1}
        @termo.save
    end
  end

  def arquivo
       @documento = Document.find(params[:document_id])
       @glossary = Term.find(:all, :conditions=>["version_id = ?", params[:version_id]])
    if request.post?
       @documento = Document.find(params[:document_id])
       name = params[:upload][:file].original_filename
       directory = "/home/mariana/Documentos/metodoc/app/views/glossary/arquivos"
       path = File.join(directory, name)
       new_name = @documento.id.to_s + ".owl"
       File.open(path, "wb") { |f| f.write(params[:upload][:file].read) 
          File.rename(path, directory + "/" + new_name )
          redirect_to :action=>'arquivo', :document_id=>@documento.id, :version_id=>params[:version_id]
       }
    end
    flash[:notice] = "File uploaded"
  end

  def edit

    @documento = Document.find(params[:document_id])
    @version = Version.find(params[:version_id])

    vClasses = params[:vClasse].split(',')
    vPropriedade = params[:vPropriedade].split(',')

    terms = Term.find(:all, :conditions=>["version_id = ?", @version.id])
    terms.each do |t|
	t.destroy
    end

    vClasses.each do |c| 
       @term = Term.new
       if vPropriedade.include?(c)
	   type_id = 4
       else
 	   type_id = 1
       end         
       @term.attributes = {:term_type_id => type_id, :name => c, :description => "test", :artefact_status_id=>1, :version_id => @version.id}
       @term.save
       
    end 

    redirect_to :action=>'arquivo', :document_id=>@documento.id, :version_id=>@version.id
  end

  def destroy
    term = Term.find(params[:id])
    if term.destroy
      redirect_to :action => 'index', :version_id => params[:version_id]
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :message => 'Efetue o Login'
    end
  end

  def check_permission
    if params[:id]
        unless User.permission(session[:user_id], Term.find(params[:id]).versions[0].ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
        #if params[:version_id]
        #  for v in Term.find(params[:id]).versions
        #    if params[:version_id] != v.id
        #      redirect_to :controller=>'authentication', :action => 'access_denied'
        #    end
        #  end
        #end
    else
      if params[:version_id]
        unless User.permission(session[:user_id], Version.find(params[:version_id]).ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
      end
    end
  end

  protected
  def load_term_types
    @term_types = TermType.all.collect { |u| [u.description, u.id] }
  end

  def load_ontologias
    @ontologias = Ontology.all
  end

 def load_glossary
    unless params[:term_type]
      term_type = 1#pegar o ID de um tipo cadastrado
    else
      term_type = params[:term_type]
    end
    current_version = Version.find(params[:version_id])
    @version_id = current_version.id
    @glossary = Term.find_terms_by_type(current_version.id, term_type)
    @term_type = TermType.find(term_type)
  end
  
end
