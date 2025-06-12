package ch.noseryoung.restfood.domain.reservation.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class ReservationRequestDTO {
    @NotNull
    private Long tableId;

    @NotBlank
    private String contactPerson;

    @NotBlank

    private String phoneNumber;

    @Min(1)
    private int numberOfPeople;

    @NotNull
    @Future // Die Reservation muss in der Zukunft liegen
    private LocalDateTime reservationStart;
}