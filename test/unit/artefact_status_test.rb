require 'test_helper'

class ArtefactStatusTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def setup
    @as = ArtefactStatus.new(:description=>"Rascunho")
  end

  test "should have a description" do
    @as.description = nil
    assert_equal(false, @as.save, "Deve possuir uma descricao")
  end

end
