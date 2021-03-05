# frozen_string_literal: true

require_relative '../../lib/shortener.rb'

PREVIOUSLY_GENERATED_NUMBERS = { 1 => 'b', 2 => 'c', 3 => 'd', 99 => 'bL', 999_999_999 => 'bfP3Qp', 4 => 'lala'}.freeze

class ShortenerTest < ActiveSupport::TestCase
  test 'against a previously generated fixtures' do
    PREVIOUSLY_GENERATED_NUMBERS.each do |number, value|
      assert_equal Shortener.generate_id_for(number), value, "#{number} != #{value}"
    end
  end
end
