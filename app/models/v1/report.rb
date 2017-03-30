class V1::Report < ApplicationRecord
  belongs_to :form, foreign_key: :v1_form_id, optional: true, class_name: V1::Form
end
