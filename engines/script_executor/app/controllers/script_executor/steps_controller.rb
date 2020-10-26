module ScriptExecutor
  class StepsController < ApplicationController
    before_action :sanitize_params, only: %w[create update]
    def new
      @step = Step.new
    end

    def index
      @steps = script_step.steps
    end

    def create
      @step = script_step.steps.create(step_params[:step])
      @step.exec_script_id = script_step.exec_script.id
      if @step.save
        render :show, status: :created, step: @step
      else
        render json: @step.errors, status: :unprocessable_entity
      end
    end

    def edit
      @step = script_step.steps.find(params[:id])
    end

    def show
      @step = script_step.steps.find(params[:id])
    end

    def destroy
      Step.find(params[:id]).delete
    end

    def update
      @step = Step.find(params[:id])
      if @step.update(step_params[:step])
        redirect_to script_executor_url(@step), notice: 'Step was successfully updated.'
      else
        respond_to do |format|
          format.html{ render :edit }
        end
      end
    end

    private

    def step_params
      params.permit(step: [:name_step, :name_script, :rollbacks, :status])
    end

    def script_step
      @script_step = ScriptExecutor::ScriptStep.find(params[:script_step_id])
    end

    def sanitize_params
      params[:step][:status] = params[:step][:status].to_i
      params[:step][:rollbacks] = params[:step][:rollbacks].to_i
    end
  end
end
