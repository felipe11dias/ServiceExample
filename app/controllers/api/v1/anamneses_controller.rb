class Api::V1::AnamnesesController < ApiController
    before_action :authenticate_user!
    before_action :verificar_admin, only: [:update, :destroy]
    before_action :verificar_usuario_dono, only:[:show]

    def create
      @anamnese = Anamnese.new(anamnese_params)
      if @anamnese.save
        redirect_to @anamnese
        render json: @anamnese, status: "Success"
      else
        render json: @anamnese, status: "Error"
      end
    end

    def show
      @anamnese = Anamnese.find(params[:id])
      render json: @anamnese
    end

    def update
      respond_to do |format|
        if @anamnese.update(anamnese_params)
          render :show, status: :ok, location: @anamnese
        else
          render json: @anamnese.errors, status: :unprocessable_entity
        end
      end
    end

    def destroy
        @anamnese = Anamnese.find(params[:id])
        @anamnese.destroy
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

  def anamnese_params
    params.require(:anamnese).permit(:boolean_example, :boolean_exampletwo,:integer_example)
  end
end
