RSpec.describe Post, type: :model do
  context 'must have associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end

  context 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:message) }
  end
end
