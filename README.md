# Ecommerce-Prithi295

Full-stack e-commerce web application developed as part of academic project (YourNameMart style).

## Features Implemented

### Core Features (F1 – F8)
- **F1** User Registration & Login (Buyer / Seller roles + seeded Admin)
- **F2** Seller product management (create / view products)
- **F3** Buyer product browsing with keyword search and category filter
- **F4** Session-based shopping cart with running total
- **F5** Checkout with mock payment confirmation
- **F6** Order history (Buyer) and incoming orders (Seller)
- **F7** Admin panel – view users and moderate listings
- **F8** Product reviews and star ratings
- **O4** AI Chatbot (mock FAQ-based support)

### Technical Highlights
- Java 17 + Maven + Servlets + JSP
- JDBC with PreparedStatement (SQL injection safe)
- BCrypt password hashing
- Session management + AuthFilter
- H2 in-memory database
- DAO → Service → Servlet layered architecture
- Design patterns used: DAO, Front Controller, Singleton (DatabaseManager)

## Project Structure
src/
├── main/
│   ├── java/com/ecommerce/
│   │   ├── dao/
│   │   ├── model/
│   │   ├── service/
│   │   ├── servlet/
│   │   ├── filter/
│   │   └── util/
│   └── webapp/
│       ├── WEB-INF/
│       └── *.jsp
└── test/


## How to Run (Local)
1. Install Java 17 and Maven
2. `mvn clean package`
3. Deploy the generated WAR on Tomcat 9+
4. Access: `http://localhost:8080/ecommerce-prithi295`

## Database
- H2 Database
- Schema and seed data available in `schema.sql` and `seed.sql`
- Default Admin account is seeded (no public signup for Admin)

## Commit History
Maintained regular commits throughout development following weekly milestones.

## Latest Updates (Sep 2026)
- Added Order history (F6)
- Added basic Admin panel (F7)
- Added Review support (F8)
- Expanded database schema
- Added security checklist and improved documentation
- Added Mock AI Chatbot (O4)

## Author
Prithiyanka
