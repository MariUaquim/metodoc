class CreateFormalityDegrees < ActiveRecord::Migration
  def self.up
    create_table :formality_degrees do |t|
      t.column  :name, :string, :nil=>false, :limit=>250
      t.timestamps
    end
    #FormalityDegree.create(:name=>"Altamente Informal")
    #FormalityDegree.create(:name=>"Semi-Informal")
    #FormalityDegree.create(:name=>"Formal")
    #FormalityDegree.create(:name=>"Altamente Formal")
  end
  

  def self.down
    drop_table :formality_degrees
  end
end
