class PagesController < ApplicationController
  before_action :set_page, only: [:show, :submit]



  # # GET /pages
  # # GET /pages.json
  # def index
  #   @pages = Page.all
  # end

  # GET /pages/1
  # GET /pages/1.json
  def show
    # signupinfo = SignUpInfo.find_by_name(:name)
    # signup = Page.new(amount: 25.0 , src: "https://docs.google.com/forms/d/1JoqfHA2YYBXus0TEONpcnaUf9UMQEn-y2UZJ73vNuWw/viewform?embedded=true")
    # signup.save

  end

  def submit
    signupinfo = SignUpInfo.find_by_name(:name)
    stripe_code(signupinfo)
  end

  # # GET /pages/new
  # def new
  #   @page = Page.new
  # end

  # # GET /pages/1/edit
  # def edit
  # end

  # # POST /pages
  # # POST /pages.json
  # def create
  #   @page = Page.new(page_params)

  #   respond_to do |format|
  #     if @page.save
  #       format.html { redirect_to @page, notice: 'Page was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @page }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @page.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /pages/1
  # # PATCH/PUT /pages/1.json
  # def update
  #   respond_to do |format|
  #     if @page.update(page_params)
  #       format.html { redirect_to @page, notice: 'Page was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @page.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /pages/1
  # # DELETE /pages/1.json
  # def destroy
  #   @page.destroy
  #   respond_to do |format|
  #     format.html { redirect_to pages_url }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params[:page]
    end
end
