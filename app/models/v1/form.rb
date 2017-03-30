class V1::Form < ApplicationRecord
	belongs_to :category, foreign_key: :v1_category_id, optional: true, class_name: V1::Category
	has_many :reports, foreign_key: :v1_form_id, dependent: :destroy
	
	has_many :questions, foreign_key: :v1_form_id, class_name: V1::Question, dependent: :destroy
	has_many :types, through: :questions, source: :form
  
	has_many :answer, through: :questions, source: :form

  
	def add_loading
		list=self
		if list.visits_count==nil
			list.visits_count=0
		end
		list.visits_count=list.visits_count+1;
		list.save
	end 
end
