class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def show
    id = params[:id]
    @league = League.find(params[:id])
  end

  def new
  end

  def create
    @league = League.new(league_params)
    if @league.save
        flash[:success] = "Welcome!"
        redirect_to leagues_path
    else
        flash[:danger] = "It failed!"
        render 'new'
    end
  end

  def edit
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
