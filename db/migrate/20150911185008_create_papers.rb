class CreatePapers < ActiveRecord::Migration
  def self.up
    create_table :papers do |t|
      t.column  :paper, :string, :nil=>false, :limit=>250
      t.timestamps
    end
  end

  def self.down
    drop_table :papers
  end
end
