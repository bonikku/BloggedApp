class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update destroy]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5) # Instead of adding obj in render
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the new BloggedApp #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account succesfully updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = 'Account and all associated articles has been permanently deleted'
    redirect_to root_path
  end

  private

  # Whitelist params
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return if current_user == @user

    flash[:alert] = 'You can only edit your own account!'
    redirect_to login_path
  end

end
