Rails.application.routes.draw do
  # Routes for the Friend group resource:

  # CREATE
  get("/friend_groups/new", { :controller => "friend_groups", :action => "new_form" })
  post("/create_friend_group", { :controller => "friend_groups", :action => "create_row" })

  # READ
  get("/friend_groups", { :controller => "friend_groups", :action => "index" })
  get("/friend_groups/:id_to_display", { :controller => "friend_groups", :action => "show" })

  # UPDATE
  get("/friend_groups/:prefill_with_id/edit", { :controller => "friend_groups", :action => "edit_form" })
  post("/update_friend_group/:id_to_modify", { :controller => "friend_groups", :action => "update_row" })

  # DELETE
  get("/delete_friend_group/:id_to_remove", { :controller => "friend_groups", :action => "destroy_row" })

  #------------------------------

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
