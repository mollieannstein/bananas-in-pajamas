# fruits = ["Types", "Apple", "Strawberry", "Tangerine", "Pineapple", "Mango", "Peach", "Watermelon"]

User.delete_all
Article.delete_all
Tagging.delete_all
Revision.delete_all
Category.delete_all

user = User.create!(username: "yaboichrissyb", email: "yaboi@gmail.com", password: 'password', admin_status: true)
user2 = User.create!(username: "boolean", email: "boo@gmail.com", password: 'password', admin_status: true)

general_users = 10.times.map do
  User.create!( username: Faker::Internet.user_name,
                email: Faker::Internet.email,
                password: 'password',
                admin_status: false
                )
end

# categories =  5.times.map do
#   Category.create!(name: fruits.sample)
# end
c1 = Category.create!(name: "Types")
c2 = Category.create!(name: "Health")
c3 = Category.create!(name: "News")
c4 = Category.create!(name: "Funny")


# non_featured_articles = 20.times do
#   Article.create!(creator_id: general_users.sample.id, featured: false , title: Faker::Hipster.word, content: Faker::Hipster.paragraph(25))
# end
nf1 = Article.create!(creator_id: general_users.sample.id, featured: false , title: "5 BANANA VARIETIES", content: "Baby The Mini brand is trademarked by Chiquita; you'll find similar fruit sold by Dole under the Baby name. Because they're half the size of a standard Cavendish, they're generally sold as a snack product for kids. More than one cultivar makes up the Baby/Mini category. Chiquita's product is the Pisang Mas variety, originally from Malaysia; Dole's Minis include two types: Ladyfinger and Orito. The Ladyfingers are the sweetest and best tasting of them all, but since there's no reliable way to determine which kind you're getting, you'll have to undertake some delicious trial and error. These fruits must be very ripe to reach full sweetness; their skin should look deep brown, with dark streaks. Brown bananas have proven a tough sell to grocery shoppers, who tend not to let miniature bananas ripen enough and wind up disappointed. It's worth the wait.
Manzano This variety, native to Central and South America, belongs to a subcategory known as apple bananas, and the name fits. The texture of a Manzano is firmer than that of the Cavendish, and the scent is complex, marked by a strong tart-apple aroma. The taste, too, is tart—at least when you first bite into the fruit, whose flavor quickly gives way to sweetness. Though you can sometimes find Manzanos at supermarkets, Asian specialty stores are your best bet.")
Tagging.create!(article: nf1, category: c1)
nf2 = Article.create!(creator_id: general_users.sample.id, featured: false , title: "Small Types", content: "Small banana varieties, also called baby bananas, are recognized by their miniature size; the fruit is only about 4 to 5 inches in length with thin, yellow skin. They have and intensely sweet flavor when they are allowed to reach optimal ripeness. These small varieties include “Lady Finger” bananas, sometimes called “Orito.” This hearty, drought resistant plant is native to Malaysia. It is able to ward off most common banana pests and diseases, such as Panama disease and black weevils. However, leaf spot disease does pose a problem for “Lady Finger” plants.")
Tagging.create!(article: nf2, category: c1)
nf3 = Article.create!(creator_id: general_users.sample.id, featured: false , title:"Health Benfits", content: "The curved yellow fruit packs a big nutritional punch, wrapped in its own convenient packaging. Some scientists believe that the banana may have even been the world's first fruit.

Dan Koeppel, author of Banana: The Fate of the Fruit That Changed the World, traces the banana back to the Garden of Eden, where he believes it was the banana, not the apple, that was the 'forbidden fruit' that Eve offered Adam.

Today, bananas are grown in at least 107 countries and are ranked fourth among the world's food crops in monetary value. Americans consume more bananas than apples and oranges combined.

With the world consuming so many bananas, its unsurprising that people are asking the question: are bananas good for you?. This article will take a look at the potential health benefits of bananas, such as lowering the risks of cancer and asthma, lowering blood pressure, improving heart health and promoting regularity. It also examines the possible health risks associated with them.")
Tagging.create!(article: nf3, category: c2)
nf4 = Article.create!(creator_id: general_users.sample.id, featured: false , title: "Banana Health Studies", content: "Research showed that among fruits and vegetables proven to be associated with cutting your risk of renal cell carcinoma, bananas were the highest1. Another study showed that bananas, which are rich in vitamin A and carotenoids, have the potential to protect you against chronic diseases like diabetes, cardiovascular disease, and other types of cancer2.

More positive proof of banana’s singular health benefits emerged in a study showing an important link between foods containing high levels of potassium, magnesium, calcium and fiber – like bananas, for instance – and a reduction in the risk of stroke in men.")
Tagging.create!(article: nf4, category: c2)
nf5 = Article.create!(creator_id: general_users.sample.id, featured: false , title: "Are Bananas bad for me?", content: "Paignton Zoo in Devon, England, isn't monkeying around with their animals' diets anymore. Zookeepers are trading the monkeys' favorite fruit in for green leafy vegetables, saying bananas grown for human consumption are full of sugar and calories.
'Wait, even the fruit isn't healthy anymore? What's left?!?!'' CNN reader NeoPrudentist posted in what was soon rated the No. 1 comment on the story.
What's left, indeed. First coffee. Then salmon. Now this?
Not to worry -- this isn't a case of human see, human do. Despite sharing more than 90% of our DNA with these fuzzy primates, humans have some very distinct differences in anatomy.
Those English zookeepers aren't totally wrong. All fruit contains sugar, and bananas are slightly denser calorie-wise than other types of fruit. But when it comes to nutritional bang for your buck, bananas are hard to beat. Just remember -- no monkey business: Eat 'em in moderation.")
Tagging.create!(article: nf5, category: c2)
# featured_articles = 5.times do
#   Article.create!(creator_id: general_users.sample.id, featured: true , title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(25))
# end
f1 = Article.create!(creator_id: general_users.sample.id, featured: true , title: "Banana Jokes", content: "Short Banana Jokes Q: Why do bananas wear suntan lotion? A: Because they peel! Q: What is Beethoven's favorite fruit? A: (sing to the tune of 5th symphony): Banana..na....! Banana..na....! Q: What do you call two banana skins? A: A pair of slippers Q: When banana growers are heart broken, what do they sing? A: What else but Peelings? Q: Why did the banana go to see the doctor? A: The banana was not peeling very well. I am going bananas. Thats what i say to my bananas before i leave the house Q: Why did the banana go out with the prune? A: Because he couldn't find a date. Q: What is the easiest way to make a banana split? A: Cut it in half. Broccoli: I look like a tree. Walnut: I look like a brain. Mushroom: I look like an umbrella. Banana: Dude! Change the topic. Q: If a crocodile makes shoes, what does a banana make ? A: Slippers ! Q: What do you call solid gold bananas? A: A bunch of money. Q: How do you spell banana? A: E, V, I, L. Q: Do banana's drink coke or pepsi? A: Neither, they drink blood because they're evil. Q: How did the Iceland repel the bananas attack? A: By freezing them Q: Why did the banana go to the hairdressers? A: Because it had split ends! Q: What did the banana do when he saw a monkey? A: The banana split! Q: Why shouldn't you shop at the Banana Republic? A: Because the employees look like a bunch of jerks. Q: What do you call a fruit that doesn't take shit from anyone? A: The top banana. Q: Why did the banana fail his driving test? A: He kept peeling out. ")
Tagging.create!(article: f1, category: c4)
f2 = Article.create!(creator_id: general_users.sample.id, featured: true , title: "Bye Bye Bananas", content: "In the mid 1900s, the most popular banana in the world—a sweet, creamy variety called Gros Michel grown in Latin America—all but disappeared from the planet. At the time, it was the only banana in the world that could be exported. But a fungus, known as Panama Disease, which first appeared in Australia in the late 1800s, changed that after jumping continents. The disease debilitated the plants that bore the fruit. The damage was so great and swift that in a matter of only a few decades the Gros Michel nearly went extinct.

Now, half a century later, a new strain of the disease is threatening the existence of the Cavendish, the banana that replaced the Gros Michel as the world's top banana export, representing 99 percent of the market, along with a number of banana varieties produced and eaten locally around the world.

And there is no known way to stop it—or even contain it.

That's the troubling conclusion of a new study published in PLOS Pathogens, which confirmed something many agricultural scientists have feared to be true: that dying banana plants in various parts of the world are suffering from the same exact thing: Tropical Race 4, a more potent mutation of the much feared Panama Disease.")
Tagging.create!(article: f2, category: c3)
f3 = Article.create!(creator_id: general_users.sample.id, featured: true , title: "Are Bnanas going extinct?", content: "A virulent strain of a banana-destroying fungus that has threatened banana crops in East and Southeast Asia is making its way around the globe and has scientists warning of the fruit’s extinction.

According to a study appearing in the online science journal PLOS Pathogens by researchers at Wageningen University in the Netherlands, a strain of the soil-borne fungus Fusarium oxysporum f.sp. cubense—also known as the Panama disease--has the potential to wipe out the world’s $11 billion banana industry.

Tracing the genetic makeup of the fungus, researchers found that a single clone of the Panama disease fungus called Tropical Race 4 is killing the Cavendish banana –the world’s most popular variety and one you see at the grocery store.

Gert Kema, banana expert at Wageningen University and Research Center, who co-authored the study, tells Quartz how in the 1960s Tropical Race 4 was found in Indonesia and spread to Taiwan and China and the rest of Southeast Asia.  In all the countries it hit, banana exports slowly fell over several decades. While it takes years for the disease to take root, once it does the decline is inevitable.

The Panama disease attacks plants’ vascular systems, causing them to wilt rapidly and turn yellow-brown due to lack of water.  Part of the problem is that the fungus can’t be killed and can only be contained.  But efforts to contain the disease aren’t working, he warns.

Kema says that the fungus has now leapt to Pakistan, Lebanon, Jordan, Oman, and Mozambique, and Australia’s northeast Queensland –and is only a matter of time before it lands in Latin America, where some more than three-fifths of the planet’s exported bananas are grown.")
Tagging.create!(article: f3, category: c3)

# all_articles = Article.all.each do |article|
#   Tagging.create!(article: article, category: categories.sample)
# end


# revision = Revision.create!(article_id: 1, revisor_id: 2, revised_content: "I revised this BOO")

