package ch.noseryoung.restfood.exception;

public class TableUnavailableException extends RuntimeException {
    public TableUnavailableException(String message) {
        super(message);
    }
}
