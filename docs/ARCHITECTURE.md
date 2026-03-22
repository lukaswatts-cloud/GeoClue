# GeoClue — Architecture (MVP)

## 1. Purpose

This document describes the technical structure for the GeoClue MVP.

The MVP goal is simple:
- show a map
- track user movement
- draw the walked path
- detect a closed loop
- convert that loop into captured territory

This architecture is intentionally small, local-first, and beginner-friendly.

---

## 2. MVP Technical Scope

The MVP includes only:

- iOS-first app
- Map display
- GPS location tracking
- Path recording
- Closed loop detection
- Territory polygon overlay
- Local storage only

The MVP excludes:
- backend
- accounts
- multiplayer
- monetisation
- complex AI
- cloud sync

---

## 3. Main Technology Choices

### Platform
- iOS-first

### UI
- SwiftUI

### Map
- MapKit

### Location
- CoreLocation

### Storage
- Local on-device storage

---

## 4. Architecture Principles

- Keep modules simple
- Separate UI from game logic
- Keep location tracking isolated from rendering
- Use local storage only
- Build one working layer at a time
- Avoid premature optimisation

---

## 5. Core App Layers

The app is split into five simple layers:

### A. UI Layer
Responsible for what the user sees.

Includes:
- map screen
- buttons / status labels
- territory display
- path display

### B. Location Layer
Responsible for GPS updates.

Includes:
- requesting location permission
- receiving user coordinates
- exposing location updates to the app

### C. Path Layer
Responsible for recording movement history.

Includes:
- storing walked coordinates in order
- deciding when movement is meaningful enough to add a new point
- preparing the trail for display

### D. Game Logic Layer
Responsible for gameplay rules.

Includes:
- checking whether a path forms a closed loop
- turning a valid loop into a polygon
- creating captured territory objects

### E. Storage Layer
Responsible for saving data locally.

Includes:
- saving captured territories
- loading saved territories on app launch

---

## 6. Suggested Folder / Code Structure

This is a simple target structure, not a strict rule:

```text
GeoClueApp/
├── App/
├── Features/
│   └── Map/
├── Services/
│   ├── Location/
│   ├── Path/
│   └── Storage/
├── GameLogic/
├── Models/
└── Resources/