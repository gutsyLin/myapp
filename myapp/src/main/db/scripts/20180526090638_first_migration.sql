--
--    Copyright 2010-2016 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

-- // First migration.
-- Migration SQL that makes the change goes here.

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('41', 'admin', '56a640b368dd8831ad8c638ae81784');
INSERT INTO `sys_user` VALUES ('43', 'test', '9ff787146779ccc57968d184304ac1');
INSERT INTO `sys_user` VALUES ('44', 'haha', '4c33473a2627b7f96b24cfed287e9f1');
INSERT INTO `sys_user` VALUES ('47', 'linfm', 'd1f72953e5d9d59ed0ceef1ce06b3d7');
INSERT INTO `sys_user` VALUES ('48', 'rldlfm', 'd1f72953e5d9d59ed0ceef1ce06b3d7');
INSERT INTO `sys_user` VALUES ('49', 'lnf', 'c353a43ea4293774e04f71368f2eb623');
INSERT INTO `sys_user` VALUES ('50', 'admin01', 'f197d0aa6f642bf44c112655443bd2ed');
INSERT INTO `sys_user` VALUES ('51', 'admin02', 'd1f72953e5d9d59ed0ceef1ce06b3d7');
INSERT INTO `sys_user` VALUES ('52', 'admin03', 'd1f72953e5d9d59ed0ceef1ce06b3d7');



-- //@UNDO
-- SQL to undo the change goes here.


