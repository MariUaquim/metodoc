class User < ActiveRecord::Base

  has_many :ontology_user, :dependent => :destroy
  has_many :ontology, :through => :ontology_user
  has_many :paper, :through => :ontology_user
  has_many :responsable
  #has_and_belongs_to_many :ontologies
  

  has_one :user_option
  validates_presence_of :name
  validates_presence_of :mail
  validates_presence_of :login
  validates_presence_of :password
  validates_uniqueness_of :mail
  validates_uniqueness_of :login
  validates_length_of :name, :within => 3..100
  validates_length_of :login, :within => 3..30
  validates_length_of :mail, :within => 5..50
  validates_format_of :mail, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  def self.check(login,pass)
    self.find(:first, :conditions=>{:login=>login,:password=>md5(pass)}) != nil
  end

  def self.permission(user_id, ontology_id)
    o = Ontology.find(ontology_id)
    o.user.each do |u|
      return true if u.id == user_id
    end
    return false
  end

  def self.md5(valor)
    Digest::MD5.hexdigest valor
  end

end
