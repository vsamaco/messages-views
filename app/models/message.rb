class Message < ActiveRecord::Base
  attr_accessible :recipient_id, :text, :title
end
