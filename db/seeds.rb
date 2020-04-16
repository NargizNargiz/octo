# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times{AllScriptsDescription.create(name_script: Faker::Nation.unique.language, steps:  Array.new(rand(2..4)) { Faker::Verb.base }.join(" ") ) }
all_scripts_descs = AllScriptsDescription.pluck(:name_script)

7.times do |i|
	all_scripts_descs = AllScriptsDescription.find(rand(1..7))
	exec_script = ExecScript.create(script_name: all_scripts_descs.name_script,
					rollbacks: 0,
					limit_errors: rand(2..9),
					success:0)
	script_step = ScriptStep.create(script_name: exec_script.script_name, name_step: "step", exec_script: exec_script, all_scripts_description: all_scripts_descs)
	
	for step in all_scripts_descs.steps.split(" ") do
		step_obj = Step.create(name_step: step, name_script: exec_script.script_name, status:0, rollbacks:0, script_step: script_step)
      	script_step.steps << step_obj
	end

end



