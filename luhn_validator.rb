# frozen_string_literal: true

# module for validation using luhn algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    (
      # reverse the integer array
      # double the value of each second digit
      # convert numbers with 2 digits into 1 digit by (- 9)
      # sum and check if it can divide by 10
      nums_a
        .reverse
        .map.with_index { |digit, index| index.odd? ? digit * 2 : digit }
        .map { |num| num > 9 ? num - 9 : num }
        .sum % 10
    ).zero?
  end
end
