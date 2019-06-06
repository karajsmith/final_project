class DestinationsController < ApplicationController
  def index
    @q = Destination.ransack(params[:q])
    @destinations = @q.result(:distinct => true).includes(:rankings, :friend_groups).page(params[:page]).per(10)

    render("destination_templates/index.html.erb")
  end

  def show
    @friend_group = FriendGroup.new
    @ranking = Ranking.new
    @destination = Destination.find(params.fetch("id_to_display"))

    render("destination_templates/show.html.erb")
  end

  def new_form
    @destination = Destination.new

    render("destination_templates/new_form.html.erb")
  end

  def create_row
    @destination = Destination.new

    @destination.city = params.fetch("city")
    @destination.country = params.fetch("country")

    if @destination.valid?
      @destination.save

      redirect_back(:fallback_location => "/destinations", :notice => "Destination created successfully.")
    else
      render("destination_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @destination = Destination.find(params.fetch("prefill_with_id"))

    render("destination_templates/edit_form.html.erb")
  end

  def update_row
    @destination = Destination.find(params.fetch("id_to_modify"))

    @destination.city = params.fetch("city")
    @destination.country = params.fetch("country")

    if @destination.valid?
      @destination.save

      redirect_to("/destinations/#{@destination.id}", :notice => "Destination updated successfully.")
    else
      render("destination_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @destination = Destination.find(params.fetch("id_to_remove"))

    @destination.destroy

    redirect_to("/destinations", :notice => "Destination deleted successfully.")
  end
end
