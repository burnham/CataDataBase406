-- Lieutenant Walden miss correct phases on 1 and 2
DELETE FROM `creature` WHERE `id`=34863;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(4833, 34863, 638, 1, 1, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(6716, 34863, 638, 1, 2, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(6565507, 50086, 0, 1, 2, 0, 0, -5077.7, -5142.05, 46.7283, 2.36466, 300, 6, 0, 929880, 0, 0, 1, 0, 0, 0); -- Correct loc for Overlord Sunderfury

-- Elites and rare npcs need special respawn
-- Karoma (http://www.wowhead.com/npc=50138) 7 hours for respawn
UPDATE `creature` SET `spawntimesecs`='25000' WHERE `id`='50138';
-- Sambas (http://www.wowhead.com/npc=50159) 6 hours for respawn
UPDATE `creature` SET `spawntimesecs`='21800' WHERE `id`='50159';
-- Overlord Sunderfury (http://www.wowhead.com/npc=50085) 6 hours for respawn
UPDATE `creature` SET `spawntimesecs`='21800' WHERE `id`='50085';
-- Overlord Sunderfury (http://www.wowhead.com/npc=50086) 7 hours for respawn
UPDATE `creature` SET `spawntimesecs`='25000' WHERE `id`='50086';
-- Jadefang (http://www.wowhead.com/npc=49822) 8 hours for respawn
UPDATE `creature` SET `spawntimesecs`='30500' WHERE `id`='49822';
-- Golgarok <The Crimson Shatterer> (http://www.wowhead.com/npc=50059) 5 hours for respawn
UPDATE `creature` SET `spawntimesecs`='19500' WHERE `id`='50059';
-- Terborus (http://www.wowhead.com/npc=50060) 2 hours for respawn
UPDATE `creature` SET `spawntimesecs`='8500' WHERE `id`='50060';
-- Aeonaxx <Mate of Aeosera> (http://www.wowhead.com/npc=50062) 2 days for respawn
UPDATE `creature` SET `spawntimesecs`='215000' WHERE `id`='50062';
-- Lady LaLa (http://www.wowhead.com/npc=49913) 2 hours for respawn
UPDATE `creature` SET `spawntimesecs`='9500' WHERE `id`='49913';
-- Ghostcrawler (http://www.wowhead.com/npc=50051) 8 hours for respawn
UPDATE `creature` SET `spawntimesecs`='30000' WHERE `id`='50051';
-- Burgy Blackheart (http://www.wowhead.com/npc=50052) 16 hours for respawn
UPDATE `creature` SET `spawntimesecs`='59500' WHERE `id`='50052';
-- Poseidus Blackheart (http://www.wowhead.com/npc=50005) 3 days for respawn
UPDATE `creature` SET `spawntimesecs`='270000' WHERE `id`='50005';
-- Armagedillo (http://www.wowhead.com/npc=50065) 4 hours for respawn
UPDATE `creature` SET `spawntimesecs`='16000' WHERE `id`='50065';
-- Cyrus the Black (http://www.wowhead.com/npc=50064) 8 hours for respawn
UPDATE `creature` SET `spawntimesecs`='30000' WHERE `id`='50064';
-- Madexx (http://www.wowhead.com/npc=51404) 2 days for respawn
UPDATE `creature` SET `spawntimesecs`='115000' WHERE `id`='51404';