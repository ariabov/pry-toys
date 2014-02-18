require 'spec_helper'

describe Hash do  
  let(:n) { 3 }
  let(:toy) { Hash.toy(n) }

  it 'has valid type' do
    expect(Hash.toy.class).to eq Hash
  end

  it 'has `n` number key / value pairs' do
    expect(Hash.toy(n).each_pair.count).to eq n
  end

  it 'able handle `n` of large sizes' do
    expect(Hash.toy(10000).each_pair.count).to eq 10000
  end

  it 'uses letters as keys' do
    expect(Hash.toy(n).keys).to eq %w|a b c|
  end
end