class User < ApplicationRecord

	has_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits
	
end
