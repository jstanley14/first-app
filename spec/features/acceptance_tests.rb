require 'spec_helper'

describe "Static Pages" do
  subject { page }

  context "when on the help page" do
    let(:help_title) { right_title('hel') }
    let(:home_title) { right_title('hom') }

    before(:each) { visit "/static_pages/#{help_title}"}

    it { should have_title(help_title) }
    it { should have_selector('h1', text: help_title) }
    it { should have_selector(:link, home_title) }

    describe "and user clicks on the home page link" do
      it "goes to the home page" do
        click_link(home_title)
        expect(page).to have_title(home_title)
        expect(page).to have_selector('h1', text: home_title)
      end
    end
  end

  context "when on the home page" do
    let(:home_title) { right_title('hom') }

    before(:each) { visit "/static_pages/#{home_title}"}

    it { should have_title(home_title) }
    it { should have_selector('h1', text: home_title) }

    it "has a text box" do
      expect(page).to have_field('home_text')
    end

    describe "when text is input into the text box" do
      it "with default text factory has the content 'Hello, world!'" do
        @text = create(:text_string)
        fill_in 'home_text', with: @text.text
        expect(page).to have_field('home_text', with: 'Hello, world!')
      end

      it "with uppercase text factory has the content 'HELLO, WORLD!'" do
        @text = create(:uppercase)
        fill_in 'home_text', with: @text.text
        expect(page).to have_field('home_text', with: 'HELLO, WORLD!')
      end

      it "with overridden text factory has the content 'BROADCAST SIGNAL HIJACKED'" do
        @text = create(:text_string, text: 'BROADCAST SIGNAL HIJACKED')
        fill_in 'home_text', with: @text.text
        expect(page).to have_field('home_text', with: 'BROADCAST SIGNAL HIJACKED')
      end
    end
  end
end
