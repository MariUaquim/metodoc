class CreateArtefactModels < ActiveRecord::Migration
  def self.up
    create_table :artefact_models do |t|
      t.column  :name, :string, :nil=>false, :limit=>250
      t.column  :filename, :string, :nil=>false, :limit=>250
      t.timestamps
    end
  end

  #ArtefactModel.create(:name=>"Modelo 1", :filename=>"artefact_model_1")
  #ArtefactModel.create(:name=>"Modelo 2", :filename=>"artefact_model_2")

  def self.down
    drop_table :artefact_models
  end
end
