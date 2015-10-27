class KidsController < ApplicationController
  def index
    @kids = Kid.all
  end

  def show
      id = params[:id]

      @kid = Kid.find(params[:id])
      if current_user.id == @kid.id
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
      @kid.user_id = current_user.id
      if @kid.save
          flash[:success] = "Welcome!"
          redirect_to("/users/#{@kid.user_id}")
      else
          flash[:danger] = "It failed!"
          render 'new'
      end
  end

  def edit
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :address, :city, :zip_code, :league, :coach, :user_id, :team_id, :guardian_first_name, :guardian_last_name)
  end
end
