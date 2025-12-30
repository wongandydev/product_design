import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        // Implement row layout here
        Text(movie.title)
    }
}

#Preview {
    MovieRowView(movie: Movie(
        id: 1,
        title: "Sample Movie",
        overview: "Sample overview",
        posterPath: nil,
        releaseDate: "2024-01-01",
        voteAverage: 7.5,
        voteCount: 1000
    ))
}
