class KidsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @kid = Kid.all
  end

  def show
      @user = User.find(params[:user_id])
      id = params[:id]
      @kid = Kid.find(params[:id])
      @user = User.find(params[:id])
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
        @kid = Kid.find(params[:id])
        if current_user.id  == @kid.user_id
            render :edit
        else
            redirect_to root_path
        end
  end

  def update
    @kid = Kid.find(params[:id])    
        if @kid.update(kid_params)
          redirect_to user_kid_path
        else
          render :edit
        end
  end

  private

  def kid_params
    params.require(:kid).permit(:first_name, :last_name, :address, :city, :zip_code, :league, :coach, :user_id, :team_id, :guardian_first_name, :guardian_last_name)
  end
end
