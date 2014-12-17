class Syllabus < ActiveRecord::Base
	belongs_to :coures_detail
	has_many :chapters
	validates :name, :uniqueness => true,:presence=>true
end
