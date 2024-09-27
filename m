Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA8315ECC5;
	Fri, 27 Sep 2024 07:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727421308; cv=none; b=HWLHNj4hzEGz5GyYWLnHI1iQn5Zn6QWVoRAgufdXR8IOwmKp79beCuDF6jn2CZ/06CydCAAbz3JdPk8jPK2N7mcNzRCMajscCvLm1di0zyBCL6n6N+0lQpJ0MOJJ7YFnJP2ny6czLPL05YW/qbwzsWGK0dW6RJXfJAkGuIB/0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727421308; c=relaxed/simple;
	bh=aOw64Eup6sC1AhWI3iU4jQh4IY04Le+2H7RNEOpAeHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMnlu1sRE+LfKNk44WWScCOQv/ev3O7PfFBz5gK80BArXiu4Cnsmz3a4GUEh92VBFyi3dIZvTwFz3pza3wsdJnK1f43sPJvCh/laOyGf/LCHHBhdxiSyMNwhqWLoQI4KaiDverfZZQidhbsOyy/kSmV1GsR/QWebzjJcYlKSkUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtEJZtLf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtEJZtLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727421306; x=1758957306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOw64Eup6sC1AhWI3iU4jQh4IY04Le+2H7RNEOpAeHI=;
  b=WtEJZtLf8hLWDIC8ktETzwpAldJtygHivSId1oUrLV/4MFa+rRYNHvzJ
   dKhZ9Zb6ptM7RHfDESEHnHiDzilwj23jyMP/5WKCAI7iOVJ3sc9IkYY40
   A5Ks8YvtC8gWYyZWZevcB1xetRehr2gN50M36oVpRpDcpFk7/mUCcEFLA
   WEUtrytWLTE1AmsrzkzDUWQKxmZvKcfLpTmqB6LPxoN/LfetR7ffiWr+C
   PqqlxTBalaQ1CWTV5VoqZlYsChibsfuMcobyL9XLUXnB+P6JbvdC5SrbA
   3GgZIGO6EG7B1djBK+1wbjlwYC8MfBYmyM05sPoxZlTDw74E5dGWoBuFz
   w==;
X-CSE-ConnectionGUID: lxB2jbSyTV2enuMIS/l6Og==
X-CSE-MsgGUID: Fr71rxa9R02BGQTN3j9yeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26652716"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26652716"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 00:15:05 -0700
X-CSE-ConnectionGUID: dyEUeQlCQcSiU8Q6Q8/T3A==
X-CSE-MsgGUID: NMsSDo+xQ1mzeFD6aDNXvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72533932"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 00:15:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su5Bt-000LeB-0G;
	Fri, 27 Sep 2024 07:15:01 +0000
Date: Fri, 27 Sep 2024 15:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 636/1001]
 drivers/usb/dwc3/core.c:1232:5: warning: no previous prototype for function
 'dwc3_core_init'
Message-ID: <202409271542.LqIuPcy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 2790ed87f0ae567824335f9e27bdf0da380bb305 [636/1001] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: i386-randconfig-003-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271542.LqIuPcy0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271542.LqIuPcy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271542.LqIuPcy0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/core.c:1232:5: warning: no previous prototype for function 'dwc3_core_init' [-Wmissing-prototypes]
    1232 | int dwc3_core_init(struct dwc3 *dwc)
         |     ^
   drivers/usb/dwc3/core.c:1232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1232 | int dwc3_core_init(struct dwc3 *dwc)
         | ^
         | static 
   1 warning generated.


vim +/dwc3_core_init +1232 drivers/usb/dwc3/core.c

  1225	
  1226	/**
  1227	 * dwc3_core_init - Low-level initialization of DWC3 Core
  1228	 * @dwc: Pointer to our controller context structure
  1229	 *
  1230	 * Returns 0 on success otherwise negative errno.
  1231	 */
