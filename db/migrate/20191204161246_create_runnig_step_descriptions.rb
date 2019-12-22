class CreateRunnigStepDescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :runnig_step_descriptions do |t|
      t.string :step
      t.text :error

      t.timestamps
    end
  end
end
