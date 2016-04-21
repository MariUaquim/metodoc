class CreateTermTypes < ActiveRecord::Migration
  def self.up
    create_table :term_types do |t|
      t.column  :description, :string, :nil => false, :limit => 200
      t.timestamps
    end
  end

  def self.down
    drop_table :term_types
  end
end
