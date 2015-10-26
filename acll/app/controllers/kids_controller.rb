class KidsController < ApplicationController
  def index
  end

  def show
      id = params[:id]

      @kid = Kid.find(params[:id])
      if current_kid.id == @kid.id
        render :show
      else
        redirect_to root_path
      end
  end

  def new
    @kid = Kid.new
  end

  def create
      @kid = Kid.new(kid_params)
      if @kid.save
          flash[:success] = "Welcome!"
          redirect_to user_kid_path(@user)
      else
          flash[:danger] = "It failed!"
          render 'new'
      end
  end

  def edit
  end

  private

  def kid_params
    params.require(:kid).permit(:user_id, :team_id, :first_name, :last_name, :address, :city, :zip_code, :league, :coach, :user_id, :team_id, :guardian_first_name, :guardian_last_name)
  end
end
