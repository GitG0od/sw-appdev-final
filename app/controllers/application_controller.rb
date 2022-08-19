class ApplicationController < ActionController::Base
  
  
  def index


#Begin logic to switch between wielding mace & shield or big sword
  if session[:big_sword] != nil
      @big_sword = session[:big_sword]
  else
    @big_sword = true
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
#End weapon weilding logic

#Spellcasting
matching_spells = Spell.all
@list_of_spells = matching_spells.order({ :created_at => :desc })

#HP Tracking
if session[:damage] != nil
@damage = session[:damage]
else
  @damage = 0
end


#Define key stats which can vary
    @armor = 14 + @shield
    @HP = 10-@damage


  render({ :template => "pages/character1.html.erb" })
  end


  #Change equipment
  def change_equipment
  
 
    if session[:big_sword] == true or nil
      session[:big_sword] = false
    else
      session[:big_sword] = true
    end



    redirect_to("/index")    # I could put in the following:   , {:notice => "Changed Equipment"} 
  end



 def cast_a_spell
  # the_id = params.fetch("spell_id")
  # the_spell = SpellList.where({ :id => the_id }).at(0)
  # the_spell.destroy

  #This isn't working for some reason, I'm not sure why. I want it to delete the spell from the database when cast.
  
  redirect_to("/index" )
end



end
