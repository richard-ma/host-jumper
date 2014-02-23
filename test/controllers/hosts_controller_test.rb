require 'test_helper'

class HostsControllerTest < ActionController::TestCase

  setup do
    @host = hosts(:one)
  end

  test "should get index" do
    sign_in admins(:admin)

    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end

  test "should get new" do
    sign_in admins(:admin)

    get :new
    assert_response :success
  end

  test "should create host" do
    sign_in admins(:admin)

    assert_difference('Host.count') do
      post :create, host: { ip: @host.ip, name: @host.name, port: @host.port, suffix: @host.suffix, token: @host.token }
    end

    assert_redirected_to host_path(assigns(:host))
  end

  test "should show host" do
    sign_in admins(:admin)

    get :show, id: @host
    assert_response :success
  end

  test "should get edit" do
    sign_in admins(:admin)

    get :edit, id: @host
    assert_response :success
  end

  test "should update host" do
    sign_in admins(:admin)

    patch :update, id: @host, host: { ip: @host.ip, name: @host.name, port: @host.port, suffix: @host.suffix, token: @host.token }
    assert_redirected_to host_path(assigns(:host))
  end

  test "should destroy host" do
    sign_in admins(:admin)

    assert_difference('Host.count', -1) do
      delete :destroy, id: @host
    end

    assert_redirected_to hosts_path
  end
end
