class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  skip_before_action :login_required, :only => [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      login(@user)
      redirect_to root_path, :notice => "You are now logged in as #{@user.name}"
    else
      render :new
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def login(user)
      session[:user_id] = user.id
    end
end
