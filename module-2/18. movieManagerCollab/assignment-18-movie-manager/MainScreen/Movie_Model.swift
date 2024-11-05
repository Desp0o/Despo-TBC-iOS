//
//  Movie_Model.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

final class Movie_Model {
    var poster: String = ""
    var backDrop: String = ""
    var title: String = ""
    var imdb: Double = 0
    var description: String = ""
    var cast = [Actor_Model]()
    var duration: String = ""
    var language: String = ""
    var rating: String = ""
    var genres = [String]()
    var isFaved: Bool = false
    var isPopular: Bool = false

    init(poster: String, backDrop: String, title: String, imdb: Double, description: String, cast: [Actor_Model], duration: String, language: String, rating: String, genres: [String], isFaved: Bool, isPopular: Bool) {
        self.poster = poster
        self.backDrop = backDrop
        self.title = title
        self.imdb = imdb
        self.description = description
        self.cast = cast
        self.duration = duration
        self.language = language
        self.rating = rating
        self.genres = genres
        self.isFaved = isFaved
        self.isPopular = isPopular
    }
}
