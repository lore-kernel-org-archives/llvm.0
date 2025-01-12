Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FF41BC07A;
	Sun, 12 Jan 2025 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736708987; cv=none; b=odMoORywudjYRe4wnfk7cunNLfchdc8tY3ddwKMxEAfWlyTVrg2dQPk39fgip5MXIUWpCaW+AB2Jmm/X4shoBhefc7qmROsubHyRXTETzJqo/fBxAZuSJIvWmvNyy8C3/fK4F8eQ72BHeoesZjAgiG94BpK0+wn2Z76jZcaD0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736708987; c=relaxed/simple;
	bh=Rx1Fy27kCBKMjZWzp+zVIMF2xAVqRtIeOI1XX5qPS/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWMrnY9eNJojeEbUuLMY9Pz+tc0Vclzo2FlyquIcrmEZkOdFvKoMh1khzK9J/rowwcPk2MjiXrFTE1BkM9NDNIF891D1I4iglwnW8xQ7QTvokCJsWHAx7DKNNjpKqmrxkNuRIadWnvgUGAL4Rkgntn5PX/87o/D6RHaS8ZnDK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHy1OsLo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHy1OsLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736708985; x=1768244985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rx1Fy27kCBKMjZWzp+zVIMF2xAVqRtIeOI1XX5qPS/8=;
  b=SHy1OsLoo2V01isS3/yD0PObNc5jt1ap5u103pKcG9W3EmuvqbSZNw8X
   4AGEwdWEmg+Sa9FCAd9WuVYbbov206p3WeErY1CjcdCWaXSLgNaXSv3uT
   Se1lFjRAoeYp/q5CeD63Aps76sHWVzER8wt/oMlhLOk8i2d3v1Qj2C/zP
   KDLTsdya6BowoihUNOR6ISe9WzpTmxrKPy4aCkIYAaXz3Ybgu18tqIbSy
   vfgzot42gpAm9e75261SVsxecaHXXWuYReL9chUwMAJWFDkYneSRUkVAk
   Nhm54L/Qs11zR97Ho49P32JqCrVcVGtjTVqbhjvCMLfa+RGLHN+vEfUG1
   Q==;
X-CSE-ConnectionGUID: 1GoVgRXvShaQPuq4l2pDxA==
X-CSE-MsgGUID: dqOMuq9dTe+RDzhUWg0EJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62308181"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="62308181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 11:09:44 -0800
X-CSE-ConnectionGUID: P+KuwwAnT8edxLnk+5+NxQ==
X-CSE-MsgGUID: MeHLz79+Ssq+00jc6OGRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104735954"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jan 2025 11:09:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX3L9-000MJr-2S;
	Sun, 12 Jan 2025 19:09:39 +0000
Date: Mon, 13 Jan 2025 03:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 270/504]
 drivers/phy/xilinx/xhdmiphy_mmcm.c:1234:9: warning: variable 'clkout_div' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202501130221.1S9vuudT-lkp@intel.com>
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
commit: b5577f1129b810e73c625bf02ca243cfd85543ca [270/504] phy: xilinx-xhdmiphy: initial driver support for xilinx HDMI PHY 2.1 IP
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250113/202501130221.1S9vuudT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130221.1S9vuudT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130221.1S9vuudT-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   3 warnings generated.


vim +1234 drivers/phy/xilinx/xhdmiphy_mmcm.c

  1178	
  1179	static u16 xhdmiphy_set_videoclk_outdiv(struct xhdmiphy_dev *inst,
  1180						enum color_depth bpc, enum ppc ppc,
  1181						enum dir dir, u16 mult_div)
  1182	{
  1183		u16 clkout_div;
  1184	
  1185		switch (bpc) {
  1186		case XVIDC_BPC_10:
  1187			if (ppc == XVIDC_PPC_4) {
  1188				clkout_div = (mult_div * 5 * ((dir == XHDMIPHY_DIR_TX) ?
  1189					      inst->tx_samplerate : 1));
  1190			} else if (ppc == XVIDC_PPC_2) {
  1191				/*
  1192				 * The clock ratio is 2.5. The PLL only
  1193				 * supports integer value. The mult_div
  1194				 * must be dividable by two
  1195				 * (2 * 2.5 = 5) to get an integer
  1196				 * number
  1197				 */
  1198				if ((mult_div % 2) == 0) {
  1199					clkout_div = (mult_div * 5 / 2 *
  1200								 ((dir == XHDMIPHY_DIR_TX) ?
  1201								 inst->tx_samplerate : 1));
  1202				}
  1203			} else {
  1204				/*
  1205				 * The clock ratio is 1.25. The pll only
  1206				 * supports integer values The multDiv
  1207				 * must be dividable by four
  1208				 * (4 * 1.25 = 5) to get an integer
  1209				 * number
  1210				 */
  1211				if ((mult_div % 4) == 0) {
  1212					clkout_div = (mult_div * 5 / 4 *
  1213								 ((dir == XHDMIPHY_DIR_TX) ?
  1214								 inst->tx_samplerate : 1));
  1215				}
  1216			}
  1217				break;
  1218		case XVIDC_BPC_12:
  1219			if (ppc == XVIDC_PPC_4) {
  1220				clkout_div = (mult_div * 6 *
  1221								 ((dir == XHDMIPHY_DIR_TX) ?
  1222								 inst->tx_samplerate : 1));
  1223				} else if (ppc == XVIDC_PPC_2) {
  1224					clkout_div = (mult_div * 3 *
  1225								 ((dir == XHDMIPHY_DIR_TX) ?
  1226								 inst->tx_samplerate : 1));
  1227				} else {
  1228					/*
  1229					 * The clock ratio is 1.5. The PLL only
  1230					 * supports integer values. The mult_div
  1231					 * must be dividable by two (2 * 1.5 = 3)
  1232					 * to get an integer number
  1233					 */
> 1234					if ((mult_div % 2) == 0) {
  1235						clkout_div = (mult_div * 3 / 2 *
  1236									 ((dir == XHDMIPHY_DIR_TX) ?
  1237									 inst->tx_samplerate : 1));
  1238					}
  1239				}
  1240				break;
  1241		case XVIDC_BPC_16:
  1242			if (ppc == XVIDC_PPC_4) {
  1243				clkout_div = (mult_div * 8 * ((dir == XHDMIPHY_DIR_TX) ?
  1244					      inst->tx_samplerate : 1));
  1245			} else if (ppc == XVIDC_PPC_2) {
  1246				clkout_div = (mult_div * 4 * ((dir == XHDMIPHY_DIR_TX) ?
  1247					      inst->tx_samplerate : 1));
  1248			} else {
  1249				clkout_div = (mult_div * 2 * ((dir == XHDMIPHY_DIR_TX) ?
  1250					      inst->tx_samplerate : 1));
  1251			}
  1252			break;
  1253		case XVIDC_BPC_8:
  1254			fallthrough;
  1255		default:
  1256			if (ppc == XVIDC_PPC_4) {
  1257				clkout_div = (mult_div * 4 * ((dir == XHDMIPHY_DIR_TX) ?
  1258					      inst->tx_samplerate : 1));
  1259			} else if (ppc == XVIDC_PPC_2) {
  1260				clkout_div = (mult_div * 2 * ((dir == XHDMIPHY_DIR_TX) ?
  1261					      inst->tx_samplerate : 1));
  1262			} else {
  1263				clkout_div = (mult_div * ((dir == XHDMIPHY_DIR_TX) ?
  1264					      inst->tx_samplerate : 1));
  1265			}
  1266			break;
  1267		}
  1268		return clkout_div;
  1269	}
  1270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
