require 'test_helper'
require 'user'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(:name =>"Matheus", :mail =>"matheus@webcomfarinha.com",
    :login => "matheus", :password => "juliana")
  end

  test "should have a name" do
    @user.name = nil
    assert_equal(false, @user.save, "Usuario salvo sem nome")
  end

  test "should have a mail" do
    @user.mail = nil
    assert_equal(false, @user.save, "usuario salvo sem email")
  end

  test "should have a login" do
    @user.login = nil
    assert_equal(false, @user.save, "Usuario salvo sem login")
  end

  test "should have a password" do
    @user.password = nil
    assert_equal(false, @user.save, "Usuario salvo sem senha")
  end

  test "should mail be unique" do
    assert_equal(true, @user.save, "Usuario deve ser salvo normal aqui")
    user1 = User.new(:name => "iojijijij", :mail => @user.mail, :login => "qualquer login", :password => "ijjiojiojio")
    assert_equal(false, user1.save, "Email deve ser unico")
  end

  test "should login be unique" do
    assert_equal(true, @user.save, "Usuario deve ser salvo normal aqui")
    user1 = User.new(:name => "iojijijij", :mail => "outroemail", :login => @user.login, :password => "ijjiojiojio")
    assert_equal(false, user1.save, "Login deve ser unico")
  end

  test "should deny wrong format in mail" do
    @user.mail = "bad@format"
    assert_equal(false, @user.save, "Email deve possuir formato correto")
  end

  test "should has login correct lenght" do
    @user.login = "12"
    assert_equal(false, @user.save,"Tamanho do login menor que 3")
    @user.login = "a" * 31
    assert_equal(false, @user.save, "Tamanho do login maior que 30")
  end

  test "should has mail correct lenght" do
    @user.mail = "@1.1"
    assert_equal(false, @user.save, "Tamanho do email menor que 5")
    @user.mail = "a" * 51
    assert_equal(false, @user.save, "Tamanho do email maior que 50")
  end

  test "should check name lenght" do
    @user.name = "@1"
    assert_equal(false, @user.save, "Tamanho do nome menor que 3")
    @user.name = "a" * 101
    assert_equal(false, @user.save, "Tamanho do nome maior que 100")
  end

end