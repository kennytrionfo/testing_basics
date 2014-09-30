require "test_helper"

class WidgetsControllerTest < ActionController::TestCase

  def widget
    @widget ||= widgets :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:widgets)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Widget.count') do
      post :create, widget: { name: @widget.name }
    end

    assert_redirected_to widget_path(assigns(:widget))
  end

  def test_show
    get :show, id: widget
    assert_response :success
  end

  def test_edit
    get :edit, id: widget
    assert_response :success
  end

  def test_update
    put :update, id: widget, widget: { name: @widget.name }
    assert_redirected_to widget_path(assigns(:widget))
  end

  def test_destroy
    assert_difference('Widget.count', -1) do
      delete :destroy, id: widget
    end

    assert_redirected_to widgets_path
  end
end
