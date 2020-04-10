class ScriptStepsController < ApplicationController
  def new
  	@script_step = ScriptStep.new
  end

  def index
  	@script_steps = ScriptStep.all

  end

  def create
    exec_scr = ExecScript.new

  	@script_step = ScriptStep.new(script_step_params)
  	@script_step.exec_script = exec_scr
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
  	@script_step = ScriptStep.find_by(params[:id])
  end
  private 
    def script_step_params
      params.permit(:script_step)
    end
end
