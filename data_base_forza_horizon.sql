-- PROJETO: BANCO DE DADOS FORZA HORIZON (MARCAS E CARROS)
-- DESCRIÇÃO: Estrutura de dados simulando 20 marcas e 400 modelos de veículos.
-- AUTOR: Enuk dos Santos Alves Nogueira

DROP TABLE IF EXISTS carros;
DROP TABLE IF EXISTS marcas;

-- 2. TABELA PAI marcas

CREATE TABLE marcas (
    id_marca INT PRIMARY KEY, 
    nome_marca VARCHAR(100), 
    pais_origem VARCHAR(50)
);

-- 3. TODOS OS DADOS DA TABELA marcas

INSERT INTO marcas (id_marca, nome_marca, pais_origem)
VALUES 
(1, 'Volkswagen', 'Alemanha'),
(2, 'BMW', 'Alemanha'),
(3, 'Mercedes-Benz', 'Alemanha'),
(4, 'Audi', 'Alemanha'),
(5, 'Porsche', 'Alemanha'),
(6, 'Toyota', 'Japão'),
(7, 'Honda', 'Japão'),
(8, 'Nissan', 'Japão'),
(9, 'Mazda', 'Japão'),
(10, 'Subaru', 'Japão'),
(11, 'Ford', 'Estados Unidos'),
(12, 'Ferrari', 'Itália'),
(13, 'Lamborghini', 'Itália'),
(14, 'Jeep', 'Estados Unidos'),
(15, 'Fiat', 'Itália'),
(16, 'Hyundai', 'Coreia do Sul'),
(17, 'Volvo', 'Suécia'),
(18, 'BYD', 'China'),
(19, 'Chevrolet', 'Estados Unidos'),
(20, 'Tesla', 'Estados Unidos');

-- 4. CRIAÇÃO DA TABELA FILHO carros 

CREATE TABLE carros (
    id_carros INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_carro TEXT,
    id_marca INT,
    FOREIGN KEY(id_marca) REFERENCES marcas(id_marca)
);

-- 5. TODOS OS DADOS DA TABELA carros (400 registros / 20 por marca)

INSERT INTO carros (nome_carro, id_marca)
VALUES 
-- Volkswagen
('Golf', 1), ('Gol', 1), ('Polo', 1), ('Jetta', 1), ('Passat', 1),
('T-Cross', 1), ('Nivus', 1), ('Virtus', 1), ('Tiguan', 1), ('Amarok', 1),
('Fusca', 1), ('Fox', 1), ('Voyage', 1), ('Saveiro', 1), ('Bora', 1),
('Santana', 1), ('Up!', 1), ('Taos', 1), ('Scirocco', 1), ('Touareg', 1),

-- BMW
('Série 3', 2), ('Série 5', 2), ('Série 1', 2), ('Série 7', 2), ('X1', 2),
('X3', 2), ('X5', 2), ('X6', 2), ('M3', 2), ('M5', 2),
('Z4', 2), ('i3', 2), ('i4', 2), ('iX', 2), ('Série 4', 2),
('Série 8', 2), ('X2', 2), ('X4', 2), ('X7', 2), ('M2', 2),

-- Mercedes-Benz
('Classe C', 3), ('Classe A', 3), ('Classe E', 3), ('Classe S', 3), ('GLA', 3),
('GLC', 3), ('GLE', 3), ('GLS', 3), ('CLA', 3), ('CLS', 3),
('C63 AMG', 3), ('A45 AMG', 3), ('G63 AMG', 3), ('EQE', 3), ('EQS', 3),
('GLB', 3), ('SLK', 3), ('AMG GT', 3), ('Classe B', 3), ('Sprinter', 3),

-- Audi
('A4', 4), ('A3', 4), ('A5', 4), ('A6', 4), ('A7', 4),
('A8', 4), ('Q3', 4), ('Q5', 4), ('Q7', 4), ('Q8', 4),
('R8', 4), ('TT', 4), ('RS3', 4), ('RS4', 4), ('RS6', 4),
('e-tron', 4), ('A1', 4), ('Q2', 4), ('RS5', 4), ('SQ5', 4),

