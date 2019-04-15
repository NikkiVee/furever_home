DROP DATABASE IF EXISTS furever_home;
CREATE DATABASE furever_home;

\c furever_home;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR NOT NULL UNIQUE,
  password_digest VARCHAR NOT NULL,
  username VARCHAR,
  name VARCHAR,
  about TEXT,
  profile_picture VARCHAR
);

CREATE TABLE location(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  city VARCHAR NOT NULL,
  state VARCHAR NOT NULL,
  zip_code INT NOT NULL
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR NOT NULL,
  pet_type VARCHAR NOT NULL,
  post_body TEXT NOT NULL
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE,
  comment_body TEXT NOT NULL
);

CREATE TABLE favorited(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  pet_id INT
);

CREATE TABLE adopted(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  pet_id INT
);

INSERT INTO users(email, password_digest, username, name, about, profile_picture) VALUES ('user1@fh.com', '$2a$10$8THnskuIHgA4epxiwUN2GOkwfwOQU8/Jx8lzU8UZIbgB8ZM7Mi/hS', 'user1', 'user one', 'I am user number one', 'https://images.pexels.com/photos/1389994/pexels-photo-1389994.jpeg'), ('user2@fh.com', '$2a$10$8THnskuIHgA4epxiwUN2GOkwfwOQU8/Jx8lzU8UZIbgB8ZM7Mi/hS', 'user2', 'user two', 'I am user number two', 'https://images.pexels.com/photos/206396/pexels-photo-206396.jpeg'), ('user3@fh.com', '$2a$10$8THnskuIHgA4epxiwUN2GOkwfwOQU8/Jx8lzU8UZIbgB8ZM7Mi/hS', 'user3', 'user three', 'I am user number three', 'https://images.pexels.com/photos/1757011/pexels-photo-1757011.jpeg'), ('user4@fh.com', '$2a$10$8THnskuIHgA4epxiwUN2GOkwfwOQU8/Jx8lzU8UZIbgB8ZM7Mi/hS', 'user4', 'user four', 'I am user number four', 'https://images.pexels.com/photos/36027/girl-cat-love-young.jpg');

INSERT INTO location(user_id, city, state, zip_code) VALUES (1, 'Brooklyn', 'NY', 11237), (2, 'Queens', 'NY', 11416), (3, 'New York City', 'NY', 10001), (4, 'Bronx', 'NY', 10467);

