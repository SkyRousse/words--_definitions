require('definition')
require('rspec')

describe(Definition) do
  before() do
    Definition.clear()
  end

    describe('#description') do
      it('adds a description to the definition') do
        cheapster_description = Definition.new('Someone who is cheap.')
        expect(cheapster_description.description()).to(eq('Someone who is cheap.'))
      end
    end

    describe('#save') do
      it('adds an object instance of Definition class to the definitions array') do
        shypod = Definition.new('When one is hesitant about sharing the contents of his or her iPod.')
        shypod.save()
        expect(Definition.all()).to(eq([shypod]))
      end
    end

    describe('.all') do
      it('starts out as an empty array') do
        expect(Definition.all()).to(eq([]))
      end
    end


end
