class V1::Question < ApplicationRecord
  	belongs_to :form, foreign_key: :v1_form_id, optional: true, class_name: V1::Form
    belongs_to :type, foreign_key: :v1_type_id, optional: true, class_name: V1::Type
    has_one :answer, foreign_key: :v1_question_id, class_name: V1::Answer, dependent: :destroy
	
    after_create :add_question
    after_destroy :del_question
    
    def add_question
        obj=self.form
        if obj.questions_count==nil
			obj.questions_count=0
        end
        obj.questions_count=obj.questions_count+1
        obj.save
    end   
    def del_question
		obj=self.form
        obj.questions_count=obj.questions_count-1
        obj.save
    end

end
