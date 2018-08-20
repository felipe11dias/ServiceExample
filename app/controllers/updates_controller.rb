class UpdatesController < ApplicationController

  def create
    @update = Update.new(update_params)
    if @update.save
      redirect_to @update
      render json: @update, status: "Success"
    else
      render json: @update, status: "Error"
    end
  end

  def show
    @update = Update.find(params[:id])
    respond_to do |format|
      format.html { @update, notice: 'Update was successfully Show.' }
      format.json { render json: @update }
  end

  def update
    respond_to do |format|
      if @update.update(update_params)
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { render :show, status: :ok, location: @update }
      else
        format.html { render :edit }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @update = Update.find(params[:id])
    if @update.destroy
      respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Update was successfully destroyed.' }
      format.json { head :no_content }
    else
      format.html {notice: "Error"}
      format.json { render json: {"messegem" : "Error"}, status: :unprocessable_entity}
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

  private
  def exame_params
    params.require(:exame).permit(:tipo)
  end

  private
  def update_params
    params.require(:update).permit(:anamneses_update, :example_update)
  end
end
