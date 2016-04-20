class Category < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings, source: :article
end
