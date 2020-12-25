class Author < ApplicationRecord
  authenticates_with_sorcery!

  validates_confirmation_of :password, message: "Should match password", if: :password

  has_many :articles
end
