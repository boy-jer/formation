class PagesController < ApplicationController
  before_action :set_page, only: [:show, :submit]
  
  def show
    # signupinfo = SignUpInfo.find_by_name(:name)
    # signup = Page.new(amount: 25.0 , src: "https://docs.google.com/forms/d/1JoqfHA2YYBXus0TEONpcnaUf9UMQEn-y2UZJ73vNuWw/viewform?embedded=true")
    # signup.save
    page = add_css(@page)
    @body = page[1]
    @head = page[0]
  end

  def submit
    signupinfo = SignUpInfo.find_by_name(:name)
    stripe_code(signupinfo)
  end

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
