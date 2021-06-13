module ScriptExecutor
  class DescriptionsController < ApplicationController
    def index
      @descriptions = Description.all
      render json: @descriptions
    end

    def show
      @description = Description.find(params[:id])
      render json: @description
    end

    def new
      @description = Description.new
    end

    def edit
      @description = Description.find(params[:id])
    end

    def create
      @description = Description.new(create_params)

      if @description.save
        render json: @description, status: :created, description: @description
      else
        render json: @description.errors, status: :unprocessable_entity
      end
    end

    def update
      @description = Description.find(params[:id])
      if @description.update(update_params)
        render json: @description
      else
        render json: @description.errors, status: :unprocessable_entity
      end
    end

    private
    # def description_params
    #   # params.permit(:all_scripts_description)
    #   params.fetch(:description, {}).permit(:name_script, :steps)
    # end


    def update_params
      params.require(:description).permit(:name_script, steps: [:name, :order, :previous_result_need, actions: []])
    end

    def create_params
      params.require(:description).permit(:name_script, steps: [:name, :order, :previous_result_need, actions: [] ])
    end
  end
end