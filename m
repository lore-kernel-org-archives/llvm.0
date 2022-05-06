Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D642568
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651857747; x=1683393747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A99+qxw+j1sMXB4sdRANlUCSkyLnijmbOqRCb8Yjjjs=;
  b=mOzzO/NDfW/gASAKosjzZIjS7F05wPbYIyVV4EEoL3MzfN4y33aUBUM+
   BqpmyP0zr0zlFJR+LkRtqn8IY9xH0vHsSGe2SozWcQ/Lm/y8rq0En7Cql
   w6/ooxHUjzdQmffBzAx+Cu6+EDG4hwgp22sUP+srIo4dRnOqR9JHMKUU0
   hCi1krpuy4Jwsp0Qchxsxl5QwctWDTE1ilQpmv2VxoBpux+Xoc99iPxYF
   Cu4enz+qzzSLuGbiNDtl8aY4w3gF6DyjQHs/ZR5br9WidSvr49nfMXm5N
   WME+FrmKL5Ku0lkv6CD/DqPJe/O9LCYYLlAhm7Hoy/h/RRm7QIBIHcbKI
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267365489"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="267365489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 10:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="518133861"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2022 10:22:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn1eo-000Dhy-Qe;
	Fri, 06 May 2022 17:22:22 +0000
Date: Sat, 7 May 2022 01:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 357/1129]
 drivers/usb/dwc3/core.c:947:5: warning: no previous prototype for function
 'dwc3_core_init'
Message-ID: <202205070136.uhXlkwBn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: abcfc28b4d344d18ab4e5100b96045ebc203259c [357/1129] usb: dwc3: gadget: Add hibernation support when operating in gadget mode
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220507/202205070136.uhXlkwBn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/abcfc28b4d344d18ab4e5100b96045ebc203259c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout abcfc28b4d344d18ab4e5100b96045ebc203259c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/core.c:947:5: warning: no previous prototype for function 'dwc3_core_init' [-Wmissing-prototypes]
   int dwc3_core_init(struct dwc3 *dwc)
       ^
   drivers/usb/dwc3/core.c:947:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int dwc3_core_init(struct dwc3 *dwc)
   ^
   static 
   1 warning generated.


