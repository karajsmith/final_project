Rails.application.routes.draw do
  # Routes for the Destination resource:

  # CREATE
  get("/destinations/new", { :controller => "destinations", :action => "new_form" })
  post("/create_destination", { :controller => "destinations", :action => "create_row" })

  # READ
  get("/destinations", { :controller => "destinations", :action => "index" })
  get("/destinations/:id_to_display", { :controller => "destinations", :action => "show" })

  # UPDATE
  get("/destinations/:prefill_with_id/edit", { :controller => "destinations", :action => "edit_form" })
  post("/update_destination/:id_to_modify", { :controller => "destinations", :action => "update_row" })

  # DELETE
  get("/delete_destination/:id_to_remove", { :controller => "destinations", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
