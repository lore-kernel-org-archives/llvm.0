Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C803E1696;
	Tue, 30 Jun 2026 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814113; cv=none; b=Tabw8DXBHzmxXyqvYilBYa/O4eAL5BGjzyRkEBheqMB5lcrQZZi/XA3HcyhXOxz0VugFT0KTsEmhVN6GxXcbmnV/OyWPR9KwO81YIMuRiQ+3UKQNMnFEsffkBOcpnHQEkELTf3WhaTEsInJS89EzbYo4mroNYvu7yJMYGbyfyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814113; c=relaxed/simple;
	bh=XzcH6TmYDkP3T3woCKmGYaFKaBtlFTrf3SFf1DErCMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kxUDKrEJzvgVuMEESuar2/oSsxgkb06G4oKw+NVg4xw+T3nI0CEgpGLDdkkT9udzIGbTetuAS63xHZNkv4DAFPweKFfXyC5uU+5Vcfesltjco7+4hCZ/vB5AmBY+fmXZVEBw72kGm6xeEedO81Yg0POhsXaWSHYouHvfKEvjIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmvPv7v2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmvPv7v2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782814112; x=1814350112;
  h=date:from:to:cc:subject:message-id;
  bh=XzcH6TmYDkP3T3woCKmGYaFKaBtlFTrf3SFf1DErCMo=;
  b=jmvPv7v2dKLU20XKKr7tJCAviazWJT/Jl+6BN/Hup1L2blLRZKC+4eM6
   gmTDzPGW1vCnqnkjd/BNjwrjjSJJJSD6Expuwt5MVqvi2X93ATM8Doppn
   1xXL0E9KqsrHLlj3Ow3xfuX0xZTwynb9y9nnr7eKOREiRwU6L64DEJHA6
   Jl5Fbz+eR7H7y4ZgxrnjEQH4fVgOyFHuViK3y5mH2uN2Bzj1DMHMOSLJn
   pp+mVn0kCh1kPgEFfGc/eKqvC/Ugjmkvi/xYquDOVnZ4QvtK0Mno113bf
   3xIkbTguXVR4h1I8jJxx+QtFiPIWxm2C0I3Pr+OjNOaFEY9Cp/fHYXKD9
   w==;
X-CSE-ConnectionGUID: z1aH20ywRgu+qLc5JYovDA==
X-CSE-MsgGUID: hZSppY9BTrKz8eDp2cQ97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83608568"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83608568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:08:31 -0700
X-CSE-ConnectionGUID: UssUnOvPTt20gg45A+xqEA==
X-CSE-MsgGUID: ZZU9D1XbTzKHKpXLkmPl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="252360812"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Jun 2026 03:08:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weVOE-000000008Er-1GYm;
	Tue, 30 Jun 2026 10:08:26 +0000
Date: Tue, 30 Jun 2026 18:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/240-isp 1/53]
 drivers/media/platform/apple/isp/isp-ipc.c:228:4: warning: format specifies
 type 'unsigned long long' but the argument has type 'dma_addr_t' (aka
 'unsigned int')
Message-ID: <202606301740.2J4S8vMX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   df907add385f43a49d493c59afd3762ae1598548
commit: 329bf83de183f0558c2e5bb6ba55da3f06a2c980 [1/53] media: apple: Add Apple ISP driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606301740.2J4S8vMX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301740.2J4S8vMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301740.2J4S8vMX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-ipc.c:228:4: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
     227 |                 isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
         |                                                     ~~~~
         |                                                     %x
     228 |                         surf->iova, surf->size);
         |                         ^~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.h:253:47: note: expanded from macro 'isp_err'
     253 |         dev_err((isp)->dev, "[%s] " fmt, __func__, ##__VA_ARGS__)
         |                                     ~~~              ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +228 drivers/media/platform/apple/isp/isp-ipc.c

   207	
   208	/* The kernel accesses exactly two dynamically allocated shared surfaces:
   209	 * 1) LOG: Surface for terminal logs. Optional, only enabled in debug builds.
   210	 * 2) STAT: Surface for BUFT2H rendered frame stat buffer. We isp_ioread() in
   211	 * the BUFT2H ISR below. Since the BUFT2H IRQ is triggered by the BUF_H2T
   212	 * doorbell, the STAT vmap must complete before the first buffer submission
   213	 * under VIDIOC_STREAMON(). The CISP_CMD_PRINT_ENABLE completion depends on the
   214	 * STAT buffer SHAREDMALLOC ISR, which is part of the firmware initialization
   215	 * sequence. We also call flush_workqueue(), so a fault should not occur.
   216	 */
   217	static void sm_malloc_deferred_worker(struct work_struct *work)
   218	{
   219		struct isp_sm_deferred_work *dwork =
   220			container_of(work, struct isp_sm_deferred_work, work);
   221		struct apple_isp *isp = dwork->isp;
   222		struct isp_surf *surf = dwork->surf;
   223		int err;
   224	
   225		err = isp_surf_vmap(isp, surf); /* Can't vmap in interrupt ctx */
   226		if (err < 0) {
   227			isp_err(isp, "failed to vmap iova=0x%llx size=0x%llx\n",
 > 228				surf->iova, surf->size);
   229			goto out;
   230		}
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
