class User < ActiveRecord::Base
  has_many :posts

    validates :login,
              presence: true,
              length: {minimum: 3},
              uniqueness: true

    validate :password_complexity

    validates :email,
             presence: true,
             format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
             uniqueness: true


    def password_complexity
      if password.present? and not password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
        errors.add :password, "must include at least one lowercase letter, one uppercase letter and one digit"
      end
    end
end
