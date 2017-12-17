class NumberValidator < Apipie::Validator::BaseValidator
  def validate(value)
    value.to_s =~ /\A(0|[1-9]\d*)\Z$/
  end
  def self.build(param_description, argument, options, block)
    if argument == :number
      self.new(param_description)
    end
  end
  def description
      'Should be a number'
  end
end

class BooleanValidator < Apipie::Validator::BaseValidator
  def validate(value)
    %w[true false 1 0].include?(value.to_s)
  end
  def self.build(param_description, argument, options, block)
    if argument == :bool || argument == :boolean
      self.new(param_description)
    end
  end
  def description
    string = %w(true false 1 0).map { |value| "<code>#{value}</code>" }.join(', ')
    "Should be of the following values: #{string}"
  end
end