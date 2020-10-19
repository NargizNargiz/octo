FactoryBot.define do
  factory :exec_script, :class => "ScriptExecutor::ExecScript" do
    script_name { "name-#{rand(36**8).to_s(36)}" }
    success { 0 }
    limit_errors { 10 }
    rollbacks { rand(10) }
  end
end
