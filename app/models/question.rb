class Question < ApplicationRecord
  belongs_to :test

  validates :title, presence: true
  validate  :quantity?

  has_many :answers, dependent: :destroy

  private
  def quantity?
    errors.add(:answers) if answers.count>=4
  end

end
