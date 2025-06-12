INSERT INTO restaurant_table (table_number, capacity) VALUES
                                                          (1, 2),  -- Tisch Nr. 1 für 2 Personen
                                                          (2, 2),  -- Tisch Nr. 2 für 2 Personen
                                                          (3, 2),  -- Tisch Nr. 3 für 2 Personen
                                                          (4, 4),  -- Tisch Nr. 4 für 4 Personen
                                                          (5, 4),  -- Tisch Nr. 5 für 4 Personen
                                                          (6, 4),  -- Tisch Nr. 6 für 4 Personen
                                                          (7, 4),  -- Tisch Nr. 7 für 4 Personen
                                                          (8, 6),  -- Tisch Nr. 8 für 6 Personen
                                                          (9, 6),  -- Tisch Nr. 9 für 6 Personen
                                                          (10, 8); -- Tisch Nr. 10, der grosse Tisch für 8 Personen

-- Reservation 1: Ein Paar reserviert einen kleinen Tisch am Abend.
INSERT INTO reservation (table_id, contact_person, phone_number, number_of_people, reservation_start, reservation_end) VALUES
    (1, 'Anna Schmidt', '079 111 22 33', 2, '2025-06-18 19:00:00', '2025-06-18 21:00:00');

-- Reservation 2: Eine Familie reserviert einen mittleren Tisch etwas später.
INSERT INTO reservation (table_id, contact_person, phone_number, number_of_people, reservation_start, reservation_end) VALUES
    (5, 'Familie Meier', '078 444 55 66', 4, '2025-06-18 19:30:00', '2025-06-18 21:30:00');

-- Reservation 3: Eine Gruppe reserviert den grossen Tisch.
INSERT INTO reservation (table_id, contact_person, phone_number, number_of_people, reservation_start, reservation_end) VALUES
    (10, 'Lukas Huber', '077 777 88 99', 8, '2025-06-18 20:00:00', '2025-06-18 22:00:00');

-- Reservation 4: Eine Reservation für einen komplett anderen Tag, um die Datumsfilterung zu testen.
INSERT INTO reservation (table_id, contact_person, phone_number, number_of_people, reservation_start, reservation_end) VALUES
    (4, 'Julia Weber', '076 123 45 67', 3, '2025-06-19 18:00:00', '2025-06-19 20:00:00');