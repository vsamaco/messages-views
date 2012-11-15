class Subscription < ActiveRecord::Base
  has_one :user, :class_name => "User"
  attr_accessible :user
  
  def can_send_message?
  end
end
