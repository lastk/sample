# frozen_string_literal: true

require_relative '../../lib/shortener.rb'

PREVIOUSLY_GENERATED_NUMBERS = { 1 => 'b', 2 => 'c', 3 => 'd', 99 => 'bL', 999_999_999 => 'bfP3Qp' }.freeze

class ShortenerTest < ActiveSupport::TestCase
  test 'against a previously generated fixtures' do
    PREVIOUSLY_GENERATED_NUMBERS.each do |number, value|
      assert_equal Shortener.generate_id_for(number), value, "#{number} != #{value}"
    end
  end

  test 'decrypt against a previously generated fixtures' do
    PREVIOUSLY_GENERATED_NUMBERS.each do |number, encrypted_text|
      assert_equal Shortener.decrypt_text(encrypted_text), number, "#{encrypted_text} != #{number}"
    end
  end

  test 'cant generate if input is not a number' do
    assert_nil Shortener.generate_id_for('hello')
  end
end
