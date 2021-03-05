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
end
