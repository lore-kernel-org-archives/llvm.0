Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E42E88BD;
	Mon,  9 Feb 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649431; cv=none; b=Sm76XYvf7W5NJ9i7bGHARcrRFMlFD7F3FcnMZdYaJITRO1ejrWD2s0b0OzUc9azW3T0nsZrurLrRdb3OcEhzvii2W3/KwpyksuupaKBn5tVYS6bKIrniVBGVbB+dc5H5ej7FFRgQM0jveYCB9+X+jCgDmf6E5mK7Ac9GC3DDmSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649431; c=relaxed/simple;
	bh=x2RntUuN3cLa3GLnx/AQzHmNG+4+TX+m2fRBHO2trUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z5cMmlKrikdB6KeUmy1Cgaqopamg+0Y2KDipHzCueHjJTrsVvDuFpuXZCzvSdf8XUuiakMq8gLWyKmc1R4mxpEvwWuZeYBZkRUeRrNk22O+VBqPuaGZpr4VrHSUzNTPNKfhpW1ERMk4Sx0U7yZKaXAkoSVeuP2beOpirQQB5WHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7F1ZIOF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7F1ZIOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770649431; x=1802185431;
  h=date:from:to:cc:subject:message-id;
  bh=x2RntUuN3cLa3GLnx/AQzHmNG+4+TX+m2fRBHO2trUA=;
  b=Y7F1ZIOFgq38CnlVNP8MMZs18EQo4OoqybKfUkyHON0vWm8l8lESxGSf
   L2n8nKiw38yk3hMj87CN/Vv/odrWzCHGJogWNBbbxW5rSDT2bt/hPXf4h
   Ul81QmHAHOANU2Tcwdpv3eHmSAlREV/Xse+SSxJZo64izpfdXWOO4/CaN
   xrXM5R8OTyfhmokbPLAFNCP5Hp4k7GNOZPdXmEKdo09eeQ9GIKACVv1XX
   Rs2KLIC5QJmhhM6pMbyM6N3hUGtHb1XehVlUolQUoZOuqmg5jBSywxvjL
   TcjzM8ZvFyzywKXM285Md/jOa/NBqfyizYgOUXXjfUZOmz7fQfnsxVJgu
   g==;
X-CSE-ConnectionGUID: Y9U6kRP3Sd6+qrMp7PxSXQ==
X-CSE-MsgGUID: 3qCjQhsDRSaTKsxV5ehvSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59326676"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="59326676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:03:51 -0800
X-CSE-ConnectionGUID: izhVOc3QTF6bYHcFJvr5pg==
X-CSE-MsgGUID: mP/e6CvET3aCkvKM43lZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="242230059"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2026 07:03:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpSni-00000000nzA-1PaX;
	Mon, 09 Feb 2026 15:03:46 +0000
Date: Mon, 09 Feb 2026 23:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [sre-misc:thinkpad-t14s-x1e 33/129]
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer
 element is not a compile-time constant
Message-ID: <202602092245.J0xaqQYK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   e59893f5d6ef4c024a8ce76f6922057dc52b8a9b
commit: bed6d0270cece713d2c84a18d27d2522b9467bdd [33/129] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260209/202602092245.J0xaqQYK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092245.J0xaqQYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092245.J0xaqQYK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: initializer element is not a compile-time constant
                   zero,
                   ^~~~
   1 error generated.


vim +486 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c

   464	
   465	const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
   466		.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
   467		.reg_info = {
   468			.init_seq = lane_regs_x1e80100,
   469			.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
   470			.offset = 0x1000,
   471			.generation = GEN2,
   472		},
   473		.supply_names = (const char *[]){
   474			"vdda-0p8",
   475			"vdda-1p2"
   476		},
   477		.num_supplies = 2,
   478		.clk_names = (const char *[]) {
   479			"camnoc_axi",
   480			"cpas_ahb",
   481			"csiphy",
   482			"csiphy_timer"
   483		},
   484		.num_clk = 4,
   485		.clk_freq = {
 > 486			zero,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
