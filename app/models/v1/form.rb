class V1::Form < ApplicationRecord
	belongs_to :category, foreign_key: :v1_category_id, optional: true, class_name: V1::Category
	has_many :reports, foreign_key: :v1_form_id, dependent: :destroy
	
	has_many :questions, foreign_key: :v1_form_id, class_name: V1::Question, dependent: :destroy
	has_many :types, through: :questions, source: :form
  
	has_many :answers, through: :questions, source: :form

  	after_create :set_vals
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

	def set_vals
		if self.visits_count==nil
			self.visits_count=0
		end
		if self.reports_count==nil
			self.reports_count=0
		end
		if self.questions_count==nil
			self.questions_count=0
		end
        self.save
	end
end
