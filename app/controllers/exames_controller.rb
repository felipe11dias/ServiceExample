class ExamesController < ApplicationController
  before_action :authenticate_user!
  before_action :verificar_admin, only: [:update, :destroy]
  before_action :verificar_usuario_dono, only:[:show]

  def create
    @exame = Exame.new(exame_params)
    if @exame.save
      @update = Update.where(user_id: current_user.id).first
      @update.example_update = Time.now
      @update.update
      redirect_to @exame
      render json: @exame, status: "Success"
    else
     render json: @exame, status: "Error"
   end
 end

  def show
    @exame = Exame.find(params[:id])
    respond_to do |format|
      format.html { @exame, notice: 'Exame was successfully show.' }
      format.json { render json: @exame }
  end

  def update
    respond_to do |format|
      if @exame.update(exame_params)
        format.html { redirect_to @exame, notice: 'Exame was successfully updated.' }
        format.json { render :show, status: :ok, location: @exame }
      else
        format.html { render :edit }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exame = Exame.find(params[:id])
    @exame.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Exame was successfully destroyed.' }
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
  def verificar_usuario_dono
    if not exame.id == current_user.id?
      render json: {"message" => "Você não é o usuario dono desse conteudo!"}
    end
  end
  private
  def exame_params
    params.require(:exame).permit(:tipo)
  end
end
