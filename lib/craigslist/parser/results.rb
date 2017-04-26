module Craigslist
  module Parser
    class Results
      def parse(nokogiri_subdomain_results, craigslist_url)
        parse_subdomain_results(nokogiri_subdomain_results, craigslist_url)
      end

      private

      def parse_subdomain_results(nokogiri_subdomain_results, craigslist_url)
        result_card_nodes = parse_result_cards(nokogiri_subdomain_results)
        subdomain_results = []
        result_card_nodes.each do |card|
          subdomain_results << {
            url: get_result_url(card, craigslist_url),
            images: get_result_image(card)
          }
        end
        subdomain_results
      end

      def parse_result_cards(nokogiri_subdomain_results)
        nokogiri_subdomain_results.css('.result-row')
      end

      def get_result_url(card, craigslist_url)
        path = card.css('.result-title')[0]['href']
        if path[/craigslist/]
          'https:' + path
        else
          craigslist_url[/.+org/] + path
        end
      end

      def get_result_image(card)
        image_ids = card.css('.result-image')[0]['data-ids']
        image_ids = image_ids.split(',')
        image_ids.map do |id|
          # remove the first two characters
          'http://images.craigslist.org/' + id[2..-1] + '_300x300.jpg'
        end
      end
    end
  end
end
