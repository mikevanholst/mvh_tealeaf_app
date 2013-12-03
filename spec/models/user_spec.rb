require 'spec_helper.rb'

describe User do 
  it "saves itself" do 
    user = User.new(name: 'test_name_one', email: 'test@one.user' )
    user.save
    expect(User.first).to eq(user)
  end

#testing nested
  it "has many posts" do
     user = User.create(name: 'test_name_two', email: 'test@two.user' )
     post1 = user.posts.create(title: "Test 2 post1", content: "Test 2 content1")
     post2 = user.posts.create(title: "Test 2 post2", content: "Test 2 content2")
     expect(user.posts).to eq([post1, post2])
  end

#not nested
it "has many posts" do
     user = User.create(name: 'test_name_two', email: 'test@two.user' )
     post3 = Post.create(title: "Test 3 post3", content: "Test 3 content3", user:  user)
     post4 = Post.create(title: "Test 3 post4", content: "Test 3 content4", user:  user)
     expect(user.posts).to eq([post3, post4])
  end

end
