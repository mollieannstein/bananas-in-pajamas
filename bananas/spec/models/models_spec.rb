require 'rails_helper'


describe User do
  let(:user) {User.create(username: "Jack", email: "boop@bop.com", password: "1234")}

  it "🍌🍌🍌🍌🍌" do
    expect(true).to be(true)
  end

  it "is not null" do
    expect(user).to_not eq(nil)
  end

  it "can have many articles" do
    user.articles << Article.create(title: "test1", content: "Testing")
    user.articles << Article.create(title: "test1", content: "Testing")
    expect(user.articles.length).to eq(2)
  end

  it "can have many revisions" do
    user.revisions << Revision.create()
    user.revisions << Revision.create()
    expect(user.revisions.length).to eq(2)
  end

  it "can make revisions on others articles" do
    User.create(username: "Bob", email: "bob@bob")
    Article.create(title: "test1", content: "Testing", creator_id: 2)
    user.revisions << Revision.create(article_id: 1)
    expect(user.revisions.length).to eq(1)
  end

end

describe Article do
  let(:user) {User.create(username: "Jack", email: "boop@bop.com", password: "1234")}
  let(:article) {Article.create}

  it "has many revisions" do
    article.revisions << Revision.create()
    article.revisions << Revision.create()
    expect(article.revisions.length).to eq(2)
  end

  it "can reference its revisors" do
    user.revisions << Revision.create(article: article)
    expect(article.revisors.first).to eq(user)
  end

end



describe Revision do



end




