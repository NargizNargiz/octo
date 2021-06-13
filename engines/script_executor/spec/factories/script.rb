FactoryBot.define do
  factory :script, :class => "ScriptExecutor::Script" do
    exec_script { create(:exec_script) }
    script_name { "name-#{rand(100)}" }
    description { create(:description) }
  end
end
