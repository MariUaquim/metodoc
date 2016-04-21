require 'test_helper'

class FormalityDegreeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def setup
    @d = FormalityDegree.new(:name=>"grau de formalidade")
  end

  test "should have a name" do
    @d.name = nil
    assert_equal(false,@d.save,"Deve possuir um nome")
  end
end
