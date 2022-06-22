package myCloset.restfullApi.exception;

public class MemberIdDoesNotMatchException extends RuntimeException{
    public MemberIdDoesNotMatchException(String message) {
        super(message);
    }
}
