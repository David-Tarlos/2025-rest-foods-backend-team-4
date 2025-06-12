package ch.noseryoung.restfood.domain.reservation;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final RestaurantTableRepository tableRepository;
    private static final int RESERVATION_DURATION_HOURS = 2;

    /**
     * Findet alle verfügbaren Tische für eine bestimmte Zeit und Personenzahl.
     */
    public List<RestaurantTable> getAvailableTables(LocalDateTime desiredTime, int numberOfPeople) {
        // 1. Finde alle Tische, die gross genug sind
        List<RestaurantTable> suitableTables = tableRepository.findByCapacityGreaterThanEqual(numberOfPeople);

        // 2. Definiere das Zeitfenster der potenziellen Reservation
        LocalDateTime startTime = desiredTime;
        LocalDateTime endTime = desiredTime.plusHours(RESERVATION_DURATION_HOURS);

        // 3. Filtere die Tische, die in diesem Zeitfenster keine Reservationen haben
        return suitableTables.stream()
                .filter(table -> {
                    List<Reservation> conflictingReservations = reservationRepository.findReservationsForTableInTimespan(table.getId(), startTime, endTime);
                    return conflictingReservations.isEmpty(); // Tisch ist frei, wenn es keine Konflikte gibt
                })
                .collect(Collectors.toList());
    }

    /**
     * Erstellt eine neue Reservation.
     */
    public Reservation createReservation(Reservation newReservation) {
        // 1. Prüfe nochmal, ob der Tisch wirklich verfügbar ist (wichtig!)
        List<RestaurantTable> availableTables = getAvailableTables(newReservation.getReservationStart(), newReservation.getNumberOfPeople());
        boolean isTableAvailable = availableTables.stream().anyMatch(table -> table.getId().equals(newReservation.getTable().getId()));

        if (!isTableAvailable) {
            throw new IllegalStateException("Der gewählte Tisch ist zu dieser Zeit nicht mehr verfügbar.");
        }

        // 2. Setze die Endzeit der Reservation
        newReservation.setReservationEnd(newReservation.getReservationStart().plusHours(RESERVATION_DURATION_HOURS));

        // 3. Speichere die Reservation
        return reservationRepository.save(newReservation);
    }

    /**
     * Holt alle Reservationen (für Admin).
     */
    public List<Reservation> getAllReservations() {
        return reservationRepository.findAll();
    }

    /**
     * Löscht eine Reservation (für Admin).
     */
    public void deleteReservation(Long id) {
        if (!reservationRepository.existsById(id)) {
            throw new EntityNotFoundException("Reservation mit ID " + id + " nicht gefunden.");
        }
        reservationRepository.deleteById(id);
    }
}