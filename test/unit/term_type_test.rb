require 'test_helper'

class TermTypeTest < ActiveSupport::TestCase

  def setup
    @type = TermType.new(:description =>"Tipo")
  end

  test "should have a description" do
    @type.description = nil
    assert_equal(false, @type.save, "Deve possuir uma descrição")
  end

  test "should check a description lenght" do
    @type.description = "123"
    assert_equal(false, @type.save, "Tamanho deve ser maior que 3")
    @type.description = "1" * 251
    assert_equal(false, @type.save, "Tamanho deve ser menor que 251")
  end
end