> 1232	int dwc3_core_init(struct dwc3 *dwc)
  1233	{
  1234		unsigned int		hw_mode;
  1235		u32			reg;
  1236		int			ret;
  1237	
  1238		hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
  1239	
  1240		/*
  1241		 * Write Linux Version Code to our GUID register so it's easy to figure
  1242		 * out which kernel version a bug was found.
  1243		 */
  1244		dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
  1245	
  1246		ret = dwc3_phy_setup(dwc);
  1247		if (ret)
  1248			return ret;
  1249	
  1250		if (!dwc->ulpi_ready) {
  1251			ret = dwc3_core_ulpi_init(dwc);
  1252			if (ret) {
  1253				if (ret == -ETIMEDOUT) {
  1254					dwc3_core_soft_reset(dwc);
  1255					ret = -EPROBE_DEFER;
  1256				}
  1257				return ret;
  1258			}
  1259			dwc->ulpi_ready = true;
  1260		}
  1261	
  1262		if (!dwc->phys_ready) {
  1263			ret = dwc3_core_get_phy(dwc);
  1264			if (ret)
  1265				goto err_exit_ulpi;
  1266			dwc->phys_ready = true;
  1267		}
  1268	
  1269		ret = dwc3_phy_init(dwc);
  1270		if (ret)
  1271			goto err_exit_ulpi;
  1272	
  1273		ret = dwc3_core_soft_reset(dwc);
  1274		if (ret)
  1275			goto err_exit_phy;
  1276	
  1277		if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD &&
  1278		    !DWC3_VER_IS_WITHIN(DWC3, ANY, 194A)) {
  1279			if (!dwc->dis_u3_susphy_quirk) {
  1280				reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
  1281				reg |= DWC3_GUSB3PIPECTL_SUSPHY;
  1282				dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), reg);
  1283			}
  1284	
  1285			if (!dwc->dis_u2_susphy_quirk) {
  1286				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
  1287				reg |= DWC3_GUSB2PHYCFG_SUSPHY;
  1288				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
  1289			}
  1290		}
  1291	
  1292		dwc3_core_setup_global_control(dwc);
  1293		dwc3_core_num_eps(dwc);
  1294	
  1295		if (dwc->scratchbuf == NULL) {
  1296			ret = dwc3_alloc_scratch_buffers(dwc);
  1297			if (ret) {
  1298				dev_err(dwc->dev,
  1299					"Not enough memory for scratch buffers\n");
  1300				goto err_exit_phy;
  1301			}
  1302		}
  1303	
  1304		ret = dwc3_setup_scratch_buffers(dwc);
  1305		if (ret) {
  1306			dev_err(dwc->dev, "Failed to setup scratch buffers: %d\n", ret);
  1307			goto err_exit_phy;
  1308		}
  1309	
  1310		/* Set power down scale of suspend_clk */
  1311		dwc3_set_power_down_clk_scale(dwc);
  1312	
  1313		/* Adjust Frame Length */
  1314		dwc3_frame_length_adjustment(dwc);
  1315	
  1316		/* Adjust Reference Clock Period */
  1317		dwc3_ref_clk_period(dwc);
  1318	
  1319		dwc3_set_incr_burst_type(dwc);
  1320	
  1321		ret = dwc3_phy_power_on(dwc);
  1322		if (ret)
  1323			goto err_exit_phy;
  1324	
  1325		dwc3_config_soc_bus(dwc);
  1326	
  1327		ret = dwc3_event_buffers_setup(dwc);
  1328		if (ret) {
  1329			dev_err(dwc->dev, "failed to setup event buffers\n");
  1330			goto err_power_off_phy;
  1331		}
  1332	
  1333		/*
  1334		 * ENDXFER polling is available on version 3.10a and later of
  1335		 * the DWC_usb3 controller. It is NOT available in the
  1336		 * DWC_usb31 controller.
  1337		 */
  1338		if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
  1339			reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
  1340			reg |= DWC3_GUCTL2_RST_ACTBITLATER;
  1341			dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
  1342		}
  1343	
  1344		/* SNPS controller when configureed in HOST mode maintains Inter Packet
  1345		 * Delay (IPD) of ~380ns which works with most of the super-speed hubs
  1346		 * except VIA-LAB hubs. When IPD is ~380ns HOST controller fails to
  1347		 * enumerate FS/LS devices when connected behind VIA-LAB hubs.
  1348		 * Enabling bit 9 of GUCTL1 enables the workaround in HW to reduce the
  1349		 * ULPI clock latency by 1 cycle, thus reducing the IPD (~360ns) and
  1350		 * making controller enumerate FS/LS devices connected behind VIA-LAB.
  1351		 */
  1352		if (dwc->enable_guctl1_ipd_quirk) {
  1353			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1354			reg |= DWC3_GUCTL1_IPD_QUIRK;
  1355			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1356		}
  1357	
  1358		/*
  1359		 * When configured in HOST mode, after issuing U3/L2 exit controller
  1360		 * fails to send proper CRC checksum in CRC5 feild. Because of this
  1361		 * behaviour Transaction Error is generated, resulting in reset and
  1362		 * re-enumeration of usb device attached. All the termsel, xcvrsel,
  1363		 * opmode becomes 0 during end of resume. Enabling bit 10 of GUCTL1
  1364		 * will correct this problem. This option is to support certain
  1365		 * legacy ULPI PHYs.
  1366		 */
  1367		if (dwc->resume_hs_terminations) {
  1368			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1369			reg |= DWC3_GUCTL1_RESUME_OPMODE_HS_HOST;
  1370			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1371		}
  1372	
  1373		if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
  1374			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1375	
  1376			/*
  1377			 * Enable hardware control of sending remote wakeup
  1378			 * in HS when the device is in the L1 state.
  1379			 */
  1380			if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
  1381				reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
  1382	
  1383			/*
  1384			 * Decouple USB 2.0 L1 & L2 events which will allow for
  1385			 * gadget driver to only receive U3/L2 suspend & wakeup
  1386			 * events and prevent the more frequent L1 LPM transitions
  1387			 * from interrupting the driver.
  1388			 */
  1389			if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
  1390				reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
  1391	
  1392			if (dwc->dis_tx_ipgap_linecheck_quirk)
  1393				reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
  1394	
  1395			if (dwc->parkmode_disable_ss_quirk)
  1396				reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
  1397	
  1398			if (dwc->parkmode_disable_hs_quirk)
  1399				reg |= DWC3_GUCTL1_PARKMODE_DISABLE_HS;
  1400	
  1401			if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY) &&
  1402			    (dwc->maximum_speed == USB_SPEED_HIGH ||
  1403			     dwc->maximum_speed == USB_SPEED_FULL))
  1404				reg |= DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
  1405	
  1406			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1407		}
  1408	
  1409		/*
  1410		 * Must config both number of packets and max burst settings to enable
  1411		 * RX and/or TX threshold.
  1412		 */
  1413		if (!DWC3_IP_IS(DWC3) && dwc->dr_mode == USB_DR_MODE_HOST) {
  1414			u8 rx_thr_num = dwc->rx_thr_num_pkt_prd;
  1415			u8 rx_maxburst = dwc->rx_max_burst_prd;
  1416			u8 tx_thr_num = dwc->tx_thr_num_pkt_prd;
  1417			u8 tx_maxburst = dwc->tx_max_burst_prd;
  1418	
  1419			if (rx_thr_num && rx_maxburst) {
  1420				reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
  1421				reg |= DWC31_RXTHRNUMPKTSEL_PRD;
  1422	
  1423				reg &= ~DWC31_RXTHRNUMPKT_PRD(~0);
  1424				reg |= DWC31_RXTHRNUMPKT_PRD(rx_thr_num);
  1425	
  1426				reg &= ~DWC31_MAXRXBURSTSIZE_PRD(~0);
  1427				reg |= DWC31_MAXRXBURSTSIZE_PRD(rx_maxburst);
  1428	
  1429				dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
  1430			}
  1431	
  1432			if (tx_thr_num && tx_maxburst) {
  1433				reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
  1434				reg |= DWC31_TXTHRNUMPKTSEL_PRD;
  1435	
  1436				reg &= ~DWC31_TXTHRNUMPKT_PRD(~0);
  1437				reg |= DWC31_TXTHRNUMPKT_PRD(tx_thr_num);
  1438	
  1439				reg &= ~DWC31_MAXTXBURSTSIZE_PRD(~0);
  1440				reg |= DWC31_MAXTXBURSTSIZE_PRD(tx_maxburst);
  1441	
  1442				dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
  1443			}
  1444		}
  1445	
  1446		return 0;
  1447	
  1448	err_power_off_phy:
  1449		dwc3_phy_power_off(dwc);
  1450	err_exit_phy:
  1451		dwc3_phy_exit(dwc);
  1452	err_exit_ulpi:
  1453		dwc3_ulpi_exit(dwc);
  1454	
  1455		return ret;
  1456	}
  1457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
