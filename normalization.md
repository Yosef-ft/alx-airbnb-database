# Database Normalization to Third Normal Form (3NF)

## Objective

To ensure the Airbnb database schema satisfies 3NF by eliminating redundant data, ensuring all attributes are atomic, and removing transitive dependencies.

---

## Step-by-Step Normalization

### First Normal Form (1NF)
- All tables have atomic (indivisible) values.
- No repeating groups or arrays.
-  Status: Satisfied.

---

### Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on the whole primary key.
- As all primary keys are single-column UUIDs, this condition is inherently satisfied.
-  Status: Satisfied.

---

### Third Normal Form (3NF) — Review
- There are no transitive dependencies. Non-key attributes depend only on the primary key, and foreign keys reference primary keys of other tables.
- status: Satisfied
---

