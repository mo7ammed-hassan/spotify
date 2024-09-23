A Spotify-like music streaming app built with **Flutter**, following the **Clean Architecture** design pattern and using **BLoC (Cubit)** for state management. The app integrates Firebase for backend services, including authentication and data storage, and offers music playback using the **just_audio** package.

## 🚀 Features

- **User Authentication**: Firebase Auth for email/password and Google Sign-In.
- **Firestore Integration**: Real-time database for user profiles, playlists, and track information.
- **Music Playback**: High-quality streaming using the `just_audio` package.
- **State Management**: Efficient and organized state management with **BLoC (Cubit)**.
- **Cloud Storage**: Store and retrieve music files and album covers using Firebase Cloud Storage.
- **Functional Programming**: Utilizes the `dartz` package for error handling and functional programming.
- **Dependency Injection & Inversion**: Ensures maintainable and loosely coupled code.

## 📚 Technologies Used

- **Flutter**: Cross-platform development framework
- **Clean Architecture**: Structured codebase for scalability and maintainability
- **BLoC / Cubit**: Business logic component for state management
- **Firebase**: Auth, Firestore, and Cloud Storage
- **just_audio**: For audio playback
- **Dartz**: Functional programming package

## 🛠️ Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Firebase project set up with `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/mo7ammed-hassan/spotify-clone.git
