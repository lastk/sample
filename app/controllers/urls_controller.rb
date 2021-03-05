# frozen_string_literal: true

class UrlsController < ApiController
  def create
    url = CreateUrlService.new.call(params[:address])
    render json: url.to_json, status: 201
  end

  def show
    url = Url.find_by(shortened_address: params[:id])
    IncreaseVisitUrlService.new(url).call
    render json: url.to_json
  end

  private

  def url_params
    params.permit(:address)
  end
end
