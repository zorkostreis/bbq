require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user) }

  let(:user_context) { UserContext.new(user, {}, '') }
  let(:another_user_context) { UserContext.new(another_user, {}, '') }
  let(:another_user_context_with_correct_pin) { UserContext.new(another_user, {}, '123123') }
  let(:another_user_context_with_wrong_pin) { UserContext.new(another_user, {}, '123321') }

  let(:another_user_context_with_correct_cookies) { UserContext.new(another_user,
    { "events_#{event_with_pin.id}_pincode" => '123123' }, '') }
  let(:another_user_context_with_wrong_cookies) { UserContext.new(another_user,
    { "events_#{event_with_pin.id}_pincode" => '123321' }, '') }

  let(:event) { FactoryBot.create(:event, user: user) }
  let(:event_with_pin) { FactoryBot.create(:event, user: user, pincode: '123123') }

  permissions :update?, :edit?, :destroy? do
    it 'gives access if user is event creator' do
      expect(subject).to permit(user_context, event)
    end

    it 'denies access if user is not event creator' do
      expect(subject).not_to permit(another_user_context, event)
    end
  end

  permissions :show? do
    context 'when user is event creator' do
      it 'shows event' do
        expect(subject).to permit(user_context, event)
      end
    end

    context 'when event doesnt have pin' do
      it 'shows to any user' do
        expect(subject).to permit(another_user_context, event)
      end
    end

    context 'when event has a pin' do
      it 'doesnt show to user without pin' do
        expect(subject).not_to permit(another_user_context, event_with_pin)
      end

      context 'when user has a pin' do
        it 'shows if pin is correct' do
          expect(subject).to permit(another_user_context_with_correct_pin, event_with_pin)
        end

        it 'doesnt show if pin is wrong' do
          expect(subject).not_to permit(another_user_context_with_wrong_pin, event_with_pin)
        end
      end

      context 'when user has pin in cookies' do
        it 'shows if pin is correct' do
          expect(subject).to permit(another_user_context_with_correct_cookies, event_with_pin)
        end
    
        it 'doesnt show if pin is wrong' do
          expect(subject).not_to permit(another_user_context_with_wrong_cookies, event_with_pin)
        end
      end
    end
  end
end
