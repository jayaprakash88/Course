class CourceDetail < ActiveRecord::Base
	has_many :syllabuses
	before_destroy :check_chapters

	def check_chapters
		syllabuses =self.syllabuses
		syllabuses.each do |each_syllabus|
		  each_syllabus.chapters.each{|chapter| chapter.delete}
		  each_syllabus.delete
		end
	end
end
