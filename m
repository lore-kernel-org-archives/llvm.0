Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629F205ABA;
	Fri, 10 Jan 2025 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508175; cv=none; b=M7OQQoD1yyiCHUd06MfgOgxUN0aHv0rLjArgxzFZxv2eJ4NIopV59voUGq87QUqoFWeubYt12dtZTbA/TSS//sfvOxk2La3XXRJlV8xu1wA0+q0je+iuBCp7zfMoUSssQGHv9wCG2p6Z1vdMfPXGOQVZcgj3fvYyO8BWbWeIxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508175; c=relaxed/simple;
	bh=5J8QH08TxmZ7/zRw+/Pt9ZVkAux94asPiGaJPRSbfKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcbSI7MnR03rGEH+U779FbdyMIz8+VEaTDbaaTNR6MEnAeD4TyHNc5WnVOBY9+ba4wSmZYQUCUMtSwpMkpvcv6RFG9yEJYrIakVFP3aX1pwWP5v+dpwmOwh05wHJiiF4qtPGfSvZUix0gTM7/E1l+asQ4QN8O/v1cC+y2Rfx5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpepZ0Hq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpepZ0Hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736508173; x=1768044173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5J8QH08TxmZ7/zRw+/Pt9ZVkAux94asPiGaJPRSbfKw=;
  b=LpepZ0HqdmFcSuBXsMakfmnK/elXKKFylKSlbx2WFHzYVrAJMPDekAGs
   RtI95Sz1dixmIL4EpV3lPT8EnfqL84ci0B4gYtWb67hNHc1/4XUdK/lbW
   T84lCxexWD9kkV01GBvgdt+7sb+zg8wEMx9WHlZwXcpKzc191euGyK2xm
   jPOVOp8iGPxz5eAkbbGq5/pDPHQkbkw808nUonta3fdkIbxcishcfS8RS
   vFHSR620NCHz67L3p8faycNOGyc/dv8gdAd+ohnEyoGCoV6Q9F3e+Kdip
   +QAYRUd7Q8+PVfRa10SjZcqI+q57tU75I9lncqEfoJo9cU95BQlKOk3zN
   Q==;
X-CSE-ConnectionGUID: D1O5RcozQjurv4wlObDzXw==
X-CSE-MsgGUID: SMOTvqNJReyI+8Cc7fFsmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36908375"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36908375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:22:52 -0800
X-CSE-ConnectionGUID: pHmKgz8nQoOo3Dwdmh4lTA==
X-CSE-MsgGUID: PeZJlcbHRFCLYHZbYAsBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103763478"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jan 2025 03:22:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWD6E-000J7X-1K;
	Fri, 10 Jan 2025 11:22:46 +0000
Date: Fri, 10 Jan 2025 19:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 333/504] drivers/usb/dwc3/core.c:1422:5:
 warning: no previous prototype for function 'dwc3_core_init'
