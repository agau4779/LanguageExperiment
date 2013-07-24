# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sound.destroy_all
Image.destroy_all
UserEntry.destroy_all
IterativeChain.destroy_all

Dir.glob(File.join(Rails.root,'/app/assets/images/*.jpg')) do |i|
  img = Image.create
  img.image.store!(File.open(i))
  img.save!
end

Dir.glob(File.join(Rails.root,'/app/assets/audio/*.wav')) do |s|
  sound = Sound.create
  sound.sound.store!(File.open(s))
  sound.save!
end

iterative_chain = IterativeChain.create(locked: false)
user_entry = iterative_chain.user_entries.create
user_entry.pairs = [
      { sound: "fej", image: "key" },
      { sound: "feej", image: "truck" },
      { sound: "jef", image: "feather" },
      { sound: "jeej", image: "lamp" },
      { sound: "fef", image: "window" },
      { sound: "gaab", image: "rock climbing" },
      { sound: "goob", image: "swimming" },
      { sound: "boog", image: "running" },
      { sound: "baab", image: "jumping on trampoline" },
      { sound: "goog", image: "mopping" }
    ]
user_entry.save!
iterative_chain.save!