require 'spec_helper'

describe Array do
  shared_examples "no nil values" do
    it "does not contain `nil` value" do
      expect(toy).not_to include(nil)
    end
  end

  let(:n) { 3 }

  context "with only `n` size specified" do
    let(:toy) { Array.toy(n) }

    it 'returns Array' do
      expect(toy.class).to eq Array
    end

    it 'returns `n` length' do
      expect(toy.size).to eq n
    end

    it 'defaults to array of Integers' do
      expect(toy).to eq [1, 2, 3]
    end

    include_examples "no nil values"
  end

  context "with both `n` size and `type` specified" do
    context "when `type` is" do
      context 'Integer' do
        let(:toy) { Array.toy(n, Integer) }

        it "returns array of Integer values" do
          expect(toy).to eq [1, 2, 3]
        end

        include_examples "no nil values"
      end

      context "Float" do
        let(:toy) { Array.toy(n, Float) }

        it "returns array of Float values" do
          expect(toy).to eq [1.0, 2.0, 3.0]
        end

        include_examples "no nil values"
      end

      context "String" do
        let(:toy) { Array.toy(n, String) }

        it "returns array of String values" do
          expect(toy.first.class).to eq String
        end

        it "has `n` size of values in the array" do
          expect(toy.size).to eq n
        end

        include_examples "no nil values"
      end

      context "Time" do
        let(:toy) { Array.toy(3, Time) }
        let(:day) { 60 * 60 * 24 }

        it "returns array of Time objects" do
          expect(toy.first).to be_an_instance_of Time
        end

        it "returned Time objects are 1 day apart" do
          expect(toy[1]).to be_within(1).of(toy[0] + day)
        end
      end

      context "Date" do
        let(:toy) { Array.toy(3, Date) }
        let(:day) { 1 }

        it "returns array of Date objects" do
          expect(toy.first).to be_an_instance_of Date
        end

        it "returns Date object 1 day apart" do
          expect(toy[1]).to be_within(1).of(toy[0] + day)
        end
      end

      context "Not predetermined class" do
        it "works with any object" do
          expect(Array.toy(3, BasicObject)).to_not be_empty
          expect(Array.toy(3, Object)).to_not be_empty
        end

        it "returns array of same object type" do
          expect(Array.toy(3, Object).first).to be_an_instance_of Object
        end

        it "has `n` size of values in the array" do
          expect(Array.toy(3, Numeric).size).to eq 3
        end

        it "raises an exception if Object does not respond to `new`" do
          expect {
            Array.toy(3, Kernel)
          }.to raise_error
        end
      end
    end
  end

  context "with `n` size and block" do
    it "returns array" do
      expect(Array.toy(n) {|i| i*3}).to eq [0, 3, 6]
    end
  end
end
