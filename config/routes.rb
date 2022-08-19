Rails.application.routes.draw do

  # Routes for the Spell resource:

  # CREATE
  post("/insert_spell", { :controller => "spells", :action => "create" })
          
  # READ
  get("/spells", { :controller => "spells", :action => "index" })
  
  get("/spells/:path_id", { :controller => "spells", :action => "show" })
  
  # UPDATE
  
  post("/modify_spell/:path_id", { :controller => "spells", :action => "update" })
  
  # DELETE
  get("/delete_spell/:path_id", { :controller => "spells", :action => "destroy" })

  #------------------------------

  get("/index", { :controller => "application", :action => "index"} )

  get("/change_equipment", { :controller => "application", :action => "change_equipment"})

  get("/cast/:spell_id", { :controller => "application", :action => "cast_a_spell"})

post("/heal", { :controller => "application", :action => "heal"})
post("/damage", { :controller => "application", :action => "take_damage"})
end
