class Test < ApplicationRecord
  def self.sort(categories)
    mas=[]
    mas << Test.where(category: categories).take!
  end
end
