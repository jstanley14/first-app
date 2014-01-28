require 'spec_helper'
#require_relative '../../app/helpers/static_pages_helper'

#RSpec.configure do |c|
#  c.include StaticPagesHelper
#end

describe "Static Pages" do
  subject { page }

  context "when on the help page" do
    before(:each) do
      page_title = right_title('hel')
      visit "/static_pages/#{page_title}"
    end

    page_title = right_title('hel')

    it { should have_title(page_title) }
    it { should have_selector('h1', text: page_title) }
    it { should have_selector(:link, right_title('hom')) }

    describe "and user clicks on the home page link" do
      it "goes to the home page" do
        page_title = right_title('hom')
        click_link(page_title)
        expect(page).to have_title(page_title)
        expect(page).to have_selector('h1', text: page_title)
      end
    end
  end

  context "when on the home page" do
    before(:each) do
      page_title = right_title('hom')
      visit "/static_pages/#{page_title}"
    end

    page_title = right_title('hom')

    it { should have_title(page_title) }
    it { should have_selector('h1', text: page_title) }

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
