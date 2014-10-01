require "test_helper"

describe ItemsController do

  let(:item) { items :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates item" do
    assert_difference('Item.count') do
      post :create, item: { name: @item.name }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  it "shows item" do
    get :show, id: item
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: item
    assert_response :success
  end

  it "updates item" do
    put :update, id: item, item: { name: @item.name }
    assert_redirected_to item_path(assigns(:item))
  end

  it "destroys item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: item
    end

    assert_redirected_to items_path
  end

end
