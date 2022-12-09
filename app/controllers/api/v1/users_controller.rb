class Api::V1::UsersController < Api::V1::BaseController
  # def index
  #   render json: { users: User.all }
  #   ## PUT http://localhost:3000/api/v1/users
  # end
  def show
    render json: { user: User.find(params[:id]) }
    ## GET http://localhost:3000/api/v1/users/${id}
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { user: @user }, status: :created
    else
      render_error
    end
    ## PUT http://localhost:3000/api/v1/users/${id}
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :avartar_url)
  end
end
