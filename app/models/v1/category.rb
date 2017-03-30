class V1::Category < ApplicationRecord
	has_many :forms, foreign_key: :v1_category_id, class_name: V1::Form, dependent: :destroy
end
