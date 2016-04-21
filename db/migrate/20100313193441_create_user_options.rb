class CreateUserOptions < ActiveRecord::Migration
  def self.up
    create_table :user_options do |t|
      t.references  :user, :artefact_model
      t.timestamps
    end
  end

  def self.down
    drop_table :user_options
  end
end
