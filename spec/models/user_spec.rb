require 'spec_helper'

describe User do
  
  describe "#send message" do
    before(:each) do
      @zach = User.create!
      @david = User.create!
    end
    
    context "when a the user is under their subscription limit" do
      before(:each) do
        @zach.subscription = Subscription.new
        @zach.subscription.stub(:can_send_message?).and_return true
      end
      
      it "sends a message to another user" do
        msg = @zach.send_message(
          :title => "Book Update",
          :text => "Beta 11 includes great stuff!",
          :recipient => @david,
          :sender => @zach
        )
        @david.received_messages.should == [msg]
      end
      
      it "creates a new message with the submitted attributes" do
        msg = @zach.send_message(
          :title => "Book Update",
          :text => "Beta 11 includes great stuff!",
          :recipient => @david,
          :sender => @zach
        )
        msg.title.should == "Book Update"
        msg.text.should == "Beta 11 includes great stuff!"
      end
      
      it "adds the message to the sender's sent messages" do
        msg = @zach.send_message(
          :title => "Book Update",
          :text => "Beta 11 includes great stuff!",
          :recipient => @david,
          :sender => @zach
        )
        @zach.sent_messages.should == [msg]
      end
    end
    
    context "when the user is over their subscription limit" do
      
      before(:each) do
        @zach.subscription = Subscription.new
        @zach.subscription.stub(:can_send_message?).and_return(false)
      end
      
      it "does not create a message" do
        lambda {
          @zach.send_message(
            :title => "Book Update",
            :text => "Beta 11 includes great stuff!",
            :recipient => @david,
            :sender => @zach
          )
        }.should_not change(Message, :count)
      end
    end
  end
end
