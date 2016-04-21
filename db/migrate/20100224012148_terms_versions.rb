class TermsVersions < ActiveRecord::Migration
  def self.up
    create_table :terms_versions, :id => false do |t|
      t.references :term, :version
    end
  end

  def self.down
    drop_table  :terms_versions
  end
end
