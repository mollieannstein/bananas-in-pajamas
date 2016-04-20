class Article < ActiveRecord::Base
  has_many :revisions
  has_many :revisors, through: :revisions, source: :revisor
  belongs_to :creator, class_name: "User"
  has_many :taggings
  has_many :categories, through: :taggings, source: :category
  accepts_nested_attributes_for :categories

  def self.search(terms)
    if terms
      where('title LIKE ? OR content LIKE ?', "%#{terms}%", "%#{terms}%")
    else
      all
    end
  end
end
