class Api::V1::UsersController < ApiController
  before_action :authenticate_user!
  before_action :verificar_admin, only: [:update, :destroy]
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      render json: @user, status: "Success"
    else
      render json: @user, status: "Error"
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        render :show, status: :ok, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: { head :no_content }
    end
  end

end

def verificar_admin
  if not current_user.is_admin?
    render json: { "message" => "Você não é um administrador!"}
  end
end

def user_params
  params.require(:user).permit(:email, :password, :password_confirmation, :name, :authenticity_tokens, :address, :birth_day)
end
