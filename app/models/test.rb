class Test < ApplicationRecord
  has_many :questions
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.sort(category)
    Test.joins('JOIN categories on tests.category_id=categories.id').where(categories: { title: category }).order(:title, :desc).pluck(:title)
  end
end
