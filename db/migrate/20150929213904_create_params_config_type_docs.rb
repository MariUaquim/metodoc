class CreateParamsConfigTypeDocs < ActiveRecord::Migration
  def self.up
    create_table :params_config_type_docs do |t|
      t.string :description
      t.text :text_start

      t.timestamps
    end
  end

  def self.down
    drop_table :params_config_type_docs
  end
end
