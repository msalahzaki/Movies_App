import 'package:movies_app/utils/app_assets.dart';

class OnboardingModel {
  static List<Map<String, String>> getOnboardingList() {
    return [
      {
        'image': AppAssets.onboardingS2,
        'title': 'Discover Movies',
        'description':
            'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.'
      },
      {
        'image': AppAssets.onboardingS3,
        'title': 'Explore All Genres',
        'description':
            'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.'
      },
      {
        'image': AppAssets.onboardingS4,
        'title': 'Create Watchlists',
        'description':
            'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.'
      },
      {
        'image': AppAssets.onboardingS5,
        'title': 'Rate, Review, and Learn',
        'description':
            'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.'
      },
      {
        'image': AppAssets.onboardingS6,
        'title': 'Start Watching Now',
        'description': ''
      }
    ];
  }
}
