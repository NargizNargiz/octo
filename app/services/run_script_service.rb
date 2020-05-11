# require 'add_user_script'


class RunScriptService
  attr_accessor :script
  def initialize(name)
    @name = name
  end
  def set_connection
    @script = AddUserScript.new(@name)
    # @script.name = @name
    while true
      once_run_script(true)
      if @script.steps - @script.success_steps == []
        break
      end
    end
  end

  def once_run_script(connection_success = false)
    unless connection_success
      @script = AddUserScript.new(@name)
    end
    @script.run
    update_exec_script_table
    update_steps_table
    update_script_steps_table
  end

  def update_exec_script_table
    all_scripts_descs = AllScriptsDescription.find_by(name_script: @name)
    exec_scr = ExecScript.find_by(script_name: @name)
    unless exec_scr
      exec_scr = ExecScript.create(script_name: all_scripts_descs.name_script,
                                   rollbacks: 0,
                                   limit_errors: 5,
                                   success:0)
    end
    upd_rollbacks = exec_scr.rollbacks + 1
    exec_scr.update(rollbacks: upd_rollbacks)
    script_st = ScriptStep.find_by(script_name: @name)
    unless script_st
      ScriptStep.create(script_name: exec_scr.script_name, name_step: "step", exec_script: exec_scr, all_scripts_description: all_scripts_descs)
    end
  end

  def update_steps_table
    script_st = ScriptStep.find_by(script_name: @name)
    for step in @script.steps do
      step_from_bd = Step.find_by(name_step: step)
      unless step_from_bd
        Step.create(name_step: step, name_script: @name, status:0,
                    rollbacks: script_st.exec_script.rollbacks,
                    exec_script: script_st.exec_script)
      end
      step_from_bd = Step.find_by(name_step: step)
      if @script.success_steps.include?(step_from_bd.name_step)
        step_from_bd.update(status: 1)
      else
        step_from_bd.update(status: 0)
      end
    end
  end

  def update_script_steps_table
    script_st = ScriptStep.find_by(script_name: @name)
    for step in @script.steps do
      step_obj = Step.find_by(name_step: step)
      script_st.steps << step_obj
    end
    if script_st.steps.map(&:status).all?("1")
      script_st.exec_script.update(success:1)
    end
  end
end

# rails s
# cd app/services
# rails c
# load "add_user_script"
# load "run_script_service"
# scr = RunScriptService.new("add_user")
# scr.set_connection