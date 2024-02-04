Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED3E225AA;
	Sun,  4 Feb 2024 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707056409; cv=none; b=Av4iXTdQKvTfptaHBWJvE4OsyXfw+4Elqa5z5uaR2CyEexWIaHObARZuTExlJ4EPrGdjBw2An68LY2MgcMMfgPMPkYUFGc3pDN1F8sn/WWpuNrNgdxmvf5pe/X/ADGkWhhb99ZBrSY6wGgjcgSpQBwNak+yB+nzRpqLtYuMQGeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707056409; c=relaxed/simple;
	bh=9R4wi9rCotNv7MMPBJDwFj841y9SDNSdM5EgvxWKO94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oODLqteK/ZoUyjjVmtcAFjtjH8Xjv7dKe9SMJJ3qiIOsJiLOnIkSgFlBxKos3jIoixIwbN+PysRkIzWtKxEi6yYiafjEfPM74aW8WKSLoRX4m/cNWgRfmNGNBPCoXGeu+Af50wANqbANg0lG/Ma0xkFmv3R9Du1bcb7xrWdPfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFJp/b7X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFJp/b7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707056407; x=1738592407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9R4wi9rCotNv7MMPBJDwFj841y9SDNSdM5EgvxWKO94=;
  b=mFJp/b7XvafebBaHYhdaH0EZZ1Na4j4JGDRq7ERFM0Nr6o4OIL28b2m6
   6Qbi/qckB+/j1UGbkrM1vmr70vN+sfFrzvU/bsAK5yW+4h44DfbMnA9xQ
   aeHSux03VsnBsZBHrCsKvQfYf9pmD6nSqlI5LioIs6ys0FM2fyvn8VAkF
   JYNk9FGTIWn+RjHPbtygU/oJLZvFxt4zuguQuBih+2WKb+bqMJzIQWuqo
   ZBZHcukPgvddY3C73RgLf/wf3wFHAvB0VOHEUc3FnaodLU+ZU8wC23TQV
   cmnXTghbXPSmCiose2ijlNTWEbL2fttdYAjcOcXi/AGB8x1MePTd+sPu6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="567637"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="567637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 06:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="790942"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2024 06:20:03 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWdLk-0006OS-2H;
	Sun, 04 Feb 2024 14:20:00 +0000
Date: Sun, 4 Feb 2024 22:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 5/12] drivers/phy/apple/dptx.c:63:14:
 error: call to undeclared function 'readl'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202402042224.6s7TEZk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3ba9173a776695e19481d515c3c1135ca6d718d5 [5/12] phy: apple: Add DP TX phy driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402042224.6s7TEZk3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402042224.6s7TEZk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402042224.6s7TEZk3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/apple/dptx.c:63:14: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         u32 value = readl(reg);
         |                     ^
>> drivers/phy/apple/dptx.c:66:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      66 |         writel(value, reg);
         |         ^
   drivers/phy/apple/dptx.c:89:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         ctrl = readl(phy->regs.dptx + 0x4000);
         |                ^
   drivers/phy/apple/dptx.c:90:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         writel(ctrl, phy->regs.dptx + 0x4000);
         |         ^
   drivers/phy/apple/dptx.c:134:2: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         readl(phy->regs.core + 0x10);
         |         ^
   drivers/phy/apple/dptx.c:135:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     135 |         writel(dcp_index, phy->regs.core + 0x10);
         |         ^
   drivers/phy/apple/dptx.c:347:5: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     347 |     readl(phy->regs.dptx + 0x2200);
         |     ^
   drivers/phy/apple/dptx.c:356:5: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     356 |     writel(val_100c, phy->regs.dptx + 0x100c);
         |     ^
   drivers/phy/apple/dptx.c:320:9: warning: variable 'sts_1008' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |         ^
   drivers/phy/apple/dptx.c:320:19: warning: variable 'sts_1014' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |                   ^
   drivers/phy/apple/dptx.c:318:5: warning: no previous prototype for function 'dptx_phy_set_link_rate' [-Wmissing-prototypes]
     318 | int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
         |     ^
   drivers/phy/apple/dptx.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     318 | int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
         | ^
         | static 
   3 warnings and 8 errors generated.


vim +/readl +63 drivers/phy/apple/dptx.c

    59	
    60	
    61	static inline void mask32(void __iomem *reg, u32 mask, u32 set)
    62	{
  > 63		u32 value = readl(reg);
    64		value &= ~mask;
    65		value |= set;
  > 66		writel(value, reg);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
