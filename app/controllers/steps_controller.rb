class StepsController < ApplicationController
  def new
  	@step = Step.new
  end

  def index
  	@steps = Step.all
  end

  def create
  	@step =  Step.new(step_params)
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
  	@step = Step.find(params[:id])
  end
  private
  	def step_params
  		params.require(:step).permit(:name_step,:name_script,:rollbacks,:rollbacks)
  	end
end
