RSpec.describe 'As a visitor' do
  context 'visiting /comedians' do
    it 'should display a list of all comedians with their name and age' do
      Comedian.create(name: 'tom', age: '12')
      visit '/comedians'
      expect(current_path).to eq('/comedians')
      expect(page).to have_content('tom')
      expect(page).to have_content('12')
    end

    it 'should display a list of all of a comedians specials' do
      tom = Comedian.create(name: 'tom', age: '12')
      specialty_1 = Special.create(name: 'funny guy', comedian_id: tom.id)
      specialty_2 = Special.create(name: 'whoopie cushion', comedian_id: tom.id)
      # require 'pry'; binding.pry
      # save_and_open_page
      #tests below showing I don't quite have this working yet.
      expect(page).to have_content('funny guy')
      expect(page).to have_content('whoopie cushion')
    end
  end
end
