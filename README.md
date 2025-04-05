# News & Weather App

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
