# library_management_system
Library Management System (LMS) Database
This project implements a Library Management System (LMS) database using SQL. The database is designed to streamline library operations by managing books, borrowers, publishers, library branches, and loan transactions efficiently. The schema ensures data consistency, scalability, and ease of maintenance.
Features of the LMS Database
Publisher Management:
Stores publisher details such as name, address, and contact information.
Ensures consistency by linking books to their respective publishers using a foreign key.
Borrower Management:
Tracks borrower details, including an auto-generated unique card number, name, address, and contact information.
Supports efficient loan tracking through integration with the book loans table.
Library Branch Management:
Maintains information about various library branches, including branch IDs, names, and addresses.
Links book copies and loan transactions to specific branches.
Book Management:
Stores book details such as title and unique book ID.
Links books to publishers, ensuring data integrity with cascading updates and deletions.
Author Management:
Maps books to authors, supporting multiple authors per book.
Provides flexibility to associate authors with their respective works through a foreign key.
Inventory Tracking:
Tracks the number of copies of each book available at different library branches.
Ensures accurate inventory management with cascading updates for book or branch changes.
Loan Management:
Records book loans with details such as loan ID, borrower card number, branch ID, loan dates, and due dates.
Ensures data consistency by linking loans to books, borrowers, and branches using foreign keys.
Key Design Principles
Normalization:
The database is normalized to reduce redundancy and ensure efficient data storage and retrieval.
Referential Integrity:
Foreign keys with cascading updates and deletions ensure consistency across related tables.
Scalability:
The schema supports the addition of new books, borrowers, branches, and transactions without structural changes.
Ease of Maintenance:
Auto-incremented IDs and clear relationships between tables simplify database management.
Use Case Scenarios
Tracking Book Loans:
View borrowing history and current loans for any borrower.
Managing Inventory:
Monitor available copies of books at each branch.
Analyzing Borrowing Patterns:
Identify popular books or high-demand library branches.
Publisher Insights:
Understand contributions of publishers to the library's collection.
Conclusion
This LMS database is a robust solution for libraries looking to manage their operations efficiently. It facilitates inventory tracking, borrower management, and seamless loan processing while ensuring data integrity and scalability for future needs.

