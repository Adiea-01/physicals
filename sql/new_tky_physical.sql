/*
 Navicat Premium Data Transfer

 Source Server         : 互联网测试环境-192.168.80.158
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 192.168.80.158:3306
 Source Schema         : new_tky_physical

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 26/02/2021 17:17:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for physical_annual_management
-- ----------------------------
DROP TABLE IF EXISTS `physical_annual_management`;
CREATE TABLE `physical_annual_management`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `year` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `year_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联体检报告表中的pu_yearUuid',
  `year_flag` int(1) NULL DEFAULT NULL COMMENT '是否显示当年的年份（1为显示）',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_date` date NULL DEFAULT NULL COMMENT '创建日期',
  `del_flag` int(1) NULL DEFAULT NULL COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '年份管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_annual_management
-- ----------------------------
INSERT INTO `physical_annual_management` VALUES (1, '2014年', 'c199fd5d58bd4fd990a951ce3ebe35bb', 1, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (2, '2015年', '6d87fa1b02624955a9aeee2bbb467460', 0, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (3, '2016年', '65d64d711f1e4f579fab6040722c4fd9', 0, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (4, '2017年', '04626589d9044977bd2554ae1bcab1b2', 0, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (5, '2018年', '4486bdc3364a4fd4bdf0016d1550af7b', 0, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (6, '2019年', 'a314db1d82bb4742a3591a1a7307a162', 0, NULL, '2020-07-06', 0);
INSERT INTO `physical_annual_management` VALUES (9, '2020年', 'cdd7c50982e746dc87ff7d56bed4b744', 0, NULL, '2021-02-23', 0);

-- ----------------------------
-- Table structure for physical_checkup_item
-- ----------------------------
DROP TABLE IF EXISTS `physical_checkup_item`;
CREATE TABLE `physical_checkup_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chinese_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `english_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文全称',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名（属性名）',
  `abbreviation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `chinese_explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `classification` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属检测模块（检测分类）',
  `miximum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测参考值（最小值）',
  `maximum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测参考值（最大值）',
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测参考值（计量单位）',
  `reference_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检测参考值描述',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field_name`(`field_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检项目管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_checkup_item
-- ----------------------------
INSERT INTO `physical_checkup_item` VALUES (1, '眼科其它', 'ophthalmology', 'ophthalmology', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (2, '裸视力(左)', 'naked vision left', 'lnv', 'NV-L', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (3, '裸视力(右)', 'naked vision right', 'rnv', 'NV-R', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (4, '矫正视力(左)', 'Corrected vision left', 'lcv', 'CV-L', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (5, '矫正视力(右)', 'Corrected vision right', 'rcv', 'CV-R', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (6, '色觉', 'colour sense', 'colourSense', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (7, '外眼', 'outer eye', 'outerEye', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (8, '眼底镜检查', 'ophthalmoscopic', 'ophthalmoscopic', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (9, '身高', 'height', 'height', NULL, NULL, '1', NULL, NULL, 'cm', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (10, '体重', 'body weight', 'weight', NULL, NULL, '1', NULL, NULL, 'Kg', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (11, '体重指数', NULL, 'bmi', 'BMI', NULL, '1', '18.5', '23.99', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (12, '收缩压', 'Systolic pressure', 'sp', 'SP', NULL, '1', NULL, NULL, 'mmHg', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (13, '舒张压', 'diastolic blood pressure', 'dp', 'DP', NULL, '1', NULL, NULL, 'mmHg', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (14, '腰围', 'waistline', 'waistline', NULL, NULL, '1', '1', '80', 'cm', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (15, '外阴', 'vulva', 'vulva', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (16, '念珠样菌', 'Candida albicans', 'candidaAlbicans', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (17, '滴虫', 'trichomonad', 'trichomonad', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (18, '阴道清洁度', 'cleaning degree of vagina', 'cdv', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (19, '阴道', 'vagina', 'vagina', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (20, '其它（白带）', 'Others (leucorrhea)', 'othersL', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (21, '宫颈', 'neck of uterus', 'neckOfUterus', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (22, '子宫(妇科)', 'Uterus', 'uterus', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (23, '附件(妇科)', 'adnexal', 'adnexal', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (24, '妇科其它', 'gynecologicexamination', 'gynecologicexamination', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (25, '病史', 'medical history', 'medicaHistory', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (26, '内科', 'Internal Medicine Department', 'imd', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (27, '家族史', 'family history', 'familyHistory', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (28, '心率', 'heart rate', 'heartRate', NULL, NULL, '7', NULL, NULL, '次/分', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (29, '心律', 'rhythm of the heart', 'roth', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (30, '心音', 'heart sound', 'heartSound', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (31, '肺部听诊', 'Lung auscultation', 'la', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (32, '肝脏触诊', 'liver palpation', 'lp', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (33, '脾脏触诊', 'Spleen Palpation', 'spleenPal', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (34, '肾脏叩诊', 'Renal percussion', 'rp', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (35, '皮肤', 'skin', 'skin', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (36, '外科', 'surgery', 'surgery', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (37, '浅表淋巴结', 'Superficial lymph nodes', 'sln', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (38, '甲状腺(外科)', 'Thyroid (surgery)', 'thyroidSurgery', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (39, '乳房', 'breast', 'breast', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (40, '脊柱', 'spine', 'spine', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (41, '四肢关节', 'Joints of limbs', 'jointsLimbs', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (42, '外生殖器', 'External genitalia', 'eg', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (43, '肛门、直肠指诊', 'anus rectum', 'anusRectum', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (44, '前列腺(外科)', 'Prostate (surgery)', 'prostateSurgery', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (45, '外耳', 'External ear', 'externalEar', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (46, '耳鼻咽喉科其它', 'Otorhinolaryngology other', 'entOther', 'E.N.T', NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (47, '既往史', 'Past history', 'pastHistory', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (48, '外耳道', 'External auditory canal', 'eac', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (49, '鼓膜', 'tympanic membrane', 'tm', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (50, '鼻腔', 'nasal cavity', 'nasalCavity', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (51, '鼻中隔', 'nasal septum', 'nasalSeptum', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (52, '咽', 'pharynx', 'pharynx', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (53, '扁桃体', 'tonsil', 'tonsil', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (54, '唇', 'lip', 'lip', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (55, '颞下颌关节', 'Temporomandibular joint', 'tmj', 'TMJ', NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (56, '口腔科其它', 'Stomatology other', 'stomatologyOther', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (57, '牙列', 'dentition', 'dentition', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (58, '牙齿', 'toothBody', 'toothBody', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (59, '口腔腺体', 'Oral gland', 'oralGland', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (60, '牙周', 'dental periphery', 'dentalPeriphery', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (61, '舌', 'tongue', 'tongue', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (62, '腭', 'palate', 'palate', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (63, '口腔粘膜', 'Oral mucosa', 'oralMucosa', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (64, '白细胞计数', 'Leukocyte Count ', 'lc', NULL, NULL, '2', '3.5', '9.5', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (65, '血小板计数', 'blood platelet', 'plt', 'PLT', NULL, '2', '125', '350', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (66, '平均血小板体积', 'Mean platelet volume', 'mpv', 'MPV', NULL, '2', '6.5', '13', 'fL', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (67, '类风湿因子', 'rheumatoid factor', 'rf', 'RF', NULL, '2', NULL, '20', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (68, '超敏C反应蛋白', 'hypersensitive C-reactive protein', 'hsCRP', 'hs-CRP', NULL, '2', NULL, '5', 'mg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (69, 'C-反应蛋白', 'C-reactive protein', 'crp', 'CRP', NULL, '2', NULL, '5', 'mg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (70, '血小板分布宽度', 'Platelet distribution width', 'pdw', 'PDW', NULL, '2', '9', '17', 'fL', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (71, '抗链球菌溶血素“O”', 'Anti-Streptolysin O', 'aso', 'ASO', NULL, '2', NULL, '200', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (72, '甲胎蛋白', 'alpha fetoprotein', 'afp', 'AFP', NULL, '2', NULL, '7', 'ng/ml', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (73, '癌胚抗原', 'carcinoembryonic antigen', 'cea', 'CEA', NULL, '2', NULL, '5', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (74, '总前列腺特异性抗原', 'Total Prostate Specific Antigen', 'tpsa', 'T-PSA', NULL, '2', NULL, '4', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (75, '游离前列腺特异性抗原', 'Free Prostate specific antigen', 'fpsa', 'F-PSA', NULL, '2', NULL, '0.93', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (76, '糖类抗原19-9（CA19-9）', 'Carbohydrate antigen199', 'ca199', 'CA199', NULL, '2', NULL, '39', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (77, '糖类抗原242', NULL, 'ca242', 'CA242', NULL, '2', NULL, '20', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (78, '糖类抗原125（CA125）', 'carbohydrate antigen 125', 'ca125', 'CA125', NULL, '2', NULL, '35', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (79, '糖类抗原15-3', NULL, 'ca153', 'CA153', NULL, '2', NULL, '25', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (80, '糖类抗原50', NULL, 'ca50', 'CA50', NULL, '2', NULL, '30', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (81, '糖类抗原724', 'Tumor Marker', 'ca724', 'CA724', NULL, '2', NULL, '6.9', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (82, '细胞角蛋白19片段(CYFRA21-1)', 'Cytokeratin-19-fragment(CYFRA21-1)', 'cyfra211', 'CYFRA21-1', NULL, '2', NULL, '3.3', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (83, '淋巴细胞百分比', 'lymphocyte', 'lymphocytePrec', 'LYMPH%', NULL, '2', '20', '40', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (84, '淋巴细胞绝对值', 'lymphocyte', 'lymphocyteAbso', 'LYMPH#', NULL, '2', '1.1', '3.2', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (85, '三碘甲状腺原氨酸T3', 'triiodothyronine', 't3', 'T3', NULL, '2', '1.3', '3.1', 'pmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (86, '甲状腺素T4', 'thyroxine', 't4', 'T4', NULL, '2', '66', '181', 'nmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (87, '促甲状腺激素（TSH）', 'thyroid stimulating hormone', 'tsh', 'TSH', NULL, '2', '0.27', '4.2', 'mIU/L', '孕期1-12周：0.05-5.17;孕期13-28周:0.39-5.22; 孕期29-40周:0.60-6.84', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (88, '中性粒细胞', 'neutrophil', 'neutrophil', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (89, '中性粒细胞百分比', 'neutrophil granulocyte', 'neutrophilPrec', 'NEUT%', NULL, '2', '40', '75', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (90, '中性粒细胞绝对值', 'neutrophil granulocyte', 'neutrophilAbso', 'NEUT#', NULL, '2', '1.8', '6.3', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (91, '免疫球蛋白A', 'immunoglobulin A', 'igA', 'IgA', NULL, '5', '0.7', '4', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (92, '免疫球蛋白E', 'immunoglobulin E', 'igE', 'IgE', NULL, '5', NULL, '100', 'KU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (93, '免疫球蛋白G', 'immunoglobulin G', 'igG', 'IgG', NULL, '5', '7', '16', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (94, '免疫球蛋白M', 'immunoglobulin M', 'igM', 'IgM', NULL, '5', '0.4', '2.3', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (95, '游离三碘甲状腺原氨酸', NULL, 'ft3', 'FT3', NULL, '5', '3.1', '6.8', 'pmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (96, '游离甲状腺素', 'FreeThyroxine.FT4', 'ft4', 'FT4', NULL, '5', '12', '22', 'pmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (97, '鳞状上皮细胞癌相关抗原', 'squamous cell carcinoma antigen', 'scc', 'SCC', NULL, '5', NULL, '1.5', 'ng/ml', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (98, '血清α-羟丁酸脱氢酶', 'α-HBDH', 'hbdh', 'α-HBDH', NULL, '5', '72', '182', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (99, '血清钾', 'Serum potassium', 'k', 'K', NULL, '5', '3.5', '5.3', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (100, '血清钠', 'Serum sodium', 'na', 'Na', NULL, '5', '137', '147', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (101, '血清氯', 'Serum chlorine', 'cl', 'Cl', NULL, '5', '99', '110', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (102, '血清镁', 'Serum magnesium', 'mg', 'Mg', NULL, '5', '0.75', '1.02', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (103, '血清钙', 'Serum calcium', 'ca', 'Ca', NULL, '5', '2.11', '2.52', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (104, '血清磷', 'Serum phosphorus', 'p', 'P', NULL, '5', '0.85', '1.51', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (105, '红细胞分布宽度-标准差', 'Red Cell volume Distribution Width ', 'rdwsd', 'RDW-SD', NULL, '2', '35', '56', 'fl', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (106, '红细胞分布宽度-变异系数', 'Red Cell volume Distribution Width ', 'rdwcv', 'RDW-CV', NULL, '2', '11', '16', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (107, '同型半胱氨酸', 'Homocysteine', 'hcy', 'Hcy', NULL, '5', '5', '15', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (108, '红细胞计数', 'Erythrocyte Count', 'ec', NULL, NULL, '2', '3.8', '5.1', '10^12/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (109, '血小板压积', 'Hematocrit', 'pct', 'PCT', NULL, '2', '0.11', '0.28', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (110, '血小板', 'platelet', 'platelet', NULL, NULL, '2', '100', '300', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (111, '单核细胞', 'monocytes', 'monocytes', NULL, NULL, '2', NULL, NULL, '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (112, '单核细胞百分比', 'monocytes', 'monocytesPrec', 'MONO%', NULL, '2', '3', '8', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (113, '单核细胞绝对值', 'monocytes', 'monocytesAbso', 'MONO#', NULL, '2', '0.12', '0.8', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (114, '嗜酸性粒细胞百分比', 'eosinophil', 'eosinophilPrec', 'EOS%', NULL, '2', '0.5', '5', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (115, '嗜酸性粒细胞绝对值', 'eosinophil', 'eosinophilAbso', 'EOS#', NULL, '2', '0.05', '0.5', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (116, '嗜酸细胞提示', 'acidophilicgranulocyte', 'eosinophilTip', NULL, NULL, '2', NULL, NULL, '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (117, '嗜碱性粒细胞百分比', 'basophil', 'basophilPrec', 'BASO%', NULL, '2', '0', '1', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (118, '嗜碱性粒细胞绝对值', 'basophil', 'basophilAbso', 'BASO#', NULL, '2', '0', '0.1', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (119, '尿比重', 'Specific gravity', 'sg', 'SG', NULL, '3', '1.015', '1.025', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (120, '血清尿酸', 'serum uric acid', 'sua', 'SUA', NULL, '3', '155', '357', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (121, '尿酸', 'Uric acid', 'ua', 'UA', NULL, '3', '208', '428', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (122, '尿白细胞', 'Leukocytes in urine', 'leu', 'LEU', NULL, '3', NULL, '阴性', 'Cell/uL', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (123, '血红蛋白', 'Hemoglobin', 'hgb', 'HGB', NULL, '2', '115', '150', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (124, '尿亚硝酸盐', 'Urinary nitrite', 'nit', 'NIT', NULL, '3', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (125, '尿蛋白质', 'Urine protein', 'pro', 'PRO', NULL, '3', NULL, '阴性', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (126, '尿糖', 'glycosuria', 'glycosuria', NULL, NULL, '3', NULL, '阴性', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (127, '尿酮体', 'Ketone', 'ketone', 'KET', NULL, '3', NULL, '阴性', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (128, '铁蛋白', 'Ferritin', 'ferritin', 'Fer', NULL, '5', NULL, NULL, 'μg/L', '男性:约15－200ug/L；女性:约12－150ug/L', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (129, '尿胆原', 'Urobilinogen', 'ubg', 'UBG', NULL, '3', NULL, '阴性', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (130, '尿胆红素', 'Bilirubin', 'bilirubin', 'BIL', NULL, '3', NULL, '阴性', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (131, '尿潜血', NULL, 'bld', 'BLD', NULL, '3', NULL, '阴性', 'Cell/uL', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (132, '便潜血', 'Fecal occult blood', 'ob', 'OB', NULL, '4', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (133, '尿镜检红细胞', 'Urine microscopy erythrocyte', 'ume', NULL, NULL, '3', '0', '3', '个', '正常人尿沉渣镜检红细胞为0～偶见/高倍视野', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (134, '胃蛋白酶原Ⅰ', 'pepsinogen1', 'pepsinogen1', 'PGⅠ', NULL, '5', '67', '200', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (135, '胃蛋白酶原Ⅰ/Ⅱ', 'pepsinogen1/2', 'pepsinogen12', 'PGI/PGII', NULL, '5', '7.5', NULL, 'nmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (136, '胃蛋白酶原Ⅱ', 'pepsinogen2', 'pepsinogen2', 'PGⅡ', NULL, '5', '0', '15', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (137, '尿镜检白细胞', 'Urine microscopy hemameba', 'umh', NULL, NULL, '3', '0', '5', '个', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (138, '管型', 'Urinary cast', 'urinaryCast', NULL, NULL, '3', '0', '1.5', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (139, '尿液其它', 'Urine other', 'urineOther', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (140, '上皮细胞', 'Epithelial Cell', 'epithelialCell', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (141, '无机盐类', 'mineral salt', 'mineralSalt', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (142, '红细胞压积', 'packed cell  volume', 'hct', 'HCT', '红细胞压积（PCV）是旧称，现在称红细胞比容（Hct）', '2', '0.35', '0.45', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (143, '天门冬氨酸氨基转移酶', 'Aspartate aminotransferase', 'ast', 'AST', '俗称：谷草转氨酶', '5', '13', '35', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (144, '丙氨酸氨基转移酶', 'Alanine aminotransferase', 'alt', 'ALT', '俗称：谷丙转氨酶', '5', '7', '40', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (145, '谷酰转酞酶', 'glutamyltransferase', 'ggt', 'GGT', '其他名称：γ-谷氨酰转移酶', '5', NULL, '50', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (146, 'HPV6型', NULL, 'hpv6', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (147, 'HPV11型', NULL, 'hpv11', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (148, 'HPV16型', NULL, 'hpv16', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (149, 'HPV18型', NULL, 'hpv18', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (150, 'HPV26型', NULL, 'hpv26', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (151, 'HPV31型', NULL, 'hpv31', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (152, 'HPV33型', NULL, 'hpv33', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (153, 'HPV35型', NULL, 'hpv35', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (154, 'HPV39型', NULL, 'hpv39', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (155, 'HPV40型', NULL, 'hpv40', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (156, 'HPV42型', NULL, 'hpv42', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (157, 'HPV43型', NULL, 'hpv43', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (158, 'HPV44型', NULL, 'hpv44', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (159, 'HPV45型', NULL, 'hpv45', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (160, 'HPV51型', NULL, 'hpv51', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (161, 'HPV52型', NULL, 'hpv52', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (162, 'HPV53型', NULL, 'hpv53', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (163, 'HPV55型', NULL, 'hpv55', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (164, 'HPV56型', NULL, 'hpv56', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (165, 'HPV58型', NULL, 'hpv58', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (166, 'HPV59型', NULL, 'hpv59', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (167, 'HPV61型', NULL, 'hpv61', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (168, 'HPV66型', NULL, 'hpv66', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (169, 'HPV68型', NULL, 'hpv68', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (170, 'HPV81型', NULL, 'hpv81', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (171, 'HPV82型', NULL, 'hpv82', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (172, 'HPV83型', NULL, 'hpv83', NULL, NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (173, '碱性磷酸酶(ALP)', 'alkaline phosphatase', 'alp', 'ALP', NULL, '5', '40', '150', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (174, '胆碱酯酶', 'cholinesterase', 'cholinesterase', 'ChE', NULL, '5', '5320', '12920', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (175, '总胆红素', 'total bilirubin', 'tbil', 'TBIL', NULL, '5', '1.7', '17.1', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (176, '直接胆红素', 'Direct Bilirubin', 'dbil', 'DBIL', NULL, '5', '0', '6.8', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (177, '间接胆红素', 'Indirect Bilirubin', 'ibil', 'IBIL', NULL, '5', '1.7', '10.2', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (178, '平均红细胞体积', 'mean corpuscular volume', 'mcv', 'MCV', NULL, '2', '82', '100', 'fL', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (179, '总蛋白', 'TotalProtein', 'tp', 'TP', NULL, '5', '60', '80', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (180, '白蛋白(ALB)', 'Albumin', 'alb', 'ALB', NULL, '5', '35', '55', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (181, '球蛋白', 'Globulin', 'globulin', 'GLO', NULL, '5', '20', '40', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (182, '白蛋白/球蛋白比值', 'Albumin globulin ratio', 'agr', 'A/G', NULL, '5', NULL, NULL, NULL, '(1.2-2.4):1', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (183, '尿素', 'Urea ', 'urea', 'UREA', NULL, '5', '2.6', '7.5', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (184, '肌酐', 'creatinine', 'cre', 'Cre', NULL, '5', '41', '73', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (185, '肌酐(血)', 'Serum creatinine', 'scr', 'Scr', NULL, '5', '44', '133', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (186, '空腹血葡萄糖', 'Fasting blood glucose', 'fbg', 'FBG', NULL, '5', '3.9', '6.1', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (187, '糖化血红蛋白', 'glycated hemoglobin', 'ghb', 'GHb', NULL, '5', '4.8', '5.9', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (188, '平均红细胞血红蛋白含量', 'mean corpuscular hemoglobin', 'mch', 'MCH', NULL, '2', '27', '34', 'pg', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (189, '平均红细胞血红蛋白浓度', 'Mean corpuscular hemoglobin concentration', 'mchc', 'MCHC', NULL, '2', '316', '354', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (190, '总胆固醇', 'total cholesterol', 'tcho', 'TCHO', NULL, '5', NULL, NULL, 'mmol/L', '理想范围:<5.18; 边缘升高:5.18-6 .19;升高:≥6.22', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (191, '低密度脂蛋白(LDL)', 'LDL', 'ldl', 'LDL', NULL, '5', NULL, '3.37', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (192, '低密度脂蛋白(LDL-C)', 'Low-Density Lipoprotein Cholesterol', 'ldlc', 'LDL-C', NULL, '5', NULL, NULL, 'mmol/L', '理想范围:<3.37; 边缘升高:3.37-4 .12;增高:>4.14', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (193, '载脂蛋白-A1', NULL, 'apoA1', 'ApoA-Ⅰ', NULL, '5', '1.04', '2.25', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (194, '载脂蛋白-B', NULL, 'apoB', 'ApoB', NULL, '5', '0.6', '1.33', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (195, '脂蛋白(a)', 'Lipoprotein(a)', 'lpA', 'Lp(A)', NULL, '5', NULL, '75', 'nmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (196, '肌酸激酶', 'creatine kinase', 'ck', 'CK', NULL, '5', '39', '208', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (197, '肌酸激酶同工酶', 'creatine kinase isoenzymes', 'cki', 'cki', NULL, '5', NULL, '25', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (198, '乳酸脱氢酶', 'Lactate dehydrogenase', 'ldh', 'LDH', NULL, '5', '135', '250', 'U/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (199, '胸部', 'chest', 'chest', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (200, '肝', 'liver', 'liver', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (201, '双肾', 'Both kidneys', 'bothKidneys', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (202, '子宫', 'uterus', 'uterusUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (203, '胆', 'gallbladder', 'gallbladderUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (204, '附件', 'adnexal', 'adnexalUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (205, '胰', 'pancreas', 'pancreasUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (206, '脾', 'spleen', 'spleenUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (207, '前列腺', 'prostate', 'prostate', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (208, '乳腺', 'milk gland', 'mgUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (209, '甲状腺', 'thyroid', 'thyroidUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (210, '颈动脉', 'carotid artery', 'caUlt', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (211, '腹部', 'abdomen', 'abdomen', NULL, '超声波', '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (212, '心电图检查', 'ECG examination', 'ecg', 'ECG', NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (213, '骨密度检测', 'bone density determination', 'bmd', 'BMD', NULL, '14', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (214, '雌二醇', 'Estradiol', 'estradiol', NULL, NULL, '6', NULL, NULL, 'pmol/L', '正常值范围大约是：排卵前期：48-521pmol/L；排卵期：70-1835pmol/L；排卵后期：272-793pmol/L；', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (215, '促卵泡成熟素（FSH）', 'follicle-stimulating hormone', 'fsh', 'FSH', NULL, '6', NULL, NULL, 'mu/mI', '女性1.7～8.5mu/mI月经周期中卵泡期水平比黄体期高，周期中期出现一高峰；男性0.9～9.8mu/ml 均在50岁以后由于性腺功能减退而有增高趋势。', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (216, 'HPV检查', 'Human Papillomavirus', 'hpv', 'HPV', NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (217, '胰岛素', 'insulin', 'ins', 'INS', NULL, '3', '5', '20', 'mIU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (218, '促黄体生成激素', 'luteinizing hormone', 'lh', 'LH', NULL, '6', NULL, NULL, 'IU/L', '男:1.5-9.3IU/L、女卵泡期:1.9-12.5IU/L、女排卵期:8.7-76.3IU/L、女黄体期:0.5-16.9IU/L、女绝经期15.9-54IU/L、女妊娠期0-1.5IU/L', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (219, 'PH值', 'PH', 'ph', 'PH', NULL, '3', '4.6', '8', NULL, '尿液的ph值', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (220, '孕酮', 'Progestin', 'progestin', NULL, NULL, '6', '0.3', '2.5', 'nmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (221, 'TCT检查', 'Thinprep cytologic test', 'tct', 'TCT', NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (222, '睾酮', 'Testosterone', 'testosterone', NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (223, 'X线检查', NULL, 'xray', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (224, '白细胞', 'white blood cell', 'wbc', 'WBC', NULL, '2', '4', '10', '10^9/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (225, '丙型肝炎抗体', 'HCV－Ab', 'hcvab', 'HCV-Ab', NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (226, '催乳素', 'prolactin', 'prl', 'PRL', NULL, '6', '4.79', '23.3', 'IU/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (227, '大血小板比率', 'P-LCR', 'plcr', 'P-LCR', NULL, '2', '13', '43', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (228, '甘油三脂（TRIG)', 'Triglyceride', 'tg', 'TG', '血清甘油三酯测定(TG)', '2', '0.56', '1.7', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (229, '高密度脂蛋白(HDL)', 'high-density lipoprotein', 'hdl', 'HDL', NULL, '2', '0.7', '2', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (230, '高密度脂蛋白(HDL-C)', 'High-density lipoprotein cholesterol', 'hdlc', 'HDL-C', NULL, '2', NULL, NULL, 'mmol/L', '理想范围:>1.04; 升高:≥1.55;降 低:<1.04', NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (231, '红细胞', 'red blood cell', 'rbc', 'RBC', NULL, '2', '3.5', '5.5', '10^12/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (232, '梅毒螺旋体特异性抗体', 'treponema pallidum antibody', 'tpha', 'TPHA', NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (233, '尿素氮', NULL, 'bun', 'BUN', NULL, '3', '2.86', '7.14', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (234, '葡萄糖', 'glucose', 'glucose', NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (235, '前列腺特异性抗原', 'Prostate specific antigen', 'psa', 'PSA', NULL, '5', '0', '4.1', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (236, '人类免疫缺陷病毒抗体检测', NULL, 'hiv', 'HIV', NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (237, '神经元特异性烯醇化酶', 'neuron-specific enolase', 'nse', 'NSE', NULL, '5', '0', '15.2', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (238, '酮体', 'ketone body', 'ketosome', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (239, '微白蛋白', 'Microalbumin', 'malb', 'MALB', NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (240, '维生素B12', 'Vitamin B12', 'vitaminB12', NULL, NULL, '2', '191', '946', 'ng/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (241, '维生维C', 'Vitamin C', 'vitaminC', NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (242, '胃幽门螺杆菌抗体检测', 'helicobacter pylori antibody', 'hpab', 'Hp-Ab', NULL, '5', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (243, '血清C肽', 'Serum C-peptide', 'serumC', NULL, NULL, '2', '0.37', '1.47', 'nmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (244, '血清前白蛋白', NULL, 'pa', 'PA', NULL, '2', '0.2', '0.4', 'g/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (245, '血清叶酸', 'Serum folate', 'sfa', 'SFA', NULL, '2', '4.6', '0', 'μg/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (246, '血清总胆固醇测定(TC)', NULL, 'tc', 'TC', NULL, '2', '0', '5.18', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (247, '血糖（GLU)', 'Blood glucose', 'glu', 'Glu', NULL, '2', '3.9', '6.1', 'mmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (248, '血细胞压积', 'packed cell  volume', 'pcv', 'PCV', NULL, '2', '31', '48', '%', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (249, '颜色', 'Color', 'color', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (250, '乙肝e抗体定性', 'Qualitative analysis of hepatitis B e antibody', 'khbe', 'k-HBe', NULL, '2', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (251, '乙肝e抗原定性', NULL, 'hbeab', 'HBeAb', NULL, '2', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (252, '乙肝表面抗体定性', NULL, 'khbs', 'k-HBs', NULL, '2', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (253, '乙肝表面抗原定性', NULL, 'hbsag', 'HBsAg', NULL, '2', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (254, '乙肝核心抗体定性', NULL, 'khbc', 'k-HBC', NULL, '2', NULL, '阴性', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (255, '中医体质辨识(离退职工项目)', 'Identification of constitution of traditional Chinese Medicine', 'tcm', 'TCM', NULL, '17', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (256, '总胆汁酸', 'total bile acid', 'tba', 'TBA', NULL, '2', '0', '10', 'μmol/L', NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (257, '眼科小结', 'Summary of Ophthalmology', 'soo', NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (258, '妇科小结', 'Summary of Gynecology', 'sog', NULL, NULL, '9', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (259, '心电图室小结', 'Summary of ECG room', 'soECG', NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (260, '内科小结', 'Summary of Internal Medicine', 'soim', NULL, NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (261, '外科小结', 'Summary of surgery', 'sos', NULL, NULL, '8', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (262, '骨密度检查室小结', 'Summary of bone mineral density examination room', 'soBMD', NULL, NULL, '14', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (263, '耳鼻咽喉科小结', 'Summary of Otorhinolaryngology', 'soENT', NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (264, '放射科小结', 'Summary of Radiology Department', 'sord', NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (265, '口腔科小结', 'Summary of Stomatology', 'soft', NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (266, '检验科小结', 'Laboratory summary', 'ls', NULL, NULL, '检验科小结', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (267, '超声检查室小结', 'Summary of ultrasound examination room', 'soue', NULL, NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (268, '一般检查室小结', 'Summary of general examination room', 'soger', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (269, '总检建议', 'General inspection suggestion', 'gis', NULL, NULL, '总检建议', NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for physical_report
-- ----------------------------
DROP TABLE IF EXISTS `physical_report`;
CREATE TABLE `physical_report`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `identity_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `physical_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体检编号',
  `customer_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `physical_date` date NULL DEFAULT NULL COMMENT '体检日期',
  `version` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `year_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年份标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17141 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_report
-- ----------------------------
INSERT INTO `physical_report` VALUES (17132, '110102193512132726', '1404250061', '467', '2014-06-06', NULL, NULL, '2021-02-22 02:15:51', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17133, '110108193806266023', '1404250062', '468', '2014-06-03', NULL, NULL, '2021-02-22 02:15:53', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17134, '110104194309051223', '1404250064', '470', '2014-05-20', NULL, NULL, '2021-02-22 02:15:55', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17135, '110108194102146028', '1404250019', '425', '2014-06-02', NULL, NULL, '2021-02-22 02:15:57', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17136, '110108193212186026', '1404250020', '426', '2014-06-03', NULL, NULL, '2021-02-22 02:15:58', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17137, '152628198205035726', '1404250198', '604', '2014-06-08', NULL, NULL, '2021-02-22 02:16:00', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17138, '132524198011120047', '1404250200', '606', '2014-06-13', NULL, NULL, '2021-02-22 02:16:02', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17139, '11010819560726602X', '1404280418', '5234', '2014-06-05', NULL, NULL, '2021-02-22 02:16:04', 'c199fd5d58bd4fd990a951ce3ebe35bb');
INSERT INTO `physical_report` VALUES (17140, '110102195811072363', '1404280419', '5235', '2014-06-04', NULL, NULL, '2021-02-22 02:16:06', 'c199fd5d58bd4fd990a951ce3ebe35bb');

-- ----------------------------
-- Table structure for physical_report_item
-- ----------------------------
DROP TABLE IF EXISTS `physical_report_item`;
CREATE TABLE `physical_report_item`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `report_id` bigint(11) NOT NULL COMMENT '报告id',
  `inspection_item` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目',
  `measuring_result` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量结果',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `item_type` int(2) NULL DEFAULT 0 COMMENT '检查项目 1: 一般项目检查  2:血常规 3:尿常规 4:便隐血 5:实验室检查 6: 性激素六项 7：内科 8：外科 9：妇科 10： 眼科 11：耳鼻咽喉科 12：心电图室 13：超声检查室 14：骨密度检查室 15：放射科 16：口腔检查 17：中医体质辨识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_report_item
-- ----------------------------
INSERT INTO `physical_report_item` VALUES (1226, 17132, '甲胎蛋白', '1.6', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1227, 17132, '癌胚抗原', '0.66', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1228, 17132, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1229, 17132, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1230, 17132, '丙氨酸氨基转移酶', '12', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1231, 17132, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1232, 17132, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1233, 17132, '天门冬氨酸氨基转移酶', '15', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1234, 17132, '白细胞', '4.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1235, 17132, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1236, 17132, '体重指数', '29', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1237, 17132, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1238, 17132, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1239, 17132, '糖类抗原15-3', '3.53', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1240, 17132, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1241, 17132, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1242, 17132, '总胆固醇', '5.52', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1243, 17132, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1244, 17132, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1245, 17132, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1246, 17132, '肌酐', '58', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1247, 17132, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1248, 17132, '单核细胞百分比', '5.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1249, 17132, '单核细胞', '0.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1250, 17132, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1251, 17132, '胃蛋白酶原Ⅰ', '93.4', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1252, 17132, '胃蛋白酶原Ⅰ/Ⅱ', '5.2', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1253, 17132, '胃蛋白酶原Ⅱ', '18.1', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1254, 17132, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1255, 17132, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1256, 17132, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1257, 17132, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1258, 17132, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1259, 17132, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1260, 17132, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1261, 17132, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1262, 17132, '腹部', '脂肪肝 肝内钙化灶 肾囊肿 肾皮质变薄结构紊乱', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1263, 17132, '妇科其它', '子宫全切术后 外阴脂肪瘤 老年性阴道炎', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1264, 17132, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1265, 17132, '血糖（GLU)', '6.44', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1266, 17132, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1267, 17132, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1268, 17132, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1269, 17132, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1270, 17132, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1271, 17132, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1272, 17132, '红细胞压积', '33.6', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1273, 17132, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1274, 17132, '高密度脂蛋白(HDL)', '1.46', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1275, 17132, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1276, 17132, '红细胞', '4.14', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1277, 17132, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1278, 17132, '红细胞分布宽度-变异系数', '13.6', '%', 2);
INSERT INTO `physical_report_item` VALUES (1279, 17132, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1280, 17132, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1281, 17132, '颈动脉', '颈动脉内中膜增厚伴斑块形成', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1282, 17132, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1283, 17132, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1284, 17132, '低密度脂蛋白(LDL)', '3.21', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1285, 17132, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1286, 17132, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1287, 17132, '淋巴细胞百分比', '41.4', '%', 2);
INSERT INTO `physical_report_item` VALUES (1288, 17132, '淋巴细胞绝对值', '1.9', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1289, 17132, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1290, 17132, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1291, 17132, '内科', '', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1292, 17132, '尿比重', '1.01', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1293, 17132, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1294, 17132, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1295, 17132, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1296, 17132, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1297, 17132, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1298, 17132, '血小板压积', '0.1', '%', 2);
INSERT INTO `physical_report_item` VALUES (1299, 17132, 'PH值', '6', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1300, 17132, '平均红细胞血红蛋白含量', '28.3', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1301, 17132, '平均红细胞血红蛋白浓度', '348', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1302, 17132, '血小板', '149', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1303, 17132, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1304, 17132, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1305, 17132, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1306, 17132, '尿潜血', '10', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1307, 17132, '乳腺', '双副乳：建议定期复查。', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1308, 17132, '收缩压', '167', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1309, 17132, '舒张压', '90', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1310, 17132, '身高', '147', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1311, 17132, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1312, 17132, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1313, 17132, '糖类抗原125（CA125）', '7.28', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1314, 17132, '糖类抗原19-9（CA19-9）', '10.55', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1315, 17132, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1316, 17132, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1317, 17132, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1318, 17132, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1319, 17132, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1320, 17132, '糖化血红蛋白', '6.8', '%', 5);
INSERT INTO `physical_report_item` VALUES (1321, 17132, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1322, 17132, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1323, 17132, '甘油三脂（TRIG)', '1.87', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1324, 17132, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1325, 17132, '尿酸', '343', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1326, 17132, '尿素', '4.38', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1327, 17132, '外科', '双膝骨性关节病：建议动态观察，骨科随诊。 混合痔', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1328, 17132, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1329, 17132, '体重', '62.6', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1330, 17132, '平均红细胞体积', '81.2', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1331, 17132, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1332, 17132, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1333, 17132, '平均血小板体积', '7.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1334, 17132, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1335, 17132, '血红蛋白', '117', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1336, 17132, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1337, 17132, '血小板分布宽度', '19.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1338, 17132, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1339, 17132, '眼科其它', '老年性白内障 视网膜动脉硬化', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1340, 17132, '腰围', '93', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1341, 17132, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1342, 17132, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1343, 17132, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1344, 17132, '总检建议', '1、体重指数偏高：建议合理饮食、均衡营养，控制热量摄入，增加运动量，有计划的适当减轻体重。 2、血压高：密切观察血压变化，确定有无高血压病，必要时心内科就诊。 3、双眼底视网膜动脉硬化：注意控制血压、血糖及血脂在正常范围，保持正常体重，必要时抗动脉硬化治疗。 4、老年性白内障：眼科门诊观察治疗。 5、双膝骨性关节病：建议动态观察，骨科随诊。 6、混合痔：尽量避免进食刺激性食物，保持大便通畅，便后注意清洗，多做提肛运动。必要时肛肠科就诊。 7、外阴脂肪瘤：建议专科诊治。 8、老年性阴道炎：妇科门诊治疗。 9、TCT未见上皮内病变及恶性细胞(NILM)、良性反应细胞改变（轻度炎症）:建议定期复查。 10、脂肪肝：低脂饮食，适当运动，不过量饮酒，注意保肝。建议复查，结合临床专科诊治。 11、肝内钙化灶：定期复查，结合临床专科诊治。 12、右肾囊肿：定期复查，必要时泌尿外科就诊。 13、双肾皮质变薄结构紊乱：建议结合临床，专科诊治。 14、双副乳：建议定期复查。 15、颈动脉内中膜增厚伴斑块形成：建议定期复查，结合临床专科诊治。 16、尿酸高：限食海鲜、动物内脏及豆类等食品，限酒。注意复查，结合临床症状，内科就医药物治疗。 17、甘油三脂高、低密度脂蛋白高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 18、胃蛋白酶原Ⅱ高、胃蛋白酶原Ⅰ /胃蛋白酶原Ⅱ低：建议复查，结合临床专科诊治 19、血糖高、糖化血红蛋白高：请适度控制主食量和甜食，适当增加运动，控制体重。如无糖尿病史，建议到内分泌科就诊，做糖耐量试验,明确诊断。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1345, 17132, '中性粒细胞百分比', '52.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1346, 17132, '中性粒细胞绝对值', '2.5', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1347, 17132, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1348, 17133, '甲胎蛋白', '1.55', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1349, 17133, '癌胚抗原', '1.69', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1350, 17133, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1351, 17133, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1352, 17133, '丙氨酸氨基转移酶', '12', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1353, 17133, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1354, 17133, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1355, 17133, '天门冬氨酸氨基转移酶', '19', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1356, 17133, '白细胞', '9', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1357, 17133, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1358, 17133, '体重指数', '30.2', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1359, 17133, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1360, 17133, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1361, 17133, '糖类抗原15-3', '19.96', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1362, 17133, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1363, 17133, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1364, 17133, '总胆固醇', '4.47', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1365, 17133, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1366, 17133, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1367, 17133, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1368, 17133, '肌酐', '62', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1369, 17133, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1370, 17133, '单核细胞百分比', '3.1', '%', 2);
INSERT INTO `physical_report_item` VALUES (1371, 17133, '单核细胞', '0.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1372, 17133, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1373, 17133, '胃蛋白酶原Ⅰ', '109', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1374, 17133, '胃蛋白酶原Ⅰ/Ⅱ', '17.2', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1375, 17133, '胃蛋白酶原Ⅱ', '6.3', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1376, 17133, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1377, 17133, '耳鼻咽喉科其它', '双耳神经性聋', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1378, 17133, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1379, 17133, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1380, 17133, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1381, 17133, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1382, 17133, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1383, 17133, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1384, 17133, '腹部', '脂肪肝', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1385, 17133, '妇科其它', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1386, 17133, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1387, 17133, '血糖（GLU)', '6.17', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1388, 17133, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1389, 17133, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1390, 17133, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1391, 17133, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1392, 17133, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1393, 17133, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1394, 17133, '红细胞压积', '36.2', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1395, 17133, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1396, 17133, '高密度脂蛋白(HDL)', '1.3', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1397, 17133, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1398, 17133, '红细胞', '4.35', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1399, 17133, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1400, 17133, '红细胞分布宽度-变异系数', '13.7', '%', 2);
INSERT INTO `physical_report_item` VALUES (1401, 17133, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1402, 17133, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1403, 17133, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1404, 17133, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1405, 17133, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1406, 17133, '低密度脂蛋白(LDL)', '2.11', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1407, 17133, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1408, 17133, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1409, 17133, '淋巴细胞百分比', '25.3', '%', 2);
INSERT INTO `physical_report_item` VALUES (1410, 17133, '淋巴细胞绝对值', '2.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1411, 17133, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1412, 17133, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1413, 17133, '内科', '', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1414, 17133, '尿比重', '1.015', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1415, 17133, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1416, 17133, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1417, 17133, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1418, 17133, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1419, 17133, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1420, 17133, '血小板压积', '0.19', '%', 2);
INSERT INTO `physical_report_item` VALUES (1421, 17133, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1422, 17133, '平均红细胞血红蛋白含量', '28.5', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1423, 17133, '平均红细胞血红蛋白浓度', '343', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1424, 17133, '血小板', '199', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1425, 17133, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1426, 17133, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1427, 17133, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1428, 17133, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1429, 17133, '乳腺', '左乳导管局限性扩张0.3cm：建议复查，专科诊治。', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1430, 17133, '收缩压', '119', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1431, 17133, '舒张压', '82', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1432, 17133, '身高', '148', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1433, 17133, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1434, 17133, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1435, 17133, '糖类抗原125（CA125）', '5', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1436, 17133, '糖类抗原19-9（CA19-9）', '14.95', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1437, 17133, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1438, 17133, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1439, 17133, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1440, 17133, 'TCT检查', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1441, 17133, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1442, 17133, '糖化血红蛋白', '6.4', '%', 5);
INSERT INTO `physical_report_item` VALUES (1443, 17133, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1444, 17133, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1445, 17133, '甘油三脂（TRIG)', '2.34', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1446, 17133, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1447, 17133, '尿酸', '372', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1448, 17133, '尿素', '4.62', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1449, 17133, '外科', '乳腺增生：加强自检，乳腺专科随诊复查。', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1450, 17133, '维生维C', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1451, 17133, '体重', '66.1', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1452, 17133, '平均红细胞体积', '83.2', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1453, 17133, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1454, 17133, 'X线检查', '胸片提示脊柱侧弯。 胸片示颈椎术后改变。', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1455, 17133, '平均血小板体积', '10', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1456, 17133, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1457, 17133, '血红蛋白', '124', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1458, 17133, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1459, 17133, '血小板分布宽度', '17.4', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1460, 17133, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1461, 17133, '眼科其它', '眼结膜炎 老年性白内障 视网膜动脉硬化', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1462, 17133, '腰围', '96', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1463, 17133, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1464, 17133, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1465, 17133, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1466, 17133, '总检建议', '1、体重指数偏高：建议合理饮食、均衡营养，控制热量摄入，增加运动量，有计划的适当减轻体重。 2、眼结膜炎：建议眼科治疗 3、老年性白内障：定期复查，建议眼科随诊。 4、眼底视网膜动脉硬化：注意控制血压、血糖及血脂在正常范围，保持正常体重，必要时抗动脉硬化治疗。 5、双耳神经性聋:建议专科诊治。 6、外科乳腺增生,左乳导管局限性扩张0.3cm：建议复查，专科诊治。 7、外科颈椎部脊椎生理弯曲消失，周围肌肉僵直；肩关节活动障碍 手指关节畸形：建议结合临床，专科诊治。 8、胸片示颈椎术后改变：请结合临床，定期复查。 9、胸片提示脊柱侧弯：请结合临床有无意义，必要时复查。 10、脂肪肝：低脂饮食，适当运动，不过量饮酒，注意保肝。建议复查，结合临床专科诊治。 11、尿酸高：限食海鲜、动物内脏及豆类等食品，限酒。注意复查，结合临床症状，内科就医药物治疗。 12、甘油三脂高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 13、血糖高、糖化血红蛋白高：请适度控制主食量和甜食，适当增加运动，控制体重。如无糖尿病史，建议到内分泌科就诊，做糖耐量试验,明确诊断。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1467, 17133, '中性粒细胞百分比', '71.6', '%', 2);
INSERT INTO `physical_report_item` VALUES (1468, 17133, '中性粒细胞绝对值', '6.4', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1469, 17133, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1470, 17134, '甲胎蛋白', '0.87', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1471, 17134, '癌胚抗原', '0.2', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1472, 17134, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1473, 17134, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1474, 17134, '丙氨酸氨基转移酶', '28', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1475, 17134, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1476, 17134, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1477, 17134, '天门冬氨酸氨基转移酶', '28', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1478, 17134, '白细胞', '75', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1479, 17134, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1480, 17134, '体重指数', '', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1481, 17134, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1482, 17134, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1483, 17134, '糖类抗原15-3', '24.19', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1484, 17134, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1485, 17134, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1486, 17134, '总胆固醇', '6.01', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1487, 17134, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1488, 17134, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1489, 17134, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1490, 17134, '肌酐', '82', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1491, 17134, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1492, 17134, '单核细胞百分比', '7.5', '%', 2);
INSERT INTO `physical_report_item` VALUES (1493, 17134, '单核细胞', '0.5', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1494, 17134, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1495, 17134, '胃蛋白酶原Ⅰ', '146.6', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1496, 17134, '胃蛋白酶原Ⅰ/Ⅱ', '12.4', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1497, 17134, '胃蛋白酶原Ⅱ', '11.8', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1498, 17134, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1499, 17134, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1500, 17134, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1501, 17134, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1502, 17134, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1503, 17134, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1504, 17134, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1505, 17134, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1506, 17134, '腹部', '肝囊肿', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1507, 17134, '妇科其它', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1508, 17134, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1509, 17134, '血糖（GLU)', '4.84', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1510, 17134, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1511, 17134, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1512, 17134, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1513, 17134, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1514, 17134, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1515, 17134, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1516, 17134, '红细胞压积', '34.5', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1517, 17134, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1518, 17134, '高密度脂蛋白(HDL)', '1.34', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1519, 17134, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1520, 17134, '红细胞', '4.1', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1521, 17134, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1522, 17134, '红细胞分布宽度-变异系数', '12.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1523, 17134, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1524, 17134, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1525, 17134, '颈动脉', '颈动脉内中膜增厚伴斑块形成', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1526, 17134, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1527, 17134, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1528, 17134, '低密度脂蛋白(LDL)', '3.92', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1529, 17134, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1530, 17134, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1531, 17134, '淋巴细胞百分比', '42.5', '%', 2);
INSERT INTO `physical_report_item` VALUES (1532, 17134, '淋巴细胞绝对值', '3.1', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1533, 17134, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1534, 17134, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1535, 17134, '内科', '有慢性肾炎史 高血压病', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1536, 17134, '尿比重', '1.025', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1537, 17134, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1538, 17134, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1539, 17134, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1540, 17134, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1541, 17134, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1542, 17134, '血小板压积', '0.14', '%', 2);
INSERT INTO `physical_report_item` VALUES (1543, 17134, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1544, 17134, '平均红细胞血红蛋白含量', '29', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1545, 17134, '平均红细胞血红蛋白浓度', '345', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1546, 17134, '血小板', '178', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1547, 17134, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1548, 17134, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1549, 17134, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1550, 17134, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1551, 17134, '乳腺', '双乳腺增生：加强自检，定期复查，专科随诊。', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1552, 17134, '收缩压', '154', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1553, 17134, '舒张压', '77', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1554, 17134, '身高', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1555, 17134, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1556, 17134, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1557, 17134, '糖类抗原125（CA125）', '7.94', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1558, 17134, '糖类抗原19-9（CA19-9）', '7.39', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1559, 17134, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1560, 17134, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1561, 17134, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1562, 17134, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症伴萎缩）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1563, 17134, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1564, 17134, '糖化血红蛋白', '6.2', '%', 5);
INSERT INTO `physical_report_item` VALUES (1565, 17134, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1566, 17134, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1567, 17134, '甘油三脂（TRIG)', '1.65', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1568, 17134, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1569, 17134, '尿酸', '403', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1570, 17134, '尿素', '7.49', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1571, 17134, '外科', '乳腺增生：加强自检，乳腺专科随诊复查。 髌骨软化：建议动态观察，骨科随诊。 混合痔', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1572, 17134, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1573, 17134, '体重', '', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1574, 17134, '平均红细胞体积', '84.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1575, 17134, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1576, 17134, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1577, 17134, '平均血小板体积', '8.2', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1578, 17134, '心电图检查', '窦性心律，ST改变', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1579, 17134, '血红蛋白', '119', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1580, 17134, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1581, 17134, '血小板分布宽度', '18.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1582, 17134, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1583, 17134, '眼科其它', '老年性白内障', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1584, 17134, '腰围', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1585, 17134, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1586, 17134, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1587, 17134, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1588, 17134, '总检建议', '1、有高血压病史、本次测量血压仍高：请密切监测血压，心内科门诊随诊，正规服用降压药物。保持健康的生活方式，控制血压、血糖及血脂在正常范围，积极预防心脑肾等重要脏器并发症的出现。 2、老年性白内障：眼科门诊观察治疗。 3、髌骨软化：建议动态观察，骨科随诊。 4、混合痔：尽量避免进食刺激性食物，保持大便通畅，便后注意清洗，多做提肛运动。必要时肛肠科就诊。 5、TCT未见上皮内病变及恶性细胞（NILM）良性反应细胞改变（轻度炎症伴萎缩）：建议定期复查。 6、心电图提示ST改变：注意复查，必要时心内科就诊。 7、肝囊肿：定期复查，必要时肝胆外科门诊就诊。 8、双乳腺增生：加强自检，定期复查，专科随诊。 9、颈动脉内中膜增厚伴斑块形成：建议定期复查，结合临床专科诊治。 10、既往史慢性肾炎史；化验血肌酐高、尿酸高：建议复查，专科诊治。 11、总胆固醇高、低密度脂蛋白高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 12、糖化血红蛋白高：请适度控制主食和甜食，适当增加运动，控制体重，监测血糖。如无糖尿病史，建议到内分泌科就诊，做糖耐量试验,明确诊断。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1589, 17134, '中性粒细胞百分比', '50', '%', 2);
INSERT INTO `physical_report_item` VALUES (1590, 17134, '中性粒细胞绝对值', '3.6', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1591, 17134, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1592, 17135, '甲胎蛋白', '1.52', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1593, 17135, '癌胚抗原', '6.85', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1594, 17135, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1595, 17135, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1596, 17135, '丙氨酸氨基转移酶', '21', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1597, 17135, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1598, 17135, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1599, 17135, '天门冬氨酸氨基转移酶', '18', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1600, 17135, '白细胞', '6.5', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1601, 17135, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1602, 17135, '体重指数', '23.5', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1603, 17135, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1604, 17135, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1605, 17135, '糖类抗原15-3', '20.24', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1606, 17135, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1607, 17135, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1608, 17135, '总胆固醇', '6.47', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1609, 17135, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1610, 17135, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1611, 17135, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1612, 17135, '肌酐', '70', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1613, 17135, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1614, 17135, '单核细胞百分比', '5.3', '%', 2);
INSERT INTO `physical_report_item` VALUES (1615, 17135, '单核细胞', '0.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1616, 17135, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1617, 17135, '胃蛋白酶原Ⅰ', '91.4', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1618, 17135, '胃蛋白酶原Ⅰ/Ⅱ', '7.2', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1619, 17135, '胃蛋白酶原Ⅱ', '12.7', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1620, 17135, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1621, 17135, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1622, 17135, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1623, 17135, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1624, 17135, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1625, 17135, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1626, 17135, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1627, 17135, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1628, 17135, '腹部', '脂肪肝 肝尾叶内回声偏低，不均匀：建议进一步检查。', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1629, 17135, '妇科其它', '老年性阴道炎', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1630, 17135, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1631, 17135, '血糖（GLU)', '14.54', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1632, 17135, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1633, 17135, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1634, 17135, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1635, 17135, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1636, 17135, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1637, 17135, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1638, 17135, '红细胞压积', '35.3', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1639, 17135, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1640, 17135, '高密度脂蛋白(HDL)', '1.4', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1641, 17135, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1642, 17135, '红细胞', '4.33', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1643, 17135, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1644, 17135, '红细胞分布宽度-变异系数', '13', '%', 2);
INSERT INTO `physical_report_item` VALUES (1645, 17135, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1646, 17135, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1647, 17135, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1648, 17135, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1649, 17135, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1650, 17135, '低密度脂蛋白(LDL)', '4.13', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1651, 17135, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1652, 17135, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1653, 17135, '淋巴细胞百分比', '27', '%', 2);
INSERT INTO `physical_report_item` VALUES (1654, 17135, '淋巴细胞绝对值', '1.8', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1655, 17135, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1656, 17135, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1657, 17135, '内科', '有糖尿病病史', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1658, 17135, '尿比重', '1.02', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1659, 17135, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1660, 17135, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1661, 17135, '尿糖', '14', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1662, 17135, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1663, 17135, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1664, 17135, '血小板压积', '0.13', '%', 2);
INSERT INTO `physical_report_item` VALUES (1665, 17135, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1666, 17135, '平均红细胞血红蛋白含量', '28.2', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1667, 17135, '平均红细胞血红蛋白浓度', '346', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1668, 17135, '血小板', '166', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1669, 17135, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1670, 17135, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1671, 17135, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1672, 17135, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1673, 17135, '乳腺', '双乳腺结节', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1674, 17135, '收缩压', '139', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1675, 17135, '舒张压', '66', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1676, 17135, '身高', '155', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1677, 17135, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1678, 17135, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1679, 17135, '糖类抗原125（CA125）', '12.73', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1680, 17135, '糖类抗原19-9（CA19-9）', '13.78', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1681, 17135, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1682, 17135, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1683, 17135, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1684, 17135, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症伴萎缩）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1685, 17135, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1686, 17135, '糖化血红蛋白', '11.7', '%', 5);
INSERT INTO `physical_report_item` VALUES (1687, 17135, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1688, 17135, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1689, 17135, '甘油三脂（TRIG)', '2.07', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1690, 17135, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1691, 17135, '尿酸', '263', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1692, 17135, '尿素', '4.48', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1693, 17135, '外科', '甲状腺结节 乳腺增生：加强自检，乳腺专科随诊复查。', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1694, 17135, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1695, 17135, '体重', '56.4', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1696, 17135, '平均红细胞体积', '81.5', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1697, 17135, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1698, 17135, 'X线检查', '胸片提示脊柱侧弯。', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1699, 17135, '平均血小板体积', '8', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1700, 17135, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1701, 17135, '血红蛋白', '122', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1702, 17135, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1703, 17135, '血小板分布宽度', '17.4', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1704, 17135, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1705, 17135, '眼科其它', '眼底视网膜血管痉挛', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1706, 17135, '腰围', '80', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1707, 17135, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1708, 17135, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1709, 17135, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1710, 17135, '总检建议', '1、眼底视网膜血管痉挛：建议定期复查，结合临床专科诊治 2、甲状腺结节：建议做甲状腺超声进一步检查，必要时普外科就诊。 3、老年性阴道炎：妇科门诊治疗。 4、TCT未见上皮内病变及恶性细胞（NILM）良性反应细胞改变（轻度炎症伴萎缩）:建议定期复查。 5、胸片提示脊柱侧弯：请结合临床有无意义，必要时复查。 6、肝内回声偏低，不均匀：建议进一步检查，专科诊治。 7、脂肪肝：低脂饮食，适当运动，不过量饮酒，注意保肝。建议复查，结合临床专科诊治。 8、乳腺增生轻度,双乳腺结节：建议复查，专科随诊。 9、总胆固醇高、甘油三脂高、低密度脂蛋白高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 10、糖尿病史；此次化验空腹血糖高、糖化血红蛋白高：请适度控制主食（<2两/餐）及甜食，适当增加运动，控制体重。建议内分泌科进一步检查治疗。 11、癌胚抗原（CEA）高：建议复查，必要时肿瘤科就诊。 12、胃蛋白酶原Ⅰ /胃蛋白酶原Ⅱ低：建议复查，结合临床专科诊治。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1711, 17135, '中性粒细胞百分比', '67.7', '%', 2);
INSERT INTO `physical_report_item` VALUES (1712, 17135, '中性粒细胞绝对值', '4.4', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1713, 17135, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1714, 17136, '甲胎蛋白', '2.07', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1715, 17136, '癌胚抗原', '1.79', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1716, 17136, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1717, 17136, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1718, 17136, '丙氨酸氨基转移酶', '11', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1719, 17136, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1720, 17136, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1721, 17136, '天门冬氨酸氨基转移酶', '18', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1722, 17136, '白细胞', '75', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1723, 17136, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1724, 17136, '体重指数', '16.3', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1725, 17136, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1726, 17136, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1727, 17136, '糖类抗原15-3', '10.1', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1728, 17136, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1729, 17136, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1730, 17136, '总胆固醇', '5.42', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1731, 17136, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1732, 17136, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1733, 17136, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1734, 17136, '肌酐', '68', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1735, 17136, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1736, 17136, '单核细胞百分比', '4.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1737, 17136, '单核细胞', '0.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1738, 17136, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1739, 17136, '胃蛋白酶原Ⅰ', '184.6', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1740, 17136, '胃蛋白酶原Ⅰ/Ⅱ', '16.7', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1741, 17136, '胃蛋白酶原Ⅱ', '11.1', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1742, 17136, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1743, 17136, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1744, 17136, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1745, 17136, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1746, 17136, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1747, 17136, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1748, 17136, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1749, 17136, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1750, 17136, '腹部', '胆囊充盈欠佳，壁毛糙，内透声性差-建议复查，专科诊治。', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1751, 17136, '妇科其它', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1752, 17136, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1753, 17136, '血糖（GLU)', '4.79', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1754, 17136, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1755, 17136, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1756, 17136, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1757, 17136, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1758, 17136, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1759, 17136, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1760, 17136, '红细胞压积', '32.6', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1761, 17136, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1762, 17136, '高密度脂蛋白(HDL)', '2.65', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1763, 17136, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1764, 17136, '红细胞', '3.97', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1765, 17136, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1766, 17136, '红细胞分布宽度-变异系数', '14.6', '%', 2);
INSERT INTO `physical_report_item` VALUES (1767, 17136, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1768, 17136, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1769, 17136, '颈动脉', '颈动脉内中膜增厚伴斑块形成', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1770, 17136, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1771, 17136, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1772, 17136, '低密度脂蛋白(LDL)', '2.38', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1773, 17136, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1774, 17136, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1775, 17136, '淋巴细胞百分比', '25', '%', 2);
INSERT INTO `physical_report_item` VALUES (1776, 17136, '淋巴细胞绝对值', '1.5', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1777, 17136, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1778, 17136, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1779, 17136, '内科', '高血压病', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1780, 17136, '尿比重', '1.02', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1781, 17136, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1782, 17136, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1783, 17136, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1784, 17136, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1785, 17136, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1786, 17136, '血小板压积', '0.09', '%', 2);
INSERT INTO `physical_report_item` VALUES (1787, 17136, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1788, 17136, '平均红细胞血红蛋白含量', '28', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1789, 17136, '平均红细胞血红蛋白浓度', '340', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1790, 17136, '血小板', '175', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1791, 17136, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1792, 17136, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1793, 17136, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1794, 17136, '尿潜血', '10', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1795, 17136, '乳腺', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1796, 17136, '收缩压', '123', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1797, 17136, '舒张压', '63', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1798, 17136, '身高', '164', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1799, 17136, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1800, 17136, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1801, 17136, '糖类抗原125（CA125）', '13.04', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1802, 17136, '糖类抗原19-9（CA19-9）', '12.25', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1803, 17136, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1804, 17136, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1805, 17136, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1806, 17136, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症伴萎缩）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1807, 17136, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1808, 17136, '糖化血红蛋白', '5.8', '%', 5);
INSERT INTO `physical_report_item` VALUES (1809, 17136, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1810, 17136, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1811, 17136, '甘油三脂（TRIG)', '0.85', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1812, 17136, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1813, 17136, '尿酸', '236', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1814, 17136, '尿素', '7.23', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1815, 17136, '外科', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1816, 17136, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1817, 17136, '体重', '43.9', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1818, 17136, '平均红细胞体积', '82.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1819, 17136, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1820, 17136, 'X线检查', '肺内钙化灶。 胸片示陈旧病灶。 胸片提示主动脉硬化。 胸片示双侧肺气肿', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1821, 17136, '平均血小板体积', '5.7', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1822, 17136, '心电图检查', '右心室肥厚图形？', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1823, 17136, '血红蛋白', '111', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1824, 17136, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1825, 17136, '血小板分布宽度', '18', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1826, 17136, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1827, 17136, '眼科其它', '老年性白内障 视网膜动脉硬化', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1828, 17136, '腰围', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1829, 17136, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1830, 17136, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1831, 17136, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1832, 17136, '总检建议', '1、有高血压病史、本次测量血压正常：血压控制理想,继续目前治疗,心内科随诊。 2、双眼底视网膜动脉硬化：注意控制血压、血糖及血脂在正常范围，保持正常体重，必要时抗动脉硬化治疗。 3、老年性白内障：眼科门诊观察治疗。 4、老年性阴道炎：妇科门诊治疗。 5、TCT未见上皮内病变及恶性细胞(NILM)、良性反应细胞改变（轻度炎症伴萎缩）:建议定期复查。 6、心电图检查结果右心室肥厚图形？：建议复查，结合临床专科诊治。 7、胸片左肺内钙化灶：请结合临床有无意义，必要时复查。 8、胸片示右上肺陈旧病灶：请结合临床有无意义，必要时复查。 9、胸片提示主动脉硬化：请结合临床有无意义，必要时复查。 10、胸片示双侧肺气肿改变：请结合临床，避免感冒，不吸烟，呼吸内科随诊。 11、胆囊充盈欠佳，壁毛糙，内透声性差：建议复查，专科诊治。 12、颈动脉内中膜增厚伴斑块形成：建议定期复查，结合临床专科诊治。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1833, 17136, '中性粒细胞百分比', '70.2', '%', 2);
INSERT INTO `physical_report_item` VALUES (1834, 17136, '中性粒细胞绝对值', '4.1', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1835, 17136, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1836, 17137, '甲胎蛋白', '1.36', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1837, 17137, '癌胚抗原', '1.16', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1838, 17137, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1839, 17137, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1840, 17137, '丙氨酸氨基转移酶', '9', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1841, 17137, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1842, 17137, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1843, 17137, '天门冬氨酸氨基转移酶', '17', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1844, 17137, '白细胞', '4.2', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1845, 17137, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1846, 17137, '体重指数', '20.3', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1847, 17137, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1848, 17137, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1849, 17137, '糖类抗原15-3', '1.23', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1850, 17137, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1851, 17137, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1852, 17137, '总胆固醇', '2.89', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1853, 17137, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1854, 17137, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1855, 17137, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1856, 17137, '肌酐', '57', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1857, 17137, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1858, 17137, '单核细胞百分比', '3.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1859, 17137, '单核细胞', '0.2', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1860, 17137, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1861, 17137, '胃蛋白酶原Ⅰ', '132.9', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1862, 17137, '胃蛋白酶原Ⅰ/Ⅱ', '19.6', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1863, 17137, '胃蛋白酶原Ⅱ', '6.8', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1864, 17137, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1865, 17137, '耳鼻咽喉科其它', '双下甲肥大，慢性鼻炎', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1866, 17137, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1867, 17137, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1868, 17137, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1869, 17137, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1870, 17137, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1871, 17137, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1872, 17137, '腹部', '左肾囊肿', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1873, 17137, '妇科其它', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1874, 17137, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1875, 17137, '血糖（GLU)', '5', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1876, 17137, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1877, 17137, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1878, 17137, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1879, 17137, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1880, 17137, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1881, 17137, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1882, 17137, '红细胞压积', '34.6', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1883, 17137, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1884, 17137, '高密度脂蛋白(HDL)', '1.6', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1885, 17137, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1886, 17137, '红细胞', '4.15', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (1887, 17137, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (1888, 17137, '红细胞分布宽度-变异系数', '13.5', '%', 2);
INSERT INTO `physical_report_item` VALUES (1889, 17137, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (1890, 17137, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1891, 17137, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1892, 17137, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1893, 17137, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1894, 17137, '低密度脂蛋白(LDL)', '1.08', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1895, 17137, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1896, 17137, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1897, 17137, '淋巴细胞百分比', '23.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (1898, 17137, '淋巴细胞绝对值', '1', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1899, 17137, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1900, 17137, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1901, 17137, '内科', '甲减5年', NULL, 7);
INSERT INTO `physical_report_item` VALUES (1902, 17137, '尿比重', '1.005', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1903, 17137, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (1904, 17137, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1905, 17137, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1906, 17137, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1907, 17137, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1908, 17137, '血小板压积', '0.11', '%', 2);
INSERT INTO `physical_report_item` VALUES (1909, 17137, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1910, 17137, '平均红细胞血红蛋白含量', '29.4', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (1911, 17137, '平均红细胞血红蛋白浓度', '353', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1912, 17137, '血小板', '128', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1913, 17137, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1914, 17137, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (1915, 17137, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1916, 17137, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (1917, 17137, '乳腺', '双乳腺结节 双乳腺增生', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1918, 17137, '收缩压', '110', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1919, 17137, '舒张压', '73', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (1920, 17137, '身高', '169', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1921, 17137, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1922, 17137, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1923, 17137, '糖类抗原125（CA125）', '12.09', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1924, 17137, '糖类抗原19-9（CA19-9）', '5.75', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1925, 17137, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (1926, 17137, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1927, 17137, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1928, 17137, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1929, 17137, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (1930, 17137, '糖化血红蛋白', '5.5', '%', 5);
INSERT INTO `physical_report_item` VALUES (1931, 17137, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1932, 17137, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1933, 17137, '甘油三脂（TRIG)', '0.47', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1934, 17137, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (1935, 17137, '尿酸', '206', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1936, 17137, '尿素', '2.59', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1937, 17137, '外科', '甲状腺结节 乳腺增生：加强自检，乳腺专科随诊复查。', NULL, 8);
INSERT INTO `physical_report_item` VALUES (1938, 17137, '维生维C', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1939, 17137, '体重', '58', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (1940, 17137, '平均红细胞体积', '83.4', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1941, 17137, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1942, 17137, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (1943, 17137, '平均血小板体积', '9.2', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1944, 17137, '心电图检查', '窦性心动过速', NULL, 12);
INSERT INTO `physical_report_item` VALUES (1945, 17137, '血红蛋白', '122', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (1946, 17137, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1947, 17137, '血小板分布宽度', '18.3', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (1948, 17137, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (1949, 17137, '眼科其它', '眼结膜炎', NULL, 10);
INSERT INTO `physical_report_item` VALUES (1950, 17137, '腰围', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (1951, 17137, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1952, 17137, '子宫(妇科)', '宫颈纳囊', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1953, 17137, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1954, 17137, '总检建议', '1、双眼结膜炎：建议眼科治疗 2、双下甲肥大，慢性鼻炎：建议结合临床，专科诊治。 3、甲状腺结节：建议做甲状腺超声进一步检查，必要时普外科就诊。 4、双乳腺增生、双乳腺结节：建议复查，专科随诊。 5、TCT未见上皮内病变及恶性细胞(NILM)、良性反应细胞改变（轻度炎症）:建议定期复查。 6、窦性心动过速：注意观察心率，心内科随诊。 7、左肾囊肿：定期复查，必要时泌尿外科就诊。 8、宫颈纳囊：妇科门诊随诊。 9、总胆固醇低、甘油三脂低、低密度脂蛋白低：注意饮食结构，择期复查。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (1955, 17137, '中性粒细胞百分比', '72.4', '%', 2);
INSERT INTO `physical_report_item` VALUES (1956, 17137, '中性粒细胞绝对值', '3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1957, 17137, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1958, 17138, '甲胎蛋白', '0.65', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (1959, 17138, '癌胚抗原', '0.23', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1960, 17138, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1961, 17138, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1962, 17138, '丙氨酸氨基转移酶', '11', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1963, 17138, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1964, 17138, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (1965, 17138, '天门冬氨酸氨基转移酶', '20', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1966, 17138, '白细胞', '5.4', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1967, 17138, '便潜血', '', NULL, 4);
INSERT INTO `physical_report_item` VALUES (1968, 17138, '体重指数', '21.7', NULL, 1);
INSERT INTO `physical_report_item` VALUES (1969, 17138, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1970, 17138, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1971, 17138, '糖类抗原15-3', '0.87', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1972, 17138, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (1973, 17138, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1974, 17138, '总胆固醇', '3.15', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1975, 17138, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1976, 17138, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1977, 17138, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1978, 17138, '肌酐', '64', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1979, 17138, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1980, 17138, '单核细胞百分比', '4.4', '%', 2);
INSERT INTO `physical_report_item` VALUES (1981, 17138, '单核细胞', '0.2', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (1982, 17138, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (1983, 17138, '胃蛋白酶原Ⅰ', '96.9', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1984, 17138, '胃蛋白酶原Ⅰ/Ⅱ', '3.7', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1985, 17138, '胃蛋白酶原Ⅱ', '26.1', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1986, 17138, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1987, 17138, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (1988, 17138, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (1989, 17138, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (1990, 17138, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (1991, 17138, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (1992, 17138, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1993, 17138, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (1994, 17138, '腹部', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (1995, 17138, '妇科其它', '宫颈轻度糜烂。', NULL, 9);
INSERT INTO `physical_report_item` VALUES (1996, 17138, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (1997, 17138, '血糖（GLU)', '4.85', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (1998, 17138, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (1999, 17138, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2000, 17138, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2001, 17138, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2002, 17138, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2003, 17138, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2004, 17138, '红细胞压积', '33.5', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2005, 17138, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2006, 17138, '高密度脂蛋白(HDL)', '1.37', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2007, 17138, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2008, 17138, '红细胞', '4.17', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (2009, 17138, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (2010, 17138, '红细胞分布宽度-变异系数', '13.1', '%', 2);
INSERT INTO `physical_report_item` VALUES (2011, 17138, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (2012, 17138, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2013, 17138, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2014, 17138, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2015, 17138, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2016, 17138, '低密度脂蛋白(LDL)', '1.56', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2017, 17138, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2018, 17138, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2019, 17138, '淋巴细胞百分比', '30.3', '%', 2);
INSERT INTO `physical_report_item` VALUES (2020, 17138, '淋巴细胞绝对值', '1.6', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2021, 17138, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2022, 17138, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2023, 17138, '内科', '', NULL, 7);
INSERT INTO `physical_report_item` VALUES (2024, 17138, '尿比重', '1.015', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2025, 17138, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (2026, 17138, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2027, 17138, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2028, 17138, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2029, 17138, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2030, 17138, '血小板压积', '0.12', '%', 2);
INSERT INTO `physical_report_item` VALUES (2031, 17138, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2032, 17138, '平均红细胞血红蛋白含量', '28.1', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (2033, 17138, '平均红细胞血红蛋白浓度', '349', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2034, 17138, '血小板', '139', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2035, 17138, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (2036, 17138, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2037, 17138, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2038, 17138, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (2039, 17138, '乳腺', '双乳腺增生', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2040, 17138, '收缩压', '114', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2041, 17138, '舒张压', '71', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2042, 17138, '身高', '171', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2043, 17138, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2044, 17138, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2045, 17138, '糖类抗原125（CA125）', '5.55', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2046, 17138, '糖类抗原19-9（CA19-9）', '6.57', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2047, 17138, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (2048, 17138, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2049, 17138, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2050, 17138, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2051, 17138, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (2052, 17138, '糖化血红蛋白', '5.6', '%', 5);
INSERT INTO `physical_report_item` VALUES (2053, 17138, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2054, 17138, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2055, 17138, '甘油三脂（TRIG)', '0.49', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2056, 17138, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (2057, 17138, '尿酸', '222', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2058, 17138, '尿素', '2.02', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2059, 17138, '外科', '乳腺增生：加强自检，乳腺专科随诊复查。', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2060, 17138, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2061, 17138, '体重', '63.5', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (2062, 17138, '平均红细胞体积', '80.3', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2063, 17138, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2064, 17138, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (2065, 17138, '平均血小板体积', '8.9', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2066, 17138, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (2067, 17138, '血红蛋白', '117', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2068, 17138, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2069, 17138, '血小板分布宽度', '17.6', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2070, 17138, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2071, 17138, '眼科其它', '', NULL, 10);
INSERT INTO `physical_report_item` VALUES (2072, 17138, '腰围', '74', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2073, 17138, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2074, 17138, '子宫(妇科)', '子宫肌瘤', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2075, 17138, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2076, 17138, '总检建议', '1、双乳腺增生：加强自检，定期复查，专科随诊。 2、宫颈轻度糜烂:建议定期复查，结合临床专科诊治。 3、TCT未见上皮内病变及恶性细胞(NILM)、良性反应细胞改变（轻度炎症）:建议定期复查。 4、子宫肌瘤：建议定期复查，妇科门诊随诊。 5、甘油三脂低：注意饮食结构，择期复查。 6、胃蛋白酶原Ⅱ高、胃蛋白酶原Ⅰ /胃蛋白酶原Ⅱ低：建议复查，结合临床专科诊治', NULL, 0);
INSERT INTO `physical_report_item` VALUES (2077, 17138, '中性粒细胞百分比', '65.3', '%', 2);
INSERT INTO `physical_report_item` VALUES (2078, 17138, '中性粒细胞绝对值', '3.6', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2079, 17138, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2080, 17139, '甲胎蛋白', '2.87', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (2081, 17139, '癌胚抗原', '1.89', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2082, 17139, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2083, 17139, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2084, 17139, '丙氨酸氨基转移酶', '14', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2085, 17139, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2086, 17139, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2087, 17139, '天门冬氨酸氨基转移酶', '16', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2088, 17139, '白细胞', '75', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2089, 17139, '便潜血', '阴性', NULL, 4);
INSERT INTO `physical_report_item` VALUES (2090, 17139, '体重指数', '22.6', NULL, 1);
INSERT INTO `physical_report_item` VALUES (2091, 17139, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2092, 17139, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2093, 17139, '糖类抗原15-3', '14.32', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2094, 17139, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2095, 17139, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2096, 17139, '总胆固醇', '6.19', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2097, 17139, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2098, 17139, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2099, 17139, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2100, 17139, '肌酐', '68', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2101, 17139, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2102, 17139, '单核细胞百分比', '5.3', '%', 2);
INSERT INTO `physical_report_item` VALUES (2103, 17139, '单核细胞', '0.4', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2104, 17139, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2105, 17139, '胃蛋白酶原Ⅰ', '101.8', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2106, 17139, '胃蛋白酶原Ⅰ/Ⅱ', '4.1', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2107, 17139, '胃蛋白酶原Ⅱ', '25.1', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2108, 17139, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2109, 17139, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (2110, 17139, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (2111, 17139, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2112, 17139, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2113, 17139, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (2114, 17139, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2115, 17139, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2116, 17139, '腹部', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2117, 17139, '妇科其它', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2118, 17139, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2119, 17139, '血糖（GLU)', '4.83', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2120, 17139, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2121, 17139, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2122, 17139, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2123, 17139, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2124, 17139, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2125, 17139, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2126, 17139, '红细胞压积', '32.4', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2127, 17139, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2128, 17139, '高密度脂蛋白(HDL)', '1.16', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2129, 17139, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2130, 17139, '红细胞', '3.95', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (2131, 17139, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (2132, 17139, '红细胞分布宽度-变异系数', '12.9', '%', 2);
INSERT INTO `physical_report_item` VALUES (2133, 17139, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (2134, 17139, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2135, 17139, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2136, 17139, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2137, 17139, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2138, 17139, '低密度脂蛋白(LDL)', '3.61', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2139, 17139, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2140, 17139, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2141, 17139, '淋巴细胞百分比', '39.7', '%', 2);
INSERT INTO `physical_report_item` VALUES (2142, 17139, '淋巴细胞绝对值', '3.1', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2143, 17139, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2144, 17139, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2145, 17139, '内科', '', NULL, 7);
INSERT INTO `physical_report_item` VALUES (2146, 17139, '尿比重', '1.015', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2147, 17139, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (2148, 17139, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2149, 17139, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2150, 17139, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2151, 17139, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2152, 17139, '血小板压积', '0.11', '%', 2);
INSERT INTO `physical_report_item` VALUES (2153, 17139, 'PH值', '6', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2154, 17139, '平均红细胞血红蛋白含量', '28.1', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (2155, 17139, '平均红细胞血红蛋白浓度', '343', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2156, 17139, '血小板', '247', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2157, 17139, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (2158, 17139, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2159, 17139, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2160, 17139, '尿潜血', '-', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (2161, 17139, '乳腺', '双乳腺结节', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2162, 17139, '收缩压', '129', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2163, 17139, '舒张压', '77', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2164, 17139, '身高', '170', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2165, 17139, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2166, 17139, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2167, 17139, '糖类抗原125（CA125）', '13.43', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2168, 17139, '糖类抗原19-9（CA19-9）', '6.07', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2169, 17139, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (2170, 17139, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2171, 17139, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2172, 17139, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2173, 17139, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (2174, 17139, '糖化血红蛋白', '6.3', '%', 5);
INSERT INTO `physical_report_item` VALUES (2175, 17139, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2176, 17139, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2177, 17139, '甘油三脂（TRIG)', '3.12', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2178, 17139, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (2179, 17139, '尿酸', '270', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2180, 17139, '尿素', '4.11', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2181, 17139, '外科', '乳腺增生：加强自检，乳腺专科随诊复查。 甲状腺结节', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2182, 17139, '维生维C', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2183, 17139, '体重', '65.3', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (2184, 17139, '平均红细胞体积', '82', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2185, 17139, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2186, 17139, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (2187, 17139, '平均血小板体积', '4.8', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2188, 17139, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (2189, 17139, '血红蛋白', '111', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2190, 17139, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2191, 17139, '血小板分布宽度', '17.7', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2192, 17139, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2193, 17139, '眼科其它', '左陈旧性黄斑病变', NULL, 10);
INSERT INTO `physical_report_item` VALUES (2194, 17139, '腰围', '76', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2195, 17139, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2196, 17139, '子宫(妇科)', '宫颈纳囊', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2197, 17139, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2198, 17139, '总检建议', '1、左眼底黄斑区陈旧性病变：定期复查，眼科随诊。 2、外科乳腺增生：加强自检，乳腺专科随诊复查。 3、甲状腺结节：建议做甲状腺超声进一步检查，必要时普外科就诊。 4、TCT未见上皮内病变及恶性细胞(NILM)、良性反应细胞改变（轻度炎症）:建议定期复查。 5、宫颈纳囊：妇科门诊随诊。 6、双乳腺结节：建议复查，专科随诊。 7、总胆固醇高、甘油三脂高、低密度脂蛋白高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 8、胃蛋白酶原Ⅱ高、胃蛋白酶原Ⅰ /胃蛋白酶原Ⅱ低：建议复查，结合临床专科诊治 9、糖化血红蛋白高：请适度控制主食和甜食，适当增加运动，控制体重，监测血糖。如无糖尿病史，建议到内分泌科就诊，做糖耐量试验,明确诊断。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (2199, 17139, '中性粒细胞百分比', '55', '%', 2);
INSERT INTO `physical_report_item` VALUES (2200, 17139, '中性粒细胞绝对值', '4.2', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2201, 17139, '总前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2202, 17140, '甲胎蛋白', '0.59', 'ng/ml', 2);
INSERT INTO `physical_report_item` VALUES (2203, 17140, '癌胚抗原', '0.44', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2204, 17140, '白蛋白(ALB)', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2205, 17140, '碱性磷酸酶(ALP)', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2206, 17140, '丙氨酸氨基转移酶', '14', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2207, 17140, '载脂蛋白-A1', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2208, 17140, '载脂蛋白-B', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2209, 17140, '天门冬氨酸氨基转移酶', '18', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2210, 17140, '白细胞', '6.1', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2211, 17140, '便潜血', '', NULL, 4);
INSERT INTO `physical_report_item` VALUES (2212, 17140, '体重指数', '', NULL, 1);
INSERT INTO `physical_report_item` VALUES (2213, 17140, '血清钙', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2214, 17140, '糖类抗原125（CA125）', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2215, 17140, '糖类抗原15-3', '28.54', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2216, 17140, '糖类抗原724', '', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2217, 17140, '癌胚抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2218, 17140, '总胆固醇', '5.33', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2219, 17140, '肌酸激酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2220, 17140, '血清氯', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2221, 17140, '肌酸激酶同工酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2222, 17140, '肌酐', '64', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2223, 17140, '细胞角蛋白19片段(CYFRA21-1)', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2224, 17140, '单核细胞百分比', '4.2', '%', 2);
INSERT INTO `physical_report_item` VALUES (2225, 17140, '单核细胞', '0.3', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2226, 17140, '尿胆红素', '-', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2227, 17140, '胃蛋白酶原Ⅰ', '137.6', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2228, 17140, '胃蛋白酶原Ⅰ/Ⅱ', '9.5', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2229, 17140, '胃蛋白酶原Ⅱ', '14.5', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2230, 17140, '直接胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2231, 17140, '耳鼻咽喉科其它', '', NULL, 11);
INSERT INTO `physical_report_item` VALUES (2232, 17140, '雌二醇', '', 'pmol/L', 6);
INSERT INTO `physical_report_item` VALUES (2233, 17140, '铁蛋白', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2234, 17140, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2235, 17140, '促卵泡成熟素（FSH）', '', 'mu/mI', 6);
INSERT INTO `physical_report_item` VALUES (2236, 17140, '游离三碘甲状腺原氨酸', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2237, 17140, '游离甲状腺素', '', 'pmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2238, 17140, '腹部', '肝脏中强回声结节', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2239, 17140, '妇科其它', '老年性阴道炎', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2240, 17140, '谷酰转酞酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2241, 17140, '血糖（GLU)', '4.76', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2242, 17140, '乙肝核心抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2243, 17140, '血清α-羟丁酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2244, 17140, '乙肝e抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2245, 17140, '乙肝e抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2246, 17140, '乙肝表面抗体定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2247, 17140, '乙肝表面抗原定性', '', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2248, 17140, '红细胞压积', '35.2', NULL, 2);
INSERT INTO `physical_report_item` VALUES (2249, 17140, '同型半胱氨酸', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2250, 17140, '高密度脂蛋白(HDL)', '1.19', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2251, 17140, '高密度脂蛋白(HDL-C)', '', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2252, 17140, '红细胞', '4.41', '10^12/L', 2);
INSERT INTO `physical_report_item` VALUES (2253, 17140, '胃幽门螺杆菌抗体检测', '', NULL, 5);
INSERT INTO `physical_report_item` VALUES (2254, 17140, '红细胞分布宽度-变异系数', '13.4', '%', 2);
INSERT INTO `physical_report_item` VALUES (2255, 17140, '胰岛素', '', 'mIU/L', 3);
INSERT INTO `physical_report_item` VALUES (2256, 17140, '血清磷', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2257, 17140, '颈动脉', '', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2258, 17140, '血清钾', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2259, 17140, '乳酸脱氢酶', '', 'U/L', 5);
INSERT INTO `physical_report_item` VALUES (2260, 17140, '低密度脂蛋白(LDL)', '3.04', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2261, 17140, '低密度脂蛋白(LDL-C)', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2262, 17140, '促黄体生成激素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2263, 17140, '淋巴细胞百分比', '28.8', '%', 2);
INSERT INTO `physical_report_item` VALUES (2264, 17140, '淋巴细胞绝对值', '1.8', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2265, 17140, '血清镁', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2266, 17140, '血清钠', '', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2267, 17140, '内科', '', NULL, 7);
INSERT INTO `physical_report_item` VALUES (2268, 17140, '尿比重', '1.025', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2269, 17140, '尿蛋白质', '-', 'g/L', 3);
INSERT INTO `physical_report_item` VALUES (2270, 17140, '尿胆原', 'norm', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2271, 17140, '尿糖', 'norm', 'mmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2272, 17140, '神经元特异性烯醇化酶', '', 'μg/L', 5);
INSERT INTO `physical_report_item` VALUES (2273, 17140, '血清前白蛋白', '', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2274, 17140, '血小板压积', '0.2', '%', 2);
INSERT INTO `physical_report_item` VALUES (2275, 17140, 'PH值', '5', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2276, 17140, '平均红细胞血红蛋白含量', '27.7', 'pg', 2);
INSERT INTO `physical_report_item` VALUES (2277, 17140, '平均红细胞血红蛋白浓度', '347', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2278, 17140, '血小板', '242', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2279, 17140, '孕酮', '', 'nmol/L', 6);
INSERT INTO `physical_report_item` VALUES (2280, 17140, '催乳素', '', 'IU/L', 6);
INSERT INTO `physical_report_item` VALUES (2281, 17140, '前列腺(外科)', '', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2282, 17140, '尿潜血', '50', 'Cell/uL', 3);
INSERT INTO `physical_report_item` VALUES (2283, 17140, '乳腺', '双乳腺增生', NULL, 13);
INSERT INTO `physical_report_item` VALUES (2284, 17140, '收缩压', '125', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2285, 17140, '舒张压', '73', 'mmHg', 1);
INSERT INTO `physical_report_item` VALUES (2286, 17140, '身高', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2287, 17140, '三碘甲状腺原氨酸T3', '', 'pmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2288, 17140, '甲状腺素T4', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2289, 17140, '糖类抗原125（CA125）', '8.59', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2290, 17140, '糖类抗原19-9（CA19-9）', '9.16', 'KU/L', 2);
INSERT INTO `physical_report_item` VALUES (2291, 17140, '糖类抗原242', '', 'U/L', 2);
INSERT INTO `physical_report_item` VALUES (2292, 17140, '总胆汁酸', '', 'μmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2293, 17140, '总胆红素', '', 'μmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2294, 17140, 'TCT检查', '未见上皮内病变及恶性细胞（NILM） 良性反应细胞改变（轻度炎症伴萎缩）', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2295, 17140, '睾酮', '', NULL, 6);
INSERT INTO `physical_report_item` VALUES (2296, 17140, '糖化血红蛋白', '6.2', '%', 5);
INSERT INTO `physical_report_item` VALUES (2297, 17140, '酮体', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2298, 17140, '总蛋白', '', 'g/L', 5);
INSERT INTO `physical_report_item` VALUES (2299, 17140, '甘油三脂（TRIG)', '2.41', 'mmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2300, 17140, '促甲状腺激素（TSH）', '', 'mIU/L', 2);
INSERT INTO `physical_report_item` VALUES (2301, 17140, '尿酸', '409', 'μmol/L', 3);
INSERT INTO `physical_report_item` VALUES (2302, 17140, '尿素', '4.64', 'mmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2303, 17140, '外科', '乳腺增生：加强自检，乳腺专科随诊复查。', NULL, 8);
INSERT INTO `physical_report_item` VALUES (2304, 17140, '维生维C', '0.2', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2305, 17140, '体重', '', 'Kg', 1);
INSERT INTO `physical_report_item` VALUES (2306, 17140, '平均红细胞体积', '79.8', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2307, 17140, '嗜酸细胞提示', '<0.7', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2308, 17140, 'X线检查', '', NULL, 15);
INSERT INTO `physical_report_item` VALUES (2309, 17140, '平均血小板体积', '8.3', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2310, 17140, '心电图检查', '', NULL, 12);
INSERT INTO `physical_report_item` VALUES (2311, 17140, '血红蛋白', '122', 'g/L', 2);
INSERT INTO `physical_report_item` VALUES (2312, 17140, '血清C肽', '', 'nmol/L', 2);
INSERT INTO `physical_report_item` VALUES (2313, 17140, '血小板分布宽度', '18.1', 'fL', 2);
INSERT INTO `physical_report_item` VALUES (2314, 17140, '尿亚硝酸盐', '-', NULL, 3);
INSERT INTO `physical_report_item` VALUES (2315, 17140, '眼科其它', '', NULL, 10);
INSERT INTO `physical_report_item` VALUES (2316, 17140, '腰围', '', 'cm', 1);
INSERT INTO `physical_report_item` VALUES (2317, 17140, '游离前列腺特异性抗原', '', 'μg/L', 2);
INSERT INTO `physical_report_item` VALUES (2318, 17140, '子宫(妇科)', '', NULL, 9);
INSERT INTO `physical_report_item` VALUES (2319, 17140, '脂蛋白(a)', '', 'nmol/L', 5);
INSERT INTO `physical_report_item` VALUES (2320, 17140, '总检建议', '1、双乳腺增生：加强自检，定期复查，专科随诊。 2、老年性阴道炎：妇科门诊治疗。 3、TCT未见上皮内病变及恶性细胞（NILM）良性反应细胞改变（轻度炎症伴萎缩）:建议定期复查。 4、肝脏中强回声结节（首次发现）：建议医院进一步检查、诊治。 5、尿酸高：限食海鲜、动物内脏及豆类等食品，限酒。注意复查，结合临床症状，内科就医药物治疗。 6、甘油三脂高：请低脂饮食，限制食用油类及坚果类食物，适度增加运动，控制体重，必要时内科降脂治疗。 7、糖类抗原153（CA153）高：建议复查，肿瘤科就诊。 8、糖化血红蛋白高：请适度控制主食和甜食，适当增加运动，控制体重，监测血糖。如无糖尿病史，建议到内分泌科就诊，做糖耐量试验,明确诊断。', NULL, 0);
INSERT INTO `physical_report_item` VALUES (2321, 17140, '中性粒细胞百分比', '67', '%', 2);
INSERT INTO `physical_report_item` VALUES (2322, 17140, '中性粒细胞绝对值', '4', '10^9/L', 2);
INSERT INTO `physical_report_item` VALUES (2323, 17140, '总前列腺特异性抗原', '', 'μg/L', 2);

-- ----------------------------
-- Table structure for physical_view_report_record
-- ----------------------------
DROP TABLE IF EXISTS `physical_view_report_record`;
CREATE TABLE `physical_view_report_record`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `report_id` bigint(11) NOT NULL COMMENT '报告id',
  `identity_card` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `view` tinyint(1) NULL DEFAULT 0 COMMENT '是否已查看 0：未查看；1：已查看',
  `view_date` datetime(0) NULL DEFAULT NULL COMMENT '查看日期',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1226 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告查看记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_view_report_record
-- ----------------------------
INSERT INTO `physical_view_report_record` VALUES (1217, 17132, '110102193512132726', 0, NULL, '2021-02-22 02:15:53');
INSERT INTO `physical_view_report_record` VALUES (1218, 17133, '110108193806266023', 0, NULL, '2021-02-22 02:15:55');
INSERT INTO `physical_view_report_record` VALUES (1219, 17134, '110104194309051223', 0, NULL, '2021-02-22 02:15:57');
INSERT INTO `physical_view_report_record` VALUES (1220, 17135, '110108194102146028', 0, NULL, '2021-02-22 02:15:58');
INSERT INTO `physical_view_report_record` VALUES (1221, 17136, '110108193212186026', 0, NULL, '2021-02-22 02:16:00');
INSERT INTO `physical_view_report_record` VALUES (1222, 17137, '152628198205035726', 0, NULL, '2021-02-22 02:16:02');
INSERT INTO `physical_view_report_record` VALUES (1223, 17138, '132524198011120047', 0, NULL, '2021-02-22 02:16:04');
INSERT INTO `physical_view_report_record` VALUES (1224, 17139, '11010819560726602X', 0, NULL, '2021-02-22 02:16:06');
INSERT INTO `physical_view_report_record` VALUES (1225, 17140, '110102195811072363', 0, NULL, '2021-02-22 02:16:07');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `menu_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_level` int(3) UNSIGNED NOT NULL COMMENT '菜单级别',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单url',
  `parent_menu_id` bigint(11) UNSIGNED NULL DEFAULT 0 COMMENT '父菜单id',
  `priority` int(5) UNSIGNED NOT NULL COMMENT '显示优先级',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限code',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, '体检管理', 1, NULL, 0, 100, NULL, NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (2, '用户管理', 2, '/user/index', 1, 101, '1', NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (3, '体检参考值管理', 2, '/checkupItem/index', 1, 102, '1', NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (4, '导入体检数据', 2, '/report/excelIndex', 1, 103, '1', NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (5, '体检报告管理', 2, '/report/reportIndex', 1, 104, '1', NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (6, '体检年份管理', 2, '/annualManagement/index', 1, 105, '1', NULL, NULL, 0);
INSERT INTO `system_menu` VALUES (7, '体检报告查询', 2, '/report/userReportQueryList', 1, 106, '3', NULL, NULL, 0);

-- ----------------------------
-- Table structure for system_user_info
-- ----------------------------
DROP TABLE IF EXISTS `system_user_info`;
CREATE TABLE `system_user_info`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `identity_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `job_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值',
  `pwd_status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提示密码修改：0为第一次登录，1不是第一次登录',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别：女为0；男为1',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门',
  `sub_department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级部门',
  `user_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  `is_super` int(1) NULL DEFAULT 3 COMMENT '权限：1：系统管理  2：普通管理员 3：普通员工',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_info
-- ----------------------------
INSERT INTO `system_user_info` VALUES (1, '管理员', '100000000000000000', '100000', 'admin', '94c73b93f834ff0985f9353060f601c0', '17ee63a9315444a8a4825684d6bf9798', '0', 1, '2021-02-26 07:00:11', 'TKY电子所', '经营管理业务群', NULL, NULL, '2021-02-25 08:08:18', 0, 1);
INSERT INTO `system_user_info` VALUES (3, '王淑媛', '110102193512132726', NULL, '', '2dded281ebe53d9af76759db893c251a', '31469c0c02a44c42bfd80c47d094a907', '0', 0, NULL, 'TKY机辆所', '离退', NULL, NULL, '2021-02-25 08:08:18', 0, 3);
INSERT INTO `system_user_info` VALUES (4, '王树敏', '110108193806266023', NULL, '', '58d21bdc6a2c29fdabd2649eea9eb0ab', 'cf75fe6d88374031b49fbf251ce5893f', '0', 0, NULL, 'TKY机辆所', '离退', NULL, NULL, '2021-02-25 08:08:18', 0, 3);
INSERT INTO `system_user_info` VALUES (5, '王希玲', '110104194309051223', NULL, '', '431ff734a8234a12dc6492b9e1cebce7', '888423e0b8e84a379be1dde74a246811', '0', 0, NULL, 'TKY机辆所', '离退', NULL, NULL, '2021-02-25 08:08:18', 0, 3);
INSERT INTO `system_user_info` VALUES (6, '陈桂芝', '110108194102146028', NULL, '', '49191ae6d0acec656dd7c6374d2c5260', '7e6d5c6a31284dac9a9fad401bdd049e', '0', 0, NULL, 'TKY机辆所', '离退', NULL, NULL, '2021-02-25 08:08:19', 0, 3);
INSERT INTO `system_user_info` VALUES (7, '陈静怡', '110108193212186026', NULL, '', '2be18bdaaf8328cacdb4b2c874e3addb', 'c27b49c25d994e15a3d72715615367e1', '0', 0, NULL, 'TKY机辆所', '离退', NULL, NULL, '2021-02-25 08:08:19', 0, 3);
INSERT INTO `system_user_info` VALUES (8, '张培峰', '152628198205035726', NULL, '', '6c2a5ed2761e8293d8514b09fe2b542d', '7c241be9d00b495cb649b3c67628eea5', '0', 0, NULL, 'TKY机辆所', '制动', NULL, NULL, '2021-02-25 08:08:19', 0, 3);
INSERT INTO `system_user_info` VALUES (9, '李妍梅', '132524198011120047', NULL, '', '4ff73de680c45fa3cab40f5a9b20efc3', '60f4902e78e84c9ab7c38cb83dbb1aa7', '0', 0, NULL, 'TKY机辆所', '网控', NULL, NULL, '2021-02-25 08:08:20', 0, 3);
INSERT INTO `system_user_info` VALUES (10, '冒一平', '11010819560726602X', NULL, '', '58981e892097ab12218511f0b3961566', '4cbf3d8c8d154821bd64ecd557a8e8aa', '0', 0, NULL, 'TKY咨询公司', '', NULL, NULL, '2021-02-25 08:08:20', 0, 3);
INSERT INTO `system_user_info` VALUES (11, '杨红', '110102195811072363', NULL, '', '6be93f1289a4d600053b53ffcdfe965e', '07e2896ec67a46bd921962cffebb7648', '0', 0, NULL, 'TKY咨询公司', '', NULL, NULL, '2021-02-25 08:08:20', 0, 3);
INSERT INTO `system_user_info` VALUES (12, '张三', '370726197511151847', '200000', '15122310192', 'ead3535f38d377d55519714fc4973963', 'c91dfb347bf6418d9ee72416f6a0be0f', '0', 1, '2021-02-25 08:09:35', '电子所', NULL, NULL, NULL, '2021-02-25 08:08:20', 0, 3);

SET FOREIGN_KEY_CHECKS = 1;
