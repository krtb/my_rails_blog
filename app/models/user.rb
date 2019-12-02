class User < ApplicationRecord

    has_many :articles #User is One side, from One-To-Many Association 

    before_save {self.email = email.downcase} # lowercase email value before hitting database 

    validates :username, presence: true, 
    uniqueness: {case_sensitive: false},
    length: { minumum: 3, maximum: 25 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true,
    length: {maximum: 105},
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEX}
end