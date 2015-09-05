require 'test_helper'

class GamesPicksControllerTest < ActionController::TestCase
  setup do
    @games_pick = games_picks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games_picks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create games_pick" do
    assert_difference('GamesPick.count') do
      post :create, games_pick: { games: @games_pick.games, team_names: @games_pick.team_names, weeks: @games_pick.weeks }
    end

    assert_redirected_to games_pick_path(assigns(:games_pick))
  end

  test "should show games_pick" do
    get :show, id: @games_pick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @games_pick
    assert_response :success
  end

  test "should update games_pick" do
    patch :update, id: @games_pick, games_pick: { games: @games_pick.games, team_names: @games_pick.team_names, weeks: @games_pick.weeks }
    assert_redirected_to games_pick_path(assigns(:games_pick))
  end

  test "should destroy games_pick" do
    assert_difference('GamesPick.count', -1) do
      delete :destroy, id: @games_pick
    end

    assert_redirected_to games_picks_path
  end
end
