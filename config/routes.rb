Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "destinations#index"
  # Routes for the Friend request resource:

  # CREATE
  get("/friend_requests/new", { :controller => "friend_requests", :action => "new_form" })
  post("/create_friend_request", { :controller => "friend_requests", :action => "create_row" })

  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  get("/friend_requests/:id_to_display", { :controller => "friend_requests", :action => "show" })

  # UPDATE
  get("/friend_requests/:prefill_with_id/edit", { :controller => "friend_requests", :action => "edit_form" })
  post("/update_friend_request/:id_to_modify", { :controller => "friend_requests", :action => "update_row" })

  # DELETE
  get("/delete_friend_request/:id_to_remove", { :controller => "friend_requests", :action => "destroy_row" })
  get("/delete_friend_request_from_receipient/:id_to_remove", { :controller => "friend_requests", :action => "destroy_row_from_receipient" })
  get("/delete_friend_request_from_sender/:id_to_remove", { :controller => "friend_requests", :action => "destroy_row_from_sender" })

  #------------------------------

  # Routes for the Ranking resource:

  # CREATE
  get("/rankings/new", { :controller => "rankings", :action => "new_form" })
  post("/create_ranking", { :controller => "rankings", :action => "create_row" })

  # READ
  get("/rankings", { :controller => "rankings", :action => "index" })
  get("/rankings/:id_to_display", { :controller => "rankings", :action => "show" })

  # UPDATE
  get("/rankings/:prefill_with_id/edit", { :controller => "rankings", :action => "edit_form" })
  post("/update_ranking/:id_to_modify", { :controller => "rankings", :action => "update_row" })

  # DELETE
  get("/delete_ranking/:id_to_remove", { :controller => "rankings", :action => "destroy_row" })
  get("/delete_ranking_from_destination/:id_to_remove", { :controller => "rankings", :action => "destroy_row_from_destination" })
  get("/delete_ranking_from_user/:id_to_remove", { :controller => "rankings", :action => "destroy_row_from_user" })

  #------------------------------

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
  get("/delete_friend_group_from_friend_request/:id_to_remove", { :controller => "friend_groups", :action => "destroy_row_from_friend_request" })
  get("/delete_friend_group_from_destination/:id_to_remove", { :controller => "friend_groups", :action => "destroy_row_from_destination" })

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
