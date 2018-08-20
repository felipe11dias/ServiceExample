class UsersController < ApplicationController
  before_action :verificar_admin, only: [:update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
         redirect_to @user
         render json: @user, status => "Success"
    else
        render json: @user, status => "Error"
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @user.destroy
      respond_to do |format|
      format.html { redirect_to tests_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def verificar_admin
    if not current_user.is_admin?
      render json: { "message" => "Você não é um administrador!"}
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :authenticity_tokens, :address, :birth_day)
  end
  
end
