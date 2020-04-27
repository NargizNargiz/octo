class StepsController < ApplicationController
  def new
  	@step = Step.new
  end

  def index
  	@steps = Step.all
  end

  def create
  	# script_step = ScriptStep.find(1)
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

  def edit 
    @step = Step.find(params[:id])
  end
  def show
  	@step = Step.find(params[:id])
  end
  
  def update
    @step = Step.find(params[:id])
    respond_to do |format|
      if @step.update(step_params)
        format.html{redirect_to @step, notice: 'Step Description was successfully updated.'}
      else
        format.html{render :edit}
      end
    end
  end
  private
  	def step_params
  		params.permit(:step)
  	end
end
