class Customer < ApplicationRecord
    validates :name, presence: true
    validates :phone, format: { with: /(?:\+62)?0?8\d{2}(\d{8})/ }
    validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
end
