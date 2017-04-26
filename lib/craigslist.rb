module Craigslist
  def self.search
    Craigslist::Search.new.perform
  end
end
