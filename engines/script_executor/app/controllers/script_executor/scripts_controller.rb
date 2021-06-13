module ScriptExecutor
  class ScriptsController < ApplicationController

    def index
      @scripts = Script.all
      render json: @scripts
    end

    def show
      @script = Script.find(params[:id])
      render json: @script
    end

    def new
      @script_options = ScriptExecutor::Description.all.map{ |description| [description.name_script, description.id] }
      @script = Script.new
    end

    def create
      # TO DO Засунуть все в Сервис Обджект
      # это должно произойти когда будет запускать скрипта или шага
      # exec_scr = ExecScript.find_by(script_name: params[:script_step][:script_name])
      # all_scr_decs = AllScriptsDescription.find_by(name_script: script_step_params[:script_name])
      @script = Script.create(script_params)
      @selected_description = ScriptExecutor::Description.find(script_params[:description_id])
      @script.script_name = @selected_description.name_script
      @selected_description.steps.each do |step|
        @script.steps.new(name_step: step['name'],
                          name_script: @script.script_name,
                          rollbacks: 0,
                          previous_result_need: step['previous_result_need'],
                          actions: step['actions'], # не обратывается никак при создании description
                          order: step['order'])
      end
      # @script_step = ScriptExecutor::ScriptSteps::Create.new(params).call
      if @script.save
        render json: @script, status: :created, script: @script
      else
        render json: @script.errors, status: :unprocessable_entity
      end
    end

    def new_exec_script
      @script = Script.find(params[:id])
    end


    def create_exec_script
      @script = Script.find(params[:id])

      @exec_script = ScriptExecutor::ExecScript.new(script_name: @script.script_name,
                                       script: @script,
                                       limit_errors: exec_script_params[:limit_erorrs].to_i,
                                       rollbacks: 0)
      run_script
      if @exec_script.save
        render partial: 'script_executor/scripts/run_script', status: :created
      else
        render json: @exec_script.errors, status: :unprocessable_entity
      end
    end

    def destroy
      # Service object
      Script.find(params[:id]).delete
    end

    def run_script
      # ScriptExecutor::Scripts::Run.autoload(:Run, 'service/scripts/run.rb')

      @script = Script.find(params[:id])
      # binding.pry
      ScriptExecutor::Scripts::Run.call(@script)
      # script = RunScriptService.new(@script.script_name)
      # script.once_run_script
    end

    private

    def script_step_params
      params.fetch(:script_step, {}).permit(:script_name, :name_step, :exec_script)
    end

    def script_params
      params[:script].permit(:description_id)
    end

    def exec_script_params
      params[:exec_script].permit(:limit_errors)
    end
  end
end
