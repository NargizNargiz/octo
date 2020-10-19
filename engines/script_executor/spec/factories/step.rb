FactoryBot.define do
  factory :step, :class => "ScriptExecutor::Step" do
    name_step { "name #{rand(36**8).to_s(36)}" }
    rollbacks { 0 }
    status { :pending }
    name_script { "script#{rand(36**8).to_s(36)}" }
  end
end
