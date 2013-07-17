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
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/key.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/fej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/truck.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/feej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/feather.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/jef.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/lamp.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/jeej.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/window.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/fef.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/rock climbing.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/gaab.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/swimming.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/goob.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/running.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/boog.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/jumping on trampoline.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/baab.wav')))
p.save!
p = Pair.create
p.image.store!(File.open(File.join(Rails.root, 'public/uploads/images/mopping.jpg')))
p.sound.store!(File.open(File.join(Rails.root, 'public/uploads/audio/goog.wav')))
p.save!

iterative_chain = IterativeChain.create(locked: false)