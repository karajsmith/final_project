class RankingsController < ApplicationController
  before_action :current_user_must_be_ranking_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_ranking_user
    ranking = Ranking.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == ranking.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Ranking.ransack(params[:q])
    @rankings = @q.result(:distinct => true).includes(:user, :destination).page(params[:page]).per(10)

    render("ranking_templates/index.html.erb")
  end

  def show
    @ranking = Ranking.find(params.fetch("id_to_display"))

    render("ranking_templates/show.html.erb")
  end

  def new_form
    @ranking = Ranking.new

    render("ranking_templates/new_form.html.erb")
  end

  def create_row
    @ranking = Ranking.new

    @ranking.user_id = params.fetch("user_id")
    @ranking.destination_id = params.fetch("destination_id")
    @ranking.rankings = params.fetch("rankings")

    if @ranking.valid?
      @ranking.save

      redirect_back(:fallback_location => "/rankings", :notice => "Ranking created successfully.")
    else
      render("ranking_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_destination
    @ranking = Ranking.new

    @ranking.user_id = params.fetch("user_id")
    @ranking.destination_id = params.fetch("destination_id")
    @ranking.rankings = params.fetch("rankings")

    if @ranking.valid?
      @ranking.save

      redirect_to("/destinations/#{@ranking.destination_id}", notice: "Ranking created successfully.")
    else
      render("ranking_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ranking = Ranking.find(params.fetch("prefill_with_id"))

    render("ranking_templates/edit_form.html.erb")
  end

  def update_row
    @ranking = Ranking.find(params.fetch("id_to_modify"))

    
    @ranking.destination_id = params.fetch("destination_id")
    @ranking.rankings = params.fetch("rankings")

    if @ranking.valid?
      @ranking.save

      redirect_to("/rankings/#{@ranking.id}", :notice => "Ranking updated successfully.")
    else
      render("ranking_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @ranking = Ranking.find(params.fetch("id_to_remove"))

    @ranking.destroy

    redirect_to("/users/#{@ranking.user_id}", notice: "Ranking deleted successfully.")
  end

  def destroy_row_from_destination
    @ranking = Ranking.find(params.fetch("id_to_remove"))

    @ranking.destroy

    redirect_to("/destinations/#{@ranking.destination_id}", notice: "Ranking deleted successfully.")
  end

  def destroy_row
    @ranking = Ranking.find(params.fetch("id_to_remove"))

    @ranking.destroy

    redirect_to("/rankings", :notice => "Ranking deleted successfully.")
  end
end
