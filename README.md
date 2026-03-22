# GeoClue

A **location-based game** where players use real-world position to discover clues and progress. This repository is set up with a simple **frontend + backend** split so you can grow each part independently.

## Project structure

```
GeoClue/
├── README.md          ← You are here — overview of the whole project
├── frontend/          ← Player-facing app (map, UI, location on the device)
│   ├── README.md      ← What the frontend is for
│   └── src/
│       └── main.js    ← Placeholder: will bootstrap the client app later
└── backend/           ← Server (API, game data, validation)
    ├── README.md      ← What the backend is for
    └── src/
        └── server.js  ← Placeholder: will bootstrap the server later
```

### Frontend (`frontend/`)

Runs in the browser or as a mobile/web app. It handles maps, asking for GPS permission, and displaying clues. It should **not** hold secret keys; anything sensitive belongs on the backend.

### Backend (`backend/`)

Runs on a server you control. It exposes APIs the frontend calls, keeps clue locations and answers private until the player earns them, and can verify guesses or proximity server-side.

## Next steps (when you’re ready)

1. Choose a frontend stack (e.g. Vite + React, or plain HTML/JS) and wire `frontend/src/main.js` (or replace it with your framework’s entry file).
2. Choose a backend runtime (e.g. Node with Express, or Python with FastAPI) and implement routes in `backend/src/`.
3. Add a single API contract (e.g. `GET /api/clues/nearby`) and call it from the frontend.

Until then, the placeholder files are intentionally empty except for comments — no game logic yet.
