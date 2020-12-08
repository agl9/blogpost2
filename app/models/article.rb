class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets" }
end
