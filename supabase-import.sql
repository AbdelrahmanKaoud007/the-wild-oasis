-- ==========================================
-- SCRIPT TO IMPORT ALL JONAS DATA INTO SUPABASE
-- Run this script in the Supabase SQL Editor:
-- Dashboard -> SQL Editor -> New Query -> Paste & Click RUN
-- ==========================================

-- 1. Fix column name in settings if misspelled
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'settings' AND column_name = 'maxGeustsPerBooking'
  ) THEN
    ALTER TABLE settings RENAME COLUMN "maxGeustsPerBooking" TO "maxGuestsPerBooking";
  END IF;
END $$;

-- 2. Ensure RLS Policies allow read/write
ALTER TABLE IF EXISTS cabins ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS bookings ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS guests ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS settings ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow all cabins" ON cabins;
CREATE POLICY "Allow all cabins" ON cabins FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow all bookings" ON bookings;
CREATE POLICY "Allow all bookings" ON bookings FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow all guests" ON guests;
CREATE POLICY "Allow all guests" ON guests FOR ALL USING (true) WITH CHECK (true);

DROP POLICY IF EXISTS "Allow all settings" ON settings;
CREATE POLICY "Allow all settings" ON settings FOR ALL USING (true) WITH CHECK (true);

-- 3. Clear existing table rows in correct order (foreign keys first)
DELETE FROM bookings;
DELETE FROM guests;
DELETE FROM cabins;
DELETE FROM settings;

-- 4. Insert Settings
INSERT INTO settings (id, "minBookingLength", "maxBookingLength", "maxGuestsPerBooking", "breakfastPrice")
VALUES (1, 3, 90, 8, 15);

