class ApplicationController < ActionController::Base
  
  
  def index
  render({ :template => "pages/character1.html.erb" })
  end
end
