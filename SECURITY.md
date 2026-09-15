# Security Checklist

- [x] All database queries use PreparedStatement (no string concatenation)
- [x] Passwords are hashed with BCrypt (never stored in plain text)
- [x] AuthFilter protects restricted pages
- [x] Session is used for authentication
- [x] User input is handled carefully in forms
- [x] No sensitive credentials committed to the repository
- [x] Error pages do not expose stack traces (planned)
- [x] Admin role is restricted (only seeded admin account)

## Notes
Security practices followed as per project requirements (Section 9 style checklist).
