import SwiftUI

// MARK: - Movie Detail View
// Displays full details for a selected movie
// This view is already fully functional!

struct MovieDetailView: View {

    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // Poster Image
                if let posterPath = movie.posterPath,
                   let imageURL = MovieService.shared.imageURL(for: posterPath, size: "w500") {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 450)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                                .frame(height: 450)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    // Placeholder for missing poster
                    Image(systemName: "film")
                        .font(.system(size: 100))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 450)
                }

                VStack(alignment: .leading, spacing: 16) {

                    // Title
                    Text(movie.title)
                        .font(.title)
                        .fontWeight(.bold)

                    // Release Date and Rating
                    HStack(spacing: 20) {
                        Label(movie.releaseYear, systemImage: "calendar")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Label(movie.formattedRating, systemImage: "star.fill")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                    }

                    // Vote Count
                    Text("\(movie.voteCount) votes")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Divider()

                    // Overview
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Overview")
                            .font(.headline)

                        Text(movie.overview)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(movie: MockData.sampleMovie)
    }
}
