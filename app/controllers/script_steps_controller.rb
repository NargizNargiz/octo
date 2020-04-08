class ScriptStepsController < ApplicationController
  def new
  	@script_step = ScriptStep.new
  end

  def index
  	@script_steps = ScriptStep.all

  end

  def create
  	@script_step = ScriptStep.new(script_step_params)
  	respond_to do |format|
  		if @script_step.save
  			format.html {redirect_to script_step, notice: 'script_step wass successfully created'}
  			format.json {render :show, status: :created, location: @script_step}
  		else
  			format.html {render :new}
  			format.json {render json: @script_step.errors, status: :unprocessable_entity}
  		end
  	end
  end

  def show
  	@script_step = Script_Step.find(params[:id])
  end
  private 
    def script_step_params
      params.require(:script_step).permit(:script_name, :name_step)
    end
end
