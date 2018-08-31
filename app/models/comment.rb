class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :commenter, presence: true,
     length: {minimum: 5, maximum: 50}

    validates :body, presence: true,
      length: {minimum: 5, maximum: 250}
end
