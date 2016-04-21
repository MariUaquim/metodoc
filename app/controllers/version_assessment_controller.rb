class VersionAssessmentController < ApplicationController
  before_filter :authenticate
  before_filter :check_permission, :except => [:authenticate]
  before_filter :load_artefact_status, :only => [:edit]


  def edit
    if params[:id]
      @version_assessment = VersionAssessment.find(params[:id])
      @version_id = @version_assessment.version.id
    else
      @version_assessment = VersionAssessment.new
      @version_assessment.artefact_status = ArtefactStatus.find(:first)
      @version_assessment.technical_assessment = "<h3>Todos os requisitos estão bem definidos?</h3>
      <p>responda aqui</p><h3>A ontologia é confiável?</h3><p>responda aqui</p>
      <h3>Cada etapa do ciclo de vida satisfaz os critérios de qualidade?</h3><p>responda aqui</p>
      <h3>O produto gerado em cada etapa atende as necessidades da etapa seguinte?</h3><p>responda aqui</p>
      <h3>As tecnologias utilizadas satisfazem?</h3><p>responda aqui</p>
      <h3>Todas as fontes de informação são confiáveis?</h3><p>responda aqui</p>
      <h3>Todas as documentações produzidas estão corretas?</h3><p>responda aqui</p>
      <h3>A integridade das informações é mantida?</h3><p>responda aqui</p>"
      @version_assessment.user_assessment = "<h3>Usabilidade</h3><p>responda aqui</p>
      <h3>Acessibilidade</h3><p>responda aqui</p><h3>Reutilizaçao</h3><p>responda aqui</p>"
      @version_id = params[:version_id]
    end
    if request.post?
      @version_assessment.attributes = params[:version_assessment]
      if @version_assessment.save
        redirect_to :controller => 'version', :action => 'show', :id => @version_assessment.version.id
      else
        redirect_to :controller => 'authentication', :action => 'error'
      end
    end
  end

  def show
    @document = VersionAssessment.find(params[:id])
  end

  def print
    @document = VersionAssessment.find(params[:id])
    render :layout=>'artefact'
  end

  def print_xml
    @document = VersionAssessment.find(params[:id])
    render :xml => @document
  end

  def check_permission
    if params[:id]
      unless User.permission(session[:user_id], VersionAssessment.find(params[:id]).version.ontology.id)
        redirect_to :controller=>'authentication', :action => 'access_denied'
      end
    else
      unless request.post?#tratar tambem a checagem quando há request!!!
        unless User.permission(session[:user_id], Version.find(params[:version_id]).ontology.id)
          redirect_to :controller=>'authentication', :action => 'access_denied'
        end
      end
    end
  end

end
