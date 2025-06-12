package ch.noseryoung.restfood.domain.reservation;

import ch.noseryoung.restfood.domain.reservation.dto.ReservationRequestDTO;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final RestaurantTableRepository tableRepository;
    private static final int RESERVATION_DURATION_HOURS = 2;

    public List<RestaurantTable> getAvailableTables(LocalDateTime desiredTime, int numberOfPeople) {
        List<RestaurantTable> suitableTables = tableRepository.findByCapacityGreaterThanEqual(numberOfPeople);
        LocalDateTime startTime = desiredTime;
        LocalDateTime endTime = desiredTime.plusHours(RESERVATION_DURATION_HOURS);

        return suitableTables.stream()
                .filter(table -> {
                    List<Reservation> conflictingReservations = reservationRepository.findReservationsForTableInTimespan(table.getId(), startTime, endTime);
                    return conflictingReservations.isEmpty();
                })
                .collect(Collectors.toList());
    }

    @Transactional
    public Reservation createReservation(Reservation newReservation) {
        List<RestaurantTable> availableTables = getAvailableTables(newReservation.getReservationStart(), newReservation.getNumberOfPeople());
        boolean isTableAvailable = availableTables.stream().anyMatch(table -> table.getId().equals(newReservation.getTable().getId()));

        if (!isTableAvailable) {
            throw new IllegalStateException("Der gewählte Tisch ist zu dieser Zeit nicht mehr verfügbar.");
        }

        newReservation.setReservationEnd(newReservation.getReservationStart().plusHours(RESERVATION_DURATION_HOURS));

        return reservationRepository.save(newReservation);
    }

    public List<Reservation> getReservationsByDate(LocalDate date) {
        if (date == null) {
            return reservationRepository.findAll();
        } else {
            LocalDateTime startOfDay = date.atStartOfDay();
            LocalDateTime endOfDay = date.atTime(23, 59, 59);
            return reservationRepository.findByReservationStartBetween(startOfDay, endOfDay);
        }
    }

    @Transactional
    public Reservation updateReservation(Long reservationId, ReservationRequestDTO dto) {
        Reservation existingReservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new EntityNotFoundException("Reservation mit ID " + reservationId + " nicht gefunden."));

        RestaurantTable table = tableRepository.findById(dto.getTableId())
                .orElseThrow(() -> new EntityNotFoundException("Tisch mit ID " + dto.getTableId() + " nicht gefunden."));

        existingReservation.setContactPerson(dto.getContactPerson());
        existingReservation.setPhoneNumber(dto.getPhoneNumber());
        existingReservation.setNumberOfPeople(dto.getNumberOfPeople());
        existingReservation.setReservationStart(dto.getReservationStart());
        existingReservation.setReservationEnd(dto.getReservationStart().plusHours(RESERVATION_DURATION_HOURS));
        existingReservation.setTable(table);

        return reservationRepository.save(existingReservation);
    }

    public void deleteReservation(Long id) {
        if (!reservationRepository.existsById(id)) {
            throw new EntityNotFoundException("Reservation mit ID " + id + " nicht gefunden.");
        }
        reservationRepository.deleteById(id);
    }
}