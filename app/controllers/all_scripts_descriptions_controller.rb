class AllScriptsDescriptionsController < ApplicationController
  def new
	@all_scripts_description = AllScriptsDescription.new  	
  end

  def create
  	# render plain: params[:all_scripts_description].inspect
  	@all_scripts_description = AllScriptsDescription.new(params[:all_scripts_description])
	@all_scripts_description.save
	redirect_to @all_scripts_description
  end
  def index
  	@all_scripts_descriptions = AllScriptsDescription.all
  end

end
