class ApplicationController < ActionController::Base
  
  
  def index

    #A function to let me convert strings to booleans
    def to_boolean(str)
      str == 'true'
    end



    if params = {}  #This is not durable because I could later add other params; ideally it would just check if params.fetch("big_sword") comes up blank, but I'm not sure how to do that and this works for now.
      @big_sword = true
    else
      @big_sword = params.fetch(:big_sword).to_boolean
    end

if @big_sword == true or @big_sword == nil
    @shield = 0
    @weapon = "2d6"
    @weilding = "Two-handed Sword"
    @unequipped = "Mace and shield"
    #I could also put in the extra +1 strength bonus to damage for wielding two-handed weapon.
elsif @big_sword == false
  @shield = 2
    @weapon = "1d8"
    @weilding = "Mace and shield"
    @unequipped = "Two-handed Sword"
end



    @armor = 14 + @shield


  render({ :template => "pages/character1.html.erb" })
  end


  def change_equipment
    if @big_sword == true or nil
      params[:big_sword] = false
    elsif @big_sword == false
      params[:big_sword] = true
    end
    redirect_to("/")    # I could put in the following:   , {:notice => "Changed Equipment"} 
  end
end
