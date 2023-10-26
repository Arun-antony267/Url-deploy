# require "rails_helper"

RSpec.describe 'Example App' do
  describe 'JavaScript Hello World Button' do
    it 'Appends "Hello World!" to hello_world_list' do
      visit '/'
      expect(find('#hello_world_list')).to_not have_text('Hello World!')
      find('#click_me_button').click
      expect(find('#hello_world_list')).to have_text('Hello World!')
    end
  end
end