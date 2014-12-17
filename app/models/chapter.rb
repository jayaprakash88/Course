class Chapter < ActiveRecord::Base
	belongs_to :syllabus
	validates :name, :uniqueness => true,:presence=>true
end
