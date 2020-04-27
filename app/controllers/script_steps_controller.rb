class ScriptStepsController < ApplicationController
  def new
  	@script_step = ScriptStep.new
  end

  def index
  	@script_steps = ScriptStep.all

  end

  def edit 
    @script_step = ScriptStep.find(params[:id])
    # @new_step = ScriptStep
    @stepss = @script_step.all_scripts_description.steps.split(" ") - @script_step.steps.pluck(:name_step)

  end

  def create
    exec_scr = ExecScript.find_by(script_name: params[:script_step][:script_name])
    all_scr_decs = AllScriptsDescription.find_by(name_script: script_step_params[:script_name])
    # byebug
    @script_step = ScriptStep.new(script_name: script_step_params[:script_name],name_step: script_step_params[:name_step],
                                  exec_script: exec_scr, all_scripts_description: all_scr_decs)
  	@script_step.exec_script = exec_scr
    respond_to do |format|
  		if @script_step.save
  			format.html {redirect_to @script_step, notice: 'script_step wass successfully created'}
  			format.json {render :show, status: :created, location: @script_step}
  		else
  			format.html {render :new}
  			format.json {render json: @script_step.errors, status: :unprocessable_entity}
  		end
  	end
  end

  def show
  	@script_step = ScriptStep.find(params[:id])
  end

  def update
    # @script_step = ScriptStep.find(params[:id])
    # respond_to do |format|
    #   if @script_step.update(script_step_params)
    #     format.html{redirect_to @script_step, notice: 'Scripts Description was successfully updated.'}
    #   else
    #     format.html{render :edit}
    #   end
    # end
    @script_step = ScriptStep.find(params[:id])
    # byebug
    # @script_step.update(steps: params[:steps])
    @step = Step.create(name_step:params[:step],name_script: @script_step.script_name, status:0, rollbacks:0, exec_script: @script_step.exec_script)
    @script_step.steps<<@step
    # @script_step.steps <<
    redirect_to script_step_path(@script_step)
  end

  def destroy
    ScriptStep.find(params[:id]).delete
  end
  
  def add_step
  end

  private 
    def script_step_params
      params.fetch(:script_step, {}).permit(:script_name, :name_step, :exec_script)
    end
end
