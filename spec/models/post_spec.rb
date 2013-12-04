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

describe 'search_by_title' do
  before(:each)do
     @alpha_post = Post.create(title: "Alpha", content: "Test content")
     @beta_post = Post.create(title: "Beta", content: "Test content")
  end

  it "should return and empty array if there is no match" do
    expect(Post.search_by_title("Unmatchable")).to eq([])
  end
  
  it "returns an array of one for an exact match" do
    expect(Post.search_by_title("Alpha")).to eq([@alpha_post])
  end

  it "returns an array of one for a partial match" do
    expect(Post.search_by_title("Alp")).to eq([@alpha_post])

  end

  it "returns an array for a multiple match" do 
    expect(Post.search_by_title("a")).to eq([@alpha_post, @beta_post])
  end

  it "should return and empty array for a blank search field" do
    expect(Post.search_by_title("")).to eq([])
  end
  

end