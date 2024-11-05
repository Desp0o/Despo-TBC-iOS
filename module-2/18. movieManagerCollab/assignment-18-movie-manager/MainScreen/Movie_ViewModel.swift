//
//  Movie_ViewModel.swift
//  assignment-18-movie-manager
//
//  Created by Despo on 25.10.24.
//

import UIKit
import Foundation

final class Movie_ViewModel {
    static var favouriteMovies = [Movie_Model]()
    var delegate: FavouriteButtonTapped?
    private var movieArray = [
        Movie_Model(
            poster: "soulPoster",
            backDrop: "soulBackdrop",
            title: "Soul",
            imdb: 7.3,
            description: "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon"),
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 59m",
            language: "English",
            rating: "R",
            genres: ["Sci-Fi", "Horror", "Thriller"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "kingsmanPoster",
            backDrop: "kingsmanBackdrop",
            title: "Kingsman",
            imdb: 7.3,
            description: "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon"),
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 59m",
            language: "English",
            rating: "R",
            genres: ["Sci-Fi", "Horror", "Thriller"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "readyplayeronePoster",
            backDrop: "readyplayeroneBackdrop",
            title: "Soul",
            imdb: 7.3,
            description: "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon"),
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 59m",
            language: "English",
            rating: "R",
            genres: ["Sci-Fi", "Horror", "Thriller"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "alienPoster",
            backDrop: "AlienBackdrop",
            title: "Alien",
            imdb: 7.3,
            description: "While scavenging the deep ends of a derelict space station, a group of young space colonizers come face to face with the most terrifying life form in the universe.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon"),
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 59m",
            language: "English",
            rating: "R",
            genres: ["Sci-Fi", "Horror", "Thriller"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "cocoPoster",
            backDrop: "cocoBackdrop",
            title: "Coco",
            imdb: 8.2,
            description: "Despite his family’s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel's family history.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 45m",
            language: "English",
            rating: "PG",
            genres: ["Family", "Animation", "Music", "Adventure"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "deadpoolPoster",
            backDrop: "deadpoolBackdrop",
            title: "Deadpool & Wolverine",
            imdb: 7.7,
            description: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 8m",
            language: "English",
            rating: "R",
            genres: ["Action", "Comedy", "Sci-Fi", "Super-Hero", "Comics"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "eternalsPoster",
            backDrop: "eternalsBackdrop",
            title: "Eternals",
            imdb: 6.9,
            description: "The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 36m",
            language: "English",
            rating: "PG-13",
            genres: ["Sci-Fi", "Action", "Drama", "Adventure"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "hellboyPoster",
            backDrop: "hellboyBackdrop",
            title: "Hellboy: The Crooked Man",
            imdb: 5.0,
            description: "Hellboy and a rookie BPRD agent get stranded in 1950s rural Appalachia. There, they discover a small community haunted by witches, led by a local devil with a troubling connection to Hellboy's past: the Crooked Man.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "1h 40m",
            language: "English",
            rating: "R",
            genres: ["Fantasy", "Horror", "Action"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "inceptionPoster",
            backDrop: "inceptionBackdrop",
            title: "Inception",
            imdb: 8.8,
            description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 28m",
            language: "English",
            rating: "PG-13",
            genres: ["Action", "Sci-Fi", "Thriller"],
            isFaved: false,
            isPopular: true
        ),
        
        Movie_Model(
            poster: "parasitePoster",
            backDrop: "parasiteBackdrop",
            title: "Parasite",
            imdb: 8.6,
            description: "A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon"),
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 12m",
            language: "Korean",
            rating: "R",
            genres: ["Thriller", "Drama"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "jokerPoster",
            backDrop: "jokerBackdrop",
            title: "Joker",
            imdb: 8.5,
            description: "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 2m",
            language: "English",
            rating: "R",
            genres: ["Crime", "Drama", "Thriller"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "interstellarPoster",
            backDrop: "interstellarBackdrop",
            title: "Interstellar",
            imdb: 8.6,
            description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 49m",
            language: "English",
            rating: "PG-13",
            genres: ["Adventure", "Drama", "Sci-Fi"],
            isFaved: false,
            isPopular: false
        ),
        
        Movie_Model(
            poster: "shawshankPoster",
            backDrop: "shawshankBackdrop",
            title: "The Shawshank Redemption",
            imdb: 9.3,
            description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
            cast: [
                Actor_Model(name: "Tom Holland", avatar: "tomHolland"),
                Actor_Model(name: "Zendaya", avatar: "zendaya"),
                Actor_Model(name: "Benedict", avatar: "benedict"),
                Actor_Model(name: "Jacon", avatar: "jacon")
            ],
            duration: "2h 22m",
            language: "English",
            rating: "R",
            genres: ["Drama", "Crime"],
            isFaved: false,
            isPopular: false
        )
    ]
    
    var numberOfMovie: Int {
        movieArray.count
    }
    
    func singleMovie(at index: Int) -> Movie_Model {
        movieArray[index]
    }
    
    var favouriteMoviesCount: Int {
        Movie_ViewModel.favouriteMovies.count
    }
    
    func singleFavouriteMovie(at index: Int) -> Movie_Model {
        Movie_ViewModel.favouriteMovies[index]
    }
    
    func favouritesButtonTapped(movie: Movie_Model) {
        movie.isFaved.toggle()
        if movie.isFaved {
            Movie_ViewModel.favouriteMovies.append(movie)
        } else {
            Movie_ViewModel.favouriteMovies.removeAll { $0.title == movie.title}
        }
        delegate?.reloadViewData()
    }
    
    func reloadCollectionView(collection: UICollectionView) {
        collection.reloadData()
    }
}

