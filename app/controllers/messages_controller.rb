class MessagesController < ApplicationController
  def create
    message = Message.new(params[:message])
    if message.save
      flash[:notice] = "The message was saved successfully."
    end
    redirect_to :action => "index"
  end
end
