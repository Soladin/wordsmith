require 'spec_helper'

feature 'Creating Collections' do
  before do
    visit '/' # NOT root. The edit page
    click_link 