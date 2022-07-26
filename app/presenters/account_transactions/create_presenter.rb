# frozen_string_literal: true

module AccountTransactions
  class CreatePresenter
    attr_reader :params, :current_user

    def initialize(current_user:, params: {})
      @params = params
      @current_user = current_user
    end

    def accounts
      Account.where.not(user_id: current_user.id).pluck(:number, :id)
    end
  end
end
