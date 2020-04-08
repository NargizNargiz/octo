class AllScriptsDescriptionsController < ApplicationController
  def index
  	@all_scripts_descriptions = AllScriptsDescription.all
  end

  def show
      @all_scripts_description = AllScriptsDescription.find_by(:id)
	end

  def new
    @all_scripts_description = AllScriptsDescription.new  	
  end

  def edit
  end
  
  def create
  	# render plain: params[:all_scripts_description].inspect
  	@all_scripts_description = AllScriptsDescription.new(all_scripts_description_params)
    byebug
    respond_to do |format|
      if @all_scripts_description.save
        format.html { redirect_to @all_scripts_description, notice: 'all_scripts_description was successfully created.' }
        format.json { render :show, status: :created, location: @all_scripts_description }
      else
        format.html { render :new }
        format.json { render json: @all_scripts_description.errors, status: :unprocessable_entity }
      end
    end
  end

  private
 	  def all_scripts_description_params
    	params.require(:all_scripts_description).permit(:name_script, :steps)
  	end

end
