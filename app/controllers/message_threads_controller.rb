class MessageThreadsController < ApplicationController
  before_action :message_participant?, except: :index

  # READ
  def index
    @inbox = current_user.message_threads
  end

  def show
    set_receiver
    # @thread = MessageThread.find(params[:id])
    # @receiver = User.find(@thread.receiver_id)
  end

  # PRIVATE METHODS
  private

  def set_receiver
    @thread = MessageThread.find(params[:id])
    @receiver = User.find(@thread.receiver_id)
  end

  def message_participant?
    set_receiver
    redirect_to inbox_path unless current_user == @receiver || current_user == @thread.user
  end
end
