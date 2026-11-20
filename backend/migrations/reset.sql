/* =========================================================
   DANKWARAI
   COMPLETE DATABASE RESET
   KEEP ONLY SUPER ADMIN ID = 2
   ========================================================= */

/* Disable foreign-key restrictions temporarily */
SET FOREIGN_KEY_CHECKS = 0;

/* =========================================================
   CLEAR MARKETPLACE / TRANSACTION DATA
   ========================================================= */

DELETE FROM support_messages;
DELETE FROM support_conversations;

DELETE FROM refund_logs;

DELETE FROM payment_logs;
DELETE FROM payments;

DELETE FROM withdrawal_items;
DELETE FROM withdrawals;

DELETE FROM earnings;

DELETE FROM order_items;
DELETE FROM orders;

DELETE FROM cart;

DELETE FROM notifications;

DELETE FROM products;

/* =========================================================
   CLEAR ADMIN / VENDOR APPLICATION DATA
   ========================================================= */

DELETE FROM admin_invitations;
DELETE FROM admin_requests;

/* =========================================================
   DELETE ALL USERS EXCEPT THE SUPER ADMIN
   Super Admin:
   ID = 2
   Name = 0598116251
   ========================================================= */

DELETE FROM users
WHERE id <> 2;

/* =========================================================
   RESET SUPER ADMIN'S VENDOR INFORMATION
   Keep the account itself.
   ========================================================= */

UPDATE users
SET
    vendor_status = 'none',
    business_name = NULL,
    business_phone = NULL,
    business_location = NULL,
    business_description = NULL,
    vendor_applied_at = NULL,
    vendor_reviewed_at = NULL,
    vendor_reviewed_by = NULL,
    vendor_rejection_reason = NULL
WHERE id = 2;

/* =========================================================
   RESET AUTO-INCREMENT COUNTERS
   ========================================================= */

ALTER TABLE users AUTO_INCREMENT = 3;

ALTER TABLE products AUTO_INCREMENT = 1;
ALTER TABLE orders AUTO_INCREMENT = 1;
ALTER TABLE order_items AUTO_INCREMENT = 1;
ALTER TABLE payments AUTO_INCREMENT = 1;
ALTER TABLE payment_logs AUTO_INCREMENT = 1;
ALTER TABLE earnings AUTO_INCREMENT = 1;
ALTER TABLE cart AUTO_INCREMENT = 1;
ALTER TABLE notifications AUTO_INCREMENT = 1;
ALTER TABLE admin_requests AUTO_INCREMENT = 1;
ALTER TABLE admin_invitations AUTO_INCREMENT = 1;
ALTER TABLE refund_logs AUTO_INCREMENT = 1;
ALTER TABLE support_conversations AUTO_INCREMENT = 1;
ALTER TABLE support_messages AUTO_INCREMENT = 1;
ALTER TABLE withdrawals AUTO_INCREMENT = 1;
ALTER TABLE withdrawal_items AUTO_INCREMENT = 1;

/* =========================================================
   RESTORE FOREIGN-KEY PROTECTION
   ========================================================= */

SET FOREIGN_KEY_CHECKS = 1;

/* =========================================================
   VERIFY SUPER ADMIN
   ========================================================= */

SELECT
    id,
    name,
    email,
    pi_username,
    role,
    status,
    admin_level,
    vendor_status
FROM users;



SELECT COUNT(*) AS total_users FROM users;


SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;
SELECT COUNT(*) AS total_payments FROM payments;
SELECT COUNT(*) AS total_earnings FROM earnings;
SELECT COUNT(*) AS total_cart FROM cart;
SELECT COUNT(*) AS total_notifications FROM notifications;
SELECT COUNT(*) AS total_admin_requests FROM admin_requests;
SELECT COUNT(*) AS total_admin_invitations FROM admin_invitations;
SELECT COUNT(*) AS total_refunds FROM refund_logs;
SELECT COUNT(*) AS total_conversations FROM support_conversations;
SELECT COUNT(*) AS total_messages FROM support_messages;
SELECT COUNT(*) AS total_withdrawals FROM withdrawals;
SELECT COUNT(*) AS total_withdrawal_items FROM withdrawal_items;