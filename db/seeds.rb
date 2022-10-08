# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'rest-client'

  response = RestClient.get "https://pokeapi.co/api/v2/pokemon/?limit=1154"
  result = JSON.parse(response.body)
  pokemons = result['results']

  pokemons.each do |i|
      name = i['name']
      response = RestClient.get "https://pokeapi.co/api/v2/pokemon/#{name}"
      result = JSON.parse(response.body)
      pokemon_details = result

      Pokemon.create(
      name: pokemon_details['name'],
      pokemon_id_number: pokemon_details['id'],
      height: pokemon_details['height'],
      weight: pokemon_details['weight'],
      base_experience: pokemon_details['base_experience']
      )
  end

