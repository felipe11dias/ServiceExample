class Api::V1::UpdatesController < ApiController
  before_action :authenticate_user!

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
    render json: @update
  end

  def update
    respond_to do |format|
      if @update.update(update_params)
        render :show, status: :ok, location: @update
      else
        render json: @update.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
      @update = Update.find(params[:id])
      @update.destroy
      render json: { head :no_content }
    end
  end
  private
  def update_params
    params.require(:update).permit(:anamneses_update, :example_update)
  end
end
