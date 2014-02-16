require_relative '../spec_helper'

describe 'pry-toys' do
  shared_examples "no nil values" do
    it "does not contain `nil` value" do
      expect(toy.include? nil).to be_false
    end
  end

  context Array do
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
      end
    end

    context "with block" do
      it "accepts block" do
        expect(Array.toy(n) {|i| i*3}).to eq [0, 3, 6]
      end
    end

  end

  context Hash do
    context "takes 1 argument" do
      it 'uses letters as keys' do
        expect(Hash.toy(3).keys).to eq %w|a b c|
      end
    end
  end

  context String do
    let(:n) { 500 }
    let(:toy) { String.toy(n) }

    it "has valid type" do
      expect(toy.class).to eq String
    end

    it "honors length" do
      expect(toy.split.size).to eq n
    end
  end

end