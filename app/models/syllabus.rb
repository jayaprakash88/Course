class Syllabus < ActiveRecord::Base
	belongs_to :coures_detail
	has_many :chapters
end
