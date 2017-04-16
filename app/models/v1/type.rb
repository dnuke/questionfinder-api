class V1::Type < ApplicationRecord
	has_many :questions, foreign_key: :v1_type_id, class_name: V1::Question, dependent: :destroy
	has_many :forms, through: :questions, source: :type
	
	has_many :answers, through: :questions, class_name: V1::Question
end
