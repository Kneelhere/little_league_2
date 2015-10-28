class TeamsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  def index
    @league = League.find(params[:league_id])
    #@team = Team.find(params[:id])
    @teams = Team.where(league_id: @league.id)
  end

  def show
    #@league = League.find(params[:league])
    #@kid = Kid.find(params[:kid_id])
    @team = Team.find(params[:id])
  end

  def new
    @league = League.find(params[:league_id])
    @team = Team.new
  end

  def create
      @league = League.find(params[:league_id])
      @team = Team.new(team_params)
      @team.league_id = @league.id
      # need logic for admin here
      if @team.save
          flash[:success] = "Welcome!"
          redirect_to("/leagues/#{@team.league_id}/teams")
      else
          flash[:danger] = "It failed!"
          render 'new'
      end
  end

  def edit
  end

    private

  def team_params
    params.require(:team).permit(:name, :coach1, :coach2, :coach3, :league_id)
  end
end
