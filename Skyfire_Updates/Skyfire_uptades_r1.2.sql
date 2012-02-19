-- Lieutenant Walden miss correct phases on 1 and 2
DELETE FROM `creature` WHERE `id`=34863;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(4833, 34863, 638, 1, 1, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0),
(6716, 34863, 638, 1, 2, 0, 0, -1405.52, 1445.8, 35.5562, 2.99158, 600, 0, 0, 42, 0, 0, 0, 0, 0);