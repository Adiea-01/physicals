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

 Date: 20/02/2021 17:34:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for physical_annual_management
-- ----------------------------
DROP TABLE IF EXISTS `physical_annual_management`;
CREATE TABLE `physical_annual_management`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年份',
  `year_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联体检报告表中的pu_yearUuid',
  `year_flag` int(1) NULL DEFAULT NULL COMMENT '是否显示当年的年份（1为显示）',
  `create_date` date NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '年份管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_annual_management
-- ----------------------------
INSERT INTO `physical_annual_management` VALUES (1, '2014年', 'c199fd5d58bd4fd990a951ce3ebe35bb', 1, '2020-07-06');
INSERT INTO `physical_annual_management` VALUES (2, '2015年', '6d87fa1b02624955a9aeee2bbb467460', 0, '2020-07-06');
INSERT INTO `physical_annual_management` VALUES (3, '2016年', '65d64d711f1e4f579fab6040722c4fd9', 0, '2020-07-06');
INSERT INTO `physical_annual_management` VALUES (4, '2017年', '04626589d9044977bd2554ae1bcab1b2', 0, '2020-07-06');
INSERT INTO `physical_annual_management` VALUES (5, '2018年', '4486bdc3364a4fd4bdf0016d1550af7b', 0, '2020-07-06');
INSERT INTO `physical_annual_management` VALUES (6, '2019年', 'a314db1d82bb4742a3591a1a7307a162', 0, '2020-07-06');

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
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field_name`(`field_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检项目管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of physical_checkup_item
-- ----------------------------
INSERT INTO `physical_checkup_item` VALUES (17, '眼科其它', 'ophthalmology', 'ophthalmology', NULL, NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (18, '裸视力(左)', 'naked vision left', 'lnv', 'NV-L', NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (19, '裸视力(右)', 'naked vision right', 'rnv', 'NV-R', NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (20, '矫正视力(左)', 'Corrected vision left', 'lcv', 'CV-L', NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (21, '矫正视力(右)', 'Corrected vision right', 'rcv', 'CV-R', NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (22, '色觉', 'colour sense', 'colourSense', NULL, NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (23, '外眼', 'outer eye', 'outerEye', NULL, NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (24, '眼底镜检查', 'ophthalmoscopic', 'ophthalmoscopic', NULL, NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (25, '身高', 'height', 'height', NULL, NULL, '一般项目检查', NULL, NULL, 'cm', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (26, '体重', 'body weight', 'weight', NULL, NULL, '一般项目检查', NULL, NULL, 'Kg', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (27, '体重指数', NULL, 'bmi', 'BMI', NULL, '一般项目检查', '18.5', '23.99', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (28, '收缩压', 'Systolic pressure', 'sp', 'SP', NULL, '一般项目检查', NULL, NULL, 'mmHg', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (29, '舒张压', 'diastolic blood pressure', 'dp', 'DP', NULL, '一般项目检查', NULL, NULL, 'mmHg', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (30, '腰围', 'waistline', 'waistline', NULL, NULL, '一般项目检查', '1', '80', 'cm', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (31, '外阴', 'vulva', 'vulva', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (32, '念珠样菌', 'Candida albicans', 'candidaAlbicans', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (33, '滴虫', 'trichomonad', 'trichomonad', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (34, '阴道清洁度', 'cleaning degree of vagina', 'cdv', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (35, '阴道', 'vagina', 'vagina', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (36, '其它（白带）', 'Others (leucorrhea)', 'othersL', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (37, '宫颈', 'neck of uterus', 'neckOfUterus', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (38, '子宫(妇科)', 'Uterus', 'uterus', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (39, '附件(妇科)', 'adnexal', 'adnexal', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (40, '妇科其它', 'gynecologicexamination', 'gynecologicexamination', NULL, NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (41, '病史', 'medical history', 'medicaHistory', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (42, '内科', 'Internal Medicine Department', 'imd', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (43, '家族史', 'family history', 'familyHistory', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (44, '心率', 'heart rate', 'heartRate', NULL, NULL, '内科', NULL, NULL, '次/分', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (45, '心律', 'rhythm of the heart', 'roth', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (46, '心音', 'heart sound', 'heartSound', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (47, '肺部听诊', 'Lung auscultation', 'la', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (48, '肝脏触诊', 'liver palpation', 'lp', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (49, '脾脏触诊', 'Spleen Palpation', 'spleenPal', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (50, '肾脏叩诊', 'Renal percussion', 'rp', NULL, NULL, '内科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (51, '皮肤', 'skin', 'skin', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (52, '外科', 'surgery', 'surgery', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (53, '浅表淋巴结', 'Superficial lymph nodes', 'sln', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (54, '甲状腺(外科)', 'Thyroid (surgery)', 'thyroidSurgery', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (55, '乳房', 'breast', 'breast', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (56, '脊柱', 'spine', 'spine', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (57, '四肢关节', 'Joints of limbs', 'jointsLimbs', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (58, '外生殖器', 'External genitalia', 'eg', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (59, '肛门、直肠指诊', 'anus rectum', 'anusRectum', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (60, '前列腺(外科)', 'Prostate (surgery)', 'prostateSurgery', NULL, NULL, '外科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (61, '外耳', 'External ear', 'externalEar', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (62, '耳鼻咽喉科其它', 'Otorhinolaryngology other', 'entOther', 'E.N.T', NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (63, '既往史', 'Past history', 'pastHistory', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (64, '外耳道', 'External auditory canal', 'eac', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (65, '鼓膜', 'tympanic membrane', 'tm', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (66, '鼻腔', 'nasal cavity', 'nasalCavity', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (67, '鼻中隔', 'nasal septum', 'nasalSeptum', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (68, '咽', 'pharynx', 'pharynx', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (69, '扁桃体', 'tonsil', 'tonsil', NULL, NULL, '耳鼻咽喉科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (70, '唇', 'lip', 'lip', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (71, '颞下颌关节', 'Temporomandibular joint', 'tmj', 'TMJ', NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (72, '口腔科其它', 'Stomatology other', 'stomatologyOther', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (73, '牙列', 'dentition', 'dentition', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (74, '牙齿', 'toothBody', 'toothBody', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (75, '口腔腺体', 'Oral gland', 'oralGland', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (76, '牙周', 'dental periphery', 'dentalPeriphery', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (77, '舌', 'tongue', 'tongue', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (78, '腭', 'palate', 'palate', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (79, '口腔粘膜', 'Oral mucosa', 'oralMucosa', NULL, NULL, '口腔检查', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (80, '白细胞计数', 'Leukocyte Count ', 'lc', NULL, NULL, '血常规', '3.5', '9.5', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (81, '血小板计数', 'blood platelet', 'plt', 'PLT', NULL, '血常规', '125', '350', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (82, '平均血小板体积', 'Mean platelet volume', 'mpv', 'MPV', NULL, '血常规', '6.5', '13', 'fL', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (83, '类风湿因子', 'rheumatoid factor', 'rf', 'RF', NULL, '血常规', NULL, '20', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (84, '超敏C反应蛋白', 'hypersensitive C-reactive protein', 'hsCRP', 'hs-CRP', NULL, '血常规', NULL, '5', 'mg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (85, 'C-反应蛋白', 'C-reactive protein', 'crp', 'CRP', NULL, '血常规', NULL, '5', 'mg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (86, '血小板分布宽度', 'Platelet distribution width', 'pdw', 'PDW', NULL, '血常规', '9', '17', 'fL', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (87, '抗链球菌溶血素“O”', 'Anti-Streptolysin O', 'aso', 'ASO', NULL, '血常规', NULL, '200', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (88, '甲胎蛋白', 'alpha fetoprotein', 'afp', 'AFP', NULL, '血常规', NULL, '7', 'ng/ml', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (89, '癌胚抗原', 'carcinoembryonic antigen', 'cea', 'CEA', NULL, '血常规', NULL, '5', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (90, '总前列腺特异性抗原', 'Total Prostate Specific Antigen', 'tpsa', 'T-PSA', NULL, '血常规', NULL, '4', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (91, '游离前列腺特异性抗原', 'Free Prostate specific antigen', 'fpsa', 'F-PSA', NULL, '血常规', NULL, '0.93', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (92, '糖类抗原19-9（CA19-9）', 'Carbohydrate antigen199', 'ca199', 'CA199', NULL, '血常规', NULL, '39', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (93, '糖类抗原242', NULL, 'ca242', 'CA242', NULL, '血常规', NULL, '20', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (94, '糖类抗原125（CA125）', 'carbohydrate antigen 125', 'ca125', 'CA125', NULL, '血常规', NULL, '35', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (95, '糖类抗原15-3', NULL, 'ca153', 'CA153', NULL, '血常规', NULL, '25', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (96, '糖类抗原50', NULL, 'ca50', 'CA50', NULL, '血常规', NULL, '30', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (97, '糖类抗原724', 'Tumor Marker', 'ca724', 'CA724', NULL, '血常规', NULL, '6.9', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (98, '细胞角蛋白19片段(CYFRA21-1)', 'Cytokeratin-19-fragment(CYFRA21-1)', 'cyfra211', 'CYFRA21-1', NULL, '血常规', NULL, '3.3', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (99, '淋巴细胞百分比', 'lymphocyte', 'lymphocytePrec', 'LYMPH%', NULL, '血常规', '20', '40', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (100, '淋巴细胞绝对值', 'lymphocyte', 'lymphocyteAbso', 'LYMPH#', NULL, '血常规', '1.1', '3.2', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (101, '三碘甲状腺原氨酸T3', 'triiodothyronine', 't3', 'T3', NULL, '血常规', '1.3', '3.1', 'pmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (102, '甲状腺素T4', 'thyroxine', 't4', 'T4', NULL, '血常规', '66', '181', 'nmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (103, '促甲状腺激素（TSH）', 'thyroid stimulating hormone', 'tsh', 'TSH', NULL, '血常规', '0.27', '4.2', 'mIU/L', '孕期1-12周：0.05-5.17;孕期13-28周:0.39-5.22; 孕期29-40周:0.60-6.84', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (104, '中性粒细胞', 'neutrophil', 'neutrophil', NULL, NULL, '血常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (105, '中性粒细胞百分比', 'neutrophil granulocyte', 'neutrophilPrec', 'NEUT%', NULL, '血常规', '40', '75', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (106, '中性粒细胞绝对值', 'neutrophil granulocyte', 'neutrophilAbso', 'NEUT#', NULL, '血常规', '1.8', '6.3', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (107, '免疫球蛋白A', 'immunoglobulin A', 'igA', 'IgA', NULL, '实验室检查', '0.7', '4', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (108, '免疫球蛋白E', 'immunoglobulin E', 'igE', 'IgE', NULL, '实验室检查', NULL, '100', 'KU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (109, '免疫球蛋白G', 'immunoglobulin G', 'igG', 'IgG', NULL, '实验室检查', '7', '16', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (110, '免疫球蛋白M', 'immunoglobulin M', 'igM', 'IgM', NULL, '实验室检查', '0.4', '2.3', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (111, '游离三碘甲状腺原氨酸', NULL, 'ft3', 'FT3', NULL, '实验室检查', '3.1', '6.8', 'pmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (112, '游离甲状腺素', 'FreeThyroxine.FT4', 'ft4', 'FT4', NULL, '实验室检查', '12', '22', 'pmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (113, '鳞状上皮细胞癌相关抗原', 'squamous cell carcinoma antigen', 'scc', 'SCC', NULL, '实验室检查', NULL, '1.5', 'ng/ml', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (114, '血清α-羟丁酸脱氢酶', 'α-HBDH', 'hbdh', 'α-HBDH', NULL, '实验室检查', '72', '182', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (115, '血清钾', 'Serum potassium', 'k', 'K', NULL, '实验室检查', '3.5', '5.3', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (116, '血清钠', 'Serum sodium', 'na', 'Na', NULL, '实验室检查', '137', '147', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (117, '血清氯', 'Serum chlorine', 'cl', 'Cl', NULL, '实验室检查', '99', '110', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (118, '血清镁', 'Serum magnesium', 'mg', 'Mg', NULL, '实验室检查', '0.75', '1.02', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (119, '血清钙', 'Serum calcium', 'ca', 'Ca', NULL, '实验室检查', '2.11', '2.52', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (120, '血清磷', 'Serum phosphorus', 'p', 'P', NULL, '实验室检查', '0.85', '1.51', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (121, '红细胞分布宽度-标准差', 'Red Cell volume Distribution Width ', 'rdwsd', 'RDW-SD', NULL, '血常规', '35', '56', 'fl', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (122, '红细胞分布宽度-变异系数', 'Red Cell volume Distribution Width ', 'rdwcv', 'RDW-CV', NULL, '血常规', '11', '16', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (123, '同型半胱氨酸', 'Homocysteine', 'hcy', 'Hcy', NULL, '实验室检查', '5', '15', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (124, '红细胞计数', 'Erythrocyte Count', 'ec', NULL, NULL, '血常规', '3.8', '5.1', '10^12/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (125, '血小板压积', 'Hematocrit', 'pct', 'PCT', NULL, '血常规', '0.11', '0.28', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (126, '血小板', 'platelet', 'platelet', NULL, NULL, '血常规', '100', '300', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (127, '单核细胞', 'monocytes', 'monocytes', NULL, NULL, '血常规', NULL, NULL, '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (128, '单核细胞百分比', 'monocytes', 'monocytesPrec', 'MONO%', NULL, '血常规', '3', '8', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (129, '单核细胞绝对值', 'monocytes', 'monocytesAbso', 'MONO#', NULL, '血常规', '0.12', '0.8', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (130, '嗜酸性粒细胞百分比', 'eosinophil', 'eosinophilPrec', 'EOS%', NULL, '血常规', '0.5', '5', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (131, '嗜酸性粒细胞绝对值', 'eosinophil', 'eosinophilAbso', 'EOS#', NULL, '血常规', '0.05', '0.5', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (132, '嗜酸细胞提示', 'acidophilicgranulocyte', 'eosinophilTip', NULL, NULL, '血常规', NULL, NULL, '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (133, '嗜碱性粒细胞百分比', 'basophil', 'basophilPrec', 'BASO%', NULL, '血常规', '0', '1', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (134, '嗜碱性粒细胞绝对值', 'basophil', 'basophilAbso', 'BASO#', NULL, '血常规', '0', '0.1', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (135, '尿比重', 'Specific gravity', 'sg', 'SG', NULL, '尿常规', '1.015', '1.025', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (136, '血清尿酸', 'serum uric acid', 'sua', 'SUA', NULL, '尿常规', '155', '357', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (137, '尿酸', 'Uric acid', 'ua', 'UA', NULL, '尿常规', '208', '428', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (138, '尿白细胞', 'Leukocytes in urine', 'leu', 'LEU', NULL, '尿常规', NULL, '阴性', 'Cell/uL', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (139, '血红蛋白', 'Hemoglobin', 'hgb', 'HGB', NULL, '血常规', '115', '150', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (140, '尿亚硝酸盐', 'Urinary nitrite', 'nit', 'NIT', NULL, '尿常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (141, '尿蛋白质', 'Urine protein', 'pro', 'PRO', NULL, '尿常规', NULL, '阴性', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (142, '尿糖', 'glycosuria', 'glycosuria', NULL, NULL, '尿常规', NULL, '阴性', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (143, '尿酮体', 'Ketone', 'ketone', 'KET', NULL, '尿常规', NULL, '阴性', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (144, '铁蛋白', 'Ferritin', 'ferritin', 'Fer', NULL, '实验室检查', NULL, NULL, 'μg/L', '男性:约15－200ug/L；女性:约12－150ug/L', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (145, '尿胆原', 'Urobilinogen', 'ubg', 'UBG', NULL, '尿常规', NULL, '阴性', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (146, '尿胆红素', 'Bilirubin', 'bilirubin', 'BIL', NULL, '尿常规', NULL, '阴性', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (147, '尿潜血', NULL, 'bld', 'BLD', NULL, '尿常规', NULL, '阴性', 'Cell/uL', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (148, '便潜血', 'Fecal occult blood', 'ob', 'OB', NULL, '便隐血', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (149, '尿镜检红细胞', 'Urine microscopy erythrocyte', 'ume', NULL, NULL, '尿常规', '0', '3', '个', '正常人尿沉渣镜检红细胞为0～偶见/高倍视野', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (150, '胃蛋白酶原Ⅰ', 'pepsinogen1', 'pepsinogen1', 'PGⅠ', NULL, '实验室检查', '67', '200', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (151, '胃蛋白酶原Ⅰ/Ⅱ', 'pepsinogen1/2', 'pepsinogen12', 'PGI/PGII', NULL, '实验室检查', '7.5', NULL, 'nmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (152, '胃蛋白酶原Ⅱ', 'pepsinogen2', 'pepsinogen2', 'PGⅡ', NULL, '实验室检查', '0', '15', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (153, '尿镜检白细胞', 'Urine microscopy hemameba', 'umh', NULL, NULL, '尿常规', '0', '5', '个', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (154, '管型', 'Urinary cast', 'urinaryCast', NULL, NULL, '尿常规', '0', '1.5', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (155, '尿液其它', 'Urine other', 'urineOther', NULL, NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (156, '上皮细胞', 'Epithelial Cell', 'epithelialCell', NULL, NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (157, '无机盐类', 'mineral salt', 'mineralSalt', NULL, NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (158, '红细胞压积', 'packed cell  volume', 'hct', 'HCT', '红细胞压积（PCV）是旧称，现在称红细胞比容（Hct）', '血常规', '0.35', '0.45', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (159, '天门冬氨酸氨基转移酶', 'Aspartate aminotransferase', 'ast', 'AST', '俗称：谷草转氨酶', '实验室检查', '13', '35', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (160, '丙氨酸氨基转移酶', 'Alanine aminotransferase', 'alt', 'ALT', '俗称：谷丙转氨酶', '实验室检查', '7', '40', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (161, '谷酰转酞酶', 'glutamyltransferase', 'ggt', 'GGT', '其他名称：γ-谷氨酰转移酶', '实验室检查', NULL, '50', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (162, 'HPV6型', NULL, 'hpv6', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (163, 'HPV11型', NULL, 'hpv11', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (164, 'HPV16型', NULL, 'hpv16', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (165, 'HPV18型', NULL, 'hpv18', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (166, 'HPV26型', NULL, 'hpv26', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (167, 'HPV31型', NULL, 'hpv31', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (168, 'HPV33型', NULL, 'hpv33', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (169, 'HPV35型', NULL, 'hpv35', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (170, 'HPV39型', NULL, 'hpv39', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (171, 'HPV40型', NULL, 'hpv40', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (172, 'HPV42型', NULL, 'hpv42', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (173, 'HPV43型', NULL, 'hpv43', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (174, 'HPV44型', NULL, 'hpv44', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (175, 'HPV45型', NULL, 'hpv45', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (176, 'HPV51型', NULL, 'hpv51', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (177, 'HPV52型', NULL, 'hpv52', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (178, 'HPV53型', NULL, 'hpv53', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (179, 'HPV55型', NULL, 'hpv55', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (180, 'HPV56型', NULL, 'hpv56', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (181, 'HPV58型', NULL, 'hpv58', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (182, 'HPV59型', NULL, 'hpv59', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (183, 'HPV61型', NULL, 'hpv61', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (184, 'HPV66型', NULL, 'hpv66', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (185, 'HPV68型', NULL, 'hpv68', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (186, 'HPV81型', NULL, 'hpv81', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (187, 'HPV82型', NULL, 'hpv82', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (188, 'HPV83型', NULL, 'hpv83', NULL, NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (189, '碱性磷酸酶(ALP)', 'alkaline phosphatase', 'alp', 'ALP', NULL, '实验室检查', '40', '150', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (190, '胆碱酯酶', 'cholinesterase', 'cholinesterase', 'ChE', NULL, '实验室检查', '5320', '12920', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (191, '总胆红素', 'total bilirubin', 'tbil', 'TBIL', NULL, '实验室检查', '1.7', '17.1', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (192, '直接胆红素', 'Direct Bilirubin', 'dbil', 'DBIL', NULL, '实验室检查', '0', '6.8', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (193, '间接胆红素', 'Indirect Bilirubin', 'ibil', 'IBIL', NULL, '实验室检查', '1.7', '10.2', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (194, '平均红细胞体积', 'mean corpuscular volume', 'mcv', 'MCV', NULL, '血常规', '82', '100', 'fL', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (195, '总蛋白', 'TotalProtein', 'tp', 'TP', NULL, '实验室检查', '60', '80', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (196, '白蛋白(ALB)', 'Albumin', 'alb', 'ALB', NULL, '实验室检查', '35', '55', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (197, '球蛋白', 'Globulin', 'globulin', 'GLO', NULL, '实验室检查', '20', '40', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (198, '白蛋白/球蛋白比值', 'Albumin globulin ratio', 'agr', 'A/G', NULL, '实验室检查', NULL, NULL, NULL, '(1.2-2.4):1', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (199, '尿素', 'Urea ', 'urea', 'UREA', NULL, '实验室检查', '2.6', '7.5', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (200, '肌酐', 'creatinine', 'cre', 'Cre', NULL, '实验室检查', '41', '73', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (201, '肌酐(血)', 'Serum creatinine', 'scr', 'Scr', NULL, '实验室检查', '44', '133', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (202, '空腹血葡萄糖', 'Fasting blood glucose', 'fbg', 'FBG', NULL, '实验室检查', '3.9', '6.1', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (203, '糖化血红蛋白', 'glycated hemoglobin', 'ghb', 'GHb', NULL, '实验室检查', '4.8', '5.9', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (204, '平均红细胞血红蛋白含量', 'mean corpuscular hemoglobin', 'mch', 'MCH', NULL, '血常规', '27', '34', 'pg', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (205, '平均红细胞血红蛋白浓度', 'Mean corpuscular hemoglobin concentration', 'mchc', 'MCHC', NULL, '血常规', '316', '354', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (206, '总胆固醇', 'total cholesterol', 'tcho', 'TCHO', NULL, '实验室检查', NULL, NULL, 'mmol/L', '理想范围:<5.18; 边缘升高:5.18-6 .19;升高:≥6.22', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (207, '低密度脂蛋白(LDL)', 'LDL', 'ldl', 'LDL', NULL, '实验室检查', NULL, '3.37', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (208, '低密度脂蛋白(LDL-C)', 'Low-Density Lipoprotein Cholesterol', 'ldlc', 'LDL-C', NULL, '实验室检查', NULL, NULL, 'mmol/L', '理想范围:<3.37; 边缘升高:3.37-4 .12;增高:>4.14', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (209, '载脂蛋白-A1', NULL, 'apoA1', 'ApoA-Ⅰ', NULL, '实验室检查', '1.04', '2.25', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (210, '载脂蛋白-B', NULL, 'apoB', 'ApoB', NULL, '实验室检查', '0.6', '1.33', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (211, '脂蛋白(a)', 'Lipoprotein(a)', 'lpA', 'Lp(A)', NULL, '实验室检查', NULL, '75', 'nmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (212, '肌酸激酶', 'creatine kinase', 'ck', 'CK', NULL, '实验室检查', '39', '208', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (213, '肌酸激酶同工酶', 'creatine kinase isoenzymes', 'cki', 'cki', NULL, '实验室检查', NULL, '25', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (214, '乳酸脱氢酶', 'Lactate dehydrogenase', 'ldh', 'LDH', NULL, '实验室检查', '135', '250', 'U/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (215, '胸部', 'chest', 'chest', NULL, NULL, '放射科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (216, '肝', 'liver', 'liver', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (217, '双肾', 'Both kidneys', 'bothKidneys', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (218, '子宫', 'uterus', 'uterusUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (219, '胆', 'gallbladder', 'gallbladderUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (220, '附件', 'adnexal', 'adnexalUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (221, '胰', 'pancreas', 'pancreasUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (222, '脾', 'spleen', 'spleenUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (223, '前列腺', 'prostate', 'prostate', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (224, '乳腺', 'milk gland', 'mgUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (225, '甲状腺', 'thyroid', 'thyroidUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (226, '颈动脉', 'carotid artery', 'caUlt', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (227, '腹部', 'abdomen', 'abdomen', NULL, '超声波', '超声检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (228, '心电图检查', 'ECG examination', 'ecg', 'ECG', NULL, '心电图室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (229, '骨密度检测', 'bone density determination', 'bmd', 'BMD', NULL, '骨密度检查室', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (230, '雌二醇', 'Estradiol', 'estradiol', NULL, NULL, '性激素六项', NULL, NULL, 'pmol/L', '正常值范围大约是：排卵前期：48-521pmol/L；排卵期：70-1835pmol/L；排卵后期：272-793pmol/L；', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (231, '促卵泡成熟素（FSH）', 'follicle-stimulating hormone', 'fsh', 'FSH', NULL, '性激素六项', NULL, NULL, 'mu/mI', '女性1.7～8.5mu/mI月经周期中卵泡期水平比黄体期高，周期中期出现一高峰；男性0.9～9.8mu/ml 均在50岁以后由于性腺功能减退而有增高趋势。', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (232, 'HPV检查', 'Human Papillomavirus', 'hpv', 'HPV', NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (233, '胰岛素', 'insulin', 'ins', 'INS', NULL, '尿常规', '5', '20', 'mIU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (234, '促黄体生成激素', 'luteinizing hormone', 'lh', 'LH', NULL, '性激素六项', NULL, NULL, 'IU/L', '男:1.5-9.3IU/L、女卵泡期:1.9-12.5IU/L、女排卵期:8.7-76.3IU/L、女黄体期:0.5-16.9IU/L、女绝经期15.9-54IU/L、女妊娠期0-1.5IU/L', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (235, 'PH值', 'PH', 'ph', 'PH', NULL, '尿常规', '4.6', '8', NULL, '尿液的ph值', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (236, '孕酮', 'Progestin', 'progestin', NULL, NULL, '性激素六项', '0.3', '2.5', 'nmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (237, 'TCT检查', 'Thinprep cytologic test', 'tct', 'TCT', NULL, '妇科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (238, '睾酮', 'Testosterone', 'testosterone', NULL, NULL, '性激素六项', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (239, 'X线检查', NULL, 'xray', NULL, NULL, '放射科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (240, '白细胞', 'white blood cell', 'wbc', 'WBC', NULL, '血常规', '4', '10', '10^9/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (241, '丙型肝炎抗体', 'HCV－Ab', 'hcvab', 'HCV-Ab', NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (242, '催乳素', 'prolactin', 'prl', 'PRL', NULL, '性激素六项', '4.79', '23.3', 'IU/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (243, '大血小板比率', 'P-LCR', 'plcr', 'P-LCR', NULL, '血常规', '13', '43', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (244, '甘油三脂（TRIG)', 'Triglyceride', 'tg', 'TG', '血清甘油三酯测定(TG)', '血常规', '0.56', '1.7', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (245, '高密度脂蛋白(HDL)', 'high-density lipoprotein', 'hdl', 'HDL', NULL, '血常规', '0.7', '2', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (246, '高密度脂蛋白(HDL-C)', 'High-density lipoprotein cholesterol', 'hdlc', 'HDL-C', NULL, '血常规', NULL, NULL, 'mmol/L', '理想范围:>1.04; 升高:≥1.55;降 低:<1.04', NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (247, '红细胞', 'red blood cell', 'rbc', 'RBC', NULL, '血常规', '3.5', '5.5', '10^12/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (248, '梅毒螺旋体特异性抗体', 'treponema pallidum antibody', 'tpha', 'TPHA', NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (249, '尿素氮', NULL, 'bun', 'BUN', NULL, '尿常规', '2.86', '7.14', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (250, '葡萄糖', 'glucose', 'glucose', NULL, NULL, '血常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (251, '前列腺特异性抗原', 'Prostate specific antigen', 'psa', 'PSA', NULL, '实验室检查', '0', '4.1', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (252, '人类免疫缺陷病毒抗体检测', NULL, 'hiv', 'HIV', NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (253, '神经元特异性烯醇化酶', 'neuron-specific enolase', 'nse', 'NSE', NULL, '实验室检查', '0', '15.2', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (254, '酮体', 'ketone body', 'ketosome', NULL, NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (255, '微白蛋白', 'Microalbumin', 'malb', 'MALB', NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (256, '维生素B12', 'Vitamin B12', 'vitaminB12', NULL, NULL, '血常规', '191', '946', 'ng/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (257, '维生维C', 'Vitamin C', 'vitaminC', NULL, NULL, '尿常规', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (258, '胃幽门螺杆菌抗体检测', 'helicobacter pylori antibody', 'hpab', 'Hp-Ab', NULL, '实验室检查', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (259, '血清C肽', 'Serum C-peptide', 'serumC', NULL, NULL, '血常规', '0.37', '1.47', 'nmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (260, '血清前白蛋白', NULL, 'pa', 'PA', NULL, '血常规', '0.2', '0.4', 'g/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (261, '血清叶酸', 'Serum folate', 'sfa', 'SFA', NULL, '血常规', '4.6', '0', 'μg/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (262, '血清总胆固醇测定(TC)', NULL, 'tc', 'TC', NULL, '血常规', '0', '5.18', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (263, '血糖（GLU)', 'Blood glucose', 'glu', 'Glu', NULL, '血常规', '3.9', '6.1', 'mmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (264, '血细胞压积', 'packed cell  volume', 'pcv', 'PCV', NULL, '血常规', '31', '48', '%', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (265, '颜色', 'Color', 'color', NULL, NULL, '眼科', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (266, '乙肝e抗体定性', 'Qualitative analysis of hepatitis B e antibody', 'khbe', 'k-HBe', NULL, '血常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (267, '乙肝e抗原定性', NULL, 'hbeab', 'HBeAb', NULL, '血常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (268, '乙肝表面抗体定性', NULL, 'khbs', 'k-HBs', NULL, '血常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (269, '乙肝表面抗原定性', NULL, 'hbsag', 'HBsAg', NULL, '血常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (270, '乙肝核心抗体定性', NULL, 'khbc', 'k-HBC', NULL, '血常规', NULL, '阴性', NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (271, '中医体质辨识(离退职工项目)', 'Identification of constitution of traditional Chinese Medicine', 'tcm', 'TCM', NULL, '中医体质辨识', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (272, '总胆汁酸', 'total bile acid', 'tba', 'TBA', NULL, '血常规', '0', '10', 'μmol/L', NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (273, '眼科小结', 'Summary of Ophthalmology', 'soo', NULL, NULL, '眼科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (274, '妇科小结', 'Summary of Gynecology', 'sog', NULL, NULL, '妇科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (275, '心电图室小结', 'Summary of ECG room', 'soECG', NULL, NULL, '心电图室小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (276, '内科小结', 'Summary of Internal Medicine', 'soim', NULL, NULL, '内科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (277, '外科小结', 'Summary of surgery', 'sos', NULL, NULL, '外科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (278, '骨密度检查室小结', 'Summary of bone mineral density examination room', 'soBMD', NULL, NULL, '骨密度检查室小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (279, '耳鼻咽喉科小结', 'Summary of Otorhinolaryngology', 'soENT', NULL, NULL, '耳鼻咽喉科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (280, '放射科小结', 'Summary of Radiology Department', 'sord', NULL, NULL, '放射科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (281, '口腔科小结', 'Summary of Stomatology', 'soft', NULL, NULL, '口腔科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (282, '检验科小结', 'Laboratory summary', 'ls', NULL, NULL, '检验科小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (283, '超声检查室小结', 'Summary of ultrasound examination room', 'soue', NULL, NULL, '超声检查室小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (284, '一般检查室小结', 'Summary of general examination room', 'soger', NULL, NULL, '一般检查室小结', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO `physical_checkup_item` VALUES (285, '总检建议', 'General inspection suggestion', 'gis', NULL, NULL, '总检建议', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for physical_report_item
-- ----------------------------
DROP TABLE IF EXISTS `physical_report_item`;
CREATE TABLE `physical_report_item`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `report_id` bigint(11) NOT NULL COMMENT '报告id',
  `inspection_item` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目',
  `measuring_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量结果',
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `item_type` int(2) NULL DEFAULT 0 COMMENT '检查项目 1: 一般项目检查  2:血常规 3:尿常规 4:便隐血 5:实验室检查 6: 性激素六项 7：内科 8：外科 9：妇科 10： 眼科 11：耳鼻咽喉科 12：心电图室 13：超声检查室 14：骨密度检查室 15：放射科',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告数据表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告查看记录表' ROW_FORMAT = Dynamic;

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
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user_info
-- ----------------------------
INSERT INTO `system_user_info` VALUES (1, '管理员', '100000000000000000', '100000', 'admin', '2aab537ad3a93282f59aa6d0c27d2c21', '17ee63a9315444a8a4825684d6bf9798', '1', 1, '2021-02-19 02:00:46', 'TKY电子所', '经营管理业务群', NULL, NULL, NULL, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
