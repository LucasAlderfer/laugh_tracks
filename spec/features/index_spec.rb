# As a visitor,
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age

# As a visitor,
# When I visit `/comedians`
# Then I also see a list of each comedian's specials.

# As a visitor,
# When I visit `/comedians`
# Then I also see the average age for all comedians.

# As a visitor,
# when I visit `/comedians?age=34`
# Then I see a list of all comedians with an age of 34.

# As a visitor,
# When I visit `/comedians`
# Then I also see the count of specials for each comedian.

RSpec.describe 'A visitor' do
  context 'visiting /comedians' do
    it "should display a list of each comedian's name and age" do
      comic_1 = Comedian.create(name: "lihdf", age: 20)
      comic_2 = Comedian.create(name: "djkfn", age: 30)

      visit '/comedians'

      expect(page).to have_content('lihdf')
      expect(page).to have_content('djkfn')
      expect(page).to have_content('20')
      expect(page).to have_content('30')
    end

    it 'should list each commedians specials' do
      comic_1 = Comedian.create(name: "lihdf", age: 20)
      comic_1.specials.create(name: "dfin")
      comic_1.specials.create(name: "djklns")
      comic_2 = Comedian.create(name: "shdhs", age: 20)
      comic_2.specials.create(name: "jnsdj")
      comic_2.specials.create(name: "ksiwie")

      visit '/comedians'

      expect(page).to have_content('dfin')
      expect(page).to have_content('djklns')
      expect(page).to have_content('jnsdj')
      expect(page).to have_content('ksiwie')
    end

    it 'should show the average age of all comedians' do
      comic_1 = Comedian.create(name: "lihdf", age: 20)
      comic_2 = Comedian.create(name: "djkfn", age: 30)
      expected_result_1 = 25

      visit '/comedians'

      expect(page).to have_content(expected_result_1)

      comic_3 = Comedian.create(name: "kdjnf", age: 40)
      expected_result_2 = 30

      visit '/comedians'

      expect(page).to have_content(expected_result_2)
    end

    it 'should list all comedians of any age that I query' do
      comic_1 = Comedian.create(name: "lihdf", age: 20)
      comic_2 = Comedian.create(name: "djkfn", age: 35)
      comic_1 = Comedian.create(name: "kdjnfd", age: 20)

      visit '/comedians?age=20'

      expect(page).to have_content("lihdf")
      expect(page).to have_content("kdjnfd")
      expect(page).to_not have_content("djkfn")

      visit '/comedians?age=35'

      expect(page).to_not have_content("lihdf")
      expect(page).to_not have_content("kdjnfd")
      expect(page).to have_content("djkfn")
    end

    it 'should list the number of specials for each comedian' do
      comic_1 = Comedian.create(name: "lihdf", age: 20)
      comic_1.specials.create(name: "dfin")
      comic_1.specials.create(name: "djklns")
      expected_result = 'Special Count: 2'

      visit '/comedians'

      expect(page).to have_content(expected_result)
    end
  end
end
