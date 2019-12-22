class CreateStepDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :step_descriptions do |t|
      t.string :script
      t.text :steps , :default => [].to_yaml
      
      t.timestamps
    end
  end
end
