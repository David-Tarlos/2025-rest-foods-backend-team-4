package ch.noseryoung.restfood.exception;

import io.swagger.v3.oas.annotations.Hidden;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Hidden
@ControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Object> handleAllExceptions(Exception ex, WebRequest request) {
        logger.error("Unhandled exception", ex);
        return buildResponse(HttpStatus.INTERNAL_SERVER_ERROR, "Ein unerwarteter Fehler ist aufgetreten.", ex.getMessage());
    }

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<Object> handleEntityNotFound(EntityNotFoundException ex) {
        return buildResponse(HttpStatus.NOT_FOUND, "Die angeforderte Ressource wurde nicht gefunden.", ex.getMessage());
    }

    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public ResponseEntity<Object> handleTypeMismatch(MethodArgumentTypeMismatchException ex) {
        String paramName = ex.getName();
        String invalidValue = String.valueOf(ex.getValue());
        String message = String.format("Parameter '%s' ist ungültig: '%s'", paramName, invalidValue);
        return buildResponse(HttpStatus.BAD_REQUEST, "Ungültiger Parameter", message);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Object> handleValidationErrors(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        for (FieldError fieldError : ex.getBindingResult().getFieldErrors()) {
            errors.put(fieldError.getField(), fieldError.getDefaultMessage());
        }

        Map<String, Object> body = new HashMap<>();
        body.put("timestamp", LocalDateTime.now());
        body.put("status", HttpStatus.BAD_REQUEST.value());
        body.put("error", "Validierungsfehler");
        body.put("details", errors);

        return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
    }




    @ExceptionHandler(NoHandlerFoundException.class)
    public ResponseEntity<Object> handleNoHandlerFound(NoHandlerFoundException ex, WebRequest request) {
        String requestUrl = ex.getRequestURL();

        // Liste aller Swagger-relevanten Pfade
        boolean isSwaggerRequest = Arrays.asList(
                "/swagger-ui",
                "/v3/api-docs",
                "/swagger-resources",
                "/webjars",
                "/favicon.ico"
        ).stream().anyMatch(requestUrl::contains);

        if (isSwaggerRequest) {
            // Für Swagger: Standard-404 ohne Body (Swagger erwartet das)
            return ResponseEntity.notFound().build();
        }

        // Standard-Error-Response für deine API
        return buildResponse(
                HttpStatus.NOT_FOUND,
                "Resource Not Found",
                "Die angeforderte Ressource '" + requestUrl + "' wurde nicht gefunden"
        );
    }

    @ExceptionHandler(TableUnavailableException.class)
    public ResponseEntity<Object> handleTableUnavailable(TableUnavailableException ex) {
        return buildResponse(HttpStatus.CONFLICT, "Reservierungskonflikt", ex.getMessage());
    }

    private ResponseEntity<Object> buildResponse(HttpStatus status, String error, String details) {
        Map<String, Object> body = new HashMap<>();
        body.put("timestamp", LocalDateTime.now());
        body.put("status", status.value());
        body.put("error", error);
        body.put("details", details);
        return new ResponseEntity<>(body, status);
    }
}