-- Porsche
('911 Carrera', 5), ('Cayenne', 5), ('Macan', 5), ('Panamera', 5), ('Taycan', 5),
('718 Cayman', 5), ('718 Boxster', 5), ('911 Turbo S', 5), ('911 GT3', 5), ('Carrera GT', 5),
('918 Spyder', 5), ('Cayman GT4', 5), ('928', 5), ('944', 5), ('Macan GTS', 5),
('Cayenne Coupe', 5), ('Panamera Sport Turismo', 5), ('911 Targa', 5), ('356', 5), ('959', 5),

-- Toyota
('Corolla', 6), ('Hilux', 6), ('Yaris', 6), ('SW4', 6), ('RAV4', 6),
('Prius', 6), ('Camry', 6), ('Supra', 6), ('Etios', 6), ('Corolla Cross', 6),
('Land Cruiser', 6), ('Avalon', 6), ('Tacoma', 6), ('Tundra', 6), ('Sienna', 6),
('C-HR', 6), ('Celica', 6), ('MR2', 6), ('GR Yaris', 6), ('Century', 6),

-- Honda
('Civic', 7), ('Fit', 7), ('City', 7), ('HR-V', 7), ('CR-V', 7),
('Accord', 7), ('WR-V', 7), ('NSX', 7), ('Prelude', 7), ('S2000', 7),
('Odyssey', 7), ('Pilot', 7), ('Passport', 7), ('Insight', 7), ('Ridgeline', 7),
('Civic Type R', 7), ('Integra', 7), ('Legend', 7), ('Element', 7), ('Zest', 7),

-- Nissan
('GT-R', 8), ('Sentra', 8), ('Versa', 8), ('Kicks', 8), ('Frontier', 8),
('March', 8), ('370Z', 8), ('350Z', 8), ('Altima', 8), ('Pathfinder', 8),
('X-Trail', 8), ('Leaf', 8), ('Murano', 8), ('Tiida', 8), ('Livina', 8),
('Maxima', 8), ('Rogue', 8), ('Silvia', 8), ('Skyline R34', 8), ('Ariya', 8),

-- Mazda
('RX-7', 9), ('RX-8', 9), ('Miata MX-5', 9), ('Mazda 3', 9), ('Mazda 6', 9),
('CX-30', 9), ('CX-5', 9), ('CX-9', 9), ('Mazda 2', 9), ('CX-3', 9),
('CX-50', 9), ('CX-60', 9), ('CX-70', 9), ('CX-90', 9), ('Mazda 5', 9),
('MX-30', 9), ('Protegé', 9), ('Tribute', 9), ('AZ-1', 9), ('Cosmo', 9),

-- Subaru
('Impreza', 10), ('WRX STi', 10), ('Outback', 10), ('Forester', 10), ('XV Crosstrek', 10),
('Legacy', 10), ('BRZ', 10), ('Ascent', 10), ('Baja', 10), ('Tribeca', 10),
('Alcyone SVX', 10), ('Justy', 10), ('Levorg', 10), ('Exiga', 10), ('Sambar', 10),
('Solterra', 10), ('Chiffon', 10), ('Rex', 10), ('Leone', 10), ('Vivio', 10),

-- Ford
('Mustang', 11), ('Ranger', 11), ('EcoSport', 11), ('Focus', 11), ('Fiesta', 11),
('Ka', 11), ('Fusion', 11), ('Edge', 11), ('Territory', 11), ('Maverick', 11),
('F-150', 11), ('Explorer', 11), ('Escort', 11), ('Corcel', 11), ('Del Rey', 11),
('Mondeo', 11), ('Bronco', 11), ('GT40', 11), ('Transit', 11), ('Galaxie', 11),

-- Ferrari
('488 GTB', 12), ('LaFerrari', 12), ('Enzo', 12), ('F40', 12), ('F50', 12),
('Testarossa', 12), ('458 Italia', 12), ('812 Superfast', 12), ('Roma', 12), ('Portofino', 12),
('SF90 Stradale', 12), ('250 GTO', 12), ('360 Modena', 12), ('F8 Tributo', 12), ('Purosangue', 12),
('California', 12), ('599 GTB', 12), ('GTC4Lusso', 12), ('Monza SP2', 12), ('Daytona SP3', 12),

