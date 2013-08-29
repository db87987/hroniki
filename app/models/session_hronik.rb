class SessionHronik < ActiveRecord::Base
  attr_accessible :hronik_id, :session_id
  belongs_to :hronik
end
