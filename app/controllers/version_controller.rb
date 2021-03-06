class VersionController < ApplicationController
  before_filter :authenticate, :except => [:authenticate]
  before_filter :check_permission, :except => [:authenticate, :create]
  before_filter :load_docs, :only=>[:show]

  def create
    #check permission
    unless User.permission(session[:user_id], params[:ontology_id])
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
    ####
    existing_versions = Version.find(:all, :conditions =>{:ontology_id => params[:ontology_id]})
    if existing_versions.size < 1
      number = 1
    else
      number = existing_versions.size + 1
    end
    new = Version.new(:ontology_id => params[:ontology_id], :number => number)
    if new.save
      
      #copiando vocabulario de termos da antiga para nova versao
      if number > 1
        previous_version_id = Version.find(:first, :conditions=>{:ontology_id=> new.ontology_id,
        :number=> number-1}).id
        glossary = Term.find_terms(previous_version_id)
        for term in glossary
          t = Term.new(:term_type => term.term_type, :artefact_status => ArtefactStatus.find(1),
          :name => term.name, :description => term.description)
          t.versions << Version.find(new.id) if t.save
        end
      end
      
      redirect_to :controller => 'ontology', :action => 'show', :id => params[:ontology_id]
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end

  def show
    @ontologias = Ontology.all
    @ontology = Ontology.find(params[:ontology_id])
    @version = Version.find(params[:id])
    @permisionFunction = Function.deUsuario(params[:ontology_id], session[:user_id]).include?(Function.find(1)) 
    @etapas = Methodstep.find(:all, :conditions=>["methodsteps.methodology_id = ? AND methodsteps.inlifecycle=?",@ontology.methodology_id,true])

    #@version_description = VersionDescription.find_by_version_id(@version.id)
    #@version_feasibility = VersionFeasibility.find_by_version_id(@version.id)
    #@version_schedule_general_status = VersionSchedule.general_status(@version.id)
    #@knowledge_acquisition = KnowledgeAcquisition.find_by_version_id(@version.id)
    #@competence_issue_general_status = CompetenceIssue.general_status(@version.id)
    #@version_evaluation = VersionEvaluation.find_by_version_id(@version.id)
    #@glossary_general_status = Term.general_status(@version.id)
    #@version_assessment = VersionAssessment.find_by_version_id(@version.id)
    
  end

  def destroy
    version = Version.find(params[:id])
    version_id = version.id
    ontology_id = version.ontology.id
    Version.destroy_all_terms(version_id)
    if version.destroy
      redirect_to :controller => 'ontology', :action => 'show', :id=> ontology_id
    else
      redirect_to :controller => 'authentication', :action => 'error'
    end
  end



  def authenticate
    if session[:user_id].nil?
      redirect_to :controller=>'authentication', :action =>'index', :fail => true
    end
  end

  def check_permission
    unless User.permission(session[:user_id], Version.find(params[:id]).ontology.id)
      redirect_to :controller=>'authentication', :action => 'access_denied'
    end
  end


  def load_docs
    @docs = Document.find_by_sql(["select doc_types.name as name, documents.id as id from documents inner join doc_types on documents.doc_type_id = doc_types.id inner join doc_type_configs on doc_type_configs.doc_type_id = doc_types.id inner join versions on versions.id = documents.version_id inner join ontologies on ontologies.id = versions.ontology_id where ontologies.id = ? and doc_type_configs.doc_config_espec_id = 2 union select doc_types.name as name, documents.id as id from documents inner join doc_types on documents.doc_type_id = doc_types.id inner join doc_type_configs on doc_type_configs.doc_type_id = doc_types.id inner join ontologies on ontologies.id = documents.ontology_id where ontologies.id = ? and doc_type_configs.doc_config_espec_id = 2", params[:ontology_id], params[:ontology_id]]).collect { |d| [d.name, d.id] }
  end
end
