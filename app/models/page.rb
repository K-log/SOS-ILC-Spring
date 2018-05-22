class Page < ApplicationRecord
  
  belongs_to :subject, {:optional => false}
	belongs_to :user
	has_many :sections
	
	scope :visible, lambda {where(:visible => true) }
  scope :invisible, lambda {where(:visible => false) }
  scope :sorted, lambda {order("position ASC") }
  scope :newest_first, lambda {order("created_at DESC")}
  scope :search, lambda {|query| where(["name LIKE ?", "1%#{query}%"])}
	
	
end
