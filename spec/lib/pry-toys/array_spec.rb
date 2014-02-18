require 'spec_helper'

describe Array do
  shared_examples "no nil values" do
    it "does not contain `nil` value" do
      expect(toy.include? nil).to be_false
    end
  end

  let(:n) { 3 }

  context "with 1 argument" do
    let(:toy) { Array.toy(n) }

    it 'returns right length' do
      expect(toy.size).to eq n
    end

    it 'equals [1, 2, 3]' do
      expect(toy).to eq [1, 2, 3]
    end

    include_examples "no nil values"
  end

  context "with 2 arguments" do
    context "2nd argument is" do
      context 'String' do
        let(:toy) { Array.toy(n, Integer) }

        it "works" do
          expect(toy).to eq [1, 2, 3]
        end

        include_examples "no nil values"
      end

      context "Float" do
        let(:toy) { Array.toy(n, Float) }

        it "works" do
          expect(toy).to eq [1.0, 2.0, 3.0]
        end

        include_examples "no nil values"
      end

      context "String" do
        let(:type) { String }
        let(:toy) { Array.toy(n, type) }

        it "works" do
          expect(toy.first.class).to eq type
        end

        include_examples "no nil values"
      end

      context "Time" do
        let(:type) { Time }
        let(:toy) { Array.toy(3, type) }
        let(:day) { 60 * 60 * 24 }

        it "returns Time object" do
          expect(toy.first).to be_an_instance_of type
        end

        it "returns Time object 1 day apart" do
          expect(toy[1]).to eq (toy[0] + day)
        end
      end

      context "Date" do
        let(:toy) { Array.toy(3, Date) }
        let(:day) { 1 }

        it "returns Time object" do
          expect(toy.first).to be_an_instance_of Date
        end

        it "returns Time object 1 day apart" do
          expect(toy[1]).to eq (toy[0] + day)
        end
      end

      context "Unknown" do
        it "works with Object" do
          expect(Array.toy(3, Object).first).to be_an_instance_of Object
          expect(Array.toy(3, Object).size).to eq 3
        end
      end
    end
  end

  context "with block" do
    it "accepts block" do
      expect(Array.toy(n) {|i| i*3}).to eq [0, 3, 6]
    end
  end

end