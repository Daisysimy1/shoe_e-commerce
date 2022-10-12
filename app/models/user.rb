class User < ApplicationRecord
    enum :type, [ :buyer, :seller, :admin]
    has_many :shoes, dependant: :destroy
    has_many :carts, dependant: :destroy
    has_many :orders, dependant: :destroy
end
