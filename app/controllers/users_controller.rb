class UsersController < ApplicationController


   before_action :correct_user,only: [:edit]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new

  end



  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user)
    else
       render action: :edit
    end
  end

  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
     # redirect_to user_path(@user)
      redirect_to user_path(current_user)
    end
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followed
    @user = User.find(params[:user_id])
    @users = @user.folower
  end

  

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
