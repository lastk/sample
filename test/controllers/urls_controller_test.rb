# frozen_string_literal: true

require 'test_helper'

class UrlControllerTest < ActionDispatch::IntegrationTest
  test 'create url' do
    post urls_path, params: { address: 'http://url.com' }, as: :json

    assert_response 201
  end

  test 'show url' do
    url = Url.create!(address: 'http://url.com', shortened_address: 'abc')

    get url_path(url.shortened_address), as: :json
    assert_response 200

    get url_path(url.shortened_address), as: :json
    url.reload

    assert_equal url.count, 2

    get url_path(url.shortened_address), as: :json
    url.reload
    assert_equal url.count, 3
  end

  test 'top_100' do
    200.times do |i|
      Url.create!(address: "http:://www.google#{i}.com", count: rand(1..1000))
    end

    get urls_top_100_path

    assert_equal response.parsed_body.count, 100
  end
end
