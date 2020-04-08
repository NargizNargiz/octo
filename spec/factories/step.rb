FactoryBot.define do
    factory :step do
      name_step {'name_s'}
      name_script {'name_script'}
      status {'none'}
      rollbacks {rand(1,10)}

      
    end
  end
  
