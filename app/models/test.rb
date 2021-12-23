class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :result

  has_many :questions, dependent: :destroy
  has_many :users, through: :results

  def self.all_category_tests(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