INSERT INTO posts(user_id, title, pet_type, post_body) VALUES (1, 'Some tips you should know before adopting a dog', 'Dog', '1) Make sure your family’s wallet can handle it!: Dogs require a lot of care that can quickly add up to big bucks. When you’re responsible for a dog, you need to spend money on regular and emergency vet visits (just like humans, dogs can have medical emergencies!), bedding, a collar and harness, high-quality dog food, treats, toys, grooming … the list goes on.  2) NEVER leave your dog chained up outdoors …: It’s hard to imagine that anyone could ever leave their dog all alone outside to suffer, especially in bad weather, but unfortunately some do. It’s cruel and dangerous. If you know anyone who does this, speak up! Have your parents call animal control or local authorities. 3) Dog tags and microchipping are a must!: Accidents happen and you never know if and when your dog will get lost or run away. If you couldn’t find your way back home, you’d be able to call someone for help, but that’s not the case with dogs. Get a collar with proper tags that have your dog’s name and at least two phone numbers for you or your family. Microchipping (a simple procedure that the vet can do) is another great way to make sure your dog gets back home again! If you move, make sure you update the tags and give the microchip company your new information. Ask your parents to talk to your dog’s vet for more information.'), (2, 'Please remember guys!', 'Cat', 'Cats are territorial, and coming into a new home leaves them feeling really uneasy. There’s all that unexplored space, and who knows what may lurk there. Do him a favor and provide a small area to call his own for the first few days or weeks. A bathroom or laundry room works well. Furnish the room with cat amenities, such as food, water and a litter box. You’ll want to spend time with your cat, so make sure there’s a comfortable place for you to sit as well.'), (3, 'A few Cat Care pointers', 'Cat', '-Handling: To pick up your cat, place one hand behind the front legs and another under the hindquarters. Lift gently. Never pick up a cat by the scruff of the neck (behind the ears) or by the front legs without supporting the rear end. -Play: Cats delight in stalking imaginary prey. The best toys are those that can be made to jump and dance around and look alive. Your cat will act out her predator role by pouncing on toys instead of people’s ankles. Don’t use your hands or fingers as play objects with kittens. This type of play may cause a biting and scratching problem to develop as your kitten matures. -Claws: Cats needs to scratch. When a cat scratches, the old outer nail sheath is pulled off and the sharp smooth claws underneath are exposed. Cutting your cat’s nails every 2 to 3 weeks will keep the nails relatively blunt and less likely to harm the arms of both humans and furniture.'), (4, 'First day when bringing a dog home', 'Dog', 'We know moving is stressful — and your new dog feels the same way! Give him time to acclimate to your home and family before introducing him to strangers. Make sure children know how to approach the dog without overwhelming him. Go here for more on introducing dogs and children. When you pick up your dog, remember to ask what and when he was fed. Replicate that schedule for at least the first few days to avoid gastric distress. If you wish to switch to a different brand, do so over a period of about a week by adding one part new food to three parts of the old for several days; then switch to half new food, half old, and then one part old to three parts new. For more information about your dog’s diet, check out our section on Dog Nutrition. On the way home, your dog should be safely secured, preferably in a crate. Some dogs find car trips stressful, so having him in a safe place will make the trip home easier on him and you. Once home, take him to his toileting area immediately and spend a good amount of time with him so he will get used to the area and relieve himself. Even if your dog does relieve himself during this time, be prepared for accidents. Coming into a new home with new people, new smells and new sounds can throw even the most housebroken dog off-track, so be ready just in case. Need more housetraining tips? Check out our Dog Housetraining section. If you plan on crate training your dog, leave the crate open so that he can go in whenever he feels like it in case he gets overwhelmed. Also, be sure to check out the do’s and don’ts of crate training your dog. From there, start your schedule of feeding, toileting and play/exercise. From Day One, your dog will need family time and brief periods of solitary confinement. Don’t give in and comfort him if he whines when left alone. Instead, give him attention for good behavior, such as chewing on a toy or resting quietly (Source: Preparing Your Home For A New Dog). For the first few days, remain calm and quiet around your dog, limiting too much excitement (such as the dog park or neighborhood children). Not only will this allow your dog to settle in easier, it will give you more one-on-one time to get to know him and his likes/dislikes. If he came from another home, objects like leashes, hands, rolled up newspapers and magazines, feet, chairs and sticks are just some of the pieces of “training equipment” that may have been used on this dog. Words like “come here” and “lie down” may bring forth a reaction other than the one you expect.Or maybe he led a sheltered life and was never socialized to children or sidewalk activity. This dog may be the product of a never-ending series of scrambled communications and unreal expectations that will require patience on your part.'), (1, 'Welcome your cat to its ne home', 'Cat', 'Go slowly at first. A new cat may need seven to fourteen days to relax into her new environment. Save meet-and-greets with friends, neighbors and relatives until the cat is eating and eliminating on a normal schedule. Offer her a safe place to hide while she gets her bearings. She’ll appreciate the chance to observe her new family’s routine from a small, dark space or one high above the action. Bring your new feline to a caring veterinarian for a wellness exam within one week after adoption. Provide the same diet she had at the shelter at least for the first week or two. If you wish to switch to a different flavor or brand, slowly make the switch over one to two weeks, starting with a quarter ration of the new food mixed into the old favorite. From there, up the ratio of new to old about 10% each day. Set up a litter box in a quiet, low-traffic area. Unsure of what litter to use? The majority of cats prefer fine grain clumping litter. Try that first unless the new adoptee is so young that she is in the litter-eating stage. Non-clumping litter is recommended for kittens under ten weeks of age. Cats must scratch, so make sure to provide yours with a sturdy, rough-textured scratching post to save wear and tear on furniture. Cat manicures every ten to fourteen days also help reduce damage. Cat-proof your home before giving your new feline run of the house. Put away harsh cleaning products, human medications and household poisons. Re-home any poisonous houseplants. And if the newcomer is a kitten, lock away any breakables and remember to keep the toilet lid down. Once settled in, a young cat or kitten will be eager to play. Stock up on interactive toys such as feather wands and kitty fishing poles to engage attention and direct energies toward a positive pursuit. Ready a comfortable cat perch on a sunny window sill – if it overlooks the birdfeeder, all the better! Observing live birds and squirrels beats out kitty videos any day.'), (2, 'Obedience is key', 'Dog', 'You should also establish clear rules and expectations from the get-go.Be firm and gentle with your training — never punitive. Be consistent with your rules. Give commands in a matter-of-fact tone. Always reward your puppy for obeying you with plenty of praise, as well as an occasional treat. When it’s time to move on to house-training, the key is to be consistent. Your puppy will typically need to eliminate 20 to 30 minutes after eating. Take him outside, and use a command such as “go potty.” Then be sure to praise him when he does. Don’t get discouraged if your puppy doesn’t learn the rules right away. Some pets catch onto housebreaking quickly, while others can take up to six months. Remember that with proper puppy care, your new pet will grow into a happy, healthy dog — and provide you with love and companionship for years to come.'), (3, 'Feeding your cat', 'Cat', 'An adult cat should be fed one large or two smaller meals each day. Kittens from 6 to 12 weeks need to be fed four times a day. Kittens from three to six months need to be fed three times a day. You can either feed specific meals, throwing away any leftover canned food after 30 minutes or free-feed dry food (keeping food out all the time). Feed your cat a high-quality, brand-name kitten or cat food (avoid generic brands) two to three times a day. Kittens can be fed human baby food for a short time if they won’t eat kitten food softened by soaking in warm water. Use turkey or chicken baby food made for children six months and older. Gradually mix with cat food. Cow’s milk is not necessary and can cause diarrhea in kittens and cats. Provide fresh, clean water at all times. Wash and refill water bowls daily.'), (4, 'Get on the right paw', 'Dog', 'When you pick up your pup, remember to ask what and when he was fed. Replicate that schedule for at least the first few days to avoid gastric distress. If you wish to switch to a different brand, do so over a period of about a week by adding one part new brand to three parts of the old for several days; then switch to equal parts; and then one part old to three parts new. From the start, consistency is important. On the way home, Puppers should ride in the back seat, either in one person’s arms or, preferably, in a crate or carrier. Once home, folks who plop the excited newcomer on the Oriental and let the kids chase him will be mopping up in no time—and regretting the lesson they taught their new pup. Instead, take him to his toileting area immediately. From there, carry out your schedule for feeding, toileting, napping, and play/exercise. From Day One, your pup will need family time and brief periods of solitary confinement. Solitude may be new to Puppers, so he may vocalize concern. Don’t give in and comfort him or you may create a monster. “Gee, if making noise brought them running once, maybe more whimpering is needed to get their attention again,” reasons the pup. Give him attention for good behavior, such as chewing on a toy or resting quietly. Doing things correctly from the start prevents confusion. Through puppy preparedness, you are one step closer to your Dream Dog.');

