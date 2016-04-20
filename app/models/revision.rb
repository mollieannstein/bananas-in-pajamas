class Revision < ActiveRecord::Base
  belongs_to :article
  belongs_to :revisor, class_name: "User"
end