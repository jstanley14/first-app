require 'spec_helper'

describe "Static Pages" do
  subject { page }

  context "when on the help page" do
    before(:each) do
      visit '/static_pages/help'
    end

    it { should have_title('help') }
    it { should have_selector('h1', text: 'help') }
    it { should have_selector(:link, 'home') }

    describe "and user clicks on the home page link" do
      it "goes to the home page" do
        click_link('home')
        expect(page).to have_title('home')
        expect(page).to have_selector('h1', text: 'home')
      end
    end
  end

  context "when on the home page" do
    before(:each) do
      visit '/static_pages/home'
    end

    it { should have_title('home') }
    it { should have_selector('h1', text: 'home') }

    it "has a text box" do
      expect(page).to have_field('home_text')
    end

    describe "when 'Hello, world!' is input into the text box" do
      it "has the content 'Hello, world!'" do
        fill_in 'home_text', with: 'Hello, world!'
        expect(page).to have_field('home_text', with: 'Hello, world!')
      end
    end
  end
end
