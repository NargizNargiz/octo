class AddOrderAndPreviousResultNeedToScriptExecutorSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :script_executor_steps, :order, :integer
    add_column :script_executor_steps, :previous_result_need, :boolean
  end
end
