class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }, allow_nil: true, uniqueness: true

  scope :user_tests, -> (level) { where(level: level) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where level: 2..4 }
  scope :hard, -> { where level: 5..Float::INFINITY }
  scope :all_category_tests, -> (category_title) { joins(:category)
                                                     .where(categories: { title: category_title })
                                                     .order(title: :desc) }

  def self.list_all_category_test(category)
    all_category_tests(category).pluck(:title)
  end
end
