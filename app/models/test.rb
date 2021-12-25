class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true }, allow_nil: true, if: :smaller_than_zero?, presence: true
  validate :validate_max_level, on: :create

  scope :user_tests, -> (level) { where(level: level) }
  scope :all_category, -> { category.order(title: :desc) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where level: 2..4 }
  scope :hard, -> { where level: 5..Float::INFINITY }
  scope :all_category_tests, -> (category_title) { joins(:category)
                                                     .where(categories: { title: category_title })
                                                     .order(title: :desc)
                                                     .pluck(:title) }

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end

  def smaller_than_zero?
    errors.add(:level) if level.to_i<0
  end
end