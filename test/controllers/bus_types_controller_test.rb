require 'test_helper'

class BusTypesControllerTest < ActionController::TestCase
  setup do
    @bus_type = bus_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_type" do
    assert_difference('BusType.count') do
      post :create, bus_type: { capacity: @bus_type.capacity, created_by: @bus_type.created_by, facility: @bus_type.facility, left: @bus_type.left, name: @bus_type.name, right: @bus_type.right, slug: @bus_type.slug, updated_by: @bus_type.updated_by }
    end

    assert_redirected_to bus_type_path(assigns(:bus_type))
  end

  test "should show bus_type" do
    get :show, id: @bus_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_type
    assert_response :success
  end

  test "should update bus_type" do
    patch :update, id: @bus_type, bus_type: { capacity: @bus_type.capacity, created_by: @bus_type.created_by, facility: @bus_type.facility, left: @bus_type.left, name: @bus_type.name, right: @bus_type.right, slug: @bus_type.slug, updated_by: @bus_type.updated_by }
    assert_redirected_to bus_type_path(assigns(:bus_type))
  end

  test "should destroy bus_type" do
    assert_difference('BusType.count', -1) do
      delete :destroy, id: @bus_type
    end

    assert_redirected_to bus_types_path
  end
end
