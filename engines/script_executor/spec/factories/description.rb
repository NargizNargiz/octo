FactoryBot.define do
  factory :all_scripts_description, :class => "ScriptExecutor::AllScriptsDescription" do
    name_script { "name-#{rand(100)}" }
    steps { "#{rand(36**8).to_s(36)} #{rand(36**8).to_s(36)}" }
  end
end
