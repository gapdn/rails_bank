# frozen_string_literal: true

class ApplicationMapper < Dry::Transformer::Pipe
  import Dry::Transformer::HashTransformations

  define! do
    symbolize_keys
  end

  def call(input)
    input.compact!

    super(input)
  end
end
