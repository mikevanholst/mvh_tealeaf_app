require 'spec_helper.rb'

describe User do 
  before(:each) do |variable|
    @user = User.create(name: 'test_name', email: 'test@user.before' )
    @user_built = User.new(name: 'test_unsaved_name', email: 'test@user.before' )

    
  end
  it "saves itself" do 
    @user.save
    expect(User.first).to eq(@user)
  end

#testing nested
  it "has many posts" do
     post1 = @user.posts.create(title: "Test 2 post1", content: "Test 2 content1")
     post2 = @user.posts.create(title: "Test 2 post2", content: "Test 2 content2")
     expect(@user.posts).to eq([post1, post2])
  end

#not nested
it "has many posts" do
     post3 = Post.create(title: "Test 3 post3", content: "Test 3 content3", user:  @user)
     post4 = Post.create(title: "Test 3 post4", content: "Test 3 content4", user:  @user)
     expect(@user.posts).to eq([post3, post4])
  end



it "validates presence of name" do
    @user_built.name = nil
    @user_built.save
    # expect(User.count).to eq(1) 
    expect(User.all).not_to include(@user_built) 
   end 

it "validates presence of email" do
    @user_built.email = nil
    @user_built.save
    # expect(User.count).to eq(1) 
    expect(User.all).not_to include(@user_built) 
   end 
#repeating tests with shoulda matchers

it {should have_many(:posts)}
it {should validate_presence_of(:name)}
it {should validate_presence_of(:email)}
 it {should have_and_belong_to_many(:groups)}




end
