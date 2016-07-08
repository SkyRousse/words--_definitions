require('definition')
require('rspec')

describe(Definition) do
  before() do
    Definition.clear()
  end

    describe('#description') do
      it('returns the description of the object') do
        cheapster = Definition.new('Someone who is cheap.')
        expect(cheapster.description()).to(eq('Someone who is cheap.'))
      end
    end

    describe('.all') do
      it('starts out as an empty array') do
        expect(Definition.all()).to(eq([]))
      end
    end

    describe('#save') do
      it('adds an object instance of Definition class to the definitions array') do
        shypod = Definition.new('When one is hesitant about sharing the contents of his or her iPod.')
        shypod.save()
        expect(Definition.all()).to(eq([shypod]))
      end
    end

    describe('.clear') do
      it('empties out all the saved definitions') do
        cheapster = Definition.new('Someone who is cheap.').save()
        Definition.clear()
        expect(Definition.all()).to(eq([]))
      end
    end

    describe('#id') do
      it('returns the id of the object') do
        xzavier = Definition.new('person who is a complete badass and a great friend everyone wants to get to know him and hangout with him')
        xzavier.save()
        expect(xzavier.id()).to(eq(1))
      end
    end

    describe('.find') do
      it('returns a definition by its id number') do
        automagically = Definition.new("Automatically, but in a way that, for some reason (typically because it is too complicated, or too ugly, or perhaps even too trivial), the speaker doesn't feel like explaining to you.")
        automagically.save()
        snoping = Definition.new("Verifying something you've seen on the internet on Snopes.com")
        snoping.save()
        expect(Definition.find(snoping.id())).to(eq(snoping))
      end
    end

end
