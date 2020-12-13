module ScriptExecutor
  class DescriptionsController < ApplicationController
    def index
      @descriptions = Description.all
    end

    def show
      @description = Description.find(params[:id])
    end

    def new
      @description = Description.new
    end

    def edit
      @description = Description.find(params[:id])
    end

    def create
      # render plain: params[:all_scripts_description].inspect
      @description = Description.new(description_params)
      respond_to do |format|
        if @description.save
          format.html { redirect_to @description, notice: 'all_scripts_description was successfully created.' }
          format.json { render :show, status: :created, location: @description }
        else
          format.html { render :new }
          format.json { render json: @description.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @description = Description.find(params[:id])
      respond_to do |format|
        if @description.update(description_params)
          format.html{redirect_to @description, notice: 'Scripts Description was successfully updated.'}
        else
          format.html{render :edit}
        end
      end
    end

    private
    # def description_params
    #   # params.permit(:all_scripts_description)
    #   params.fetch(:description, {}).permit(:name_script, :steps)
    # end

    def post_params
      params.require(:description)
          .permit(steps: [:name, :order, actions: [:text]])
    end

    def description_params
      params.require(:description).permit(:name_script, steps_attributes: [:name, :order, :actions, :previous_result_need, :_destroy])
    end
  end
end