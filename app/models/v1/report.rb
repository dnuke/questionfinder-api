class V1::Report < ApplicationRecord
	belongs_to :form, foreign_key: :v1_form_id, optional: true, class_name: V1::Form
  
	after_create :add_report
	after_destroy :del_report
   
	def add_report
		obj=self.form
		if obj.reports_count==nil
			obj.reports_count=0
		end
		obj.reports_count=obj.reports_count+1
		obj.save
	end
	def del_report
		obj=self.form
		obj.reports_count=obj.reports_count-1
		obj.save
	end
end
