class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :check_quantity_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def check_quantity_of_answers
    if question.answers.count >= 4
      errors.add(:base, :count, message: "The question must have from 1 to 4 questions")
    end
  end
end
