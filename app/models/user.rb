class User < ActiveRecord::Base
  has_many :received_messages, :class_name => Message.name,
    :foreign_key => "recipient_id"
  has_many :sent_messages, :class_name => Message.name,
    :foreign_key => "sender_id"
  belongs_to :subscription
    
  attr_accessible :login, :subscription
  
  def send_message(message_attributes)
    if subscription.can_send_message?
      sent_messages.create! message_attributes
    end
  end
  
end
