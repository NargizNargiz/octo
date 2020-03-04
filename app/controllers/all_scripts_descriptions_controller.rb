class AllScriptsDescriptionsController < ApplicationController
  def new
	@all_scripts_description = AllScriptsDescription.new  	
  end

  def create
  	# render plain: params[:all_scripts_description].inspect
  	@all_scripts_description = AllScriptsDescription.new(all_scripts_description_params)
	@all_scripts_description.save
	redirect_to @all_scripts_description
  end
  def index
  	@all_scripts_descriptions = AllScriptsDescription.all
  end
  def show
  	@all_scripts_description = AllScriptsDescription.find(params[:id])
	end
  private
 	def all_scripts_description_params
    	params.require(:all_scripts_description).permit(:name_script, :steps)
  	end

end
