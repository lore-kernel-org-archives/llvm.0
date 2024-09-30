Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842420B0F;
	Mon, 30 Sep 2024 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727709562; cv=none; b=WPJiFVWtAMC1LEbiMB0R557BpPlp+eAKdPrKzTH9WMqiW7qeY5PFkRqP7JMJXHFR3NyxbOZq16bHeXABF3eMyDgdSD4BlH8jBLW1ZiC4GiH9pyMyc7b83Ds0+Uy6jnTEAmMXK7M0r9dTSMOqXSf/bVJmFVtyjjUtj+6yW1hwttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727709562; c=relaxed/simple;
	bh=ZaaHFN24f06MFIInK9a09ZOHgaVxUhhbLaVyiovnby8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXL8FNRjNQGHTZpRSSbwW+zXpT0IsrzmbCMA758mZ9Nn9Ka3Jip+WCzwjWpx25TkSaFcF+S8YLz0LDPYXrND1Qe1L52SgpTHZ0RzQq8I85VwwFogJPtjfNYnVWMfnsttptxDSVSt/1BIxrefORVRDX9FrKw0zucNOKV4bMY1ziU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQMnAOqB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQMnAOqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727709560; x=1759245560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZaaHFN24f06MFIInK9a09ZOHgaVxUhhbLaVyiovnby8=;
  b=NQMnAOqBst4yfnOyzee+eEg9kS+OeKnL8torY9R4A3qPLeXxYhg9G9dJ
   4n0qlbiRroLPc+YFlRDutlWmHtVGERChgMUjaH1JQ6D5egBNDDA6Nq/zT
   +YWcpIYdNhhbm3veO1jtgplCPe8IjmwXIlTG/sMJYqdrsPmPS5G1piQJ1
   FYZxPxhspkL91z7Lt+D8yywTmuuymm7eY/PKJ5Vthv8FGWrSRqHWOgJIw
   rZO4pIqEVVo0Bfxqmi0LIRxLdv1a8layKM4IC/qr+sIfecgLcbFys0EoL
   CVkunRl2hxxTL6i7QuXOXVpH3rsZ4LGWoB8olRE7h/2LNv7E5XY9aQJMP
   g==;
X-CSE-ConnectionGUID: OVfOKLfYSxW38t+aWNwBYw==
X-CSE-MsgGUID: XRppHYxzQ5yLYqKtO371NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52221722"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="52221722"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 08:19:19 -0700
X-CSE-ConnectionGUID: nlZ4ZbmMT7OGrtpQzZSvUg==
X-CSE-MsgGUID: +ZOrdQRGTxCfSWXkoXwMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="104140169"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 08:19:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svIB9-000Pa9-1H;
	Mon, 30 Sep 2024 15:19:15 +0000
Date: Mon, 30 Sep 2024 23:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1055/1093]
 drivers/phy/xilinx/xhdmiphy_mmcm.c:1234:9: warning: variable 'clkout_div' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202409302308.lIL0sda0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   3c31f9d5fb29a99c43f59d424f7f717ee2177e14
