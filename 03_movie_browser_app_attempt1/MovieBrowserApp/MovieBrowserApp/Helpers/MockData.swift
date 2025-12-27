import Foundation

// MARK: - Mock Data
// Use this for testing without making real API calls

struct MockData {

    // Sample JSON response from TMDB API (popular movies endpoint)
    static let sampleMoviesJSON = """
    {
        "page": 1,
        "results": [
            {
                "id": 550,
                "title": "Fight Club",
                "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground fight clubs forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
                "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
                "backdrop_path": "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
                "release_date": "1999-10-15",
                "vote_average": 8.4,
                "vote_count": 26280,
                "genre_ids": [18, 53]
            },
            {
                "id": 238,
                "title": "The Godfather",
                "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
                "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                "backdrop_path": "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
                "release_date": "1972-03-14",
                "vote_average": 8.7,
                "vote_count": 18287,
                "genre_ids": [18, 80]
            },
            {
                "id": 424,
                "title": "Schindler's List",
                "overview": "The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.",
                "poster_path": "/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg",
                "backdrop_path": "/7w0m4BSdunEP5LWn9Eh4Jkb5uPx.jpg",
                "release_date": "1993-12-15",
                "vote_average": 8.6,
                "vote_count": 14359,
                "genre_ids": [18, 36, 10752]
            },
            {
                "id": 278,
                "title": "The Shawshank Redemption",
                "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                "poster_path": "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                "backdrop_path": "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
                "release_date": "1994-09-23",
                "vote_average": 8.7,
                "vote_count": 24629,
                "genre_ids": [18, 80]
            },
            {
                "id": 497,
                "title": "The Green Mile",
                "overview": "A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.",
                "poster_path": "/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
                "backdrop_path": "/l6hQWH9eDksNJNiXWYRkWqikOdu.jpg",
                "release_date": "1999-12-10",
                "vote_average": 8.5,
                "vote_count": 16220,
                "genre_ids": [14, 18, 80]
            }
        ],
        "total_pages": 500,
        "total_results": 10000
    }
    """.data(using: .utf8)!

    // Helper to create a sample movie for previews
    static var sampleMovie: Movie {
        Movie(
            id: 550,
            title: "Fight Club",
            overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
            posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
            backdropPath: "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
            releaseDate: "1999-10-15",
            voteAverage: 8.4,
            voteCount: 26280,
            genreIds: [18, 53]
        )
    }

    // TODO: You can add more mock data here for different scenarios
    // - Different genres
    // - Error responses
    // - Empty results
    // - Edge cases
}
