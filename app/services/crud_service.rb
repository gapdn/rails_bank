# frozen_string_literal: true

class CrudService < BaseService
  attr_reader :params

  def initialize(params)
    @params = params.dup.to_h
  end

  # 1. Mapping @params
  # 2. Validate contract
  def call
    @params = mapper if mapper
    return contract if contract.failure?

    run
  end

  private

  def run
    raise NotImplementedError
  end

  def contract
    raise NotImplementedError
  end

  def mapper; end
end
