class UsersController < ApplicationController
  def index
  end

  def show
      id = params[:id]

      @user = User.find(params[:id])
      if current_user.id == @user.id
        render :show
      else
        redirect_to root_path
      end
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
          login(@user)
          flash[:success] = "Welcome!"
          redirect_to("/users/#{@user.id}")
      else
          flash[:danger] = "It failed!"
          render 'new'
      end
  end

  def edit
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
