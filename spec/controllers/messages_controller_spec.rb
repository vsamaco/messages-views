require 'spec_helper'

describe MessagesController do
  describe "POST create" do
    it "creates a new message" do
      Messages.should_receive(:new).with("text" => "a quick brown fox")
      post :create, :message => { "text" => "a quick brown fox" }
    end
    it "saves the message"
  end
end