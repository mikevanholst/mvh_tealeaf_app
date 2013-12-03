require 'spec_helper.rb'

describe Group do 
  
#UNNECESSARILY TESTING RAILS
  it "saves itself" do 
    group = Group.new(name: 'test_group_one' )
    group.save
    expect(Group.first).to eq(group)
  end

  it {should validate_presence_of(:name)}
  it {should have_and_belong_to_many(:users)}
end
