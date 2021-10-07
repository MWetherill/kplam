class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all.order(updated_at: :DESC)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "New event created."
      redirect_to @event
    else
      flash[:danger] = "Unable to create new event"
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event #{@event.title} was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "The event #{@event.title} has been deleted."
    redirect_to events_path
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :user_id)
    end
  
end
