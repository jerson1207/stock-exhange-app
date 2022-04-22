class ProfilesController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy  ]
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
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def edit 
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(@users).permit(:email, :first_name, :last_name, :password, :password_confirmation, :cash, :admin)
    end
end
