class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

    private

  def team_params
    params.require(:team).permit(:name, :coach1, :coach2, :coach3, :league_id)
  end
end
