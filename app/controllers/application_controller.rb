class ApplicationController < ActionController::Base
  
  
  def index

    #@big_sword = false

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
end
