require('capybara/rspec')
require('launchy')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('allows user to add a word') do
    visit('/')
    click_link('Add New Werd')
    fill_in('name', :with => 'Jabroni')
    click_button('Add Werd')
    expect(page).to have_content('Jabroni')
  end
end

describe('the add a definition path', {type => :feature}) do
  it('allows user to add a definition to a word') do
    visit('/')
    click_link('Jabroni')
    expect(page).to have_content('Jabroni')
    click_link('Add a Definition')
    expect(page).to have_content("Add a New Definition")
    fill_in('definition', :with => 'An obnoxious person, a loser (most often said of males), especially one who portrays himself to be more powerful, competent or important than he really is.')
  end

  it('displays a list of definitions that have been added for each word') do
    visit('/')
    click_link('Jabroni')
    expect(page).to have_content('An obnoxious person, a loser (most often said of males), especially one who portrays himself to be more powerful, competent or important than he really is.')
  end
end
