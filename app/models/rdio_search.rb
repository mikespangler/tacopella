class RdioSearch

  attr_accessor :search_results, :results_hash

  def initialize(search_q)
    #api = Rdio::Api.new('nwqk6482vnzn47ph332m5e6v', 'TxxUNrJC3v')
    @search_results = create_results_hash(search_q)
  end



  def create_results_hash(search_q)
    results = []
    search_q.each do |result|
      begin
      results << {
        raise  
        key: result.trackKeys[0] if !result.trackKeys[0].nil?, 
        name: result.name if !result.trackKeys[0].nil?, 
        artist: result.artist if !result.trackKeys[0].nil? }
    end
    results
  end

  # def as_json(option = {})
  #   @search_results.map do |result|
  #     {
  #       key: result.key,
  #       name: result.name,
  #       artist: result.artist_name
  #     }
  #   end
  # end
  
end
