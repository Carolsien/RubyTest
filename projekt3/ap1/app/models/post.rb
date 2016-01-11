class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title,
            presence: true,
            length: {minimum: 3}

  validates :text,
            presence: true,
            length: {minimum: 3, maximum: 2000}

end
