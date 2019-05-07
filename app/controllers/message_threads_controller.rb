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
    exist_send = MessageThread.find_by(user: current_user, receiver_id: User.find(params[:id]))
    exist_receive = MessageThread.find_by(receiver_id: current_user.id, user: User.find(params[:id]))
    # check to see if a message thread already exists
    if !!exist_send
      # first check if current user has sent a message to user
      redirect_to exist_send
    elsif !!exist_receive
      # then check if user has sent a message to current user
      redirect_to exist_receive
    else
      # if neither exist, create a new thread
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
