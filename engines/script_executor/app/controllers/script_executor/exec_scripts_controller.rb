module ScriptExecutor
  class ExecScriptsController < ApplicationController
    def index
      @exec_scripts = ScriptExecutor::ExecScript.all
      render json: @exec_scripts
    end

    def show
      @exec_script = ExecScript.find(params[:id])
      render json: @exec_script
    end

    def new
      @script_options = ScriptExecutor::Script.all.map{ |script| [script.script_name, script.id] }
      @exec_script = ExecScript.new
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
      script_step = ScriptStep.create(script_name: @exec_script.script_name, exec_script: @exec_script, all_scripts_description: all_scripts_description)
      # create_steps(all_scripts_description, script_step)
    end


    def create
      @script = ScriptExecutor::Script.find(exec_script_params[:script_id])
      @exec_script = ScriptExecutor::ExecScript.new(exec_script_params.merge(script_name: @script.script_name))
      @exec_script.script_id = @script.id
      if @exec_script.save
        render json: @exec_script, status: :created, exec_script: @exec_script
      else
        render json: @exec_script.errors, status: :unprocessable_entity
      end
    end

    def destroy
      ExecScript.find(params[:id]).delete
    end

    def update
      @exec_script = ExecScript.find(params[:id])
      if @exec_script.update(update_params)
        render json: @exec_script, notice: 'Script was successfully updated.'
      else
        render json: edit
      end
    end

    def script_step(id)
      ScriptExecutor::ScriptStep.find_by(exec_script_id: id)
    end

    private

    def exec_script_params
      params[:exec_script].permit(:script_id, :limit_errors)
    end

    def update_params
      params.require(:exec_script).permit(:limit_errors)
    end
  end
end
