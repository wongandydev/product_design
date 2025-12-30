import Foundation

struct MockData {
    static let moviesJSON = """
    {
      "page": 1,
      "results": [
        {
          "id": 278,
          "title": "The Shawshank Redemption",
          "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison.",
          "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
          "release_date": "1994-09-23",
          "vote_average": 8.7,
          "vote_count": 26000
        },
        {
          "id": 238,
          "title": "The Godfather",
          "overview": "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.",
          "poster_path": "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
          "release_date": "1972-03-14",
          "vote_average": 8.7,
          "vote_count": 19000
        },
        {
          "id": 550,
          "title": "Fight Club",
          "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
          "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
          "release_date": "1999-10-15",
          "vote_average": 8.4,
          "vote_count": 28000
        },
        {
          "id": 155,
          "title": "The Dark Knight",
          "overview": "Batman raises the stakes in his war on crime with the help of Lt. Jim Gordon and District Attorney Harvey Dent.",
          "poster_path": "/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
          "release_date": "2008-07-18",
          "vote_average": 9.0,
          "vote_count": 32000
        },
        {
          "id": 13,
          "title": "Forrest Gump",
          "overview": "A man with a low IQ has accomplished great things in his life and been present during significant historic events.",
          "poster_path": "/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg",
          "release_date": "1994-07-06",
          "vote_average": 8.5,
          "vote_count": 25000
        },
        {
          "id": 680,
          "title": "Pulp Fiction",
          "overview": "A burger-loving hit man, his philosophical partner, and a drug-addled gangster's moll navigate Los Angeles' criminal underworld.",
          "poster_path": "/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
          "release_date": "1994-10-14",
          "vote_average": 8.5,
          "vote_count": 27000
        },
        {
          "id": 497,
          "title": "The Green Mile",
          "overview": "The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder who has a mysterious gift.",
          "poster_path": "/velWPhVMQeQKcxggNEU8YmIo52R.jpg",
          "release_date": "1999-12-10",
          "vote_average": 8.5,
          "vote_count": 16000
        },
        {
          "id": 122,
          "title": "The Lord of the Rings: The Return of the King",
          "overview": "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam.",
          "poster_path": "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
          "release_date": "2003-12-17",
          "vote_average": 8.5,
          "vote_count": 23000
        },
        {
          "id": 27205,
          "title": "Inception",
          "overview": "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea.",
          "poster_path": "/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
          "release_date": "2010-07-16",
          "vote_average": 8.8,
          "vote_count": 34000
        },
        {
          "id": 637,
          "title": "Life Is Beautiful",
          "overview": "A Jewish-Italian book shop owner employs his fertile imagination to shield his son from the horrors of internment in a Nazi concentration camp.",
          "poster_path": "/74hLDKjD5aGYOotO6esUVaeISa2.jpg",
          "release_date": "1997-12-20",
          "vote_average": 8.6,
          "vote_count": 12500
        },
        {
          "id": 103,
          "title": "Taxi Driver",
          "overview": "A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence fuels his urge for violent action.",
          "poster_path": "/ekstpH614fwDX8DUln1a2Opz0N8.jpg",
          "release_date": "1976-02-09",
          "vote_average": 8.1,
          "vote_count": 14500
        },
        {
          "id": 1124,
          "title": "The Prestige",
          "overview": "After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.",
          "poster_path": "/tRNlZbgNCNOpLpbPEz5L8G8A0JN.jpg",
          "release_date": "2006-10-20",
          "vote_average": 8.2,
          "vote_count": 15000
        },
        {
          "id": 429,
          "title": "The Good, the Bad and the Ugly",
          "overview": "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
          "poster_path": "/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg",
          "release_date": "1966-12-23",
          "vote_average": 8.5,
          "vote_count": 7800
        },
        {
          "id": 769,
          "title": "GoodFellas",
          "overview": "The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito.",
          "poster_path": "/aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg",
          "release_date": "1990-09-19",
          "vote_average": 8.5,
          "vote_count": 12000
        },
        {
          "id": 914,
          "title": "The Great Dictator",
          "overview": "Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel's regime.",
          "poster_path": "/1QpO9wo7JWecZ4NiBuu625FiY1j.jpg",
          "release_date": "1940-10-15",
          "vote_average": 8.4,
          "vote_count": 4200
        }
      ],
      "total_pages": 500,
      "total_results": 10000
    }
    """.data(using: .utf8)!
}
