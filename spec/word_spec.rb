require('word')
require('rspec')
require('definition')

describe(Word) do

  describe('#name') do
    it('returns the name of the word') do
      cheapster = Word.new("Cheapster")
      expect(cheapster.name()).to(eq("Cheapster"))
    end
  end

end
