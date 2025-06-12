package ch.noseryoung.restfood.domain.reservation;

import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ch.noseryoung.restfood.domain.reservation.dto.ReservationRequestDTO;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/v1/reservations")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;
    private final RestaurantTableRepository tableRepository;

    // --- Öffentliche Endpunkte ---

    @GetMapping("/available-tables")
    public ResponseEntity<List<RestaurantTable>> getAvailableTables(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime dateTime,
            @RequestParam int people) {
        return ResponseEntity.ok(reservationService.getAvailableTables(dateTime, people));
    }

    @PostMapping
    public ResponseEntity<Reservation> createReservation(@Valid @RequestBody ReservationRequestDTO dto) {

        RestaurantTable table = tableRepository.findById(dto.getTableId())
                .orElseThrow(() -> new EntityNotFoundException("Tisch nicht gefunden"));

        Reservation reservation = new Reservation();
        reservation.setTable(table);
        reservation.setContactPerson(dto.getContactPerson());
        reservation.setPhoneNumber(dto.getPhoneNumber());
        reservation.setNumberOfPeople(dto.getNumberOfPeople());
        reservation.setReservationStart(dto.getReservationStart());

        Reservation createdReservation = reservationService.createReservation(reservation);

        // Gibt Status 201 Created mit Link zur neuen Ressource zurück
        return ResponseEntity
                .created(URI.create("/api/v1/admin/reservations/" + createdReservation.getId()))
                .body(createdReservation);
    }

    // --- Admin Endpunkte ---

    @GetMapping("/admin/reservations")
    public ResponseEntity<List<Reservation>> getAllReservations() {
        return ResponseEntity.ok(reservationService.getAllReservations());
    }

    @DeleteMapping("/admin/reservations/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT) // Gibt Status 204 No Content zurück
    public void deleteReservation(@PathVariable Long id) {
        reservationService.deleteReservation(id);
    }
}