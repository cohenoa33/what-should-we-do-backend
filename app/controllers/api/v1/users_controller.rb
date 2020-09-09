class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { message: 'This ID does not exist' }
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: { error: 'Something went wrong' }
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: { error: 'Something went wrong' }
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy

    render json: { message: 'deleted' }
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :address, :city, :state, :zipcode, :image)
  end
end
