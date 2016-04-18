class User < ActiveRecord::Base
  has_many :articles, foreign_key: :creator_id
  has_many :revisions, foreign_key: :revisor_id
  has_secure_password
end