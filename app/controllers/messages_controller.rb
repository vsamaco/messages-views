class MessagesController < ApplicationController
  def create
    Message.new(params[:message])
    redirect_to :action => "index"
  end
end
