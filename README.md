# KodeKid: Interactive Python Tutor for Kids 1.0

KodeKid teaches Python to kids (8–12) through interactive, gamified lessons. Built with Flutter (web + mobile) and Firebase, with a sandboxed Python runner.

## Features (MVP)
- Kid-friendly UI with Material 3 and Google Fonts
- Lessons list and simple in-app code editor
- Progress tracking and badges (data model ready)
- Firebase integration scaffold (Auth, Firestore, Storage)
- Python sandbox service skeleton (FastAPI, Docker)

## Getting Started

### 1) Prerequisites
- Flutter 3.24+ (Dart 3.4+)
- Firebase CLI
- Python 3.11 (for sandbox service)
- Docker (optional for deployment)

### 2) Install Flutter deps
```bash
flutter pub get
```

### 3) Configure Firebase
```bash
# Generates firebase_options.dart
flutter pub add firebase_core firebase_auth cloud_firestore firebase_storage
flutterfire configure
```
Then replace the placeholder at `lib/firebase_options.dart` with generated content.

### 4) Run the Flutter app
```bash
flutter run -d chrome
```

### 5) Run the sandbox service (local)
```bash
cd backend/python_service
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8080
```

## Architecture
- Feature-first: `lib/features/<feature>/{presentation,domain,data}`
- Routing: `go_router` in `lib/app/app.dart`
- State management: Riverpod (providers, testable, simple)
- Shared components in `lib/shared/*`
- Firebase rules and hosting configured in root JSON files

## Safe Python Execution Strategy
- Start with FastAPI microservice (containerized) with strict timeouts and no network/file access beyond temp dir
- For web safety and latency, consider in-browser Pyodide (WASM) for pure-Python lessons
- For advanced features (files, packages), run on Cloud Run with gVisor or Firecracker; lock down via AppArmor/seccomp, resource limits, and network egress blocks

## State Management Choice
**Riverpod** is recommended for simplicity, testability, and fine-grained rebuilds. It suits feature-first modules and scales to complex flows without heavy boilerplate.

## Next Steps
- Hook up Firebase Auth UI (email/anonymous sign-in)
- Implement lesson loading from Firestore and/or `assets/lessons`
- Wire editor "Run" button to sandbox service or Pyodide (web)
- Add badge logic and progress persistence

## License
MIT
