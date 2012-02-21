-- NPC
-- SAI

-- -----
-- NPC
-- -----
-- Lieutenant Walden miss correct phases on 1 and 2
DELETE FROM `creature` WHERE `id`=34863;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(4833, 34863, 638, 1, 1, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0),
(6716, 34863, 638, 1, 2, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0),
(6565507, 50086, 0, 1, 2, 0, 0, -5077.7, -5142.05, 46.7283, 2.36466, 300, 6, 0, 929880, 0, 1, 0, 0, 0); -- Correct loc for Overlord Sunderfury

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

-- NPC: Rates NPC's are rank 2 (rare) not 1 (Elite)
UPDATE `creature_template` SET `rank`='2' WHERE `entry` IN 
(50138,50159,50085,50086,49822,50059,50060,50062,49913,50051,50052,50005,50065,50064,51404);

-- NPC: Fix HP for rares creatures
UPDATE `creature_template` SET `Health_mod`='2.00' WHERE `entry` IN (50085); -- Overlord Sunderfury
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50085);
UPDATE `creature_template` SET `Health_mod`='1.5' WHERE `entry` IN (50086); -- Tarvus the Vile
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50086);
UPDATE `creature_template` SET `Health_mod`='9.37' WHERE `entry` IN (49822); -- Jadefang
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (49822);
UPDATE `creature_template` SET `Health_mod`='9.62' WHERE `entry` IN (50059); -- Golgarok
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50059);
UPDATE `creature_template` SET `Health_mod`='109.62' WHERE `entry` IN (50051); -- Ghostcrawler
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50051);
UPDATE `creature_template` SET `Health_mod`='4.520' WHERE `entry` IN (50052); -- Burgy Blackheart <Dreaded Captain of Diane's Fancy>
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50052);
UPDATE `creature_template` SET `Health_mod`='4.50' WHERE `entry` IN (50005); -- Poseidus
UPDATE `creature` SET `curhealth`='0' WHERE `id` IN (50005);

-- ----
-- SAI
-- ----
-- SAI: Karoma <The Wolf Spirit>
SET @ENTRY := 50138;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,5,45,1000,2500,11,75002,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On player range - Cast Leaping Rush");

-- SAI: Sambas
SET @ENTRY := 50159 ;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,5,45,1000,2500,11,75002,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On player range - Cast Leaping Rush");

-- SAI; Jadefang
SET @ENTRY := 49822;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,5,45,3500,4600,11,96201,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On player are in range cast - Web Wrap"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2500,3500,9500,10000,11,86570,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Shale Flurry"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,5500,5600,11000,12500,11,83381,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: kill");

-- SAI: Golgarok
SET @ENTRY := 50059;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,5,10,3000,3500,11,86699,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On player on range cast: Sockwave"),
(@ENTRY,@SOURCETYPE,1,0,2,0,100,0,25,25,35000,48000,11,80117,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"On 25% HP: Earth Spike"),
(@ENTRY,@SOURCETYPE,2,0,67,0,100,0,10000,11000,0,0,11,80182,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On behing target cast: Uppercut"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,25000,28000,60000,70000,11,86861,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Earthquake");

-- SAI: Terborus
SET @ENTRY := 50060;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,60000,65000,70000,11,79927,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Earth Shield"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,5000,6000,45000,50000,11,32738,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Bore");

-- SAI: Mobus
SET @ENTRY := 50009;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1300,2300,60000,70000,11,93492,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Ram"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,5500,6000,120000,130000,11,93491,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Algae"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,0,40,40,24000,25400,11,8599,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On 40% HP cast: Enrage"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,2500,3000,60000,120000,11,93494,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Wake");

-- SAI: Ghostcrawler
SET @ENTRY := 50051;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,53148,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On aggro: Charge"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1300,1500,10000,15000,11,67982,4,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC cast: Claw"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,0,50,50,0,0,11,93082,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On 50% HP cast: Supernerf");

-- SAI: Burgy Blackheart
SET @ENTRY := 50052;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,1,30,1200,1300,11,75380,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"On Range cast: Parrrley!"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1600,1700,12000,15000,11,75361,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC Cast: Swashbuckling Slice"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,1200,1300,28000,30000,11,79414,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC Cast: Brittle Touch");

-- SAI: Poseidus
SET @ENTRY := 50005;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,8,25,3500,4000,11,93497,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Range Cast: Bubble Charge"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1300,1500,30000,35000,11,93500,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC Cast: Bubblebeam"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,0,10,50,25000,30000,11,93502,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On % HP Cast: Seascape");

-- SAI: Armagedillo
SET @ENTRY := 50065;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,5,30,1200,1300,11,0,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Range Cast: Spiked Charge"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1500,1600,40000,45000,11,93592,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Ic Cast: Diligeddon"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,1600,1700,16000,20000,11,93590,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Ic Cast: Flame Breath");

-- SAI: Xariona
SET @ENTRY := 50061;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1500,1600,25000,30000,11,93544,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On IC Cast: Twilight Breath"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3500,4000,55000,60000,11,93546,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"On IC Cast: Twilight Fissure"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,0,50,50,25000,30000,11,93553,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On 50% HP Cast: Twilight Zone"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,4000,4500,60000,70000,11,93556,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Ic Cast: Unleashed Magic");