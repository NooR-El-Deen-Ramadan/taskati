# 📝 Taskati - Task Management App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

**Taskati** 
is a modern and intuitive task management application built with Flutter. The name "Taskati" means "My Tasks" in Arabic, reflecting the app's focus on personal productivity and task organization.

## 🌟 Features

### Core Functionality
- ✅ **Create, Edit & Delete Tasks** - Full CRUD operations for task management
- 📅 **Date & Time Scheduling** - Set due dates and reminders for tasks
- 🏷️ **Task Categories** - Organize tasks with custom categories and tags
- ⭐ **Priority Levels** - Mark tasks with different priority levels (High, Medium, Low)
- ✔️ **Task Completion** - Mark tasks as completed with progress tracking
- 🔍 **Search & Filter** - Quickly find tasks with search and filter options

### User Experience
- 🎨 **Modern UI/UX** - Clean, intuitive interface following Material Design principles
- 🌙 **Dark/Light Mode** - Toggle between dark and light themes
- 📱 **Responsive Design** - Optimized for different screen sizes
- 🔄 **Real-time Updates** - Instant updates across the application
- 💾 **Local Storage** - Data persistence using local storage solutions

### Additional Features
- 📊 **Progress Tracking** - Visual progress indicators and statistics
- 🔔 **Notifications** - Task reminders and due date notifications
- 📈 **Analytics** - Task completion statistics and productivity insights
- 🎯 **Goal Setting** - Set and track personal productivity goals
- 🗂️ **Task Organization** - Drag and drop functionality for task reordering

## 📱 Screenshots

### Main Screens
<div align="center">
  <img src="assets/screenshots/home_screen.png" width="200" alt="Home Screen"/>
  <img src="assets/screenshots/task_list.png" width="200" alt="Task List"/>
  <img src="assets/screenshots/add_task.png" width="200" alt="Add Task"/>
  <img src="assets/screenshots/task_details.png" width="200" alt="Task Details"/>
</div>

### Additional Screens
<div align="center">
  <img src="assets/screenshots/categories.png" width="200" alt="Categories"/>
  <img src="assets/screenshots/settings.png" width="200" alt="Settings"/>
  <img src="assets/screenshots/dark_mode.png" width="200" alt="Dark Mode"/>
  <img src="assets/screenshots/notifications.png" width="200" alt="Notifications"/>
</div>

## 🏗️ Architecture

The app follows a clean architecture pattern with the following structure:

```
lib/
├── core/
│   ├── constants/
│   ├── themes/
│   ├── utils/
│   └── widgets/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── presentation/
│   ├── screens/
│   ├── widgets/
│   └── providers/
└── main.dart
```

### Key Components
- **Models** - Data structures for tasks, categories, and user preferences
- **Services** - Local storage, notifications, and external API integrations
- **Providers** - State management using Provider or Riverpod
- **Repositories** - Data access layer abstracting storage operations
- **Widgets** - Reusable UI components and custom widgets

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.17.0)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/NooR-El-Deen-Ramadan/taskati.git
   cd taskati
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

## 📦 Dependencies

### Core Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  provider: ^6.0.0  # State management
  sqflite: ^2.0.0  # Local database
  shared_preferences: ^2.0.0  # Simple data storage
  intl: ^0.18.0  # Internationalization
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

### Additional Packages
- **UI/UX**: `flutter_animate`, `lottie`, `cached_network_image`
- **Storage**: `hive`, `path_provider`
- **Notifications**: `flutter_local_notifications`
- **Date/Time**: `table_calendar`, `flutter_datetime_picker`
- **Navigation**: `go_router` or `auto_route`

## 🎨 Design System

### Color Palette
- **Primary**: `#6366F1` (Indigo)
- **Secondary**: `#8B5CF6` (Purple)
- **Success**: `#10B981` (Green)
- **Warning**: `#F59E0B` (Amber)
- **Error**: `#EF4444` (Red)
- **Background**: `#F8FAFC` (Light) / `#0F172A` (Dark)

### Typography
- **Headings**: Inter / SF Pro Display
- **Body**: Inter / SF Pro Text
- **Code**: JetBrains Mono

## 🧪 Testing

Run tests with:
```bash
flutter test
```

### Test Coverage
- Unit Tests: Core business logic
- Widget Tests: UI components
- Integration Tests: End-to-end user flows

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Follow the existing code style
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Nour El-Deen Ramadan**
- GitHub: [@NooR-El-Deen-Ramadan](https://github.com/NooR-El-Deen-Ramadan)
- Email: [your-email@example.com]
- LinkedIn: [Your LinkedIn Profile]

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for design inspiration
- Community contributors and testers
- Open source packages that made this project possible

## 🔄 Version History

- **v1.0.0** - Initial release with core task management features
- **v1.1.0** - Added categories and priority levels
- **v1.2.0** - Implemented dark mode and notifications
- **v1.3.0** - Added search and filter functionality

## 📞 Support

If you encounter any issues or have questions:
- Create an issue on GitHub
- Email: [support-email@example.com]
- Documentation: [Link to documentation]

---

<div align="center">
  <strong>⭐ Don't forget to star this repository if you found it helpful! ⭐</strong>
</div>
