module ScriptExecutor
  class StepsController < ApplicationController
    before_action :sanitize_params, only: %w[create update]
    def new
      @step = Step.new
    end

    def all
      @all = ScriptExecutor::Step.all
      render json: @all
    end

    def index
      @steps = script.steps
      render json: @steps
    end

    def create
      @step = script.steps.create(step_params[:step])
      @step.name_script = script.script_name
      @step.exec_script_id = script.exec_script.id
      if @step.save
        render json: @step, status: :created, step: @step
      else
        render json: @step.errors, status: :unprocessable_entity
      end
    end

    def edit
      @step = script.steps.find(params[:id])
    end

    def show
      @step = ScriptExecutor::Step.find(params[:id])
      render json: @step
    end

    def destroy
      Step.find(params[:id]).delete
    end

    def update
      @step = script.steps.find(params[:id])
      if @step.update(update_params)
        render json: @step
      else
        render json: @step.errors
      end
    end

    private

    def step_params
      params.permit(step: [:name_step, :rollbacks, :status])
    end

    def update_params
      params.require(:step).permit(:status, :rollbacks, :result)
    end

    def script
      @script = ScriptExecutor::Script.find(params[:script_id])
    end

    def sanitize_params
      params[:step][:status] = params[:step][:status].to_i
      params[:step][:rollbacks] = params[:step][:rollbacks].to_i
    end
  end
end
