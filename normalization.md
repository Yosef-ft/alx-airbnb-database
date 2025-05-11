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

**Issue Identified:**
- `users.role` stores values like `'guest'`, `'host'`, and `'admin'`.
- The `properties` table depends on `users` where `role = 'host'`.
- This introduces a transitive dependency: `property → user → role`.

**Solution:**
- Extract roles into a separate `roles` table.
- Replace `users.role` with `users.role_id` referencing `roles.role_id`.

---

