# frozen_string_literal: true

class UrlsController < ApiController
  def create
    url = CreateUrlService.new.call(params[:address])
    render_json(url, status = 201)
  end

  def show
    url = Url.find_by(shortened_address: params[:id])
    IncreaseVisitUrlService.new(url).call
    render_json(url)
  end

  def top_100
    render_json(Url.top_100)
  end

  private

  def render_json(obj, status = 200, fields = %i[count address shortened_address])
    render json: obj.to_json(only: fields), status: status
  end

  def url_params
    params.permit(:address)
  end
end
