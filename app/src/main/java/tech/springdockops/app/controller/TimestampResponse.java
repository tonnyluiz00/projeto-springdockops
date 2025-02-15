package tech.springdockops.app.controller;

import java.time.Instant;

public record TimestampResponse(Instant requestDateTime) {
}