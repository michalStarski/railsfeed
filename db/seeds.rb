# Mock data
sub_names = ['Dank Memes', 'Games', 'Global', 'Technology']

comments = {
  'Games' => [
    'One clue following another until we are together and I rid myself of your foolish games and inconvenient
    interruptions.',
    'Stop playing games, Vinnie.',
    "Let's not play games with one another today.",
    "This isn't the time for your games, Gabriel said.",
  ],
  'Dank Memes' => [
    "Don't joke about that.",
    "They were all making a joke out of the whole thing.",
    "The joke was on him, then.",
    "There hasn't been much to joke about, has there?",
  ],
  'Global' => [
    "Satellite imagery gives a global perspective on the ozone hole.",
    "The global appeal of restorative justice is truly startling.",
    "It was given to the victor, bestowing upon its holder absolute global power.",
    "Moby won global acclaim last year for his album Play.",
  ],
  'Technology' => [
    "I'm not opposed to technology, I simply enjoy the work.",
    "Technology has made us ever more productive.",
    "This is because technology is cumulative.",
    "This same technology will allow farming to be much, much more efficient.",
  ],
}

lorem_ipsum = %(
  Lorem ipsum dolor sit amet, consectetur adipiscing elit,
  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
  commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit e
  sse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
  sunt in culpa qui officia deserunt mollit anim id est laborum.
)

# Create mock subs
sub_names.each do |sub_name|
  Sub.create(:name => sub_name)
end

# Create mock users
User.create([
  {
    name: 'Bob',
    email: 'bob@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Alice',
    email: 'alice@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Tom',
    email: 'tom@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Kekz',
    email: 'kekz@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Michal',
    email: 'michal@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Muffin',
    email: 'muffin@gmail.com',
    password: 'test1234',
  },
  {
    name: 'Douchebat',
    email: 'douchebat@gmail.com',
    password: 'test1234',
  },
  {
    name: 'michals',
    email: 'test@test.foo',
    password: 'michals1',
    is_admin: true,
  },
])

# Create mock posts
100.times do
  sub_name = sub_names[(rand * sub_names.length).floor]
  Post.create({
    content: lorem_ipsum,
    user: User.order("RANDOM()").first,
    title: comments[sub_name][(rand * comments[sub_name].length).floor],
    sub: Sub.where(:name => sub_name).first,
  })
end

# Create mock comments
100.times do
  sub_name = sub_names[(rand * sub_names.length).floor]
  Comment.create({
    content: comments[sub_name][(rand * comments[sub_name].length).floor],
    user: User.order("RANDOM()").first,
    likes: 0,
    dislikes: 0,
  })
end

# Create mock reactions + Make every user follow a sub
User.all.each do |user|
  Post.all.each do |post|
    reaction = (rand * 2).floor ? "like" : "dislike"
    Vote.create({
      user: user,
      post: post,
      reaction: reaction,
    })
  end

  Sub.order("RANDOM()").limit(3).each do |sub|
    user.subs << sub
  end
end
