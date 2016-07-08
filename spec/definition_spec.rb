require('definition')
require('rspec')

describe(Definition) do
  before() do
    Definition.clear()
  end

    describe('#description') do
      it('returns the description of the object') do
        cheapster_test_definition = Definition.new('Someone who is cheap.')
        expect(cheapster_test_definition.description()).to(eq('Someone who is cheap.'))
      end
    end

    describe('.all') do
      it('starts out as an empty array') do
        expect(Definition.all()).to(eq([]))
      end
    end

    describe('#save') do
      it('adds an object instance of Definition class to the definitions array') do
        shypod_test_definition = Definition.new('When one is hesitant about sharing the contents of his or her iPod.')
        shypod_test_definition.save()
        expect(Definition.all()).to(eq([shypod_test_definition]))
      end
    end

    describe('.clear') do
      it('empties out all the saved definitions') do
        cheapster_test_definition = Definition.new('Someone who is cheap.').save()
        Definition.clear()
        expect(Definition.all()).to(eq([]))
      end
    end

    describe('#id') do
      it('returns the id of the object') do
        xzavier_test_definition = Definition.new('A person who is a complete badass and a great friend everyone wants to get to know him and hangout with him')
        xzavier_test_definition.save()
        expect(xzavier_test_definition.id()).to(eq(1))
      end
    end

    describe('.find') do
      it('returns a definition by its id number') do
        automagically_test_definition = Definition.new("Something that happens automatically,  but in a way that, for some reason (typically because it is too complicated, or too ugly, or perhaps even too trivial), the speaker doesn't feel like explaining to you.")
        automagically_test_definition.save()
        snoping_test_definition = Definition.new("Verifying something you've seen on the internet on Snopes.com")
        snoping_test_definition.save()
        expect(Definition.find(snoping_test_definition.id())).to(eq(snoping_test_definition))
      end
    end

end
