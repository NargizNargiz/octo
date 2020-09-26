class AllScriptsDescriptionsController < ApplicationController
  def index
  	@all_scripts_descriptions = AllScriptsDescription.all
  end

  def show
      @all_scripts_description = AllScriptsDescription.find(params[:id])
	end

  def new
    @all_scripts_description = AllScriptsDescription.new  	
  end

  def edit
      @all_scripts_description = AllScriptsDescription.find(params[:id])
  end

  
  def create
  	# render plain: params[:all_scripts_description].inspect
    @all_scripts_description = AllScriptsDescription.new(all_scripts_description_params)
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

  def update
    @all_scripts_description = AllScriptsDescription.find(params[:id])
    respond_to do |format|
      if @all_scripts_description.update(all_scripts_description_params)
        format.html{redirect_to @all_scripts_description, notice: 'Scripts Description was successfully updated.'}
      else
        format.html{render :edit}
      end
    end
  end

  private
 	  def all_scripts_description_params
      # params.permit(:all_scripts_description)
    	params.fetch(:all_scripts_description, {}).permit(:name_script, :steps)
  	end

end
