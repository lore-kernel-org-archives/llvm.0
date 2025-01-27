Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8E1FF1A8;
	Mon, 27 Jan 2025 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737983406; cv=none; b=aztNwm6QxKvMzRfMiGr+cYDKd0bd/2iLyDr9vQqdofk52Kv4cCvV4c8mTBDm941n8ThLt1e8d+YyDC4Y6BAB9npAjAlp1xaerzjdclOV98nRVBTBrg3oL5lCcMqAyM4s05ElL6p+pFGgb7z5FQY3U5QeWjHWWu9K11WymOL5EbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737983406; c=relaxed/simple;
	bh=l97OQXEfFi8HXs/cCBw2AgcBZumruO41TbWAnnrtehM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFKK/frFlRLosTqnKOTjvypVzkGnwvVPRudx5g6GvV4WKoXgFeRfm1wuOKVp5GV6i6FP7PFfaupQcdQxNZrVp/sYUeo2v/h0fGjBzEHWyOHgcuQ+i3pUEjOB1yZKeK6xqQgkDFCpwBqHcWq8D3kfrbpFXZoMbeiFNRPRBomyNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgalkMs5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgalkMs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737983405; x=1769519405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l97OQXEfFi8HXs/cCBw2AgcBZumruO41TbWAnnrtehM=;
  b=KgalkMs5MOVPjYZizwv5sGmEjlkxZiPzHG5nToECNqQ6WfFaAFKIqrRy
   Y7Eljvf+OJhD5N+H1h/DGnl0D3ehep7cqnbUUmdOU3j1+20EXoTMh7TFx
   18iGcTysT4srjWJovMj8KsekKi9NMAmDvg42olqlVCcdg84CODDbMLNgh
   hDk5+M9t8/vcUX5aLeTeyy0HH06jGaPegU2cUrf0SCFiclp3ieQaR2LYZ
   SHkLIu7CXZhrSJWGelNEpUvtbftqRyznOL1eajdE9quOyx9C4IofEtzV0
   yHUyjYA1ciG1Uo0xAyD7/jzuVrj6jY0onDxOW8gQwwUFqPbjwFNCxImvd
   A==;
X-CSE-ConnectionGUID: 6IFb1lJKQeGjPUGcT4bDUw==
X-CSE-MsgGUID: bxqlS4WLReaJIgxKHIAnvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38580510"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38580510"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:10:05 -0800
X-CSE-ConnectionGUID: QiSxWFBGT2ONdRg0XVip8g==
X-CSE-MsgGUID: ZsA81HXJSvieRGDcYn7hTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="113468031"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Jan 2025 05:10:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcOsJ-000gn5-2o;
	Mon, 27 Jan 2025 13:09:59 +0000
Date: Mon, 27 Jan 2025 21:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Yan <yanaijie@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: drivers/video/fbdev/matrox/g450_pll.c:410:18: warning: variable
 'mnp' set but not used
Message-ID: <202501272018.GPmzUBlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c5968db9e625019a0ee5226c7eebef5519d366a
commit: 7b987887f97b9fdbc5fa4774ff973158266d834c video: fbdev: matroxfb: remove dead code and set but not used variable
date:   4 years, 10 months ago
config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/archive/20250127/202501272018.GPmzUBlW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272018.GPmzUBlW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272018.GPmzUBlW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/matrox/g450_pll.c:17:
   In file included from drivers/video/fbdev/matrox/g450_pll.h:5:
   In file included from drivers/video/fbdev/matrox/matroxfb_base.h:33:
   In file included from include/linux/mm.h:1289:
   include/linux/vmstat.h:398:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     398 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     399 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:405:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     405 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     406 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:412:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     412 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:426:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     426 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     427 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/matrox/g450_pll.c:410:18: warning: variable 'mnp' set but not used [-Wunused-but-set-variable]
     410 |                                 unsigned int mnp;
         |                                              ^
   6 warnings generated.


vim +/mnp +410 drivers/video/fbdev/matrox/g450_pll.c

