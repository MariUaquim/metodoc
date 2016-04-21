class CreateDocTypeConfigs < ActiveRecord::Migration
  def self.up
    create_table :doc_type_configs, :id=>false do |t|
      t.boolean :answer, :default=>true
      t.references :doc_type, :params_config_Type_Doc, :doc_config_espec
      t.timestamps
    end
  end

  def self.down
    drop_table :doc_type_configs
  end
end
