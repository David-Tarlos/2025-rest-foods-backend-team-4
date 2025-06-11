INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES (gen_random_uuid(), 'Caprese Salad', 'Fresh tomatoes, mozzarella, and basil drizzled with balsamic glaze.', 6.50, 'VORSPEISE', false, 'https://example.com/caprese.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES (gen_random_uuid(), 'Spaghetti Carbonara', 'Classic pasta with pancetta, eggs, and parmesan.', 12.90, 'HAUPTGANG', true, 'https://example.com/carbonara.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES (gen_random_uuid(), 'Chocolate Lava Cake', 'Warm cake with gooey chocolate center.', 5.40, 'DESSERT', false, 'https://example.com/lavacake.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES (gen_random_uuid(), 'Iced Matcha Latte', 'Chilled green tea with creamy milk.', 4.20, 'GETRAENKE', false, 'https://example.com/matcha.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES (gen_random_uuid(), 'Beef Wellington', 'Filet steak coated with pâté and duxelles, wrapped in puff pastry.', 18.99, 'HAUPTGANG', true, 'https://example.com/wellington.jpg');
