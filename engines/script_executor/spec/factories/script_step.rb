FactoryBot.define do
  factory :script_step, :class => "ScriptExecutor::ScriptStep" do
    exec_script { create(:exec_script) }
    script_name { "name-#{rand(100)}" }
    all_scripts_description { create(:all_scripts_description) }
  end
end
