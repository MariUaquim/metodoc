class RemoveResponsibleFromProjectFeasibilities < ActiveRecord::Migration
  def self.up
    remove_column :project_feasibilities, :responsible
  end

  def self.down
    add_column  :project_feasibilities, :responsible, :string, :nil => false, :limit => 250
  end
end
