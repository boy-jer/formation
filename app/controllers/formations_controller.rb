class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :edit, :update, :destroy]

  # GET /formations
  # GET /formations.json


  def home
    @formations = Formations.new
  end


# Scaffold Action


  def index
    @formations = Formations.all
  end

  # GET /formations/1
  # GET /formations/1.json
  def show
  end

  # GET /formations/new
  def new
    @formation = Formations.new
  end

  # GET /formations/1/edit
  def edit
  end

  # POST /formations
  # POST /formations.json
  def create
    # binding.pry

    @formation = Formations.new(formation_params)
    # binding.pry

    respond_to do |format|
      if @formation.save
        @page = @formation.create_page
        @user = @formation.create_user
        format.html { redirect_to @page, notice: 'Formation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @formation }
      else
        format.html { render action: 'new' }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formations/1
  # PATCH/PUT /formations/1.json
  def update
    respond_to do |format|
      if @formation.update(formation_params)
        format.html { redirect_to @formation, notice: 'Formation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formations/1
  # DELETE /formations/1.json
  def destroy
    @formation.destroy
    respond_to do |format|
      format.html { redirect_to formations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation
      @formation = Formations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formation_params
      params[:formations].permit(:src, :name, :first_name, :country, :last_name, :email, :amount, :bank_account, :routing_number)
    end

end
