class Chapter < ActiveRecord::Base
	belongs_to :syllabus
	validates :name, :uniqueness => true,:presence=>true

	before_destroy :user_delete

def user_delete
	raise self.inspect
	end
end
