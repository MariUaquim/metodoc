require 'test_helper'

class ArtefactModelTest < ActiveSupport::TestCase

  def setup
    @a = ArtefactModel.new(:name=>"nome", :filename=>"nome.css")
  end

  test "should have a name" do
    @a.name = nil
    assert_equal(false,@a.save,"Arquivo deve possuir uma descriçao")
  end

  test "should have a filename" do
    @a.filename = nil
    assert_equal(false, @a.save, "Arquivo deve possuir um nome")
  end
end
