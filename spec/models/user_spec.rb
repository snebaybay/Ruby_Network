require 'rails_helper'

RSpec.describe User, type: :model do
  it "email should be valid" do 
		user = User.new(
		email:'spokharel',
		name:'Snebaybay',
		password: 'password',
		password_confirmation:'password',
		description: 'TESTING RULES',
		)
		expect(user.valid?).to eq(false)
	end 

	it "name should only contain alphabetical letters" do
	user = User.new(
		email:'spokharel@gmail.com',
		name:'Sne4',
		password: 'password',
		password_confirmation:'password',
		description: 'TESTING RULES',
		)
		expect(user.valid?).to eq(false)
	end 

	it "description should be filled out" do
		user = User.new(
		email:'spokharel@gmail.com',
		name:'Sneha',
		password: 'password',
		password_confirmation:'password',
		description: '',
		)

		expect(user).to be_invalid
	end 
end
