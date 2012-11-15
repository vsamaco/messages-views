class User < ActiveRecord::Base
  has_many :received_messages, :class_name => Message.name,
    :foreign_key => "recipient_id"
  has_many :sent_messages, :class_name => Message.name,
    :foreign_key => "sender_id"
    
  attr_accessible :login
  
  def send_message(message_attributes)
    sent_messages.create! message_attributes
  end
end
