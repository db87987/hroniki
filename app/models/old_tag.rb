class OldTag < ActiveRecord::Base
  attr_accessible :old_id, :tag_id
  
  belongs_to :old
  belongs_to :tag
end
