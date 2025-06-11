-- VORSPEISE
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('38186d4b-4853-440f-b83d-811ab8fbdf1c', 'Bruschetta', 'Grilled bread rubbed with garlic and topped with fresh tomato and basil.', 5.80, 'VORSPEISE', false, 'https://example.com/bruschetta.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('bbff566a-833e-4047-b1ec-a630a0647acf', 'Pumpkin Soup', 'Creamy pumpkin soup with roasted seeds and a hint of nutmeg.', 6.20, 'VORSPEISE', true, 'https://example.com/pumpkinsoup.jpg');

-- HAUPTGANG
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('d02b9436-69ea-4836-8612-458f047279ee', 'Grilled Salmon', 'Salmon fillet served with lemon butter sauce and seasonal vegetables.', 14.90, 'HAUPTGANG', false, 'https://example.com/salmon.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('349a8230-b558-426e-99eb-04386ccf82e2', 'Vegan Buddha Bowl', 'Quinoa, chickpeas, avocado, and roasted vegetables with tahini dressing.', 11.50, 'HAUPTGANG', false, 'https://example.com/buddhabowl.jpg');

-- DESSERT
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('6d447771-9fe1-488f-b309-677d9e659d5b', 'Tiramisu', 'Classic Italian dessert with mascarpone and espresso-soaked ladyfingers.', 5.90, 'DESSERT', true, 'https://example.com/tiramisu.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('6ebc66fd-44df-4c9d-904a-18c42009bccb', 'Lemon Tart', 'Zesty lemon filling in a buttery crust, topped with fresh berries.', 4.80, 'DESSERT', false, 'https://example.com/lemontart.jpg');

-- GETRÄNKE
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('62be7899-1f48-47c7-8d80-4cde71194ad1', 'Elderflower Spritz', 'Refreshing soda with elderflower syrup and mint.', 3.90, 'GETRAENKE', false, 'https://example.com/elderflower.jpg');

INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url)
VALUES ('a960dfeb-4afa-413f-8295-96918e8ece37', 'Espresso', 'Strong and rich single-shot Italian espresso.', 2.50, 'GETRAENKE', true, 'https://example.com/espresso.jpg');
