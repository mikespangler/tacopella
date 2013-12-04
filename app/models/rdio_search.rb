class RdioSearch
  RDIO_KEY = 'nwqk6482vnzn47ph332m5e6v'
  RDIO_SECRET = 'TxxUNrJC3v'

  def initialize(search_q)
    api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
    @search_results = api.search(search_q,types='Song',never_or=nil,extras=nil,count=5)
  end

  def as_json(option = {})
    @search_results.map do |result|
      {
        key: result.key,
        name: result.name,
        artist: result.artist_name
      }
    end
  end

end
