class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new()
    if @message.save
      flash[:notice]
    end
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
