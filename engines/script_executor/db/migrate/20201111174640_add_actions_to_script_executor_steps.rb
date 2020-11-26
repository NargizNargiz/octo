class AddActionsToScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :script_executor_steps, :actions, :jsonb, default: []
  end
end

#https://stackoverflow.com/questions/56156323/storing-postgres-array-of-jsonb-in-rails-5-escapes-strings-unexpectedly pro
#
#
