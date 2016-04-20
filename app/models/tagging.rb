class Tagging < ActiveRecord::Base
  belongs_to :article
  belongs_to :category

  validates :article_id, :category_id, presence: true
end
