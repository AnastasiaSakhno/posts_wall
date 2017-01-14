RSpec.describe Category, type: :model do
  context 'must have associations' do
    it { should have_many(:posts) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
