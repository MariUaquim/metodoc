class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers, :id => false do |t|
      t.text :answer
      t.references :document, :question, :type_answer
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
