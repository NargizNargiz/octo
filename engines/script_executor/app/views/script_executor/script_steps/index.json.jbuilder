json.array! @script_steps do |script_step|
	json.id 			script_step.id
	json.script_name 	script_step.script_name
	json.name_step 		script_step.name_step
	json.exec_script 	script_step.exec_script
	json.all_scripts_description script_step.all_scripts_description
	json.steps do
		json.array! script_step.steps do |step|
			json.partial! 'steps/step', step: step
		end
	end 
end