-- Lamborghini
('Aventador', 13), ('Gallardo', 13), ('Murciélago', 13), ('Huracán', 13), ('Urus', 13),
('Countach', 13), ('Diablo', 13), ('Miura', 13), ('Reventón', 13), ('Veneno', 13),
('Centenario', 13), ('Sesto Elemento', 13), ('Sián', 13), ('Revuelto', 13), ('Espada', 13),
('Jalpa', 13), ('LM002', 13), ('Islero', 13), ('Jarama', 13), ('Asterion', 13),

-- Jeep
('Wrangler', 14), ('Compass', 14), ('Renegade', 14), ('Commander', 14), ('Grand Cherokee', 14),
('Cherokee', 14), ('Gladiator', 14), ('Avenger', 14), ('Wagoneer', 14), ('Patriot', 14),
('Liberty', 14), ('Compass 4xe', 14), ('Renegade 4xe', 14), ('CJ-5', 14), ('Willys', 14),
('Scrambler', 14), ('Grand Wagoneer', 14), ('Meridian', 14), ('Comanche', 14), ('Trackhawk', 14),

-- Fiat
('Uno', 15), ('Palio', 15), ('Mobi', 15), ('Argo', 15), ('Cronos', 15),
('Pulse', 15), ('Fastback', 15), ('Toro', 15), ('Strada', 15), ('Siena', 15),
('Punto', 15), ('Stilo', 15), ('Marea', 15), ('Tempra', 15), ('147', 15),
('500', 15), ('Fiorino', 15), ('Idea', 15), ('Bravo', 15), ('Linea', 15),

-- Hyundai
('HB20', 16), ('HB20S', 16), ('Creta', 16), ('Tucson', 16), ('Santa Fe', 16),
('Ix35', 16), ('Azera', 16), ('Elantra', 16), ('i30', 16), ('Veloster', 16),
('Sonata', 16), ('Accent', 16), ('Ioniq 5', 16), ('Ioniq 6', 16), ('Palisade', 16),
('Kona', 16), ('H100', 16), ('Galloper', 16), ('Genesis', 16), ('Atos', 16),

-- Volvo
('XC60', 17), ('XC40', 17), ('XC90', 17), ('V40', 17), ('S60', 17),
('S90', 17), ('V60', 17), ('V90', 17), ('C40 Recharge', 17), ('EX30', 17),
('EX90', 17), ('C30', 17), ('S40', 17), ('V50', 17), ('850', 17),
('Amazon', 17), ('P1800', 17), ('XC70', 17), ('S80', 17), ('EX40', 17),

-- BYD
('Seal', 18), ('Dolphin', 18), ('Yuan Plus', 18), ('Song Plus', 18), ('Han', 18),
('Tan', 18), ('Dolphin Mini', 18), ('King', 18), ('Shark', 18), ('Seagull', 18),
('Qin Plus', 18), ('Tang EV', 18), ('Denza D9', 18), ('Yangwang U8', 18), ('Yangwang U9', 18),
('Song Pro', 18), ('Yuan Up', 18), ('e2', 18), ('e3', 18), ('e6', 18),

-- Chevrolet
('Onix', 19), ('Onix Plus', 19), ('Tracker', 19), ('Cruze', 19), ('Spin', 19),
('S10', 19), ('Trailblazer', 19), ('Montana', 19), ('Equinox', 19), ('Camaro', 19),
('Bolt EV', 19), ('Celta', 19), ('Corsica', 19), ('Corsa', 19), ('Astra', 19),
('Vectra', 19), ('Omega', 19), ('Opala', 19), ('Monza', 19), ('Malibu', 19),

-- Tesla
('Model S', 20), ('Model 3', 20), ('Model X', 20), ('Model Y', 20), ('Cybertruck', 20),
('Roadster Gen 1', 20), ('Roadster 2026', 20), ('Semi', 20), ('Model S Plaid', 20), ('Model X Plaid', 20),
('Model 3 Highland', 20), ('Model Y Juniper', 20), ('Cybercab', 20), ('Robovan', 20), ('Model 2', 20),
('Model S P100D', 20), ('Model X P100D', 20), ('Model 3 Performance', 20), ('Model Y Performance', 20), ('Next-Gen Platform Car', 20);

-- 6. CONSULTAS ANALÍTICAS PARA PORTFÓLIO

-- Relatório completo cruzando as tabelas
SELECT 
    carros.nome_carro,
    marcas.nome_marca,
    marcas.pais_origem
FROM carros
INNER JOIN marcas ON carros.id_marca = marcas.id_marca