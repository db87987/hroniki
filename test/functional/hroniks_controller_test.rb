require 'test_helper'

class HroniksControllerTest < ActionController::TestCase
  setup do
    @hronik = hroniks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hroniks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hronik" do
    assert_difference('Hronik.count') do
      post :create, hronik: { cover: @hronik.cover, date: @hronik.date, text: @hronik.text, title: @hronik.title }
    end

    assert_redirected_to hronik_path(assigns(:hronik))
  end

  test "should show hronik" do
    get :show, id: @hronik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hronik
    assert_response :success
  end

  test "should update hronik" do
    put :update, id: @hronik, hronik: { cover: @hronik.cover, date: @hronik.date, text: @hronik.text, title: @hronik.title }
    assert_redirected_to hronik_path(assigns(:hronik))
  end

  test "should destroy hronik" do
    assert_difference('Hronik.count', -1) do
      delete :destroy, id: @hronik
    end

    assert_redirected_to hroniks_path
  end
end
