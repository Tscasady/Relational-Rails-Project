require 'rails_helper'

RSpec.describe Player do
  describe 'relationship' do
    it { should have_many :games}
  end
end