class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :text,
            presence: true,
            length: {minimum: 3, maximum: 30}



end
