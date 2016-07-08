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

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a new instance of a Word object in the words array') do
      shypod = Word.new('ShyPod')
      shypod.save()
      expect(Word.all()).to(eq([shypod]))
    end
  end

  describe('.clear') do
    it('empties the Words array') do
      shypod = Word.new('ShyPod')
      shypod.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

end
