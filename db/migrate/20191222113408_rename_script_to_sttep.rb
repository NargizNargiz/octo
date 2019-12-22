class RenameScriptDescriptionsToSttepDescriptions < ActiveRecord::Migration[5.2]
  def change
  	self.up
  end
  def self.up
    rename_table :scriptDescriptions, :sttepDescriptions
  end
  
  def self.down
    rename_table :sttepDescriptions, :scriptDescriptions
  end
end
