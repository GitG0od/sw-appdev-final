class ApplicationController < ActionController::Base
  
  
  def index

    #@big_sword = false

if @big_sword == true or @big_sword == nil
    @shield = 0
    @weapon = "2d6"
elsif @big_sword == false
  @shield = 2
    @weapon = "1d8"
end



    @armor = 14 + @shield


  render({ :template => "pages/character1.html.erb" })
  end
end
