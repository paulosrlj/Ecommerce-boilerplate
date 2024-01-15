class UsersController < ApplicationController

  ApiError::StandardError.descendants.each do |error_class|
    rescue_from error_class do |e|
      render json: { error_code: e.error_code, message: e.message }, status: e.status_code
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create!(user_params)
  rescue ActiveRecord::RecordInvalid => e
    raise ApiError::RecordInvalidError.new(e.message)
  rescue ActiveRecord::RecordNotUnique => e
    raise ApiError::RecordInvalidError.new(e.message)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
