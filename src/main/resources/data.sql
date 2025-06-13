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


-- VORSPEISE (15 Items)
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url) VALUES
    ('38186d4b-4853-440f-b83d-811ab8fbdf1c', 'Bruschetta', 'Grilled bread rubbed with garlic and topped with fresh tomato and basil.', 5.80, 'VORSPEISE', false, 'https://www.sanpellegrino.com/de/sites/g/files/xknfdk2266/files/styles/open_graph_image/public/bruschetta_h_15.jpg.webp?itok=aP4Glmih'),
    ('bbff566a-833e-4047-b1ec-a630a0647acf', 'Pumpkin Soup', 'Creamy pumpkin soup with roasted seeds and a hint of nutmeg.', 6.20, 'VORSPEISE', true, 'https://freshchoice.imgix.net/assets/Recipes/Pumpkin-Soup.jpg?w=960&h=540&ch=Width,DPR&fit=crop&auto=format%2C%20compress'),
    ('e8c1234a-d234-4cbd-9a6b-3bfe5672a78a', 'Caprese Salad', 'Fresh mozzarella, ripe tomatoes, basil, olive oil, and balsamic glaze.', 7.00, 'VORSPEISE', false, 'https://www.allrecipes.com/thmb/Usj7zOLJSQ5xqw-4dwWarvPNjJg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-228126-caprese-salad-with-balsamic-reduction-ddmfs-2644-4x3-f32ac2b2fb9d4234884a752490fb015b.jpg'),
    ('f34b2eaa-7d8a-49e5-9c2f-38d5e9d71e46', 'Stuffed Mushrooms', 'Baked mushrooms stuffed with cheese, herbs, and breadcrumbs.', 6.50, 'VORSPEISE', false, 'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2023/10/Stuffed-Mushrooms-main.jpg'),
    ('9df9b98a-7a0e-4a98-99db-1a0c179c33fc', 'Garlic Prawns', 'Sautéed prawns with garlic, chili, and fresh parsley.', 8.20, 'VORSPEISE', true, 'https://cdn.thefreshmancook.com/wp-content/uploads/2024/08/Plate-of-Creamy-Garlic-Prawns-Served-with-Fresh-Garnishes-and-Accompaniments-500x500.png'),
    ('f773ef6b-0a6b-4f42-8b29-ef1c8eaed490', 'Caesar Salad', 'Crisp romaine with Caesar dressing, parmesan, and croutons.', 6.80, 'VORSPEISE', false, 'https://feelgoodfoodie.net/wp-content/uploads/2020/04/Caesar-Salad-TIMG.jpg'),
    ('af7e6f3d-788c-4b5f-8dcd-1aa36f78701f', 'Tomato Basil Soup', 'Creamy tomato soup garnished with fresh basil.', 5.90, 'VORSPEISE', false, 'https://thecozyapron.com/wp-content/uploads/2012/02/tomato-basil-soup_thecozyapron_1.jpg'),
    ('d3490a5d-3f75-4274-82e3-75879610eb4a', 'Fried Calamari', 'Golden fried calamari rings served with lemon and aioli.', 7.90, 'VORSPEISE', false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS81_LVaM2X-ZSfnuIT4YpxXOj-pLV1p7D5bQ&s'),
    ('7122f6ae-8bbd-430d-b92e-36066771d0c1', 'Greek Salad', 'Cucumber, tomato, olives, feta cheese, and red onion.', 6.50, 'VORSPEISE', false, 'https://www.foodnetwork.com/content/dam/images/food/fullset/2010/4/23/0/BX0204_greek-salad_s4x3.jpg'),
    ('7af7d2a0-b6c6-4a8d-a4b3-0d8a2f8d67f5', 'Shrimp Cocktail', 'Chilled shrimp with tangy cocktail sauce.', 8.00, 'VORSPEISE', false, 'https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/blt4ecafaa8dc8626aa/664cbddfd94e395c7e4c7cf1/shrimp-cocktail-glass.jpg?q=70&width=3840&auto=webp'),
    ('7bcb0834-4c68-49c9-9428-8d35d4a0f59f', 'Avocado Toast', 'Toasted sourdough topped with smashed avocado and chili flakes.', 5.50, 'VORSPEISE', false, 'https://www.allrecipes.com/thmb/8NccFzsaq0_OZPDKmf7Yee-aG78=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AvocadoToastwithEggFranceC4x3-bb87e3bbf1944657b7db35f1383fabdb.jpg'),
    ('3b9a4c36-4d8e-4d29-a3e0-754fe91a7b37', 'Minestrone Soup', 'Hearty vegetable soup with beans and pasta.', 6.10, 'VORSPEISE', false, 'https://images.immediate.co.uk/production/volatile/sites/30/2021/03/Classic-Minestrone-Soup-13720e5.jpg?quality=90'),
    ('91aefbc7-5a66-4b6d-9f15-9dca20d7ac19', 'Prosciutto Melon', 'Sweet melon wrapped with thinly sliced prosciutto.', 7.20, 'VORSPEISE', false, 'https://www.giangiskitchen.com/wp-content/uploads/2012/09/prosciutto21-1-of-1-scaled.jpg'),
    ('64c492ea-ff82-4bd2-85f7-533d3ccac3b3', 'Spinach Artichoke Dip', 'Warm creamy dip served with toasted bread.', 6.60, 'VORSPEISE', false, 'https://www.evolvingtable.com/wp-content/uploads/2021/12/Hot-Spinach-Artichoke-Dip-24-GWS.jpg'),
    ('cb381334-5e1d-4f33-89b7-e3eb6df1485c', 'Onion Rings', 'Crispy beer-battered onion rings.', 5.70, 'VORSPEISE', false, 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/onion-rings-10b4117.jpg'),
    ('aadf51fc-6a62-4e3f-b383-7d7a3318f446', 'Crab Cakes', 'Pan-fried crab cakes served with remoulade sauce.', 9.10, 'VORSPEISE', true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXG7sRW2aWPvP1M0an0170im_OPdRAidKaaA&s');


-- HAUPTGANG (15 Items)
-- HAUPTGANG (15 Items)
INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url) VALUES
                                                                                               ('d02b9436-69ea-4836-8612-458f047279ee', 'Grilled Salmon', 'Salmon fillet served with lemon butter sauce and seasonal vegetables.', 14.90, 'HAUPTGANG', false, 'https://www.pccmarkets.com/wp-content/uploads/2017/08/pcc-rosemary-grilled-salmon-flo.jpg'),
                                                                                               ('349a8230-b558-426e-99eb-04386ccf82e2', 'Vegan Buddha Bowl', 'Quinoa, chickpeas, avocado, and roasted vegetables with tahini dressing.', 11.50, 'HAUPTGANG', false, 'https://www.crazyvegankitchen.com/wp-content/uploads/2023/11/buddha-bowl-recipe.jpg'),
                                                                                               ('2a4fbe3d-9d8f-497b-90b1-7c1c2ec47d5f', 'Beef Stroganoff', 'Tender strips of beef in a creamy mushroom sauce, served with noodles.', 16.50, 'HAUPTGANG', true, 'https://www.mrshappyhomemaker.com/wp-content/uploads/2022/06/easy-beef-stroganoff.jpg'),
                                                                                               ('b7e19c26-7a40-4f59-9ec6-4e1b9eb7b850', 'Chicken Parmesan', 'Breaded chicken breast topped with marinara sauce and melted mozzarella.', 13.80, 'HAUPTGANG', false, 'https://preppykitchen.com/wp-content/uploads/2018/10/Chicken-Parmesan-Recipe-n.jpg'),
                                                                                               ('8a9a9d56-2a45-4f2d-8f61-93207a1f763f', 'Spaghetti Carbonara', 'Classic Italian pasta with eggs, cheese, pancetta, and pepper.', 12.90, 'HAUPTGANG', false, 'https://img.chefkoch-cdn.de/rezepte/1298241234947062/bilder/1590571/crop-960x720/carbonara-wie-bei-der-mamma-in-rom.jpg'),
                                                                                               ('ff1d34c5-e580-4646-918f-1b6fa92f20e1', 'Lamb Chops', 'Grilled lamb chops served with rosemary and garlic potatoes.', 19.50, 'HAUPTGANG', true, 'https://urbanfarmandkitchen.com/wp-content/uploads/2024/11/marinated-greek-lamb-chops-18.jpg'),
                                                                                               ('9b1e9af6-377b-4a9c-9d3a-8cc06a5c20b1', 'Seafood Paella', 'Traditional Spanish rice dish with mixed seafood and saffron.', 18.00, 'HAUPTGANG', false, 'https://simply-delicious-food.com/wp-content/uploads/2020/10/0E2A1651-3.jpg'),
                                                                                               ('ec1f32ea-f7b3-4d6d-8d90-61d0591cc1d1', 'Vegetable Stir Fry', 'Mixed vegetables stir-fried in a tangy soy sauce.', 10.50, 'HAUPTGANG', false, 'https://images.themodernproper.com/production/posts/VegetableStirFry_9.jpg?w=1200&h=1200&q=60&fm=jpg&fit=crop&dm=1703377301&s=79d95f7318643d92c30863f226d5eb8e'),
                                                                                               ('0e6f8267-d8d6-4eaf-9c9d-63a03c661d44', 'Pork Schnitzel', 'Breaded pork cutlet fried until golden, served with lemon.', 13.20, 'HAUPTGANG', false, 'https://www.slimmingeats.com/blog/wp-content/uploads/2013/02/pork-Schnitzel-11-540x720.jpg'),
                                                                                               ('34bfa2a4-80f0-4c6c-8e4d-84225a33082d', 'Vegetarian Lasagna', 'Layers of pasta with vegetables, ricotta, and marinara sauce.', 12.80, 'HAUPTGANG', false, 'https://www.simplyrecipes.com/thmb/sdTBmeRjdzbQ11qBVJfjbPU54Hs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2012__11__Vegetarian-Lasagna-LEAD-1-6173a71bfd1347aa8d7659150e87b8f4.jpg'),
                                                                                               ('bb0c0b2f-5b84-4b42-b5b4-b97f39a1a9aa', 'Duck Breast', 'Pan-seared duck breast with orange glaze and sautéed greens.', 18.90, 'HAUPTGANG', true, 'https://preview.redd.it/duck-breast-with-mushrooms-and-pearl-onions-v0-9u3qdq9otvra1.jpg?width=640&crop=smart&auto=webp&s=158f8d77aad075007037c5a4e024b09878ca6b11'),
                                                                                               ('7c1e65c1-224e-46d6-9f06-9d146c839ad4', 'Fish and Chips', 'Beer-battered cod with fries and tartar sauce.', 13.50, 'HAUPTGANG', false, 'https://www.thespruceeats.com/thmb/sdVTq0h7xZvJjPr6bE2fhh5M3NI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/SES-best-fish-and-chips-recipe-434856-hero-01-27d8b57008414972822b866609d0af9b.jpg'),
                                                                                               ('27e47665-965d-4e06-bb4b-0a0668db42c6', 'Ratatouille', 'Traditional French vegetable stew with tomato and herbs.', 11.90, 'HAUPTGANG', false, 'https://www.kikkoman.at/fileadmin/_processed_/1/8/csm_1075-recipe-page-Saffron-scented-Ratatouille_desktop_d3b870df0d.jpg'),
                                                                                               ('37c1d2d8-4a23-4a7e-a1db-c7e0d73f5b42', 'Beef Burger', 'Juicy beef burger with cheddar, lettuce, tomato, and pickles.', 12.50, 'HAUPTGANG', false, 'https://www.certifiedirishangus.ie/wp-content/uploads/2019/11/TheUltimateBurgerwBacon_RecipePic.jpg');


        INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url) VALUES
        ('6d447771-9fe1-488f-b309-677d9e659d5b', 'Tiramisu', 'Classic Italian dessert with mascarpone and espresso-soaked ladyfingers.', 5.90, 'DESSERT', true, 'https://baristaroyal.de/cdn/shop/articles/15-834476_940x.png?v=1719300440'),
     ('6ebc66fd-44df-4c9d-904a-18c42009bccb', 'Lemon Tart', 'Zesty lemon filling in a buttery crust, topped with fresh berries.', 4.80, 'DESSERT', false, 'https://sugargeekshow.com/wp-content/uploads/2022/02/lemon_tart-25.jpg'),
     ('cf7d9b41-5f1a-42f0-a42a-2de5b4cc0a3e', 'Chocolate Lava Cake', 'Warm chocolate cake with a gooey molten center.', 6.50, 'DESSERT', true, 'https://images.getrecipekit.com/20250325120225-how-20to-20make-20chocolate-20molten-20lava-20cake-20in-20the-20microwave.png?width=650&quality=90&'),
     ('a6c9f36f-c9f0-4dcd-bbfa-07b74e914a4d', 'Cheesecake', 'Creamy cheesecake with a graham cracker crust.', 5.70, 'DESSERT', false, 'https://scientificallysweet.com/wp-content/uploads/2022/05/IMG_7944-vanilla-cheesecake-feature.jpg'),
     ('fbf458a1-3fbc-44c9-bb2a-c61b0e06a48d', 'Panna Cotta', 'Smooth Italian cream dessert topped with berry sauce.', 5.20, 'DESSERT', false, 'https://www.einfachbacken.de/sites/einfachbacken.de/files/styles/facebook/public/2021-07/panna_cotta_grundrezept_1.jpg?h=4521fff0&itok=6RY_YG36'),
     ('d2f7d911-2584-4d7d-899a-38c4a5d8ab04', 'Apple Pie', 'Traditional apple pie with cinnamon and a flaky crust.', 4.90, 'DESSERT', false, 'https://www.simplyorganic.com/media/wysiwyg/tmp/simply-organic-recipe-vanilla-bean-apple-pie-900x900.jpg'),
     ('a1d8b0d3-8b0a-4d7a-9c8b-0d8e0f4e3f56', 'Crème Brûlée', 'Rich custard topped with a caramelized sugar crust.', 6.80, 'DESSERT', true, 'https://img.chefkoch-cdn.de/rezepte/279041105901002/bilder/1502490/crop-960x720/creme-brulee.jpg'),
     ('67f2b3c6-6e39-4e9b-a878-8ed365a55de1', 'Strawberry Shortcake', 'Layers of sponge cake, whipped cream, and fresh strawberries.', 5.40, 'DESSERT', false, 'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2023_19/1993690/strawberry-shortcake-mc-1x1-230511.jpg'),
     ('847fa814-f528-4b6d-8fca-e8c0f2b29cc7', 'Chocolate Mousse', 'Light and airy chocolate mousse with whipped cream.', 5.90, 'DESSERT', false, 'https://laneandgreyfare.com/wp-content/uploads/2024/07/Easy-Chocolate-Mousse-Eggless-1.jpg'),
     ('c5d3b0a2-37ab-4c89-a3c9-bf2a1e5d98e0', 'Banoffee Pie', 'Pie with bananas, toffee, and whipped cream.', 5.60, 'DESSERT', false, 'https://www.allrecipes.com/thmb/cuPG3ES6WAkBt-gSARQY2V_osD0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/12625-Banoffee-pie-ddmfs-1x2-1771-9728e8a56ffa4672853fcc1a3f9f930e.jpg'),
     ('5ac9d0c2-ecb1-49d8-94e8-1d7a3b6e716c', 'Carrot Cake', 'Moist carrot cake with cream cheese frosting.', 5.80, 'DESSERT', false, 'https://www.simplyrecipes.com/thmb/oR-ZM8gn9H0VG2SvXXOM68z-9P8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/simply-recipes-easy-carrot-cake-lead-6-7770d9f1cf51473287ceb635f2c1ebf9.jpg'),
     ('7b9f4e5e-667a-4d0c-b9ad-92664a8d36b1', 'Profiteroles', 'Choux pastry filled with cream and topped with chocolate sauce.', 6.10, 'DESSERT', true, 'https://whippedfood.com/wp-content/uploads/2023/09/Profiterole-.jpg'),
     ('d12f3457-2f67-4b42-a842-903b66d3e719', 'Pavlova', 'Meringue dessert topped with whipped cream and fresh fruit.', 5.70, 'DESSERT', false, 'https://cranecuisine.de/wp-content/uploads/2023/07/Mini-Pavlova-mit-Mascarpone-Beeren-3.jpg'),
     ('f22c8d58-4a8c-4a4b-9de7-37e3e8a5e71f', 'Chocolate Chip Cookies', 'Classic chewy chocolate chip cookies.', 3.90, 'DESSERT', false, 'https://images.aws.nestle.recipes/resized/5b069c3ed2feea79377014f6766fcd49_Original_NTH_Chocolate_Chip_Cookie_1080_850.jpg'),
     ('e452e24c-3bb2-441b-a3db-2f4275f5d9f8', 'Ice Cream Sundae', 'Vanilla ice cream topped with chocolate sauce and nuts.', 4.60, 'DESSERT', false, 'https://cookienameddesire.com/wp-content/uploads/2018/05/brownie-sundae.jpg');

         INSERT INTO menu_item (id, name, description, price, category, is_chefs_choice, image_url) VALUES
('dce8e833-b123-4c26-a6e1-64d0c0e9fd67', 'Espresso', 'Strong, aromatic shot of Italian roast.', 2.20, 'GETRAENKE', true, 'https://upload.wikimedia.org/wikipedia/commons/4/45/A_small_cup_of_coffee.JPG'),
      ('7ef48cd3-fb7e-4e3b-bec6-37e004b4e6cf', 'Cappuccino', 'Espresso with steamed milk and milk foam.', 3.20, 'GETRAENKE', true, 'https://www.barista-passione.de/wp-content/uploads/cappuccino.jpg'),
      ('f6b1689c-805b-4c35-a80f-093b69df569e', 'Latte Macchiato', 'Creamy milk foam with a shot of espresso.', 3.50, 'GETRAENKE', false, 'https://liliebakery.fr/wp-content/uploads/2024/10/latte-macchiato-recette-facile-lilie-bakery-500x500.jpg'),
      ('3e71d8b1-2efb-4f7e-8d1f-7e65eb3f3f49', 'Flat White', 'Intense espresso with silky microfoam.', 3.80, 'GETRAENKE', false, 'https://cdn-s-www.ledauphine.com/images/2D239879-5350-4E09-8DE0-CDB39C250C69/NW_raw/tous-les-cafes-ont-pour-base-une-ou-deux-doses-d-expresso-photo-by-wenhao-ryan-on-unsplash-1646236309.jpg'),
      ('4a761918-78ec-4099-8678-083c75c5e63e', 'Americano', 'Espresso diluted with hot water.', 2.80, 'GETRAENKE', false, 'https://assets.beanbox.com/blog_images/AB7ud4YSE6nmOX0iGlgA.jpeg'),
      ('6a738115-fc49-464f-8326-271cde9f417d', 'Cold Brew', 'Cold-extracted coffee – mild & refreshing.', 4.00, 'GETRAENKE', true, 'https://lifesimplified.gorenje.com/wp-content/uploads/2024/06/gorenje-blog-refreshing_cold_brew_coffee-1040x585.jpg'),
      ('c04b7e43-b7ea-4a8a-86f4-ec69c9b4c2b7', 'Matcha Latte', 'Green Japanese tea frothed with milk.', 4.20, 'GETRAENKE', false, 'https://ucarecdn.com/6aaa3bb8-8a69-41a1-9f8a-7c9a7380c4d6/-/crop/4016x5425/0%2C296/-/preview/-/scale_crop/496x670/-/quality/smart/-/format/preserve/'),
      ('b6f9483b-bf93-4c10-91a3-5be5485f6d60', 'Chai Latte', 'Spiced tea with milk and cinnamon flavor.', 3.90, 'GETRAENKE', false, 'https://www.modernfarmhouseeats.com/wp-content/uploads/2022/01/starbucks-chai-tea-latte-12.jpg'),
      ('8677e775-0343-4206-b53b-1d0ad1f7e882', 'Hot Cocoa', 'Creamy hot chocolate with whipped cream.', 3.50, 'GETRAENKE', true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_H9P3_-Ar8SihqktN_J555pqRfE6X8_ir_g&s'),
      ('e0e45eb6-ff44-4f0a-baf3-301f3d3a3fd4', 'Iced Coffee', 'Cold coffee with vanilla ice cream and cream.', 4.50, 'GETRAENKE', false, 'https://www.tegut.com//fileadmin/tegut_upload/Rezepte/Eiskaffee-Vanilleeis-Sahne-Schokosauce-1920x1080.jpg'),
      ('b92d9a4e-77c3-44ee-939b-d013f6c99d02', 'Fresh Mint Tea', 'Hot tea with fresh mint and honey.', 2.90, 'GETRAENKE', false, 'https://images.t-online.de/2021/05/90075874v4/0x149:1920x1078/fit-in/1200x0/pfefferminztee-schon-seit-jahrhunderten-wird-der-pflanze-eine-heilende-wirkung-zugeschrieben.jpg'),
      ('e6eb3b94-7fa3-4e34-b6ea-29fc1ff5c233', 'Homemade Lemonade', 'Lemon lemonade with mint – fresh & fizzy.', 3.20, 'GETRAENKE', true, 'https://magazin.knappschaft.de/wp-content/uploads/2021/09/GettyImages-1167977173_L_Daniel-Mazilu-500px_erw_DS-scaled-2048x1366.jpg'),
      ('0e4137d3-85f4-4b80-bd9b-8982f2952d88', 'Fresh Orange Juice', 'Freshly squeezed daily, 100% fruit.', 3.90, 'GETRAENKE', false, 'https://www.tentamus.de/wp-content/uploads/2022/03/Analyse-Orangensaft_Tentamus-2.jpg'),
      ('bc62fa76-2c8e-4cd6-a23d-e342a73fba33', 'House Peach Iced Tea', 'Homemade with black tea and peach.', 3.30, 'GETRAENKE', false, 'https://images.t-online.de/2021/09/77864414v2/0x97:1920x1080/fit-in/1920x0/auch-mit-minze-erhaelt-ihr-selbstgemachter-eistee-ein-frisches-aroma.jpg'),
      ('47a66e76-7d90-4228-b663-5aa5807c5cd1', 'Mineral Water (still or sparkling)', 'From the region, served chilled.', 2.20, 'GETRAENKE', false, 'https://vilsa.de/wp-content/uploads/images/34185/shutterstock_264619850_070f940.jpg');
