# GeoClue — Game Design (MVP)

## 1. Core Idea

GeoClue: Urban Conquest is a location-based mobile game where players walk in the real world to capture territory on a map.

Players create closed shapes (polygons) by physically moving through streets. When a loop is completed, the enclosed area becomes captured territory.

The city becomes a canvas, and movement becomes gameplay.

### Problem it solves
- Walking and exploration often lack purpose
- Existing location-based games can be stressful or competitive
- GeoClue provides a calm, visual, and rewarding real-world experience

---

## 2. Core Gameplay Loop (MVP)

The entire MVP is built around one simple loop:

Walk → Draw Path → Close Shape → Capture Area → Repeat

### Step-by-step experience

1. User opens the app
2. A map is displayed (centred on their location)
3. GPS tracks movement in real time
4. The app draws a path showing where the user has walked
5. When the user completes a closed loop:
   - The app detects the shape
   - The enclosed area becomes captured territory
6. The captured area is displayed visually on the map
7. The user continues exploring to expand territory

---

## 3. MVP Features

Only the following features are included in Version 1:

### Map & Movement
- Map-based interface (Apple Maps / MapKit)
- Real-time GPS tracking
- Live path/trail drawing

### Territory System
- Closed loop (polygon) detection
- Automatic area capture when loop is completed
- Visual territory overlay on the map (semi-transparent fill)

### Data & Storage
- Local storage of captured territories
- No accounts or syncing

### Modes
- Single-player only

---

## 4. Visual Design (Core Concepts)

The map is the primary interface.

### Key visual elements:
- A live path line showing movement
- Completed shapes filled with colour (captured territory)
- Multiple captured areas visible at once
- Clean, minimal UI (no clutter)

### Conceptual model:
- The city is the game board
- The player “draws” on the map using movement
- Progress is visual and spatial, not just numerical

---

## 5. Technical Approach (MVP)

### Platform
- iOS-first

### Technologies
- SwiftUI (UI)
- MapKit (map rendering)
- CoreLocation (GPS tracking)

### Core Modules
- Location tracking
- Path recording
- Polygon detection
- Territory storage
- Map rendering

### Data Strategy
- Local-first (no backend)
- All gameplay data stored on-device

---

## 6. Build Order (Strict)

Development must follow this sequence:

1. Project setup + architecture
2. Map view rendering
3. GPS location tracking
4. Path/trail drawing
5. Closed loop detection
6. Polygon rendering (territory overlay)

Only after all above are working:
7. Optional: simple drone system

---

## 7. Optional Feature (Post-MVP)

### AI Drones (Simple Expansion Pressure)

- Territories slowly expand over time
- Expansion is predictable and local (adjacent only)
- No complex AI or real-time behaviour

Purpose:
- Add light pressure
- Encourage continued exploration
- Maintain a calm, non-competitive experience

---

## 8. Design Principles

- Keep it simple
- One core mechanic only
- Visual feedback over complex systems
- Calm, low-stress experience
- Real-world movement is the only input
- Avoid feature creep

---

## 9. Explicitly Out of Scope (MVP)

The following are NOT included in Version 1:

- Multiplayer
- Accounts or authentication
- Leaderboards
- Monetisation
- Backend infrastructure
- Complex AI systems
- Clue systems or challenges

These may be considered in future versions, but are intentionally excluded from the MVP.

---

## 10. Success Criteria (MVP)

The MVP is successful if:

- A user can walk and see their path drawn on the map
- A closed loop correctly creates a captured area
- The captured area displays clearly on the map
- The experience feels intuitive and satisfying
- The app runs reliably without crashes

---

## 11. Future Direction (Not for MVP)

Potential future expansions:

- Drone mode (fully implemented)
- Territory contesting mechanics
- Clue-based exploration layer
- Seasonal resets or leagues
- Multiplayer or social features

These are intentionally deferred until the core mechanic is proven.