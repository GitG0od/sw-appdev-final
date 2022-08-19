Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index"} )

  get("/change_equipment", { :controller => "application", :action => "change_equipment"})

end
