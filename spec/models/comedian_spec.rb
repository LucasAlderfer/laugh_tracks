RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Instance Methods' do
    describe 'specials_count' do
      it 'should be the number of specials for a comedian' do
        comic_1 = Comedian.create(name: "lihdf", age: 20)
        comic_1.specials.create(name: "dfin")
        comic_1.specials.create(name: "djklns")
        expect(comic_1.specials_count).to eq(2)
      end
    end
  end
end
