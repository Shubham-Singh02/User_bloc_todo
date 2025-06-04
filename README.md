# Flutter User Management App

This Flutter app provides a clean, scalable solution for managing and viewing users, their posts, and todos. Built with the BLoC pattern and following clean architecture principles, it offers a smooth and responsive user experience with real-time search, infinite scrolling, and well-structured state management.

## Overview

The app displays a list of users fetched from the DummyJSON API. Users can scroll through the list infinitely with seamless pagination, and search for any user by name in real-time. Tapping on a user opens a detailed view, showing their profile along with associated posts and todos.

Users can also create new posts locally, and the app handles loading states, errors, and edge cases gracefully. Everything is organized using a clean folder structure, and the code is modular, readable, and easy to maintain.

## Features

- ✅ User list with avatar, name, and email
- ✅ Infinite scrolling with pagination
- ✅ Real-time search bar at the top of the list
- ✅ Detailed user screen with posts and todos
- ✅ Local post creation (title + body)
- ✅ Pull-to-refresh support for the user list
- ✅ Light and dark mode switching
- ✅ Offline caching using local storage (if available)
- ✅ Loading indicators during API operations
- ✅ Error handling with user-friendly messages
- ✅ Clean architecture and BLoC-based state management

- ## 🖼️ App Visuals

### 🔹 Home Screen
![Home Screen](assets/Visuals/Screenshot_20250604_145202.jpg)

### 🔹 User Profile
![User Profile](assets/Visuals/Screenshot_20250604_145209.jpg)

### 🔹 Todo List
![Todo List](assets/Visuals/Screenshot_20250604_145216.jpg)


## Tech Stack

- **Flutter**
- **Dart**
- **flutter_bloc** for state management
- **http** for network requests
- **Equatable** for cleaner state comparisons


## 🔗 API Used

All data is fetched from [DummyJSON](https://dummyjson.com/docs) API:

- **Users**:  
  `https://dummyjson.com/users`  
  Supports pagination with `limit` and `skip` parameters  
  Real-time search using `?q={username}`

- **User Posts**:  
  `https://dummyjson.com/posts/user/{userId}`

- **User Todos**:  
  `https://dummyjson.com/todos/user/{userId}`

## 💬 Final Thoughts

This project is a complete showcase of how to build a feature-rich Flutter app with real-world API handling, proper state management using the BLoC pattern, and scalable architecture. It balances functionality with clean code practices and provides a solid foundation for production-level apps.

The app is easy to extend with new features, and the modular structure makes onboarding for new contributors straightforward. It was both fun and rewarding to build — and it’s ready for whatever comes next.

---
