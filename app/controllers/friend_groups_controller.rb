class FriendGroupsController < ApplicationController
  def index
    @friend_groups = FriendGroup.all

    render("friend_group_templates/index.html.erb")
  end

  def show
    @friend_group = FriendGroup.find(params.fetch("id_to_display"))

    render("friend_group_templates/show.html.erb")
  end

  def new_form
    @friend_group = FriendGroup.new

    render("friend_group_templates/new_form.html.erb")
  end

  def create_row
    @friend_group = FriendGroup.new

    @friend_group.friend_request_id = params.fetch("friend_request_id")
    @friend_group.name = params.fetch("name")
    @friend_group.destination_id = params.fetch("destination_id")

    if @friend_group.valid?
      @friend_group.save

      redirect_back(:fallback_location => "/friend_groups", :notice => "Friend group created successfully.")
    else
      render("friend_group_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friend_group = FriendGroup.find(params.fetch("prefill_with_id"))

    render("friend_group_templates/edit_form.html.erb")
  end

  def update_row
    @friend_group = FriendGroup.find(params.fetch("id_to_modify"))

    @friend_group.friend_request_id = params.fetch("friend_request_id")
    @friend_group.name = params.fetch("name")
    @friend_group.destination_id = params.fetch("destination_id")

    if @friend_group.valid?
      @friend_group.save

      redirect_to("/friend_groups/#{@friend_group.id}", :notice => "Friend group updated successfully.")
    else
      render("friend_group_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @friend_group = FriendGroup.find(params.fetch("id_to_remove"))

    @friend_group.destroy

    redirect_to("/friend_groups", :notice => "Friend group deleted successfully.")
  end
end
