class GamesPicksController < ApplicationController
  before_action :set_games_pick, only: [:show, :edit, :update, :destroy]

  # GET /games_picks
  # GET /games_picks.json
  def index
    @games_picks = GamesPick.all
  end

  # GET /games_picks/1
  # GET /games_picks/1.json
  def show
  end

  # GET /games_picks/new
  def new
    @weeks = 1..17
    @games_pick = GamesPick.new
  end

  # GET /games_picks/1/edit
  def edit
  end

  # POST /games_picks
  # POST /games_picks.json
  def create
    @games_pick = GamesPick.new(games_pick_params)

    respond_to do |format|
      if @games_pick.save
        format.html { redirect_to @games_pick, notice: 'Games pick was successfully created.' }
        format.json { render :show, status: :created, location: @games_pick }
      else
        format.html { render :new }
        format.json { render json: @games_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games_picks/1
  # PATCH/PUT /games_picks/1.json
  def update
    respond_to do |format|
      if @games_pick.update(games_pick_params)
        format.html { redirect_to @games_pick, notice: 'Games pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @games_pick }
      else
        format.html { render :edit }
        format.json { render json: @games_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games_picks/1
  # DELETE /games_picks/1.json
  def destroy
    @games_pick.destroy
    respond_to do |format|
      format.html { redirect_to games_picks_url, notice: 'Games pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_pick
      @games_pick = GamesPick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def games_pick_params
      params.require(:games_pick).permit(:games, :team_names, :weeks)
    end
end
