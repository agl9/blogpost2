class Tag < ApplicationRecord
<<<<<<< HEAD
  has_many :taggings, dependent: :destroy
=======
  has_many :taggings
>>>>>>> b5a1508b4ee5594e8dab4b447e1c80b79fe46fc1
  has_many :articles, through: :taggings
end
