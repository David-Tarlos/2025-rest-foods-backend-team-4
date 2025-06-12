package ch.noseryoung.restfood.domain.reservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {

    /**
     * Findet alle Reservationen für einen bestimmten Tisch, die sich mit einem gegebenen Zeitfenster überschneiden.
     * Eine Überschneidung liegt vor, wenn:
     * (StartA < EndeB) und (EndeA > StartB)
     */
    @Query("SELECT r FROM Reservation r WHERE r.table.id = :tableId AND r.reservationStart < :endTime AND r.reservationEnd > :startTime")
    List<Reservation> findReservationsForTableInTimespan(
            @Param("tableId") Long tableId,
            @Param("startTime") LocalDateTime startTime,
            @Param("endTime") LocalDateTime endTime
    );

    // Findet alle Reservationen, die an einem bestimmten Tag beginnen (für Admin-Dashboard)
    List<Reservation> findByReservationStartBetween(LocalDateTime startOfDay, LocalDateTime endOfDay);
}