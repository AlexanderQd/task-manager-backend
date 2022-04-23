class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: {
     status: 200,
     success: true,
     users: User.all.order(id: :asc).as_json
    }
  end

  def show
    json = if @user
      {
       status: 200,
       success: true,
       user: @user.as_json
      }
    else
      {
       status: 404,
       success: false,
       errors: ['User not found.']
      }
    end

    render json: json
  end

  def create
    user = User.new user_params
    json = if user.valid? and user.save
      {
       status: 200,
       success: true,
       user: user.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: user.errors.full_messages
      }
    end

    render json: json
  end

  def update
    json = if @user.update user_params
      {
       status: 200,
       success: true,
       user: @user.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @user.errors.full_messages
      }
    end

    render json: json
  end

  def destroy
    json = if @user.update :active, false
      {
       status: 200,
       success: true,
       user: @user.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @user.errors.full_message
      }
    end

    render json: json
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :name, :password, :active)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