^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  330  
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  331  static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  332  			 unsigned int pll, unsigned int *mnparray,
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  333  			 unsigned int *deltaarray)
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  334  {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  335  	unsigned int mnpcount;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  336  	const struct matrox_pll_limits* pi;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  337  	struct matrox_pll_cache* ci;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  338  
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  339  	switch (pll) {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  340  		case M_PIXEL_PLL_A:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  341  		case M_PIXEL_PLL_B:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  342  		case M_PIXEL_PLL_C:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  343  			{
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  344  				u_int8_t tmp, xpwrctrl;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  345  				unsigned long flags;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  346  				
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  347  				matroxfb_DAC_lock_irqsave(flags);
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  348  
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  349  				xpwrctrl = matroxfb_DAC_in(minfo, M1064_XPWRCTRL);
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  350  				matroxfb_DAC_out(minfo, M1064_XPWRCTRL, xpwrctrl & ~M1064_XPWRCTRL_PANELPDN);
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  351  				mga_outb(M_SEQ_INDEX, M_SEQ1);
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  352  				mga_outb(M_SEQ_DATA, mga_inb(M_SEQ_DATA) | M_SEQ1_SCROFF);
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  353  				tmp = matroxfb_DAC_in(minfo, M1064_XPIXCLKCTRL);
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  354  				tmp |= M1064_XPIXCLKCTRL_DIS;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  355  				if (!(tmp & M1064_XPIXCLKCTRL_PLL_UP)) {
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  356  					tmp |= M1064_XPIXCLKCTRL_PLL_UP;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  357  				}
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  358  				matroxfb_DAC_out(minfo, M1064_XPIXCLKCTRL, tmp);
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  359  				/* DVI PLL preferred for frequencies up to
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  360  				   panel link max, standard PLL otherwise */
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  361  				if (fout >= minfo->max_pixel_clock_panellink)
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  362  					tmp = 0;
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  363  				else tmp =
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  364  					M1064_XDVICLKCTRL_DVIDATAPATHSEL |
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  365  					M1064_XDVICLKCTRL_C1DVICLKSEL |
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  366  					M1064_XDVICLKCTRL_C1DVICLKEN |
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  367  					M1064_XDVICLKCTRL_DVILOOPCTL |
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  368  					M1064_XDVICLKCTRL_P1LOOPBWDTCTL;
8c651311a3a08c drivers/video/matrox/g450_pll.c Alan Cox       2009-12-15  369                                  /* Setting this breaks PC systems so don't do it */
8c651311a3a08c drivers/video/matrox/g450_pll.c Alan Cox       2009-12-15  370  				/* matroxfb_DAC_out(minfo, M1064_XDVICLKCTRL, tmp); */
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  371  				matroxfb_DAC_out(minfo, M1064_XPWRCTRL,
e798bd95b61918 drivers/video/matrox/g450_pll.c Paul A. Clarke 2007-08-10  372  						 xpwrctrl);
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  373  
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  374  				matroxfb_DAC_unlock_irqrestore(flags);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  375  			}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  376  			{
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  377  				u_int8_t misc;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  378  		
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  379  				misc = mga_inb(M_MISC_REG_READ) & ~0x0C;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  380  				switch (pll) {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  381  					case M_PIXEL_PLL_A:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  382  						break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  383  					case M_PIXEL_PLL_B:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  384  						misc |=  0x04;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  385  						break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  386  					default:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  387  						misc |=  0x0C;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  388  						break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  389  				}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  390  				mga_outb(M_MISC_REG, misc);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  391  			}
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  392  			pi = &minfo->limits.pixel;
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  393  			ci = &minfo->cache.pixel;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  394  			break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  395  		case M_SYSTEM_PLL:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  396  			{
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  397  				u_int32_t opt;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  398  
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  399  				pci_read_config_dword(minfo->pcidev, PCI_OPTION_REG, &opt);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  400  				if (!(opt & 0x20)) {
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  401  					pci_write_config_dword(minfo->pcidev, PCI_OPTION_REG, opt | 0x20);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  402  				}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  403  			}
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  404  			pi = &minfo->limits.system;
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  405  			ci = &minfo->cache.system;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  406  			break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  407  		case M_VIDEO_PLL:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  408  			{
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  409  				u_int8_t tmp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16 @410  				unsigned int mnp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  411  				unsigned long flags;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  412  				
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  413  				matroxfb_DAC_lock_irqsave(flags);
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  414  				tmp = matroxfb_DAC_in(minfo, M1064_XPWRCTRL);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  415  				if (!(tmp & 2)) {
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  416  					matroxfb_DAC_out(minfo, M1064_XPWRCTRL, tmp | 2);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  417  				}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  418  				
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  419  				mnp = matroxfb_DAC_in(minfo, M1064_XPIXPLLCM) << 16;
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  420  				mnp |= matroxfb_DAC_in(minfo, M1064_XPIXPLLCN) << 8;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  421  				matroxfb_DAC_unlock_irqrestore(flags);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  422  			}
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  423  			pi = &minfo->limits.video;
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  424  			ci = &minfo->cache.video;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  425  			break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  426  		default:
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  427  			return -EINVAL;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  428  	}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  429  
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  430  	mnpcount = 0;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  431  	{
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  432  		unsigned int mnp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  433  		unsigned int xvco;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  434  
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  435  		for (mnp = g450_firstpll(minfo, pi, &xvco, fout); mnp != NO_MORE_MNP; mnp = g450_nextpll(minfo, pi, &xvco, mnp)) {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  436  			unsigned int idx;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  437  			unsigned int vco;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  438  			unsigned int delta;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  439  
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  440  			vco = g450_mnp2vco(minfo, mnp);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  441  			delta = pll_freq_delta(fout, g450_vco2f(mnp, vco));
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  442  			for (idx = mnpcount; idx > 0; idx--) {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  443  				/* == is important; due to nextpll algorithm we get
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  444  				   sorted equally good frequencies from lower VCO 
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  445  				   frequency to higher - with <= lowest wins, while
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  446  				   with < highest one wins */
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  447  				if (delta <= deltaarray[idx-1]) {
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  448  					/* all else being equal except VCO,
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  449  					 * choose VCO not near (within 1/16th or so) VCOmin
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  450  					 * (freqs near VCOmin aren't as stable)
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  451  					 */
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  452  					if (delta == deltaarray[idx-1]
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  453  					    && vco != g450_mnp2vco(minfo, mnparray[idx-1])
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  454  					    && vco < (pi->vcomin * 17 / 16)) {
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  455  						break;
6d39bedc47fbf1 drivers/video/matrox/g450_pll.c Paul A. Clarke 2006-05-20  456  					}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  457  					mnparray[idx] = mnparray[idx-1];
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  458  					deltaarray[idx] = deltaarray[idx-1];
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  459  				} else {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  460  					break;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  461  				}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  462  			}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  463  			mnparray[idx] = mnp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  464  			deltaarray[idx] = delta;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  465  			mnpcount++;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  466  		}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  467  	}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  468  	/* VideoPLL and PixelPLL matched: do nothing... In all other cases we should get at least one frequency */
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  469  	if (!mnpcount) {
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  470  		return -EBUSY;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  471  	}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  472  	{
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  473  		unsigned long flags;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  474  		unsigned int mnp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  475  		
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  476  		matroxfb_DAC_lock_irqsave(flags);
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  477  		mnp = g450_checkcache(minfo, ci, mnparray[0]);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  478  		if (mnp != NO_MORE_MNP) {
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  479  			matroxfb_g450_setpll_cond(minfo, mnp, pll);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  480  		} else {
316b4d644caceb drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  481  			mnp = g450_findworkingpll(minfo, pll, mnparray, mnpcount);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  482  			g450_addcache(ci, mnparray[0], mnp);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  483  		}
fc2d10ddfc8989 drivers/video/matrox/g450_pll.c Jean Delvare   2009-09-22  484  		updatehwstate_clk(&minfo->hw, mnp, pll);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  485  		matroxfb_DAC_unlock_irqrestore(flags);
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  486  		return mnp;
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  487  	}
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  488  }
^1da177e4c3f41 drivers/video/matrox/g450_pll.c Linus Torvalds 2005-04-16  489  

:::::: The code at line 410 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
