require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { User.new }
  let(:event) { Event.new(user: user) }

  subject { described_class }

  permissions :update?, :edit?, :destroy? do
    it 'gives access if user is event creator' do
      expect(subject).to permit(user, event)
    end

    it 'denies access if user is not event creator' do
      expect(subject).not_to permit(User.new, event)
    end
  end
end
