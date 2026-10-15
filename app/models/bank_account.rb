class BankAccount < ApplicationRecord
    validates :account_number, presence: true, uniqueness: true
    validates :balance, numericality: { greater_than: 0 }
end
