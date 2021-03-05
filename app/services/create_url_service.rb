# frozen_string_literal: true

require "#{Rails.root}/lib/shortener"
class CreateUrlService
  def initialize(shortener = Shortener)
    @shortener = shortener
  end

  def call(url)
    url = Url.create!(address: url)
    url.update!(shortened_address: @shortener.generate_id_for(url.id))

    url
  end
end
