// package com.huutruong.moneypro.Controllers.Addon;

// import java.util.ArrayList;
// import java.util.Date;
// import java.util.LinkedHashMap;
// import java.util.List;
// import java.util.Map;

// import org.springframework.http.HttpHeaders;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.validation.FieldError;
// import org.springframework.web.bind.MethodArgumentNotValidException;
// import org.springframework.web.bind.annotation.ControllerAdvice;
// import org.springframework.web.context.request.WebRequest;
// import
// org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

// @ControllerAdvice
// public class CustomExeption extends ResponseEntityExceptionHandler {
// @Override
// protected ResponseEntity<Object>
// handleMethodNotValid(MethodArgumentNotValidException ex, HttpHeaders headers,
// HttpStatus status, WebRequest request) {
// Map<String, Object> responseBody = new LinkedHashMap<>();
// responseBody.put("timestamp", new Date());
// responseBody.put("status", status.value());

// List<FieldError> fieldErrors = ex.getBindingResult().getFieldErrors();
// List<String> listErrors = new ArrayList<>();
// for (FieldError fieldError : fieldErrors) {
// String error = fieldError.getDefaultMessage();
// listErrors.add(error);
// }
// responseBody.put("Error", listErrors);
// return new ResponseEntity<>(responseBody, headers, status);
// }
// }
