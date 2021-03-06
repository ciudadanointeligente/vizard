require 'icalendar'

class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :generate_ical]
  before_action :set_project
  before_action :set_objective

  respond_to :html, :json

  def index
    if params[:outcome_id]
      @activities = Outcome.find(params[:outcome_id]).activities
    elsif params[:objective_id]
      @activities = Objective.find(params[:objective_id]).activities
    else
      @activities = Project.find(params[:project_id]).activities
    end
    respond_with(@activities)
  end

  def show
    respond_with(@activity)
  end

  def new
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @activity = @objective.activities.create(activity_params)
    @activity.outcome_ids = params[:outcome_ids]
    @activity.ask_ids = params[:ask_ids]
    respond_with(@project, @objective, @activity)
  end

  def update
    @activity.update(activity_params)
    @activity.outcome_ids = params[:outcome_ids]
    @activity.ask_ids = params[:ask_ids]
    respond_with(@project, @objective, @activity)
  end

  def destroy
    @activity.destroy
    respond_with(@project, @objective, @activity)
  end

  def stage6
  end

  def generate_ical
      cal = Icalendar::Calendar.new
      event = Icalendar::Event.new

      event.dtstart = @activity.scheduling
      event.summary = @activity.description
      cal.add_event(event)
      cal.publish
      headers['Content-Type'] = "text/calendar; charset=UTF-8"
      render :layout => false, :text => cal.to_ical
    end

  private
    def set_objective
      @objective = Objective.find(params[:objective_id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params[:activity][:outcome_ids] ||= []
      params[:activity][:ask_ids] ||= []
      params.require(:activity).permit(:title, :description, :completion, :scheduling, :objective_id, :organizer, :activity_types, outcome_ids: [], ask_ids: [])
    end
end
