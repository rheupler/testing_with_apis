class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @contacts = Contact.all
  end

  def new
    @message = Message.new
    @contacts = Contact.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
      params.permit(:to, :from, :body)
  end
end
