class RdioSearch

  def initialize(rdio_search_results)
    @search_results = rdio_search_results
  end

  def as_json(option = {})
    @search_results.map do |result|
      {
        key: nil,
        name: nil,
        artist: nil
      }
    end
  end

end
