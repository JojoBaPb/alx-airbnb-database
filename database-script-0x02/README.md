# Airbnb Clone Database Seeding

This directory contains SQL scripts to populate the Airbnb clone database with sample data for development and testing purposes.

## 📄 Files

- `seed.sql`: Contains `INSERT` statements for all core tables — users, properties, bookings, payments, reviews, and messages.

---

## 🧪 Sample Data Highlights

### Users
- 3 users: a guest, a host, and an admin.
- Unique UUIDs used for consistency with schema.

### Properties
- 2 properties listed by the host (`Bob`).

### Bookings
- 2 bookings made by the guest (`Alice`) with different statuses.

### Payments
- Payments linked to each booking using valid methods.

### Reviews
- Each booking has an associated user review.

### Messages
- Direct communication between guest and host simulating real-world usage.

---

## 🚀 How to Run

After setting up the schema using `schema.sql`, run the following command:

```bash
psql -U your_user -d your_database -f seed.sql

