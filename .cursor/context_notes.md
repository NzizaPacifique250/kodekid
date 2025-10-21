# KodeKid: Interactive Python Tutor for Kids 1.0

## Project Summary
KodeKid is a kid-friendly, browser/mobile app that teaches Python through interactive lessons, playful UI, and instant feedback. Learners write code, run it safely, and earn badges as they progress.

## Target Users
- Children aged 8–12
- New to programming
- Require bright visuals, playful copy, clear guidance, and short feedback loops

## Tech Stack Overview
- Flutter (mobile + web) with Material 3, Google Fonts
- State management: Riverpod (unidirectional data-flow, testable)
- Routing: go_router
- Firebase: Auth, Firestore, Storage, Hosting
- Python execution: FastAPI microservice (Cloud Run) or in-browser Pyodide/Skulpt for safe execution

## Data Structures (Examples)

### User
```
/users/{uid} => {
  display_name: string,
  avatar_url: string,
  created_at: Timestamp,
  last_active_at: Timestamp,
  level: number,            // gamified level
  badges: string[],         // e.g., ["starter", "loop_hero"]
}
```

### Progress (subcollection)
```
/users/{uid}/progress/{lesson_id} => {
  started_at: Timestamp,
  completed_at: Timestamp | null,
  attempts: number,
  best_score: number, // 0-100
  last_code: string,
}
```

### Lesson
```
/lessons/{lesson_id} => {
  title: string,
  order: number,
  difficulty: string, // easy/medium
  goals: string[],
  starter_code: string,
  tests: [
    {
      prompt: string,
      input: string,
      expected_output: string
    }
  ]
}
```

## Folder Naming Conventions
- lowercase_with_underscores for files and folders
- Feature-first structure under `lib/features/<feature_name>/{presentation,domain,data}`
- Shared code under `lib/shared/*`
- Backend under `backend/python_service`
- Assets in `assets/lessons`

## Dev Workflows
- Flutter web preview: `flutter run -d chrome`
- Flutter mobile: `flutter run` (device/emulator required)
- Firebase emulators (optional): `firebase emulators:start`
- Python service local run: `uvicorn app.main:app --reload --port 8080`

## Figma
- Placeholder: Add your Figma link here.

## Notes
- Replace `lib/firebase_options.dart` by running `flutterfire configure` and committing the generated file.
- Harden the sandbox before production. Consider Pyodide-in-browser for extra safety.
