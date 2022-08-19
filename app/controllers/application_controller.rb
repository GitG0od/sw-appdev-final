class ApplicationController < ActionController::Base
  
  
  def index

    #A function to let me convert strings to booleans
    def to_boolean(str)
      str == 'true'
    end


#Begin logic to switch between wielding mace & shield or big sword
  if params[:big_sword] != nil
      @big_sword = params.fetch(:big_sword.to_boolean)
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


#Define key stats which can vary
    @armor = 14 + @shield


  render({ :template => "pages/character1.html.erb" })
  end


  def change_equipment
    cookies.store(:test, @value)
    #I can't figure out how to actually write to params. I think I need to go back and find the example from class; right now this isn't working so it just reloads with no value for :big_sword in params
    if @big_sword == true or nil
      params[:big_sword] = false
    elsif @big_sword == false
      params[:big_sword] = true
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
