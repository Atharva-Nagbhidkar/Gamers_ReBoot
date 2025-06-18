INSERT INTO service (game, genre, price, publisher, filename) VALUES
('GTA V', 'Open World', '$ 12.99', 'Rockstar Games', 'gta_v.png'),
('Assassin''s Creed', 'Action RPG', '$ 49.99', 'Ubisoft', 'assassins_creed_valhalla.jpg'),
('Halo Infinite', 'First-Person Shooter', '$ 59.99', 'Xbox Studios', 'halo_infinite.jpg'),
('Among Us', 'Party', '$ 4.99', 'Innersloth', 'among_us.png'),
('Cyberpunk 2077', 'RPG', '$ 29.99', 'CD Projekt', 'cyberpunk_2077.png'),
('The Witcher 3', 'RPG', '$ 19.99', 'CD Projekt', 'the_witcher_3.png'),
('Minecraft', 'Sandbox', '$ 26.95', 'Mojang Studios', 'minecraft.png'),
('Fortnite', 'Battle Royale', 'Free', 'Epic Games', 'fortnite.jpg'),
('RDR 2', 'Action-Adventure', '$ 39.99', 'Rockstar Games', 'red_dead_redemption_2.png');


INSERT INTO users (username, email, phone, password, isadmin) VALUES
('Elbert Oliver', 'a@gmail.com', '9823765134', '$2a$10$kIf3fX2Rb9aIA89WFQUfEufv.lY7E7.4g/SlgSTXLOMPRlF4dgosi', 'false'),
('Admin', 'a@admin.ad', '0000000000', '$2a$10$67CdptkxiDRL5U5pKl.4SevTonq/SjVkOAzButtft.3B4Rn9Q2N/.', 'true');