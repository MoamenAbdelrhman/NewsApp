# News App

A Flutter-based mobile application that fetches and displays news articles from various categories using the [News API](https://newsapi.org/). The app implements the **MVVM (Model-View-ViewModel)** architecture with state management handled by **Cubit** from the `flutter_bloc` package.

## Features
- **Login Screen**: A simple UI for user login with social media options (not fully implemented).
- **Explore Screen**: Displays top headlines with category filtering (e.g., General, Business, Technology).
  - The first article is showcased in a larger, prominent card.
  - Other articles are displayed in a compact card format.
- **Article Details**: View detailed information about a selected article.
- **Search Functionality**: Search through fetched articles by title, source, or description.
- **Responsive UI**: Built with Flutter's Material Design for a smooth user experience.

## Tech Stack
- **Flutter**: Cross-platform framework for building the app.
- **Dart**: Programming language used with Flutter.
- **flutter_bloc**: State management library implementing Cubit for MVVM.
- **Dio**: HTTP client for making API requests to News API.
- **News API**: External API for fetching news articles (requires an API key).

## Project Structure
lib/
├── view_model/                 
│   ├── explore_cubit.dart
│   └── explore_state.dart
├── model/                  # Data models
│   ├── article_model.dart
│   └── source_model.dart
├── screens/                # UI screens (View)
│   ├── explore_screen.dart
│   ├── login_screen.dart
│   ├── article_detail_screen.dart
│   └── article_search_delegate.dart
├── services/               # API and data services (Model)
│   └── news_service.dart
├── widgets/                # Reusable UI components
│   └── article_card.dart
└── main.dart               # Entry point of the application


### Key Components
- **Model**: `Article` and `NewsSource` classes handle data structure; `NewsService` manages API calls.
- **View**: UI screens (`ExploreScreen`, `LoginScreen`, etc.) and widgets (`ArticleCard`).
- **ViewModel**: `ExploreCubit` manages the state of the Explore screen (e.g., loading, loaded, error).

## Prerequisites
- **Flutter SDK**: Version 3.7.2 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install)).
- **Dart**: Included with Flutter.
- **News API Key**: Obtain a free API key from [NewsAPI.org](https://newsapi.org/).

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/<your-username>/news-app.git
   cd news-app
   
2. **Install Dependencies**:
   Run the following command to install required packages**:
   ```bash
   flutter pub get

3. **Add API Key**:
  Open lib/services/news_service.dart.
  Replace the _apiKey constant with your News API key
    ```bash
    static const String _apiKey = 'YOUR_API_KEY_HERE';

4. **Run the App**:
  Connect a device or start an emulator.
  Run the app:
    ```bash
    flutter run

Usage
Login: Enter dummy credentials or click "Login" to proceed to the Explore screen (authentication not implemented).
Explore: Browse top headlines by category. Tap an article to view details.
Search: Use the search icon in the app bar to filter articles.

Future Improvements
Implement full login functionality with authentication.
Support for multiple languages and regions.
Offline caching of articles.

Contributing
Feel free to submit issues or pull requests. Contributions are welcome!