-- 5. Insert Cabins
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (1, '001', 2, 250, 0, 'Discover the ultimate luxury getaway for couples in the cozy wooden cabin 001. Nestled in a picturesque forest, this stunning cabin offers a secluded and intimate retreat. Inside, enjoy modern high-quality wood interiors, a comfortable seating area, a fireplace and a fully-equipped kitchen. The plush king-size bed, dressed in fine linens guarantees a peaceful nights sleep. Relax in the spa-like shower and unwind on the private deck with hot tub.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-001.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (2, '002', 2, 350, 25, 'Escape to the serenity of nature and indulge in luxury in our cozy cabin 002. Perfect for couples, this cabin offers a secluded and intimate retreat in the heart of a picturesque forest. Inside, you will find warm and inviting interiors crafted from high-quality wood, a comfortable living area, a fireplace and a fully-equipped kitchen. The luxurious bedroom features a plush king-size bed and spa-like shower. Relax on the private deck with hot tub and take in the beauty of nature.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-002.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (3, '003', 4, 300, 0, 'Experience luxury family living in our medium-sized wooden cabin 003. Perfect for families of up to 4 people, this cabin offers a comfortable and inviting space with all modern amenities. Inside, you will find warm and inviting interiors crafted from high-quality wood, a comfortable living area, a fireplace, and a fully-equipped kitchen. The bedrooms feature plush beds and spa-like bathrooms. The cabin has a private deck with a hot tub and outdoor seating area, perfect for taking in the natural surroundings.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-003.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (4, '004', 4, 500, 50, 'Indulge in the ultimate luxury family vacation in this medium-sized cabin 004. Designed for families of up to 4, this cabin offers a sumptuous retreat for the discerning traveler. Inside, the cabin boasts of opulent interiors crafted from the finest quality wood, a comfortable living area, a fireplace, and a fully-equipped gourmet kitchen. The bedrooms are adorned with plush beds and spa-inspired en-suite bathrooms. Step outside to your private deck and soak in the natural surroundings while relaxing in your own hot tub.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-004.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (5, '005', 6, 350, 0, 'Enjoy a comfortable and cozy getaway with your group or family in our spacious cabin 005. Designed to accommodate up to 6 people, this cabin offers a secluded retreat in the heart of nature. Inside, the cabin features warm and inviting interiors crafted from quality wood, a living area with fireplace, and a fully-equipped kitchen. The bedrooms are comfortable and equipped with en-suite bathrooms. Step outside to your private deck and take in the natural surroundings while relaxing in your own hot tub.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-005.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (6, '006', 6, 800, 100, 'Experience the epitome of luxury with your group or family in our spacious wooden cabin 006. Designed to comfortably accommodate up to 6 people, this cabin offers a lavish retreat in the heart of nature. Inside, the cabin features opulent interiors crafted from premium wood, a grand living area with fireplace, and a fully-equipped gourmet kitchen. The bedrooms are adorned with plush beds and spa-like en-suite bathrooms. Step outside to your private deck and soak in the natural surroundings while relaxing in your own hot tub.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-006.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (7, '007', 8, 600, 100, 'Accommodate your large group or multiple families in the spacious and grand wooden cabin 007. Designed to comfortably fit up to 8 people, this cabin offers a secluded retreat in the heart of beautiful forests and mountains. Inside, the cabin features warm and inviting interiors crafted from quality wood, multiple living areas with fireplace, and a fully-equipped kitchen. The bedrooms are comfortable and equipped with en-suite bathrooms. The cabin has a private deck with a hot tub and outdoor seating area, perfect for taking in the natural surroundings.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-007.jpg');
INSERT INTO cabins (id, name, "maxCapacity", "regularPrice", discount, description, image) VALUES (8, '008', 10, 1400, 0, 'Experience the epitome of luxury and grandeur with your large group or multiple families in our grand cabin 008. This cabin offers a lavish retreat that caters to all your needs and desires. The cabin features an opulent design and boasts of high-end finishes, intricate details and the finest quality wood throughout. Inside, the cabin features multiple grand living areas with fireplaces, a formal dining area, and a gourmet kitchen that is a chef''s dream. The bedrooms are designed for ultimate comfort and luxury, with plush beds and en-suite spa-inspired bathrooms. Step outside and immerse yourself in the beauty of nature from your private deck, featuring a luxurious hot tub and ample seating areas for ultimate relaxation and enjoyment.', 'https://dclaevazetcjjkrzczpc.supabase.co/storage/v1/object/public/cabin-images/cabin-008.jpg');

-- 6. Insert Guests
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (1, 'Astro', 'astro@astro.com', 'Egypt', '30012345678901', 'https://flagcdn.com/eg.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (2, 'Jonathan Smith', 'johnsmith@test.eu', 'Great Britain', '4534593454', 'https://flagcdn.com/gb.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (3, 'Jonatan Johansson', 'jonatan@example.com', 'Finland', '9374074454', 'https://flagcdn.com/fi.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (4, 'Jonas Mueller', 'jonas@example.eu', 'Germany', '1233212288', 'https://flagcdn.com/de.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (5, 'Jonas Anderson', 'anderson@example.com', 'Bolivia (Plurinational State of)', '0988520146', 'https://flagcdn.com/bo.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (6, 'Jonathan Williams', 'jowi@gmail.com', 'United States of America', '633678543', 'https://flagcdn.com/us.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (7, 'Emma Watson', 'emma@gmail.com', 'United Kingdom', '1234578901', 'https://flagcdn.com/gb.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (8, 'Mohammed Ali', 'mohammedali@yahoo.com', 'Egypt', '987543210', 'https://flagcdn.com/eg.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (9, 'Maria Rodriguez', 'maria@gmail.com', 'Spain', '1098765321', 'https://flagcdn.com/es.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (10, 'Li Mei', 'li.mei@hotmail.com', 'China', '102934756', 'https://flagcdn.com/cn.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (11, 'Khadija Ahmed', 'khadija@gmail.com', 'Sudan', '1023457890', 'https://flagcdn.com/sd.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (12, 'Gabriel Silva', 'gabriel@gmail.com', 'Brazil', '109283465', 'https://flagcdn.com/br.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (13, 'Maria Gomez', 'maria@example.com', 'Mexico', '108765421', 'https://flagcdn.com/mx.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (14, 'Ahmed Hassan', 'ahmed@gmail.com', 'Egypt', '1077777777', 'https://flagcdn.com/eg.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (15, 'John Doe', 'johndoe@gmail.com', 'United States', '3245908744', 'https://flagcdn.com/us.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (16, 'Fatima Ahmed', 'fatima@example.com', 'Pakistan', '1089999363', 'https://flagcdn.com/pk.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (17, 'David Smith', 'david@gmail.com', 'Australia', '44450960283', 'https://flagcdn.com/au.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (18, 'Marie Dupont', 'marie@gmail.com', 'France', '06934233728', 'https://flagcdn.com/fr.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (19, 'Ramesh Patel', 'ramesh@gmail.com', 'India', '9875412303', 'https://flagcdn.com/in.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (20, 'Fatimah Al-Sayed', 'fatimah@gmail.com', 'Kuwait', '0123456789', 'https://flagcdn.com/kw.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (21, 'Nina Williams', 'nina@hotmail.com', 'South Africa', '2345678901', 'https://flagcdn.com/za.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (22, 'Taro Tanaka', 'taro@gmail.com', 'Japan', '3456789012', 'https://flagcdn.com/jp.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (23, 'Abdul Rahman', 'abdul@gmail.com', 'Saudi Arabia', '4567890123', 'https://flagcdn.com/sa.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (24, 'Julie Nguyen', 'julie@gmail.com', 'Vietnam', '5678901234', 'https://flagcdn.com/vn.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (25, 'Sara Lee', 'sara@gmail.com', 'South Korea', '6789012345', 'https://flagcdn.com/kr.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (26, 'Carlos Gomez', 'carlos@yahoo.com', 'Colombia', '7890123456', 'https://flagcdn.com/co.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (27, 'Emma Brown', 'emma@gmail.com', 'Canada', '8901234567', 'https://flagcdn.com/ca.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (28, 'Juan Hernandez', 'juan@yahoo.com', 'Argentina', '4343433333', 'https://flagcdn.com/ar.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (29, 'Ibrahim Ahmed', 'ibrahim@yahoo.com', 'Nigeria', '2345678009', 'https://flagcdn.com/ng.svg');
INSERT INTO guests (id, "fullName", email, nationality, "nationalID", "countryFlag") VALUES (30, 'Mei Chen', 'mei@gmail.com', 'Taiwan', '3456117890', 'https://flagcdn.com/tw.svg');

-- 7. Insert Bookings
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-24T14:16:47.761', '2026-09-13T00:00:00.000', '2026-09-20T00:00:00.000', 7, 1, 1750, 105, 1855, 'unconfirmed', true, false, 'I have a gluten allergy and would like to request a gluten-free breakfast.', 1, 2);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-11T14:16:47.763', '2026-08-21T00:00:00.000', '2026-08-31T00:00:00.000', 10, 2, 2500, 300, 2800, 'checked-out', true, true, '', 1, 3);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-17T14:16:47.763', '2026-09-25T00:00:00.000', '2026-10-01T00:00:00.000', 6, 2, 1500, 0, 1500, 'unconfirmed', false, false, '', 1, 4);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-07-30T14:16:47.763', '2026-07-30T00:00:00.000', '2026-08-15T00:00:00.000', 16, 2, 5200, 0, 5200, 'checked-out', false, true, '', 2, 5);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-11T14:16:47.763', '2026-09-28T00:00:00.000', '2026-10-01T00:00:00.000', 3, 2, 975, 90, 1065, 'unconfirmed', true, true, '', 2, 6);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-08T14:16:47.763', '2026-10-16T00:00:00.000', '2026-10-31T00:00:00.000', 15, 2, 4875, 450, 5325, 'unconfirmed', true, false, '', 2, 7);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-07-10T14:16:47.763', '2026-08-19T00:00:00.000', '2026-08-24T00:00:00.000', 5, 4, 1500, 300, 1800, 'checked-out', true, true, '', 3, 8);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-11T14:16:47.763', '2026-09-11T00:00:00.000', '2026-09-13T00:00:00.000', 2, 3, 600, 0, 600, 'checked-in', false, true, 'We will be bringing our small dog with us', 3, 9);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-30T14:16:47.763', '2026-08-30T00:00:00.000', '2026-09-02T00:00:00.000', 3, 4, 900, 180, 1080, 'checked-out', true, true, '', 3, 10);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-14T14:16:47.763', '2026-09-09T00:00:00.000', '2026-09-21T00:00:00.000', 12, 4, 5400, 720, 6120, 'checked-in', true, true, '', 4, 11);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-12T14:16:47.763', '2026-09-25T00:00:00.000', '2026-09-30T00:00:00.000', 5, 4, 2250, 300, 2550, 'unconfirmed', true, false, '', 4, 12);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-10T14:16:47.763', '2026-10-01T00:00:00.000', '2026-10-02T00:00:00.000', 1, 1, 450, 0, 450, 'unconfirmed', false, true, '', 4, 13);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-13T14:16:47.763', '2026-09-27T00:00:00.000', '2026-10-04T00:00:00.000', 7, 5, 2450, 525, 2975, 'unconfirmed', true, false, '', 5, 14);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-07T14:16:47.763', '2026-09-07T00:00:00.000', '2026-09-09T00:00:00.000', 2, 4, 700, 120, 820, 'checked-out', true, true, '', 5, 15);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-09T14:16:47.763', '2026-09-09T00:00:00.000', '2026-09-12T00:00:00.000', 3, 6, 1050, 0, 1050, 'checked-out', false, true, '', 5, 16);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-10T14:16:47.763', '2026-09-13T00:00:00.000', '2026-09-24T00:00:00.000', 11, 6, 7700, 0, 7700, 'unconfirmed', false, true, 'We will be checking in late, around midnight. Hope that''s okay :)', 6, 17);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-28T14:16:47.763', '2026-08-28T00:00:00.000', '2026-09-04T00:00:00.000', 7, 4, 4900, 420, 5320, 'checked-out', true, true, 'I will need a rollaway bed for one of the guests', 6, 18);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-08-26T14:16:47.763', '2026-09-09T00:00:00.000', '2026-09-12T00:00:00.000', 3, 6, 2100, 270, 2370, 'checked-out', true, true, '', 6, 19);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-11T14:16:47.763', '2026-09-30T00:00:00.000', '2026-10-06T00:00:00.000', 6, 8, 3000, 0, 3000, 'unconfirmed', false, false, '', 7, 20);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-06T14:16:47.763', '2026-10-23T00:00:00.000', '2026-11-02T00:00:00.000', 10, 7, 5000, 1050, 6050, 'unconfirmed', true, true, '', 7, 21);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-07-20T14:16:47.763', '2026-10-15T00:00:00.000', '2026-10-20T00:00:00.000', 5, 6, 2500, 450, 2950, 'unconfirmed', true, true, '', 7, 22);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-05T14:16:47.763', '2026-09-08T00:00:00.000', '2026-09-13T00:00:00.000', 5, 9, 7000, 675, 7675, 'checked-in', true, true, 'My wife has a gluten allergy so I would like to request a gluten-free breakfast if possible', 8, 1);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-13T14:16:47.763', '2026-09-13T00:00:00.000', '2026-09-18T00:00:00.000', 5, 10, 7000, 750, 7750, 'unconfirmed', true, true, 'I am celebrating my anniversary, can you arrange for any special amenities or decorations?', 8, 23);
INSERT INTO bookings ("created_at", "startDate", "endDate", "numNights", "numGuests", "cabinPrice", "extrasPrice", "totalPrice", status, "hasBreakfast", "isPaid", observations, "cabinId", "guestId") VALUES ('2026-09-03T14:16:47.763', '2026-09-23T00:00:00.000', '2026-09-26T00:00:00.000', 3, 7, 4200, 0, 4200, 'unconfirmed', false, true, '', 8, 24);

-- 8. Reset identity sequences so new inserts don't conflict
SELECT setval(pg_get_serial_sequence('cabins', 'id'), coalesce(max(id), 0) + 1, false) FROM cabins;
SELECT setval(pg_get_serial_sequence('guests', 'id'), coalesce(max(id), 0) + 1, false) FROM guests;
SELECT setval(pg_get_serial_sequence('bookings', 'id'), coalesce(max(id), 0) + 1, false) FROM bookings;
