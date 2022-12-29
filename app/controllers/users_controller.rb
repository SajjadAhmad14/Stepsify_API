class UsersController < ApplicationController
  before_action :authorize_user, only: [:auto_login]

  def create
    @user = User.create(user_params)
    if @user.save
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, jwt: token }, status: 200
    else
      render json: { errors: @user.errors.full_messages[0] }, status: 400
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, token: token }, status: 200
    else
      render json: { message: 'No User found! Please signup first!' }, status: 400
    end
  end

  def auto_login
    render json: logged_in_user if logged_in_user
  end

  private

  def user_params
    params.permit(:username, :password, :sex, :height, :weight)
  end
end
