class IncreaseVisitUrlService
  def initialize(url)
    @url = url
  end

  def call(count = 1)
    Url.update_counters(@url.id, count: count)
  end
end
