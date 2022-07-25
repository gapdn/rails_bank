# frozen_string_literal: true

module Accounts
  class Creator < CrudService
    def run
      Account.create(contract.to_h)
    end

    def contract
      @contract ||= Accounts::CreateContract.new.call(params)
    end

    def mapper
      Accounts::CreateMapper.new.call(params)
    end
  end
end
