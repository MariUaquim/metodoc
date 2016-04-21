u1 = User.create(:name =>"Matheus Andrade", :mail => "matheus@webcomfarinha.com",
:login => "matheus", :password => "49339465c068fb48e796b4e68bdd35d5")

ArtefactModel.create(:name=>"Modelo 1", :filename=>"artefact_model_1")
ArtefactModel.create(:name=>"Modelo 2", :filename=>"artefact_model_2")

ArtefactStatus.create(:description => "Rascunho")
ArtefactStatus.create(:description => "Revisão Pendente")
ArtefactStatus.create(:description => "Finalizado")

FormalityDegree.create(:name=>"Altamente Informal")
FormalityDegree.create(:name=>"Semi-Informal")
FormalityDegree.create(:name=>"Formal")
FormalityDegree.create(:name=>"Altamente Formal")

TermType.create(:description => 'Classe')
TermType.create(:description => 'Propriedade de Dados')
TermType.create(:description => 'Instância de Classe')
TermType.create(:description => 'Relação entre Classe')
TermType.create(:description => 'Restrição de Classe')
TermType.create(:description => 'Termo a Definir')
TermType.create(:description => 'Termo Abandonado')


o1 = Ontology.create(:project_name =>'Ontologia da Classificação Brasileira de Ocupações', :name => 'OntoCBO', :visible => 1, :domain => 'Ramos ocupacionais do mercado de trabalho brasileiro', :formality_degree => FormalityDegree.find(:first))
o1.users << u1
o2 = Ontology.create(:project_name =>'Ontologia teste', :name => 'OntoT', :visible => 1, :domain => 'primeiro teste', :formality_degree => FormalityDegree.find(:first))
o2.users << u1
