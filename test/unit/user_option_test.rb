require 'test_helper'

class UserOptionTest < ActiveSupport::TestCase

  def setup
    @o = UserOption.new(:user_id=>1, :artefact_model_id=>1)
  end

  test "should have a user" do
    @o.user_id = nil
    assert_equal(false, @o.save, "Deve possuir um usuário")
  end

  test "should have a unique user" do
    assert_equal(true, @o.save, "Deve salvar normal aqui")
    x = UserOption.new(:user_id=>@o.user_id, :artefact_model_id=>1)
    assert_equal(false, x.save, "Usuario deve possuir unica opcao")
  end

  test "should have a artefact model" do
    @o.artefact_model_id = nil
    assert_equal(false, @o.save, "Deve possuir modelo de artefato definido")
  end
end
