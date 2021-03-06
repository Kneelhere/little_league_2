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
      @user = User.find(params[:id])
      if current_user.id  == @user.id
          render :edit
      else
          redirect_to root_path
      end
  end

  def update
    @user = User.find(params[:id])    
        if @user.update(user_params)
          redirect_to user_path
        else
          render :edit
        end
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
