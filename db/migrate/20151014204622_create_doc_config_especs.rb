class CreateDocConfigEspecs < ActiveRecord::Migration
  def self.up
    create_table :doc_config_especs do |t|
      t.string :name
      t.string :destination

      t.timestamps
    end
  end

  def self.down
    drop_table :doc_config_especs
  end
end
