class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.references :term_type, :version
      t.column  :name, :string, :nill=>false, :limit=>200
      t.column  :description, :text, :nil=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
