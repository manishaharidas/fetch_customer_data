require 'spec_helper'

describe FetchCustomerData do
  it 'has a version number' do
    expect(FetchCustomerData::VERSION).not_to be nil
  end

  it 'fetches data from json' do
    expect(FetchCustomerData::fetch_data("/Users/manishaharidas/Desktop/collection.json")).to eq(true)
  end

  it 'returns error for invalid file path' do
    expect(FetchCustomerData::fetch_data("/Users/manishaharidas/Desktop/collect.json")).to eq(nil)
  end
end
