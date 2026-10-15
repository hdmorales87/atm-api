module Api
  module V1
    class BaseController < ApplicationController    
        attr_reader :transaction_amount        
        before_action :find_bank_account        
        private
        
          def find_bank_account
              @bank_account = BankAccount.find_by(account_number: params[:account_number])
              render json: { error: "Account not found" }, status: :not_found if @bank_account.nil?
          end

          def set_transaction_amount            
              _transaction_amount = params[:amount].to_f
              if _transaction_amount <= 0
                  render json: { error: "Amount must be greater than 0" }, status: :bad_request
                  return
              end
              @transaction_amount = _transaction_amount
          end
    end
  end
end