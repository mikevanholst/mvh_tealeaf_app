require 'spec_helper.rb'

describe Post do 

  #unnecessary  because it is testing rails
  it "saves itself" do
    post = Post.new(title: "Test one post", content: "Test one content")
    post.save
    expect(Post.first).to eq(post)
  end
  

  it "belongs to user" do
    user = User.create(name: 'belongs to', email: 'test@user.com' )
    post = Post.new(title: "Test one post", content: "Test one content", user: user)
    post.save
    expect(user.posts.first).to eq(post)
  end

#redone as shoulda
it {should belong_to(:user)}
it {should validate_presence_of(:title)}
it {should validate_presence_of(:content)}


end