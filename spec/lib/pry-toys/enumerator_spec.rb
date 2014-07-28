require 'spec_helper'

describe Enumerator do
  shared_examples "no nil values" do
    it "does not contain `nil` value" do
      expect(toy.take(3)).not_to include(nil)
    end
  end

  context "with nothing specified" do
    let(:toy) { described_class.toy }

    it 'defaults to enumerator of Integers' do
      expect(toy.take(3)).to eq([1, 2, 3])
    end

    it 'has infinite size' do
      pending 'Only usable in Ruby 2 or greater' unless RUBY_VERSION.split.first.to_i >= 2
      expect(toy.size).to eq(Float::INFINITY)
    end

    include_examples "no nil values"
  end

  context "with `type` specified" do
    context "when `type` is" do
      context 'Integer' do
        let(:toy) { described_class.toy(Integer) }

        it "contains Integer values" do
          expect(toy.take(3)).to eq [1, 2, 3]
        end

        include_examples "no nil values"
      end

      context "Float" do
        let(:toy) { described_class.toy(Float) }

        it "contains Float values" do
          expect(toy.take(3)).to eq [1.0, 2.0, 3.0]
        end

        include_examples "no nil values"
      end

      context "String" do
        let(:toy) { described_class.toy(String) }

        it "contains String values" do
          expect(toy.first.class).to eq String
        end

        include_examples "no nil values"
      end

      context "Time" do
        let(:toy) { described_class.toy(Time) }
        let(:day) { 60 * 60 * 24 }

        it "contains Time objects" do
          expect(toy.first).to be_an_instance_of Time
        end

        it "returned Time objects are 1 day apart" do
          expect(toy.take(3)[1]).to be_within(1).of(toy.take(3)[0] + day)
        end
      end

      context "Date" do
        let(:toy) { described_class.toy(Date) }
        let(:day) { 1 }

        it "contains Date objects" do
          expect(toy.first).to be_an_instance_of Date
        end

        it "returns Date object 1 day apart" do
          expect(toy.take(3)[1]).to be_within(1).of(toy.take(3)[0] + day)
        end
      end

      context "Not predetermined class" do
        it "works with any object" do
          expect(described_class.toy(BasicObject).take(3)).to_not be_empty
          expect(described_class.toy(Object).take(3)).to_not be_empty
        end

        it "contains same object type" do
          expect(described_class.toy(Object).first).to be_an_instance_of Object
        end

        it "raises an exception if Object does not respond to `new`" do
          expect {
            described_class.toy(Kernel)
          }.to raise_error
        end
      end
    end
  end

  context "with block" do
    it "yields the block" do
      expect { |probe| described_class.toy(&probe).take(3) }.to yield_successive_args(0, 1, 2)
    end

    it "contains the return values from the block" do
      expect(described_class.toy {|i| i*3 }.take(3)).to eq([0, 3, 6])
    end
  end
end
