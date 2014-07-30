class MessagesController < ApplicationController
  respond_to :html

  def index
  end

  def create
    message = Message.new(params[:contact_form])
    if message.deliver
      redirect_to root_path, :notice => 'Email has been sent.'
    else
      redirect_to root_path, :notice => 'Email could not be sent.'
    end
  end
end
