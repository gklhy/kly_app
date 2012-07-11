#encoding=utf-8

require 'spec_helper'
describe User do
 # pending "add some examples to (or delete) #{__FILE__}"
   before do
    @user = User.new(name: 'tom', email: 'tom@ddd.com',
                     password: 'abcd1234', password_confirmation: 'abcd1234') 
   end
  subject { @user }

  it { should respond_to (:name) }
  it { should respond_to (:email) } 
  it { should respond_to (:password_digest) }
  it { should respond_to (:password) }
  it { should respond_to (:password_confirmation) }
  it { should respond_to (:authenticate) }
  it { should respond_to (:remember_token) }
  it { should be_valid }
  
  describe 'when username is not present' do
  	 before { @user.name = " " }
     it { should_not be_valid }
  end

  describe 'when email is not present' do
     before { @user.name = " " }
     it { should be_invalid }
  end

  describe 'when username is too long (> 50 )' do
     before { @user.name = 'a' * 51 }
     it { should_not be_valid }
  end

  describe 'when email is not valid' do
     invalid_email_addresses = %w[addad@ddd,com dfs@ddfdf  sdfds@ @dafds.com fssdf@sdd. sdfd_at_sdfdsf]
     invalid_email_addresses.each do | invalid_email_address |
        before { @user.email = invalid_email_address }
        it { should_not be_valid }
     end
  end

  describe 'when email is valid' do
     valid_email_addresses = %w[addf.dfd@dfdf.com ds111@fddf.com.cn erer@ddd.info QQQ+rrr@ddd.uk]
     valid_email_addresses.each do | valid_email_address |
        before { @user.email = valid_email_address }
        it { should be_valid }
     end
  end


  describe 'when email address is already taken' do
     before do 
         user_with_same_email = @user.dup
         user_with_same_email.email = @user.email.upcase
         user_with_same_email.save
     end
     it { should_not be_valid }
  end

  describe 'when password is not present' do
     before do
     	@user.password = " "
     	@user.password_confirmation = " "
     end

     it { should_not be_valid }
    
  end
  
  describe 'when password_confirmation is nil' do
     before { @user.password_confirmation = nil }
     it { should_not be_valid }
  end

  describe "when password doesn't match the comfirmation" do
     before { @user.password_confirmation = 'mismatch' }
     it { should_not be_valid }
  end

  describe 'return value of authenticate method' do
     before { @user.save }
     let(:found_user) { User.find_by_email(@user.email) }
     
     describe 'with valid password' do
        it { should == found_user.authenticate(@user.password) }
     end

     describe 'with invalid password' do
        let(:user_for_invalid_password) { found_user.authenticate('错误的密码') }
        it { should_not == user_for_invalid_password }
        specify { user_for_invalid_password.should be_false }
     end

  end
end
