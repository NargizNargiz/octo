FactoryBot.define do
  factory :description, :class => "ScriptExecutor::Description" do
    name_script { "name-#{rand(100)}" }
    steps {
      [
          { name: rand(36**8).to_s(36),
            order: 1,
            previous_result_need: false,
            actions: [ rand(36**8).to_s(36) ]
          }
      ]
    }
  end
end
