class Person < ApplicationRecord
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true
end
