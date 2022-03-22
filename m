Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1D42BD
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647977372; x=1679513372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hsiCAgQyG5Dv6Y68E8Oy+nC6F1u9qCj1E00+uIItQ5Y=;
  b=O8BaNUBduANAArWt+l3c3/V6v1khiaBVhQautJhQ2I2koOLtTDu6o787
   kg8G3/jaUbGScwfqe+oFtuyaAM/nqnMB2AQ6o/qabFtLw3R0aMheJbMUp
   l+/bp52m4JIejp8prweHRdCiv38zmf676PVRCNNFQeDmkXJU6AMmfl8iB
   41/HDQEBY7bLdByVEGs4OPfiA2q7GOv9kz5s2CdISyvs6BhSjXRr2l2Ur
   yEQSmlGkatLWhPeMhGC0zJqWYE/Y0fIhABPWJQesfpyRKLJVYwpYWirMz
   3BlaGhDW/OE0goCyTXJgr2+BCJdsZBo3KMJRs7aHz1AB7xuNtIsyb8Ino
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="240088490"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="240088490"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 12:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="560554114"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2022 12:29:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWkC9-000JDZ-Lb; Tue, 22 Mar 2022 19:29:29 +0000
Date: Wed, 23 Mar 2022 03:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: daniel.almeida@collabora.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v2] media: Add AV1 uAPI
Message-ID: <202203230341.mMBnQJB8-lkp@intel.com>
References: <20220322160101.620748-1-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322160101.620748-1-daniel.almeida@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.17 next-20220322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/daniel-almeida-collabora-com/media-Add-AV1-uAPI/20220323-000213
base:   git://linuxtv.org/media_tree.git master
config: hexagon-randconfig-r005-20220320 (https://download.01.org/0day-ci/archive/20220323/202203230341.mMBnQJB8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8779a727424842161cc9099ce3d6fd493d170f90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review daniel-almeida-collabora-com/media-Add-AV1-uAPI/20220323-000213
        git checkout 8779a727424842161cc9099ce3d6fd493d170f90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-ctrls-defs.c:1548:13: error: use of undeclared identifier 'V4L2_CTRL_FLAG_DYNAMIC_ARRAY'
                   *flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
                             ^
   drivers/media/v4l2-core/v4l2-ctrls-defs.c:1552:13: error: use of undeclared identifier 'V4L2_CTRL_FLAG_DYNAMIC_ARRAY'
                   *flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
                             ^
   2 errors generated.


vim +/V4L2_CTRL_FLAG_DYNAMIC_ARRAY +1548 drivers/media/v4l2-core/v4l2-ctrls-defs.c

  1239	
  1240	void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
  1241			    s64 *min, s64 *max, u64 *step, s64 *def, u32 *flags)
  1242	{
  1243		*name = v4l2_ctrl_get_name(id);
  1244		*flags = 0;
  1245	
  1246		switch (id) {
  1247		case V4L2_CID_AUDIO_MUTE:
  1248		case V4L2_CID_AUDIO_LOUDNESS:
  1249		case V4L2_CID_AUTO_WHITE_BALANCE:
  1250		case V4L2_CID_AUTOGAIN:
  1251		case V4L2_CID_HFLIP:
  1252		case V4L2_CID_VFLIP:
  1253		case V4L2_CID_HUE_AUTO:
  1254		case V4L2_CID_CHROMA_AGC:
  1255		case V4L2_CID_COLOR_KILLER:
  1256		case V4L2_CID_AUTOBRIGHTNESS:
  1257		case V4L2_CID_MPEG_AUDIO_MUTE:
  1258		case V4L2_CID_MPEG_VIDEO_MUTE:
  1259		case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:
  1260		case V4L2_CID_MPEG_VIDEO_PULLDOWN:
  1261		case V4L2_CID_EXPOSURE_AUTO_PRIORITY:
  1262		case V4L2_CID_FOCUS_AUTO:
  1263		case V4L2_CID_PRIVACY:
  1264		case V4L2_CID_AUDIO_LIMITER_ENABLED:
  1265		case V4L2_CID_AUDIO_COMPRESSION_ENABLED:
  1266		case V4L2_CID_PILOT_TONE_ENABLED:
  1267		case V4L2_CID_ILLUMINATORS_1:
  1268		case V4L2_CID_ILLUMINATORS_2:
  1269		case V4L2_CID_FLASH_STROBE_STATUS:
  1270		case V4L2_CID_FLASH_CHARGE:
  1271		case V4L2_CID_FLASH_READY:
  1272		case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
  1273		case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
  1274		case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
  1275		case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
  1276		case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
  1277		case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
  1278		case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
  1279		case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
  1280		case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
  1281		case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
  1282		case V4L2_CID_WIDE_DYNAMIC_RANGE:
  1283		case V4L2_CID_IMAGE_STABILIZATION:
  1284		case V4L2_CID_RDS_RECEPTION:
  1285		case V4L2_CID_RF_TUNER_LNA_GAIN_AUTO:
  1286		case V4L2_CID_RF_TUNER_MIXER_GAIN_AUTO:
  1287		case V4L2_CID_RF_TUNER_IF_GAIN_AUTO:
  1288		case V4L2_CID_RF_TUNER_BANDWIDTH_AUTO:
  1289		case V4L2_CID_RF_TUNER_PLL_LOCK:
  1290		case V4L2_CID_RDS_TX_MONO_STEREO:
  1291		case V4L2_CID_RDS_TX_ARTIFICIAL_HEAD:
  1292		case V4L2_CID_RDS_TX_COMPRESSED:
  1293		case V4L2_CID_RDS_TX_DYNAMIC_PTY:
  1294		case V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT:
  1295		case V4L2_CID_RDS_TX_TRAFFIC_PROGRAM:
  1296		case V4L2_CID_RDS_TX_MUSIC_SPEECH:
  1297		case V4L2_CID_RDS_TX_ALT_FREQS_ENABLE:
  1298		case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
  1299		case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
  1300		case V4L2_CID_RDS_RX_MUSIC_SPEECH:
  1301			*type = V4L2_CTRL_TYPE_BOOLEAN;
  1302			*min = 0;
  1303			*max = *step = 1;
  1304			break;
  1305		case V4L2_CID_ROTATE:
  1306			*type = V4L2_CTRL_TYPE_INTEGER;
  1307			*flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
  1308			break;
  1309		case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
  1310		case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
  1311		case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
  1312		case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
  1313			*type = V4L2_CTRL_TYPE_INTEGER;
  1314			break;
  1315		case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
  1316			*type = V4L2_CTRL_TYPE_INTEGER;
  1317			break;
  1318		case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
  1319			*type = V4L2_CTRL_TYPE_INTEGER;
  1320			*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
  1321			break;
  1322		case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
  1323			*type = V4L2_CTRL_TYPE_BITMASK;
  1324			*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
  1325			break;
  1326		case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
  1327		case V4L2_CID_PAN_RESET:
  1328		case V4L2_CID_TILT_RESET:
  1329		case V4L2_CID_FLASH_STROBE:
  1330		case V4L2_CID_FLASH_STROBE_STOP:
  1331		case V4L2_CID_AUTO_FOCUS_START:
  1332		case V4L2_CID_AUTO_FOCUS_STOP:
  1333		case V4L2_CID_DO_WHITE_BALANCE:
  1334			*type = V4L2_CTRL_TYPE_BUTTON;
  1335			*flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
  1336				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
  1337			*min = *max = *step = *def = 0;
  1338			break;
  1339		case V4L2_CID_POWER_LINE_FREQUENCY:
  1340		case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
  1341		case V4L2_CID_MPEG_AUDIO_ENCODING:
  1342		case V4L2_CID_MPEG_AUDIO_L1_BITRATE:
  1343		case V4L2_CID_MPEG_AUDIO_L2_BITRATE:
  1344		case V4L2_CID_MPEG_AUDIO_L3_BITRATE:
  1345		case V4L2_CID_MPEG_AUDIO_AC3_BITRATE:
  1346		case V4L2_CID_MPEG_AUDIO_MODE:
  1347		case V4L2_CID_MPEG_AUDIO_MODE_EXTENSION:
  1348		case V4L2_CID_MPEG_AUDIO_EMPHASIS:
  1349		case V4L2_CID_MPEG_AUDIO_CRC:
  1350		case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:
  1351		case V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK:
  1352		case V4L2_CID_MPEG_VIDEO_ENCODING:
  1353		case V4L2_CID_MPEG_VIDEO_ASPECT:
  1354		case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
  1355		case V4L2_CID_MPEG_STREAM_TYPE:
  1356		case V4L2_CID_MPEG_STREAM_VBI_FMT:
  1357		case V4L2_CID_EXPOSURE_AUTO:
  1358		case V4L2_CID_AUTO_FOCUS_RANGE:
  1359		case V4L2_CID_COLORFX:
  1360		case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
  1361		case V4L2_CID_TUNE_PREEMPHASIS:
  1362		case V4L2_CID_FLASH_LED_MODE:
  1363		case V4L2_CID_FLASH_STROBE_SOURCE:
  1364		case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
  1365		case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
  1366		case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
  1367		case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
  1368		case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
  1369		case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
  1370		case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
  1371		case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
  1372		case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
  1373		case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
  1374		case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
  1375		case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
  1376		case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
  1377		case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
  1378		case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
  1379		case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
  1380		case V4L2_CID_ISO_SENSITIVITY_AUTO:
  1381		case V4L2_CID_EXPOSURE_METERING:
  1382		case V4L2_CID_SCENE_MODE:
  1383		case V4L2_CID_DV_TX_MODE:
  1384		case V4L2_CID_DV_TX_RGB_RANGE:
  1385		case V4L2_CID_DV_TX_IT_CONTENT_TYPE:
  1386		case V4L2_CID_DV_RX_RGB_RANGE:
  1387		case V4L2_CID_DV_RX_IT_CONTENT_TYPE:
  1388		case V4L2_CID_TEST_PATTERN:
  1389		case V4L2_CID_DEINTERLACING_MODE:
  1390		case V4L2_CID_TUNE_DEEMPHASIS:
  1391		case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
  1392		case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
  1393		case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
  1394		case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
  1395		case V4L2_CID_DETECT_MD_MODE:
  1396		case V4L2_CID_STATELESS_AV1_PROFILE:
  1397		case V4L2_CID_STATELESS_AV1_LEVEL:
  1398		case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
  1399		case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
  1400		case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_TYPE:
  1401		case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
  1402		case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:
  1403		case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
  1404		case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
  1405		case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
  1406		case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
  1407		case V4L2_CID_STATELESS_H264_DECODE_MODE:
  1408		case V4L2_CID_STATELESS_H264_START_CODE:
  1409		case V4L2_CID_CAMERA_ORIENTATION:
  1410			*type = V4L2_CTRL_TYPE_MENU;
  1411			break;
  1412		case V4L2_CID_LINK_FREQ:
  1413			*type = V4L2_CTRL_TYPE_INTEGER_MENU;
  1414			break;
  1415		case V4L2_CID_RDS_TX_PS_NAME:
  1416		case V4L2_CID_RDS_TX_RADIO_TEXT:
  1417		case V4L2_CID_RDS_RX_PS_NAME:
  1418		case V4L2_CID_RDS_RX_RADIO_TEXT:
  1419			*type = V4L2_CTRL_TYPE_STRING;
  1420			break;
  1421		case V4L2_CID_ISO_SENSITIVITY:
  1422		case V4L2_CID_AUTO_EXPOSURE_BIAS:
  1423		case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:
  1424		case V4L2_CID_MPEG_VIDEO_VPX_NUM_REF_FRAMES:
  1425			*type = V4L2_CTRL_TYPE_INTEGER_MENU;
  1426			break;
  1427		case V4L2_CID_USER_CLASS:
  1428		case V4L2_CID_CAMERA_CLASS:
  1429		case V4L2_CID_CODEC_CLASS:
  1430		case V4L2_CID_FM_TX_CLASS:
  1431		case V4L2_CID_FLASH_CLASS:
  1432		case V4L2_CID_JPEG_CLASS:
  1433		case V4L2_CID_IMAGE_SOURCE_CLASS:
  1434		case V4L2_CID_IMAGE_PROC_CLASS:
  1435		case V4L2_CID_DV_CLASS:
  1436		case V4L2_CID_FM_RX_CLASS:
  1437		case V4L2_CID_RF_TUNER_CLASS:
  1438		case V4L2_CID_DETECT_CLASS:
  1439		case V4L2_CID_CODEC_STATELESS_CLASS:
  1440		case V4L2_CID_COLORIMETRY_CLASS:
  1441			*type = V4L2_CTRL_TYPE_CTRL_CLASS;
  1442			/* You can neither read nor write these */
  1443			*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
  1444			*min = *max = *step = *def = 0;
  1445			break;
  1446		case V4L2_CID_BG_COLOR:
  1447		case V4L2_CID_COLORFX_RGB:
  1448			*type = V4L2_CTRL_TYPE_INTEGER;
  1449			*step = 1;
  1450			*min = 0;
  1451			/* Max is calculated as RGB888 that is 2^24 - 1 */
  1452			*max = 0xffffff;
  1453			break;
  1454		case V4L2_CID_COLORFX_CBCR:
  1455			*type = V4L2_CTRL_TYPE_INTEGER;
  1456			*step = 1;
  1457			*min = 0;
  1458			*max = 0xffff;
  1459			break;
  1460		case V4L2_CID_FLASH_FAULT:
  1461		case V4L2_CID_JPEG_ACTIVE_MARKER:
  1462		case V4L2_CID_3A_LOCK:
  1463		case V4L2_CID_AUTO_FOCUS_STATUS:
  1464		case V4L2_CID_DV_TX_HOTPLUG:
  1465		case V4L2_CID_DV_TX_RXSENSE:
  1466		case V4L2_CID_DV_TX_EDID_PRESENT:
  1467		case V4L2_CID_DV_RX_POWER_PRESENT:
  1468			*type = V4L2_CTRL_TYPE_BITMASK;
  1469			break;
  1470		case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
  1471		case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
  1472			*type = V4L2_CTRL_TYPE_INTEGER;
  1473			*flags |= V4L2_CTRL_FLAG_READ_ONLY;
  1474			break;
  1475		case V4L2_CID_MPEG_VIDEO_DEC_PTS:
  1476			*type = V4L2_CTRL_TYPE_INTEGER64;
  1477			*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
  1478			*min = *def = 0;
  1479			*max = 0x1ffffffffLL;
  1480			*step = 1;
  1481			break;
  1482		case V4L2_CID_MPEG_VIDEO_DEC_FRAME:
  1483			*type = V4L2_CTRL_TYPE_INTEGER64;
  1484			*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
  1485			*min = *def = 0;
  1486			*max = 0x7fffffffffffffffLL;
  1487			*step = 1;
  1488			break;
  1489		case V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR:
  1490			*type = V4L2_CTRL_TYPE_INTEGER64;
  1491			*min = 0;
  1492			/* default for 8 bit black, luma is 16, chroma is 128 */
  1493			*def = 0x8000800010LL;
  1494			*max = 0xffffffffffffLL;
  1495			*step = 1;
  1496			break;
  1497		case V4L2_CID_PIXEL_RATE:
  1498			*type = V4L2_CTRL_TYPE_INTEGER64;
  1499			*flags |= V4L2_CTRL_FLAG_READ_ONLY;
  1500			break;
  1501		case V4L2_CID_DETECT_MD_REGION_GRID:
  1502			*type = V4L2_CTRL_TYPE_U8;
  1503			break;
  1504		case V4L2_CID_DETECT_MD_THRESHOLD_GRID:
  1505			*type = V4L2_CTRL_TYPE_U16;
  1506			break;
  1507		case V4L2_CID_RDS_TX_ALT_FREQS:
  1508			*type = V4L2_CTRL_TYPE_U32;
  1509			break;
  1510		case V4L2_CID_STATELESS_MPEG2_SEQUENCE:
  1511			*type = V4L2_CTRL_TYPE_MPEG2_SEQUENCE;
  1512			break;
  1513		case V4L2_CID_STATELESS_MPEG2_PICTURE:
  1514			*type = V4L2_CTRL_TYPE_MPEG2_PICTURE;
  1515			break;
  1516		case V4L2_CID_STATELESS_MPEG2_QUANTISATION:
  1517			*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION;
  1518			break;
  1519		case V4L2_CID_STATELESS_FWHT_PARAMS:
  1520			*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
  1521			break;
  1522		case V4L2_CID_STATELESS_H264_SPS:
  1523			*type = V4L2_CTRL_TYPE_H264_SPS;
  1524			break;
  1525		case V4L2_CID_STATELESS_H264_PPS:
  1526			*type = V4L2_CTRL_TYPE_H264_PPS;
  1527			break;
  1528		case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
  1529			*type = V4L2_CTRL_TYPE_H264_SCALING_MATRIX;
  1530			break;
  1531		case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
  1532			*type = V4L2_CTRL_TYPE_H264_SLICE_PARAMS;
  1533			break;
  1534		case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
  1535			*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
  1536			break;
  1537		case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
  1538			*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
  1539			break;
  1540		case V4L2_CID_STATELESS_VP8_FRAME:
  1541			*type = V4L2_CTRL_TYPE_VP8_FRAME;
  1542			break;
  1543		case V4L2_CID_STATELESS_AV1_SEQUENCE:
  1544			*type = V4L2_CTRL_TYPE_AV1_SEQUENCE;
  1545			break;
  1546		case V4L2_CID_STATELESS_AV1_TILE_GROUP:
  1547			*type = V4L2_CTRL_TYPE_AV1_TILE_GROUP;
> 1548			*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
