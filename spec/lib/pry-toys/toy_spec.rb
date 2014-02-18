require 'spec_helper'

describe Toy do
  context '#hash_range' do
    it "returns range object" do
      expect(Toy.hash_range_for(3).class).to eq Range
    end

    it 'works with various sizes' do
      expect(Toy.hash_range_for(3)).to eq ('a'..'z')
      expect(Toy.hash_range_for(700)).to eq ('a'..'zz')
      expect(Toy.hash_range_for(1000)).to eq ('a'..'zzz')
      expect(Toy.hash_range_for(20000)).to eq ('a'..'zzzz')
    end
  end
end