class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
    validates :title, presence: true,
     length: {minimum: 5, maximum: 50}

    validates :text, presence: true,
      length: {minimum: 5, maximum: 500}

     belongs_to :user
end
