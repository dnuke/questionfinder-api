class V1::Form < ApplicationRecord
	belongs_to :category, foreign_key: :v1_category_id, optional: true, class_name: V1::Category
	has_many :reports, foreign_key: :v1_form_id, dependent: :destroy
	
	has_many :questions, foreign_key: :v1_form_id, class_name: V1::Question, dependent: :destroy
	has_many :types, through: :questions, source: :form
  
	has_many :answer, through: :questions, source: :form

  
	def add_visit
		if self.visits_count==nil
			self.visits_count=0
		end
		self.visits_count=self.visits_count+1;
		self.save
	end
	
	def self.search(term)
		term="%#{term}%"
		where("title ILIKE :s OR details ILIKE :s",s: term)
	end
end
