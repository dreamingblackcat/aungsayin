class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :authorize_super_admin
  before_action :set_user, only: [:show, :update]


  def index
    @users = User.all
  end

  def show
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    respond_to do |format|
      if @user.update(role: user_params[:role].to_i)
        format.html { redirect_to users_path, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:role)
    end 

end