INSERT INTO comments(user_id, post_id, comment_body) VALUES (1, 3, 'I found this very insightful I might add that playing with your cat is also important. Keeps them happy!'), (4, 3, 'I agree with the playing. I have found that the best toys are those that can be made to jump and dance around and look alive.'), (2, 1, 'I love this I would also add to take your time making a decision. With all of the adorable “fur babies” in need of homes, you might be tempted to make a snap decision. However, it will be better for your future furry BFF if you put a lot of thought into it. For example, do you live in an apartment, or a house with a yard? Does your family travel a lot? Who will be there to let your dog out when you’re not home? Do your siblings want a new dog as much as you do?'), (3, 1, 'I want another dog'), (1, 4, 'I remember the first day as well. I was super excited but my buddy was alittle shy'), (3, 4, 'This here is a great post!'), (2, 5, 'I wish I read this before I brought my cat home. little fella went crazy with the change. now the house is all his lol'), (3, 5, 'I create a hiding spot for my cat. Even I forget where it is.'), (4, 2, 'My cat doesnt like sharing his space. Hes super territorial'), (1, 6, 'Alot of people this that hitting their dogs will teach them obedience. In fact it doesnt'), (4, 6, 'I keep my dog tired with plenty of exercise so she doesnt tear up the house'), (2, 7, 'Am I horrible that I love fat cats LOL'), (4, 7, 'My cats are picky with their food'), (1, 7, 'I too love fat cats!'), (1, 8, 'I do a mixer of dry and wet food to make sure their stool is not too hard or too soft'), (3, 8, 'I always give my dogs Blue'), (2, 8, 'I have heard people actually meal prep for their dogs');

INSERT INTO favorited(user_id, pet_id)
VALUES (1, 4439537), (2, 44439791), (3, 44439926), (4, 44439939), (1, 44440935), (2, 44440950), (3, 44440936), (4, 44440926), (1, 44441053), (2, 44440829), (3, 44441011), (4, 44440934), (1, 44441053);

INSERT INTO adopted(user_id, pet_id)
VALUES(1, 44441235), (1, 44441017), (2, 44440157), (3, 44440129), (3, 44439718), (4, 44440157);
