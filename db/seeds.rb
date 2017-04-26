# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# TODO: Figure out the right production configuration and get this moved to the /lib directory where it belongs

class Craigslist
  def search
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
    clean_html = clean(response.body)
    nokogiri_results = Nokogiri::HTML(clean_html)
    parse_results(nokogiri_results, craigslist_url)
  end

  def parse_results(nokogiri_results, craigslist_url)
    result_card_nodes = parse_result_cards(nokogiri_results)
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

  def clean(html_string)
    remove_any_white_space_between_tags(
      condense_whitespace(html_string)
    ).strip
  end

  def remove_any_white_space_between_tags(html_string)
    html_string.gsub(/(?<=>)\s+(?=<)/, '')
  end

  def condense_whitespace(html_string)
    html_string.gsub(/\s+/, ' ')
  end
end

# Populate the db with dogs
parsed_results = Craigslist.new.search
parsed_results.each do |result|
  dog = Dog.new
  dog.url = result[:url]
  dog.images = result[:images]
  dog.cats = [true, false].sample
  dog.children = [true, false].sample
  dog.energy = rand(1..5)
  dog.save
end
