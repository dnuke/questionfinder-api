class V1::Answer < ApplicationRecord
  belongs_to :question, foreign_key: :v1_question_id, optional: true, class_name: V1::Question
end
