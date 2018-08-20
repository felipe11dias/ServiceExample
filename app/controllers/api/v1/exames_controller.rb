class Api::V1::ExamesController < ApiController
  before_action :authenticate_user!
  before_action :verificar_admin, only_one: [:update, :destroy]
  before_action :verificar_usuario_dono, only:[:show]

  def create
    @exame = Exame.new(exame_params)
    if @exame.save
      redirect_to @exame
      render json: @exame, status: "Success"
    else
      render json: @exame, status: "Error"
    end
  end

  def show
    @exame = Exame.find(params[:id])
    render json: @exame
  end

  def update
    respond_to do |format|
      if @exame.update(exame_params)
        render :show, status: :ok, location: @exame
      else
        render json: @exame.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
      @exame = Exame.find(params[:id])
      @exame.destroy
      render json: { head :no_content }
    end
  end

end

def verificar_admin
  if not current_user.is_admin?
    render json: { "message" => "Você não é um administrador!"}
  end
end

def verificar_usuario_dono
  if not anamnese.id == current_user.id?
    render json: {"message" => "Você não é o usuario dono desse conteudo!"}
end

def exame_params
  params.require(:exame).permit(:tipo)
end
