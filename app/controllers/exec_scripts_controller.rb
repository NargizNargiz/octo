class ExecScriptsController < ApplicationController
  def index
  	@exec_scripts = ExecScript.all
  end

  def show
    @exec_script = ExecScript.find_by(params[:id])
	end

  def new
    @exec_script = ExecScript.new  	
  end

  def edit
  end
  
  def create
  	# render plain: params[:all_scripts_description].inspect
  	@exec_script = ExecScript.new(exec_script_params)

    respond_to do |format|
      if @exec_script.save
        format.html { redirect_to @exec_script, notice: 'exec_script was successfully created.' }
        format.json { render :show, status: :created, location: @exec_script }
      else
        format.html { render :new }
        format.json { render json: @exec_script.errors, status: :unprocessable_entity }
      end
    end
  end

  private
 	  def exec_script_params
    	params.permit(:exec_script)
  	end


end
