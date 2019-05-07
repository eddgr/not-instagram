class MessageThreadsController < ApplicationController
  before_action :message_participant?, except: [:index, :new, :create]

  # READ
  def index
    @inbox = current_user.message_threads
    @messages = MessageThread.where(receiver_id: current_user.id)
  end

  def show
    set_receiver
  end

  # CREATE
  def new
    exist = MessageThread.find_by(user: current_user, receiver_id: User.find(params[:id]))
    # check to see if a message thread already exists
    if !!exist
      redirect_to exist
    else
      @thread = MessageThread.new
    end
  end

  def create
    @thread = MessageThread.new(thread_params)
    if @thread.save
      redirect_to @thread
    end
  end

  # PRIVATE METHODS
  private

  def set_receiver
    @thread = MessageThread.find(params[:id])
    @receiver = User.find(@thread.receiver_id)
  end

  def thread_params
    params.require(:message_thread).permit(:user_id, :receiver_id, :body)
  end

  def message_participant?
    set_receiver
    redirect_to inbox_path unless current_user == @receiver || current_user == @thread.user
  end
end
