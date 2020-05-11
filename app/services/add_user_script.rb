class AddUserScript
  attr_accessor :failed_steps, :name, :steps, :success_steps
  def initialize(name)
    @name = name
    @steps = []
    @failed_steps = {}
    @success_steps = []
  end
  def set_connection(steps_params)
    run
    # run(steps_params)
  end

  # def run(steps_params)
  def run
    reload_script
    check_group
    @success_steps = @steps - @failed_steps.stringify_keys.keys
  end

  def check_group
    #subavtion create_group
    add_step("check_group")
    if rand(100) < 20
      @failed_steps[:check_group] = generate_error("check_group")
      generate_error
    else
      if rand(2) == 0 && create_group == -1 # нет группы => создать группу
        @failed_steps[:check_group] = generate_error("check_group")
        generate_error
      else
        generate_ok("check_group")
        check_user
      end
    end
  end

  def check_user
    add_step("check_user")
    if rand(100) < 40
      @failed_steps[:check_user] = generate_error("check_user")
      generate_error
    else
      if rand(2) == 0  && create_user == -1# нет user => создать user
        @failed_steps[:check_user] = generate_error("check_user")
        generate_error
      else
        generate_ok("check_user")
        add_user_to_group
      end
    end
  end

  def add_user_to_group
    add_step("add_user_to_group")
    if rand(100) < 40
      @failed_steps[:add_user_to_group] = generate_error("add_user_to_group")
      generate_error
    else
      generate_ok("add_user_to_group")
      add_ssh_key
    end
  end

  def add_ssh_key
    add_step("add_ssh_key")
    if rand(100) < 40
      @failed_steps[:add_ssh_key] = generate_error("add_ssh_key")
      generate_error
    else
      generate_ok("add_ssh_key")
    end
  end

  def create_user
    if rand(100) < 20
      generate_error
    else
      generate_ok
    end
  end

  def create_group
    # add_step("add_group")
    if rand(100) < 20
      generate_error
    else
      generate_ok
    end
  end

  def reload_script
    @steps = []
    @failed_steps = {}
  end
  private

  def add_step(step)
    @steps<<step
  end

  def generate_error(step = nil)
    unless step == nil
      puts "#{step} failed"
    end
    -1
  end

  def generate_ok(step = nil)
    unless step == nil
      puts "#{step} success"
    end
    1
  end
end

