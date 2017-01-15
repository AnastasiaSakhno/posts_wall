describe User, type: :model do

  context 'must have associations' do
    it { should have_many(:posts) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }
    it { should validate_presence_of(:salt) }
  end

  context 'user set their password' do
    let(:user) { build :user, password: '123456' }

    it 'should encrypt and decrypt password' do
      expect(user.password).to eq(user.salt + '123456')
      expect(user.encrypted_password).to_not eq('123456')
    end
  end

end