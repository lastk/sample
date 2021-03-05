# Simple bijective function
# Basically encodes any integer into a base(n) string,
# where n is ALPHABET.length.
# Based on pseudocode from http://stackoverflow.com/questions/742013/how-to-code-a-url-shortener/742047#742047
# source: https://gist.github.com/zumbojo/1073996 , http://refactormycode.com/codes/125-base-62-encoding , http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby

ALPHABET =
  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.split(//)
# make your own alphabet using:
# (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join
#  use: biject_encode(int)
#  use: biject_decode(int)

class Shortener
  class << self
    def generate_id_for(number)
      bijective_encode(number)
    end

    def decrypt_text(text)
      bijective_decode(text)
    end
  end

  def self.bijective_encode(i)
    return ALPHABET[0] if i == 0

    return nil unless i.is_a? Integer
    return nil if i < 0

    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.bijective_decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
end
