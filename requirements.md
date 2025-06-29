# Database Requirements - Airbnb Clone

This document outlines the database schema requirements and the entity-relationship model for the Airbnb clone project.

---

## Entity-Relationship Diagram

![ER Diagram](./airbnb_erd_fixed.png)

---

## Entities and Attributes

### 1. User
- **user_id**: UUID, Primary Key, Indexed
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM (`guest`, `host`, `admin`), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 2. Property
- **property_id**: UUID, Primary Key, Indexed
- **host_id**: UUID, Foreign Key → User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### 3. Booking
- **booking_id**: UUID, Primary Key, Indexed
- **property_id**: UUID, Foreign Key → Property(property_id)
- **user_id**: UUID, Foreign Key → User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### 4. Payment
- **payment_id**: UUID, Primary Key, Indexed
- **booking_id**: UUID, Foreign Key → Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

### 5. Review
- **review_id**: UUID, Primary Key, Indexed
- **property_id**: UUID, Foreign Key → Property(property_id)
- **user_id**: UUID, Foreign Ke**_**

