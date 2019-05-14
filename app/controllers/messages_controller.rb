class MessagesController < ApplicationController
  # CREATE
  def create
    @thread = MessageThread.find(params[:message_thread_id])
    @message = @thread.messages.build(message_params)
    if @thread.save
      # update the time on the original thread to the latest messages created time
      @thread.updated_at = @thread.messages.last.created_at
      # save it to memory
      @thread.save
      redirect_to @thread
    end
  end

  # PRIVATE METHOD
  private

  def message_params
    params.require(:message).permit(:user_id, :body)
  end
end