Message-ID: <202501101933.bG3wkkG3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 852fef317cff07d1feee37e7d6ae013b9da7394e [333/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: hexagon-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101933.bG3wkkG3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101933.bG3wkkG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101933.bG3wkkG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/dwc3/core.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/usb/dwc3/core.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/usb/dwc3/core.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/usb/dwc3/core.c:24:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/usb/dwc3/core.c:1422:5: warning: no previous prototype for function 'dwc3_core_init' [-Wmissing-prototypes]
    1422 | int dwc3_core_init(struct dwc3 *dwc)
         |     ^
   drivers/usb/dwc3/core.c:1422:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1422 | int dwc3_core_init(struct dwc3 *dwc)
         | ^
         | static 
   8 warnings generated.


vim +/dwc3_core_init +1422 drivers/usb/dwc3/core.c

  1415	
  1416	/**
  1417	 * dwc3_core_init - Low-level initialization of DWC3 Core
  1418	 * @dwc: Pointer to our controller context structure
  1419	 *
  1420	 * Returns 0 on success otherwise negative errno.
  1421	 */
> 1422	int dwc3_core_init(struct dwc3 *dwc)
  1423	{
  1424		unsigned int		hw_mode;
  1425		u32			reg;
  1426		int			ret;
  1427	
  1428		hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
  1429	
  1430		/*
  1431		 * Write Linux Version Code to our GUID register so it's easy to figure
  1432		 * out which kernel version a bug was found.
  1433		 */
  1434		dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
  1435	
  1436		ret = dwc3_phy_setup(dwc);
  1437		if (ret)
  1438			return ret;
  1439	
  1440		if (!dwc->ulpi_ready) {
  1441			ret = dwc3_core_ulpi_init(dwc);
  1442			if (ret) {
  1443				if (ret == -ETIMEDOUT) {
  1444					dwc3_core_soft_reset(dwc);
  1445					ret = -EPROBE_DEFER;
  1446				}
  1447				return ret;
  1448			}
  1449			dwc->ulpi_ready = true;
  1450		}
  1451	
  1452		if (!dwc->phys_ready) {
  1453			ret = dwc3_core_get_phy(dwc);
  1454			if (ret)
  1455				goto err_exit_ulpi;
  1456			dwc->phys_ready = true;
  1457		}
  1458	
  1459		ret = dwc3_phy_init(dwc);
  1460		if (ret)
  1461			goto err_exit_ulpi;
  1462	
  1463		ret = dwc3_core_soft_reset(dwc);
  1464		if (ret)
  1465			goto err_exit_phy;
  1466	
  1467		dwc3_core_setup_global_control(dwc);
  1468		dwc3_core_num_eps(dwc);
  1469	
  1470		if (dwc->scratchbuf == NULL) {
  1471			ret = dwc3_alloc_scratch_buffers(dwc);
  1472			if (ret) {
  1473				dev_err(dwc->dev,
  1474					"Not enough memory for scratch buffers\n");
  1475				goto err_exit_phy;
  1476			}
  1477		}
  1478	
  1479		ret = dwc3_setup_scratch_buffers(dwc);
  1480		if (ret) {
  1481			dev_err(dwc->dev, "Failed to setup scratch buffers: %d\n", ret);
  1482			goto err_exit_phy;
  1483		}
  1484	
  1485		/* Set power down scale of suspend_clk */
  1486		dwc3_set_power_down_clk_scale(dwc);
  1487	
  1488		/* Adjust Frame Length */
  1489		dwc3_frame_length_adjustment(dwc);
  1490	
  1491		/* Adjust Reference Clock Period */
  1492		dwc3_ref_clk_period(dwc);
  1493	
  1494		dwc3_set_incr_burst_type(dwc);
  1495	
  1496		dwc3_config_soc_bus(dwc);
  1497	
  1498		ret = dwc3_phy_power_on(dwc);
  1499		if (ret)
  1500			goto err_exit_phy;
  1501	
  1502		ret = dwc3_event_buffers_setup(dwc);
  1503		if (ret) {
  1504			dev_err(dwc->dev, "failed to setup event buffers\n");
  1505			goto err_power_off_phy;
  1506		}
  1507	
  1508		/*
  1509		 * ENDXFER polling is available on version 3.10a and later of
  1510		 * the DWC_usb3 controller. It is NOT available in the
  1511		 * DWC_usb31 controller.
  1512		 */
  1513		if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
  1514			reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
  1515			reg |= DWC3_GUCTL2_RST_ACTBITLATER;
  1516			dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
  1517		}
  1518	
  1519		/*
  1520		 * STAR 9001285599: This issue affects DWC_usb3 version 3.20a
  1521		 * only. If the PM TIMER ECM is enabled through GUCTL2[19], the
  1522		 * link compliance test (TD7.21) may fail. If the ECN is not
  1523		 * enabled (GUCTL2[19] = 0), the controller will use the old timer
  1524		 * value (5us), which is still acceptable for the link compliance
  1525		 * test. Therefore, do not enable PM TIMER ECM in 3.20a by
  1526		 * setting GUCTL2[19] by default; instead, use GUCTL2[19] = 0.
  1527		 */
  1528		if (DWC3_VER_IS(DWC3, 320A)) {
  1529			reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
  1530			reg &= ~DWC3_GUCTL2_LC_TIMER;
  1531			dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
  1532		}
  1533	
  1534		/*
  1535		 * When configured in HOST mode, after issuing U3/L2 exit controller
  1536		 * fails to send proper CRC checksum in CRC5 feild. Because of this
  1537		 * behaviour Transaction Error is generated, resulting in reset and
  1538		 * re-enumeration of usb device attached. All the termsel, xcvrsel,
  1539		 * opmode becomes 0 during end of resume. Enabling bit 10 of GUCTL1
  1540		 * will correct this problem. This option is to support certain
  1541		 * legacy ULPI PHYs.
  1542		 */
  1543		if (dwc->resume_hs_terminations) {
  1544			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1545			reg |= DWC3_GUCTL1_RESUME_OPMODE_HS_HOST;
  1546			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1547		}
  1548	
  1549		if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
  1550			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1551	
  1552			/*
  1553			 * Enable hardware control of sending remote wakeup
  1554			 * in HS when the device is in the L1 state.
  1555			 */
  1556			if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
  1557				reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
  1558	
  1559			/*
  1560			 * Decouple USB 2.0 L1 & L2 events which will allow for
  1561			 * gadget driver to only receive U3/L2 suspend & wakeup
  1562			 * events and prevent the more frequent L1 LPM transitions
  1563			 * from interrupting the driver.
  1564			 */
  1565			if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
  1566				reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
  1567	
  1568			if (dwc->dis_tx_ipgap_linecheck_quirk)
  1569				reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
  1570	
  1571			if (dwc->parkmode_disable_ss_quirk)
  1572				reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
  1573	
  1574			if (dwc->parkmode_disable_hs_quirk)
  1575				reg |= DWC3_GUCTL1_PARKMODE_DISABLE_HS;
  1576	
  1577			if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY)) {
  1578				if (dwc->maximum_speed == USB_SPEED_FULL ||
  1579				    dwc->maximum_speed == USB_SPEED_HIGH)
  1580					reg |= DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
  1581				else
  1582					reg &= ~DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
  1583			}
  1584	
  1585			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1586		}
  1587	
  1588		dwc3_config_threshold(dwc);
  1589	
  1590		/*
  1591		 * Modify this for all supported Super Speed ports when
  1592		 * multiport support is added.
  1593		 */
  1594		if (hw_mode != DWC3_GHWPARAMS0_MODE_GADGET &&
  1595		    (DWC3_IP_IS(DWC31)) &&
  1596		    dwc->maximum_speed == USB_SPEED_SUPER) {
  1597			reg = dwc3_readl(dwc->regs, DWC3_LLUCTL);
  1598			reg |= DWC3_LLUCTL_FORCE_GEN1;
  1599			dwc3_writel(dwc->regs, DWC3_LLUCTL, reg);
  1600		}
  1601	
  1602		return 0;
  1603	
  1604	err_power_off_phy:
  1605		dwc3_phy_power_off(dwc);
  1606	err_exit_phy:
  1607		dwc3_phy_exit(dwc);
  1608	err_exit_ulpi:
  1609		dwc3_ulpi_exit(dwc);
  1610	
  1611		return ret;
  1612	}
  1613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
