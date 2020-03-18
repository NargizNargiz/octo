class CreateProjectStats < ActiveRecord::Migration
  def change
    create_table :statistics_project_stats do |t|
      t.string :kind
      t.text :data
      t.timestamps
    end
  end
end