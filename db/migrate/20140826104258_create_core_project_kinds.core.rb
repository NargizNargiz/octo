# This migration comes from core (originally 20140826104113)
class CreateCoreProjectKinds < ActiveRecord::Migration[4.2]
  def change
    create_table :core_project_kinds do |t|
      t.string :name
    end
  end
end