vim +/dwc3_core_init +947 drivers/usb/dwc3/core.c

   940	
   941	/**
   942	 * dwc3_core_init - Low-level initialization of DWC3 Core
   943	 * @dwc: Pointer to our controller context structure
   944	 *
   945	 * Returns 0 on success otherwise negative errno.
   946	 */
 > 947	int dwc3_core_init(struct dwc3 *dwc)
   948	{
   949		unsigned int		hw_mode;
   950		u32			reg;
   951		int			ret;
   952	
   953		hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
   954	
   955		/*
   956		 * Write Linux Version Code to our GUID register so it's easy to figure
   957		 * out which kernel version a bug was found.
   958		 */
   959		dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
   960	
   961		ret = dwc3_phy_setup(dwc);
   962		if (ret)
   963			goto err0;
   964	
   965		if (!dwc->ulpi_ready) {
   966			ret = dwc3_core_ulpi_init(dwc);
   967			if (ret)
   968				goto err0;
   969			dwc->ulpi_ready = true;
   970		}
   971	
   972		if (!dwc->phys_ready) {
   973			ret = dwc3_core_get_phy(dwc);
   974			if (ret)
   975				goto err0a;
   976			dwc->phys_ready = true;
   977		}
   978	
   979		usb_phy_init(dwc->usb2_phy);
   980		usb_phy_init(dwc->usb3_phy);
   981		ret = phy_init(dwc->usb2_generic_phy);
   982		if (ret < 0)
   983			goto err0a;
   984	
   985		ret = phy_init(dwc->usb3_generic_phy);
   986		if (ret < 0) {
   987			phy_exit(dwc->usb2_generic_phy);
   988			goto err0a;
   989		}
   990	
   991		ret = dwc3_core_soft_reset(dwc);
   992		if (ret)
   993			goto err1;
   994	
   995		if (hw_mode == DWC3_GHWPARAMS0_MODE_DRD &&
   996		    !DWC3_VER_IS_WITHIN(DWC3, ANY, 194A)) {
   997			if (!dwc->dis_u3_susphy_quirk) {
   998				reg = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
   999				reg |= DWC3_GUSB3PIPECTL_SUSPHY;
  1000				dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), reg);
  1001			}
  1002	
  1003			if (!dwc->dis_u2_susphy_quirk) {
  1004				reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
  1005				reg |= DWC3_GUSB2PHYCFG_SUSPHY;
  1006				dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
  1007			}
  1008		}
  1009	
  1010		dwc3_core_setup_global_control(dwc);
  1011		dwc3_core_num_eps(dwc);
  1012	
  1013		ret = dwc3_alloc_scratch_buffers(dwc);
  1014		if (ret) {
  1015			dev_err(dwc->dev,
  1016				"Not enough memory for scratch buffers\n");
  1017			goto err1;
  1018		}
  1019	
  1020		ret = dwc3_setup_scratch_buffers(dwc);
  1021		if (ret)
  1022			goto err1;
  1023	
  1024		/* Adjust Frame Length */
  1025		dwc3_frame_length_adjustment(dwc);
  1026	
  1027		dwc3_set_incr_burst_type(dwc);
  1028	
  1029		usb_phy_set_suspend(dwc->usb2_phy, 0);
  1030		usb_phy_set_suspend(dwc->usb3_phy, 0);
  1031		ret = phy_power_on(dwc->usb2_generic_phy);
  1032		if (ret < 0)
  1033			goto err2;
  1034	
  1035		ret = phy_power_on(dwc->usb3_generic_phy);
  1036		if (ret < 0)
  1037			goto err3;
  1038	
  1039		ret = dwc3_event_buffers_setup(dwc);
  1040		if (ret) {
  1041			dev_err(dwc->dev, "failed to setup event buffers\n");
  1042			goto err4;
  1043		}
  1044	
  1045		/*
  1046		 * ENDXFER polling is available on version 3.10a and later of
  1047		 * the DWC_usb3 controller. It is NOT available in the
  1048		 * DWC_usb31 controller.
  1049		 */
  1050		if (DWC3_VER_IS_WITHIN(DWC3, 310A, ANY)) {
  1051			reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
  1052			reg |= DWC3_GUCTL2_RST_ACTBITLATER;
  1053			dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
  1054		}
  1055	
  1056		if (!DWC3_VER_IS_PRIOR(DWC3, 250A)) {
  1057			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
  1058	
  1059			/*
  1060			 * Enable hardware control of sending remote wakeup
  1061			 * in HS when the device is in the L1 state.
  1062			 */
  1063			if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
  1064				reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
  1065	
  1066			/*
  1067			 * Decouple USB 2.0 L1 & L2 events which will allow for
  1068			 * gadget driver to only receive U3/L2 suspend & wakeup
  1069			 * events and prevent the more frequent L1 LPM transitions
  1070			 * from interrupting the driver.
  1071			 */
  1072			if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
  1073				reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
  1074	
  1075			if (dwc->dis_tx_ipgap_linecheck_quirk)
  1076				reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
  1077	
  1078			if (dwc->parkmode_disable_ss_quirk)
  1079				reg |= DWC3_GUCTL1_PARKMODE_DISABLE_SS;
  1080	
  1081			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
  1082		}
  1083	
  1084		if (dwc->dr_mode == USB_DR_MODE_HOST ||
  1085		    dwc->dr_mode == USB_DR_MODE_OTG) {
  1086			reg = dwc3_readl(dwc->regs, DWC3_GUCTL);
  1087	
  1088			/*
  1089			 * Enable Auto retry Feature to make the controller operating in
  1090			 * Host mode on seeing transaction errors(CRC errors or internal
  1091			 * overrun scenerios) on IN transfers to reply to the device
  1092			 * with a non-terminating retry ACK (i.e, an ACK transcation
  1093			 * packet with Retry=1 & Nump != 0)
  1094			 */
  1095			reg |= DWC3_GUCTL_HSTINAUTORETRY;
  1096	
  1097			dwc3_writel(dwc->regs, DWC3_GUCTL, reg);
  1098		}
  1099	
  1100		/*
  1101		 * Must config both number of packets and max burst settings to enable
  1102		 * RX and/or TX threshold.
  1103		 */
  1104		if (!DWC3_IP_IS(DWC3) && dwc->dr_mode == USB_DR_MODE_HOST) {
  1105			u8 rx_thr_num = dwc->rx_thr_num_pkt_prd;
  1106			u8 rx_maxburst = dwc->rx_max_burst_prd;
  1107			u8 tx_thr_num = dwc->tx_thr_num_pkt_prd;
  1108			u8 tx_maxburst = dwc->tx_max_burst_prd;
  1109	
  1110			if (rx_thr_num && rx_maxburst) {
  1111				reg = dwc3_readl(dwc->regs, DWC3_GRXTHRCFG);
  1112				reg |= DWC31_RXTHRNUMPKTSEL_PRD;
  1113	
  1114				reg &= ~DWC31_RXTHRNUMPKT_PRD(~0);
  1115				reg |= DWC31_RXTHRNUMPKT_PRD(rx_thr_num);
  1116	
  1117				reg &= ~DWC31_MAXRXBURSTSIZE_PRD(~0);
  1118				reg |= DWC31_MAXRXBURSTSIZE_PRD(rx_maxburst);
  1119	
  1120				dwc3_writel(dwc->regs, DWC3_GRXTHRCFG, reg);
  1121			}
  1122	
  1123			if (tx_thr_num && tx_maxburst) {
  1124				reg = dwc3_readl(dwc->regs, DWC3_GTXTHRCFG);
  1125				reg |= DWC31_TXTHRNUMPKTSEL_PRD;
  1126	
  1127				reg &= ~DWC31_TXTHRNUMPKT_PRD(~0);
  1128				reg |= DWC31_TXTHRNUMPKT_PRD(tx_thr_num);
  1129	
  1130				reg &= ~DWC31_MAXTXBURSTSIZE_PRD(~0);
  1131				reg |= DWC31_MAXTXBURSTSIZE_PRD(tx_maxburst);
  1132	
  1133				dwc3_writel(dwc->regs, DWC3_GTXTHRCFG, reg);
  1134			}
  1135		}
  1136	
  1137		return 0;
  1138	
  1139	err4:
  1140		phy_power_off(dwc->usb3_generic_phy);
  1141	
  1142	err3:
  1143		phy_power_off(dwc->usb2_generic_phy);
  1144	
  1145	err2:
  1146		usb_phy_set_suspend(dwc->usb2_phy, 1);
  1147		usb_phy_set_suspend(dwc->usb3_phy, 1);
  1148	
  1149	err1:
  1150		usb_phy_shutdown(dwc->usb2_phy);
  1151		usb_phy_shutdown(dwc->usb3_phy);
  1152		phy_exit(dwc->usb2_generic_phy);
  1153		phy_exit(dwc->usb3_generic_phy);
  1154	
  1155	err0a:
  1156		dwc3_ulpi_exit(dwc);
  1157	
  1158	err0:
  1159		return ret;
  1160	}
  1161	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
