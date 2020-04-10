class StepsController < ApplicationController
  def new
  	@step = Step.new
  end

  def index
  	@steps = Step.all
  end

  def create
  	script_step = ScriptStep.find(1)
  	@step =  Step.new(step_params)
  	@step.script_step = script_step
  	# byebug
  	respond_to do |format|
  		if @step.save
  			format.html {redirect_to step, notice: 'step was successfully created'}
  			format.json {render :show, status: :created, location: @step}
  		else
  			format.html {render :new}
  			format.json {render json: @step.errors, status: :unprocessable_entity}
  		end
  	end
  end

  def show
  	@step = Step.find_by(params[:id])
  end
  private
  	def step_params
  		params.permit(:step)
  	end
end
