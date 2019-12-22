class SttepDescriptionsController < ApplicationController
  def index
    @sttep_description = SttepDescription.all
  end

  def show
  end

  def new
    @sttep_description = SttepDescription.new
  end

  def edit
  end

  def create
    @sttep_description = SttepDescription.new(sttep_description_params)
    respond_to do |format|
      if @sttep_description.save
        format.html { redirect_to @sttep_description, notice: 'Step description was successfully created.' }
        format.json { render :show, status: :created, location: @sttep_description }
      else
        format.html { render :new }
        format.json { render json: @sttep_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sttep_description.update(sttep_description_params)
        format.html { redirect_to @sttep_description, notice: 'Step description was successfully created.' }
        format.json { render :show, status: :created, location: @sttep_description }
      else
        format.html { render :edit }
        format.json { render json: @sttep_description.errors, status: :unprocessable_entity }    
      end
    end
  end

  def destroy
    @sttep_description.destroy
    respond_to do |format|
       if @sttep_description.update(sttep_description_params)
        format.html { redirect_to @sttep_description, notice: 'Step description was successfully created.' }
        format.json { render :show, status: :created, location: @sttep_description }
      else
        format.html { render :edit }
        format.json { render json: @sttep_description.errors, status: :unprocessable_entity }    
      end
    end 
  end

  private

  def set_sttep_description
    @sttep_description = SttepDescription.find(params[id])
  end
  
  def set_sttep_description_params
    params.require(:sttep_description).permit(:step, :rollbacks, :checkbox, :limit, :requests_to_admin)
  end

end

