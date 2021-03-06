class Message < ActiveRecord::Base
  belongs_to :recipient, :class_name => "User"
  belongs_to :sender, :class_name => "User"
  attr_accessible :recipient, :sender, :text, :title
  validates_presence_of :title, :text, :recipient, :sender
end
