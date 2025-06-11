# 2025-rest-foods-backend-team-4

## REST-Foods Backend API Dokumentation

Dieses Dokument beschreibt den API-Vertrag für die REST-Foods Webapplikation.

- **Version:** 1.0
- **Basis-URL:** `/api/v1`
- **Admin-Auth:** Für alle `/admin` Routen muss der HTTP-Header `X-Admin-Secret: eiscreme-fuer-alle` gesendet werden.

---

### 1. Öffentliche Endpunkte

#### Menükarte

- **`GET /menu-items`**
  - Holt alle Menüeinträge, sortiert mit "Chefs Choice" zuoberst.
  - **Query (optional):** `?category=` (Werte: `VORSPEISE`, `HAUPTGANG`, `DESSERT`, `GETRAENKE`)
  - **Antwort `200 OK`:** `[ MenuItem, ... ]`

- **`GET /menu-items/{id}`**
  - Holt einen einzelnen Menüeintrag.
  - **Antwort `200 OK`:** `MenuItem`

#### Reservationen

- **`GET /reservations/available-tables`**
  - Findet verfügbare Tische.
  - **Query (erforderlich):** `?dateTime={ISO_STRING}&people={anzahl}`
  - **Antwort `200 OK`:** `[ RestaurantTable, ... ]`

- **`POST /reservations`**
  - Erstellt eine neue Reservation. Die Dauer ist fix auf 2 Stunden festgelegt (wird vom Backend gesetzt).
  - **Body:** `ReservationRequest`
  - **Antwort `201 Created`:** `Reservation` (das vollständige Objekt)

---

### 2. Admin Endpunkte (`/admin/*`)

#### Menüverwaltung

- `POST /admin/menu-items`
- `PUT /admin/menu-items/{id}`
- `DELETE /admin/menu-items/{id}`

#### Reservationsverwaltung

- `GET /admin/reservations` (Optionaler Query: `?date=YYYY-MM-DD`)
- `PUT /admin/reservations/{id}`
- `DELETE /admin/reservations/{id}`

---

### 3. Datenmodelle

#### `MenuItem`
```json
{
  "id": 1,
  "name": "Rindsfilet",
  "description": "Zartes Rindsfilet mit saisonalem Gemüse.",
  "price": 45.00,
  "category": "HAUPTGANG",
  "isChefsChoice": false,
  "imageUrl": "https://example.com/images/filet.jpg"
}
```
#### `Reservation (Vollständiges Objekt vom Server zurückgegeben)`
```json
{
  "id": 101,
  "table": { "id": 1, "tableNumber": 1, "capacity": 4 },
  "contactPerson": "Max Mustermann",
  "phoneNumber": "0791234567",
  "numberOfPeople": 4,
  "reservationStart": "2025-06-21T19:00:00",
  "reservationEnd": "2025-06-21T21:00:00"
}
```
#### `ReservationRequest (Vom Client gesendet)`
```json
{
  "tableId": 1,
  "contactPerson": "Max Mustermann",
  "phoneNumber": "0791234567",
  "numberOfPeople": 4,
  "reservationStart": "2025-06-21T19:00:00"
}
```
#### `RestaurantTable`
```json
{
  "id": 1,
  "tableNumber": 1,
  "capacity": 4
}
```