class Test < ApplicationRecord
  def self.sort(category)
    Test.joins('JOIN categories on tests.category_id=categories.id').where(categories: {title: category }).order(:title, :desc).pluck(:title)
  end
end
