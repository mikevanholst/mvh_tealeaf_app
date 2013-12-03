require 'spec_helper.rb'

describe Group do 
  it "saves itself" do 
    group = Group.new(name: 'test_group_one' )
    group.save
    expect(Group.first).to eq(group)
  end
end
