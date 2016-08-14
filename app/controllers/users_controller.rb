class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,:destroy]
  before_action :require_same_user, only: [:show, :edit, :update]
  before_action :require_admin, only: [:destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] =  @user.id
        flash[:success]  = "Welcome #{@user.username}"
        redirect_to @user
      else
        render 'new'
    end
  end
  def destroy
    @user.destroy
    flash[:danger] = "User Has Been Removed"
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
      flash[:success] = "Updated Your Settings"
      redirect_to @user
      else
        render edit
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] =  "Only Admins Can Preform This Action"
        redirect_to root_path
      end
    end
    def require_same_user
      redirect_to root_path if !logged_in? && current_user != @user && !current_user.admin?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
