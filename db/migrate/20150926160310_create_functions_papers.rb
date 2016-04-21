class CreateFunctionsPapers < ActiveRecord::Migration
  def self.up
    create_table :functions_papers , :id => false do |t|
      t.references :function, :paper
    end
  end

  def self.down
    drop_table :functions_papers
  end
end
