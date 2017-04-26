module Craigslist
  class Search
    def perform
      request_and_parse
    end

    private

    def request_and_parse
      # hard coded search params
      craigslist_url = 'http://seattle.craigslist.org/search/pet?query=dog+-missing+-training+-lost&hasPic=1'
      process_response(craigslist_url)
    end

    def process_response(craigslist_url)
      response = RestClient.get(craigslist_url)
      clean_html = Parser::HTMLCleaner.new.clean(response.body)
      nokogiri_results_page = Nokogiri::HTML(clean_html)
      Parser::Results.new.parse(nokogiri_results_page, craigslist_url)
    end
  end
end
