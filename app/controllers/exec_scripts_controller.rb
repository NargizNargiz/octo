class ExecScriptsController < ApplicationController
  def index
  	@exec_scripts = ExecScript.all
  end

  def show
    @exec_script = ExecScript.find(params[:id])
	end

  def new
    @exec_script = ExecScript.new  	
  end

  def edit
    @exec_script = ExecScript.find(params[:id])
  end

  def create_steps(all_scripts_description, script_step)
    steps = all_scripts_description.steps.split(" ")
    for step in steps do
      step_obj = Step.create(name_step: step, name_script: @exec_script.script_name, status:0, rollbacks:0)
      script_step.steps << step_obj
    end
  end   

  def create_script_step(scr_name)
    all_scripts_description = AllScriptsDescription.find_by(name_script: scr_name)
    script_step = ScriptStep.create(script_name: @exec_script.script_name, name_step: "stepee", exec_script: @exec_script, all_scripts_description: all_scripts_description)
    # create_steps(all_scripts_description, script_step)
  end
    
  
  def create
  	# render plain: params[:all_scripts_description].inspect
  	@exec_script = ExecScript.new(exec_script_params)

    respond_to do |format|
      if @exec_script.save
        format.html { redirect_to @exec_script, notice: 'exec_script was successfully created.' }
        create_script_step(@exec_script.script_name)
        format.json { render :show, status: :created, location: @exec_script }
      else
        format.html { render :new }
        format.json { render json: @exec_script.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ExecScript.find(params[:id]).delete
  end

def update
    @exec_script = ExecScript.find(params[:id])
    respond_to do |format|
      if @exec_script.update(exec_script_params)
        format.html{redirect_to @exec_script, notice: 'Script was successfully updated.'}
      else
        format.html{render :edit}
      end
    end
end


  private
 	  def exec_script_params
    	params.fetch(:exec_script,{}).permit(:script_name, :rollbacks,:limit_errors, :success)
  	end


end
