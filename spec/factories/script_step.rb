FactoryBot.define do
    factory :script_step do
      script_name {"name_s#{rand(10)}"}
      name_step {'name_step'}
      exec_script 
      all_scripts_description 
    end
  end
