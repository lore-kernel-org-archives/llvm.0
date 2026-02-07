Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E575B21A;
	Sat,  7 Feb 2026 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770432238; cv=none; b=O6V8AMYeY6+L8T3PeXdwH+YajT4VNxebE+LIjcO6G6x7ozjuGGOv6r9zZQbSnFhni/U3FcHVSITeo0LbYGZCDBwtjgDCXufQZFAeKUf3afjW7MQNSFN2zPlZrf/181PuNdlM+1gHaGTtmrFHKXxK5LsE9rVKm2M6PwQHIHVSMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770432238; c=relaxed/simple;
	bh=i3NsRavbhX+660Ui5QUv6s1Rz8LcVnhbtnHRTpm4t+c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LD6KsdIK7YbyWUagV783DxdoDToAGgmnera3nIvYRe5UnRxzbvw8LTjmJlbyDdasx6UKROhjcbIHO+06Dwo56zNiDY/MKfek8E0QKLEVhoyroAM6nBUeEMlhco8PSSGhXZsn/jATYRP2m09BzHDWNOqdlGxAnQNXyMGnVlvpMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfLRh5++; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfLRh5++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770432238; x=1801968238;
  h=date:from:to:cc:subject:message-id;
  bh=i3NsRavbhX+660Ui5QUv6s1Rz8LcVnhbtnHRTpm4t+c=;
  b=DfLRh5++aeKj6YAEmrvgKYwGnsLKZwceSH180ZdcHiPWNGUlyMC0y7XB
   RvbMgfuU4mveHYxXu1aLfrgc1z5QgSzRMZ4s+J47db+jT+DPTC5F8/9Iw
   H185mNFTvFH7cMI24nr3nhpnO8CNJH3AvYAkw9oBbzQpjDfOomwnmLDwV
   tqaQzJs68IjYcWDg6p1BYAumJhAt4PXE3zTmLpPjZX3Vvo0+qFEHfkY45
   rCNeQe5aGVF5YPG+znqkzMOne1+fwjAg+oX+S32q7KbOHw8QknqJ8ZdM9
   FPQZsgm+RMvqCtom7DbQtz1sSx3rAPDryNQBik28glZBlJSrcq9vcof0N
   g==;
X-CSE-ConnectionGUID: rhYuxR52Q6q9sDYaod5ABA==
X-CSE-MsgGUID: VnlCo7I3SZCBJ1WsPYrRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="74240989"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="74240989"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 18:43:58 -0800
X-CSE-ConnectionGUID: H35doiK4RymZBrETFFQzmQ==
X-CSE-MsgGUID: x5K5/l/7SPCejr2vaDO1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="248659317"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2026 18:43:56 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voYIb-000000004nR-0zG0;
	Sat, 07 Feb 2026 02:43:53 +0000
Date: Sat, 07 Feb 2026 03:43:11 +0100
From: kernel test robot <lkp@intel.com>
To: Jie Zhang <jzhang918@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Jacob Keller <jacob.e.keller@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5041:19:
 error: no member named 'has_gmac4' in 'struct plat_stmmacenet_data'
Message-ID: <202602070342.pqfps3fC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jie-Zhang/net-stmmac-fix-oops-when-split-header-is-enabled/20260207-035916
head:   b6e467ac560dc4805fb6799e75c1646366bfb6e8
commit: b6e467ac560dc4805fb6799e75c1646366bfb6e8 net: stmmac: fix oops when split header is enabled
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260207/202602070342.pqfps3fC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070342.pqfps3fC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070342.pqfps3fC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5041:19: error: no member named 'has_gmac4' in 'struct plat_stmmacenet_data'
    5041 |         if (!priv->plat->has_gmac4 && (status & rx_not_ls))
         |              ~~~~~~~~~~  ^
   1 error generated.


vim +5041 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  5014	
  5015	static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
  5016					       struct dma_desc *p,
  5017					       int status, unsigned int len)
  5018	{
  5019		int coe = priv->hw->rx_csum;
  5020		unsigned int plen = 0;
  5021	
  5022		/* Not split header, buffer is not available */
  5023		if (!priv->sph_active)
  5024			return 0;
  5025	
  5026		/* For GMAC4, when split header is enabled, in some rare cases, the
  5027		 * hardware does not fill buf2 of the first descriptor with payload.
  5028		 * Thus we cannot assume buf2 is always fully filled if it is not
  5029		 * the last descriptor. Otherwise, the length of buf2 of the second
  5030		 * descriptor will be calculated wrong and cause an oops.
  5031		 *
  5032		 * If this is the last descriptor, 'plen' is the length of the
  5033		 * received packet that was transferred to system memory.
  5034		 * Otherwise, it is the accumulated number of bytes that have been
  5035		 * transferred for the current packet.
  5036		 *
  5037		 * Thus 'plen - len' always gives the correct length of buf2.
  5038		 */
  5039	
  5040		/* Not GMAC4 and not last descriptor */
> 5041		if (!priv->plat->has_gmac4 && (status & rx_not_ls))
  5042			return priv->dma_conf.dma_buf_sz;
  5043	
  5044		/* GMAC4 or last descriptor */
  5045		plen = stmmac_get_rx_frame_len(priv, p, coe);
  5046	
  5047		return plen - len;
  5048	}
  5049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
