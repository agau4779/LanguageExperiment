# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pair.destroy_all
UserEntry.destroy_all
IterativeChain.destroy_all

p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/key.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/fej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/truck.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/feej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/feather.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/jef.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/lamp.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/jeej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/window.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/fef.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/rock climbing.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/gaab.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/swimming.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/goob.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/running.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/boog.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/jumping on trampoline.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/baab.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'app/assets/images/mopping.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'app/assets/audio/goog.wav')))
p.save!

iterative_chain = IterativeChain.create(locked: false)
user_entry = iterative_chain.user_entries.create
user_entry.pairs << p