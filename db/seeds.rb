# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
player1 = Player.create(name: "Magnus", rating: 3000, professional: true)
player2 = Player.create(name: "Anthony", rating: 1100, professional: false)
player3 = Player.create(name: "Judit", rating: 2700, professional: true)
player4 = Player.create(name: "Kaylah Rose", rating: 1200, professional: false)
player5 = Player.create(name: "Thomas", rating: 1300, professional: false)
Game.create(name: "Sinquefield Cup Round 1", won: true, number_of_moves: rand(10..80), player: player1)
Game.create(name: "Grand Prix 2022", won: true, number_of_moves: rand(10..80), player: player1)
Game.create(name: "Sinquefield Cup Round 1", won: false, number_of_moves: rand(10..80), player: player2)
Game.create(name: "Grand Prix 2022", won: true, number_of_moves: rand(10..80), player: player2)
Game.create(name: "Sinquefield Cup Round 1", won: true, number_of_moves: rand(10..80), player: player3)
Game.create(name: "Grand Prix 2022", won: true, number_of_moves: rand(10..80), player: player3)
Game.create(name: "Sinquefield Cup Round 1", won: false, number_of_moves: rand(10..80), player: player4)
Game.create(name: "Grand Prix 2022", won: true, number_of_moves: rand(10..80), player: player4)
Game.create(name: "Sinquefield Cup Round 1", won: false, number_of_moves: rand(10..80), player: player5)
Game.create(name: "Grand Prix 2022", won: false, number_of_moves: rand(10..80), player: player5)