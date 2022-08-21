# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "open-uri"
Movie.create(title: "STILLWATER", overview: "Film Suspense, États-Unis d'Amérique, 2021, 2h13", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "House of Gucci", overview: "Film Drame, États-Unis d'Amérique, Canada, 2021, 2h31", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Le Flambeau, les aventuriers de Chupacabra", overview: "Série Humour, Saison en 9 épisodes, France", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 10.0)
Movie.create(title: "La Flamme", overview: "Série Humour, Saison en 9 épisodes, France", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 10.0)
Movie.create(title: "Le roi lion", overview: "Film Animation, États-Unis d'Amérique, 2019, 2h07", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "Toy Story 4", overview: "Film Animation, États-Unis d'Amérique, 2019, 1h40", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "Canal Football Club", overview: "L'émission de référence du football est de retour, pilotée par son incontournable capitaine, Hervé Mathoux.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "Formule 1, France", overview: "Margot Laffite présente les actualités de la Formule 1. ", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)
movies["results"].take(10).each do |movie|
  new_movie = Movie.new(
    title: movie["original_title"],
    poster_url: movie["poster_path"],
    overview: movie["overview"],
    rating: movie["vote_average"]
  )
  new_movie.save
end
