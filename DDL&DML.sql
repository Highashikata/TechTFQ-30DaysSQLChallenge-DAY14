-- Drop the table if it exists
DROP TABLE IF EXISTS InvoiceTable;

-- Create the table
CREATE TABLE InvoiceTable (
    SERIAL_NO INT PRIMARY KEY,
    INVOICE_DATE DATE
);

-- Insert data into the table
INSERT INTO InvoiceTable (SERIAL_NO, INVOICE_DATE) VALUES
(330115, '2024-03-01'),
(330120, '2024-03-01'),
(330121, '2024-03-01'),
(330122, '2024-03-02'),
(330125, '2024-03-02');
