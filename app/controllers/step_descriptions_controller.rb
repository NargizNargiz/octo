class StepDescriptionsController < ApplicationController
  before_action :set_step_description, only: [:show, :edit, :update, :destroy]

  # GET /step_descriptions
  # GET /step_descriptions.json
  def index
    @step_descriptions = StepDescription.all
  end

  # GET /step_descriptions/1
  # GET /step_descriptions/1.json
  def show
  end

  # GET /step_descriptions/new
  def new
    @step_description = StepDescription.new
  end

  # GET /step_descriptions/1/edit
  def edit
  end

  # POST /step_descriptions
  # POST /step_descriptions.json
  def create
    @step_description = StepDescription.new(step_description_params)

    respond_to do |format|
      if @step_description.save
        format.html { redirect_to @step_description, notice: 'Step description was successfully created.' }
        format.json { render :show, status: :created, location: @step_description }
      else
        format.html { render :new }
        format.json { render json: @step_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /step_descriptions/1
  # PATCH/PUT /step_descriptions/1.json
  def update
    respond_to do |format|
      if @step_description.update(step_description_params)
        format.html { redirect_to @step_description, notice: 'Step description was successfully updated.' }
        format.json { render :show, status: :ok, location: @step_description }
      else
        format.html { render :edit }
        format.json { render json: @step_description.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /step_descriptions/1
  # DELETE /step_descriptions/1.json
  def destroy
    @step_description.destroy
    respond_to do |format|
      format.html { redirect_to step_descriptions_url, notice: 'Step description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step_description
      @step_description = StepDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_description_params
      params.require(:step_description).permit(:script, :steps)
    end
end
