module Api
  module V1
    class WithdrawController < BaseController
      before_action :set_transaction_amount, :check_balance
      def create
        @bank_account.balance -= transaction_amount
        @bank_account.save
        render json: { message: "Withdraw successful" }
      end

      private

      def check_balance
        return if @bank_account.balance >= transaction_amount

        render json: { error: "Insufficient funds" }, status: :unprocessable_entity
        end
    end
  end
end