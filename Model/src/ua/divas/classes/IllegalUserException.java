package ua.divas.classes;

public class IllegalUserException extends Exception {
    @SuppressWarnings("compatibility:3562862433749181993")
    private static final long serialVersionUID = 1L;

    public IllegalUserException(String message) {
        super(message);
    }

    public IllegalUserException(String message, Throwable throwable) {
        super(message, throwable);
    }
}
