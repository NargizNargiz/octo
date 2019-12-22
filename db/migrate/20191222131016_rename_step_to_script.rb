class RenameStepDescriptionsToScriptDescriptions < ActiveRecord::Migration[5.2]
  def change
  
  end
  def self.up
    rename_table :stepDescriptions, :scriptDescriptions
  end
  def self.down
    rename_table :scriptDescriptions, :stepDescriptions
  end
end
