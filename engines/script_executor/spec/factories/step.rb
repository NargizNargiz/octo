FactoryBot.define do
  factory :step, :class => "ScriptExecutor::Step" do
    name_step { 'name' }
    rollbacks { 0 }
    name_script { 'script' }
  end
end
