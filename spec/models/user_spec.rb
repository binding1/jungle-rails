require "rails_helper"

RSpec.describe User, type: :model do
  describe "Validations" do

  before do
    @user = User.create(first_name: "John", last_name: "Smith", email: "jsmith@email.com", password: "smithj", password_confirmation: "smithj")
  end    

  it "is valid" do
    expect(@user).to be_valid
  end

  it "should have valid first name" do
    @user.first_name = nil
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have valid last name" do
    @user.last_name = nil
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have valid email" do
    @user.email = nil
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have unique email" do
    @user_2 = User.create(first_name: "Jonny", last_name: "Smith", email: "JSmith@email.com", password: "smithj", password_confirmation: "smithj") 
    @user_2.valid? 
    expect(@user_2.errors.full_messages).to_not be_empty
  end

  it "should have a password" do
    @user.password = nil
    @user.password_confirmation = nil
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should match password and password confirmation" do
    @user.password_confirmation = "jsmithy"
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end

  it "should have minimum length" do
    @user.password = "smith"
    @user.password_confirmation = "smith"
    @user.valid? 
    expect(@user.errors.full_messages).to_not be_empty
  end
end

describe ".authenticate_with_credentials" do
  before do
    @user = User.create(first_name: "John", last_name: "Smith", email: "jsmith@email.com", password: "smithj", password_confirmation: "smithj")
  end

  it "should login if valid email and valid password are correct" do
    email = "jsmith@email.com"
    password = "smithj"
    @user_2 = User.authenticate_with_credentials(email, password)
    expect(@user_2).to eq(@user)
  end

  it "should not logging if email is incorrect" do
    email = "jsmioth@email.com"
    password = "smithj"
    @user_2 = User.authenticate_with_credentials(email, password)
    expect(@user_2).to_not eq(@user)
  end

  it "should not logging if password is incorrect" do
    email = "jsmith@email.com"
    password = "smiothj"
    @user_2 = User.authenticate_with_credentials(email, password)
    expect(@user_2).to_not eq(@user)
  end

  it "should login if there email has spaces" do
    email = "    jsmith@email.com      "
    password = "smithj"
    @user_2 = User.authenticate_with_credentials(email, password)
    expect(@user_2).to eq(@user)
  end

  it "should login if email is typed in different cases" do
    email = "JSmith@email.com"
    password = "smithj"
    @user_2 = User.authenticate_with_credentials(email, password)
    expect(@user_2).to eq(@user)
  end


end
end
