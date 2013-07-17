# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


UserEntry.delete_all
IterativeChain.delete_all

num_chains = 3
for i in 1..num_chains
  iterative_chain = IterativeChain.create(locked: false)
  iterative_chain.user_entries.create(pairs: [
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
  ])
end

IterativeChain.find(1).user_entries.create(pairs: [
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
])
IterativeChain.find(1).user_entries.create(pairs: [
  { sound: "feej", image: "truck" },
  { sound: "jeej", image: "lamp" },
  { sound: "fef", image: "window" },
  { sound: "goob", image: "swimming" },
  { sound: "boog", image: "running" },
  { sound: "baab", image: "jumping on trampoline" },
  { sound: "fej", image: "key" },
  { sound: "gaab", image: "rock climbing" },
  { sound: "jef", image: "feather" },
  { sound: "goog", image: "mopping" }
])
IterativeChain.find(2).user_entries.create(pairs: [
  { sound: "feej", image: "truck" },
  { sound: "jeej", image: "lamp" },
  { sound: "fef", image: "window" },
  { sound: "goob", image: "swimming" },
  { sound: "boog", image: "running" },
  { sound: "baab", image: "jumping on trampoline" },
  { sound: "fej", image: "key" },
  { sound: "gaab", image: "rock climbing" },
  { sound: "jef", image: "feather" },
  { sound: "goog", image: "mopping" }
])
IterativeChain.find(3).user_entries.create(pairs: [
  { sound: "fef", image: "swimming" },
  { sound: "goob", image: "key" },
  { sound: "boog", image: "running" },
  { sound: "feej", image: "truck" },
  { sound: "jeej", image: "lamp" },
  { sound: "baab", image: "jumping on trampoline" },
  { sound: "fej", image: "window" },
  { sound: "gaab", image: "rock climbing" },
  { sound: "jef", image: "feather" },
  { sound: "goog", image: "mopping" }
])