require 'rails_helper'

RSpec.describe Dog, type: :model do
  it 'validates uniqueness of url' do
    fido = Dog.create(url: 'http://www.google.com', images: %w(one two))
    ralph = Dog.new(url: 'http://www.google.com', images: %w(one two))

    expect { ralph.save! }.to raise_error
  end
end