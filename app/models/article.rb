class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}, format: { with: /\A[a-zA-Z]+\z/, message: "Only alphabets" }

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :attachments, dependent: :destroy

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(', ')
  end

  def tag_list= (tags_string)
    tag_names = tags_string.split(',').collect{|tag| tag.strip.downcase}.uniq
    new_or_found = tag_names.collect{|name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found
  end

end
