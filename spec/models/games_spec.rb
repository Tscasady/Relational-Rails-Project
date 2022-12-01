require 'rails_helper'

RSpec.describe Game do
  describe 'relationship' do
    it { should belong_to :player }
  end
end