commit: 08ecfe67e56a27154e6db9a57f578f21eb53bf9f [1055/1093] phy: xilinx-xhdmiphy: Add support for selection of PLL/MMCM clock primitive
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409302308.lIL0sda0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409302308.lIL0sda0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409302308.lIL0sda0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/xilinx/xhdmiphy_mmcm.c:7:
   In file included from drivers/phy/xilinx/xhdmiphy.h:7:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2170:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/phy/xilinx/xhdmiphy_mmcm.c:1234:9: warning: variable 'clkout_div' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1234 |                                 if ((mult_div % 2) == 0) {
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1268:9: note: uninitialized use occurs here
    1268 |         return clkout_div;
         |                ^~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1234:5: note: remove the 'if' if its condition is always true
    1234 |                                 if ((mult_div % 2) == 0) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1211:8: warning: variable 'clkout_div' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1211 |                         if ((mult_div % 4) == 0) {
         |                             ^~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1268:9: note: uninitialized use occurs here
    1268 |         return clkout_div;
         |                ^~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1211:4: note: remove the 'if' if its condition is always true
    1211 |                         if ((mult_div % 4) == 0) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1198:8: warning: variable 'clkout_div' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1198 |                         if ((mult_div % 2) == 0) {
         |                             ^~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1268:9: note: uninitialized use occurs here
    1268 |         return clkout_div;
         |                ^~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1198:4: note: remove the 'if' if its condition is always true
    1198 |                         if ((mult_div % 2) == 0) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/xilinx/xhdmiphy_mmcm.c:1183:16: note: initialize the variable 'clkout_div' to silence this warning
    1183 |         u16 clkout_div;
         |                       ^
         |                        = 0
   8 warnings generated.


vim +1234 drivers/phy/xilinx/xhdmiphy_mmcm.c

08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1178  
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1179  static u16 xhdmiphy_set_videoclk_outdiv(struct xhdmiphy_dev *inst,
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1180  					enum color_depth bpc, enum ppc ppc,
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1181  					enum dir dir, u16 mult_div)
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1182  {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1183  	u16 clkout_div;
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1184  
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1185  	switch (bpc) {
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1186  	case XVIDC_BPC_10:
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1187  		if (ppc == XVIDC_PPC_4) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1188  			clkout_div = (mult_div * 5 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1189  				      inst->tx_samplerate : 1));
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1190  		} else if (ppc == XVIDC_PPC_2) {
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1191  			/*
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1192  			 * The clock ratio is 2.5. The PLL only
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1193  			 * supports integer value. The mult_div
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1194  			 * must be dividable by two
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1195  			 * (2 * 2.5 = 5) to get an integer
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1196  			 * number
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1197  			 */
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1198  			if ((mult_div % 2) == 0) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1199  				clkout_div = (mult_div * 5 / 2 *
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1200  							 ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1201  							 inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1202  			}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1203  		} else {
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1204  			/*
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1205  			 * The clock ratio is 1.25. The pll only
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1206  			 * supports integer values The multDiv
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1207  			 * must be dividable by four
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1208  			 * (4 * 1.25 = 5) to get an integer
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1209  			 * number
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1210  			 */
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1211  			if ((mult_div % 4) == 0) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1212  				clkout_div = (mult_div * 5 / 4 *
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1213  							 ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1214  							 inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1215  			}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1216  		}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1217  			break;
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1218  	case XVIDC_BPC_12:
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1219  		if (ppc == XVIDC_PPC_4) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1220  			clkout_div = (mult_div * 6 *
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1221  							 ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1222  							 inst->tx_samplerate : 1));
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1223  			} else if (ppc == XVIDC_PPC_2) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1224  				clkout_div = (mult_div * 3 *
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1225  							 ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1226  							 inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1227  			} else {
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1228  				/*
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1229  				 * The clock ratio is 1.5. The PLL only
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1230  				 * supports integer values. The mult_div
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1231  				 * must be dividable by two (2 * 1.5 = 3)
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1232  				 * to get an integer number
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1233  				 */
c48231bd27c857 Rajesh Gugulothu 2021-07-30 @1234  				if ((mult_div % 2) == 0) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1235  					clkout_div = (mult_div * 3 / 2 *
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1236  								 ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1237  								 inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1238  				}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1239  			}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1240  			break;
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1241  	case XVIDC_BPC_16:
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1242  		if (ppc == XVIDC_PPC_4) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1243  			clkout_div = (mult_div * 8 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1244  				      inst->tx_samplerate : 1));
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1245  		} else if (ppc == XVIDC_PPC_2) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1246  			clkout_div = (mult_div * 4 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1247  				      inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1248  		} else {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1249  			clkout_div = (mult_div * 2 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1250  				      inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1251  		}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1252  		break;
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1253  	case XVIDC_BPC_8:
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1254  		fallthrough;
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1255  	default:
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1256  		if (ppc == XVIDC_PPC_4) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1257  			clkout_div = (mult_div * 4 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1258  				      inst->tx_samplerate : 1));
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1259  		} else if (ppc == XVIDC_PPC_2) {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1260  			clkout_div = (mult_div * 2 * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1261  				      inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1262  		} else {
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1263  			clkout_div = (mult_div * ((dir == XHDMIPHY_DIR_TX) ?
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1264  				      inst->tx_samplerate : 1));
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1265  		}
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1266  		break;
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1267  	}
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1268  	return clkout_div;
08ecfe67e56a27 Rajesh Gugulothu 2024-07-16  1269  }
c48231bd27c857 Rajesh Gugulothu 2021-07-30  1270  

:::::: The code at line 1234 was first introduced by commit
:::::: c48231bd27c857761af739b6f11c5872a10482ac phy: xilinx-xhdmiphy: initial driver support for xilinx HDMI PHY 2.1 IP

:::::: TO: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
