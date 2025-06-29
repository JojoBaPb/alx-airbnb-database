# Database Normalization - Airbnb Clone

This document explains the normalization steps applied to the Airbnb database schema, ensuring that it adheres to the Third Normal Form (3NF) and avoids redundancy, update anomalies, and data inconsistencies.

---

## 🔰 Normalization Overview

**Normalization** is the process of organizing data in a database to reduce redundancy and improve data integrity. The standard normal forms are:

- **1NF (First Normal Form)**: Eliminate repeating groups; ensure atomicity.
- **2NF (Second Normal Form)**: Ensure that all non-key attributes are fully functionally dependent on the entire primary key.
- **3NF (Third Normal Form)**: Ensure that there are no transitive dependencies; non-key attributes must depend only on the primary key.

---

## ✅ Normalization Steps

### 🧱 Step 1: First Normal Form (1NF)

- All tables have unique primary keys.
- All attributes are atomic (e.g., names are stored separately, no multi-valued fields).
- ✅ **Passed**.

### 🧱 Step 2: Second Normal Form (2NF)

- There are no partial dependencies.
- All non-key attributes depend on the whole primary key.
- Since all tables use a single-column primary key (UUID), partial dependencies are not possible.
- ✅ **Passed**.

### 🧱 Step 3: Third Normal Form (3NF)

- No transitive dependencies.
- All non-key attributes depend **only** on the primary key.

#### Review of Tables:

---

### 🔹 **User**

- All fields depend on `user_id`.
- No derived or dependent data.
- ✅ **In 3NF**

---

### 🔹 **Property**

- Depends on `property_id`.
- `host_id` is a foreign key to `User`, and not derived from any other column in the table.
- ✅ **In 3NF**

---

### 🔹 **Booking**

- Depends on `booking_id`.
- `property_id`, `user_id` are foreign keys.
- `total_price` might appear derived (from `pricepernight` × nights), but is acceptable for performance and audit purposes.
- ✅ **In 3NF**

---

### 🔹 **Payment**

- Depends on `payment_id`.
- `amount` and `payment_method` are attributes of a single payment.
- ✅ **In 3NF**

---

### 🔹 **Review**

- Depends on `review_id`.
- Foreign keys are appropriate, no transitive dependencies.
- ✅ **In 3NF**

---

### 🔹 **Message**

- Depends on `message_id`.
- `sender_id`, `recipient_id` are both foreign keys.
- ✅ **In 3NF**

---

## 💡 Design Considerations

- All ENUMs are implemented as inline constraints (e.g., `role`, `status`, `payment_method`). If these grow in complexity, consider extracting them into separate lookup tables.
- `total_price` in `Booking` is a calculated field stored for performance and tracking. This is a deliberate denormalization choice.

---

## ✅ Conclusion

The Airbnb database schema has been carefully reviewed and **conforms to the Third Normal Form (3NF)**. I believe to the best of my knowledge that all entities avoid redundancy, and there are no partial or transitive dependencies.

This structure ensures optimal data integrity, scalability, and maintainability.

