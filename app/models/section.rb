class Section < ApplicationRecord

	belongs_to :page
  has_many :section_edits
	has_many :users, :through => :section_edits
	
	scope :visible, lambda {where(:visible => true) }
  scope :invisible, lambda {where(:visible => false) }
  scope :sorted, lambda {order("position ASC") }
  scope :newest_first, lambda {order("created_at DESC")}
  scope :search, lambda {|query| where(["name LIKE ?", "1%#{query}%"])}
	
end
