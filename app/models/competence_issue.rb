class CompetenceIssue < ActiveRecord::Base
  belongs_to :version
  belongs_to :artefact_status
  validates_presence_of :artefact_status_id
  validates_presence_of :version_id
  validates_presence_of :question
  validates_length_of :question, :within => 4..250


  def self.general_status(version_id)
    rascunho = ArtefactStatus.find_by_description("Rascunho")
    if self.find(:first, :conditions=>{:version_id=>version_id, :artefact_status_id=>rascunho.id})
      rascunho.description
    else
      revisao = ArtefactStatus.find_by_description("Revisão Pendente")
      if self.find(:first, :conditions=>{:version_id=>version_id, :artefact_status_id=>revisao.id})
        revisao.description
      else
        finalizado = ArtefactStatus.find_by_description("Finalizado")
        if self.find(:first, :conditions=>{:version_id=>version_id, :artefact_status_id=>finalizado.id})
          finalizado.description
        else
          "Não Criado"
        end
      end
    end
  end

end
