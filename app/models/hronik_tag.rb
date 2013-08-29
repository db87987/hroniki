class HronikTag < ActiveRecord::Base
  attr_accessible :hronik_id, :tag_id
  belongs_to :hronik
  belongs_to :tag
end
