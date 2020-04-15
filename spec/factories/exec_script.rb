FactoryBot.define do
    factory :exec_script do
      script_name {"name#{rand(10)}"}
      rollbacks {rand(10)}
      limit_errors {rand(10)}
      success {rand(2)}
    end
  end