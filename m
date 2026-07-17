Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6942A7A0;
	Fri, 17 Jul 2026 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299280; cv=none; b=MdvJFItnE1IyNUXd/q96B4XKqjQ5loOlw9plf2r44SfweAAD9DLQIJzmoFVC1mxy9khm0LVL0iuZRxtyAk4E3la4D8wjb1taXjhCpHqeLyvgULtEu44gw+echavnsZL4q4ybAQpUnCvJeEAHKltMj2rviAfbiDE8VRkh4EyXZ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299280; c=relaxed/simple;
	bh=P7+weuB8QPihtexURhNCZhXnN56KXtsnnE8UOHMwujY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ie9UGjlSsX1vc7JtraD6XnpC66+BgGZ/C4AZ3hTA5L1WPcmBW5njyStLIMoYjgeYPXDYwYf99+sTYjld3CV94Z/OWjvGgu9Qma9OMX2DpcnzRnCXtPcyBp7Q25TVm7E8WWtGD5c9gZYl7TuM0d3DYrBdbAF2ylwA1QsAFKHnRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwUvlr6T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwUvlr6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784299277; x=1815835277;
  h=date:from:to:cc:subject:message-id;
  bh=P7+weuB8QPihtexURhNCZhXnN56KXtsnnE8UOHMwujY=;
  b=FwUvlr6TJ+Dk5nrQ9/mUZiyOdbklmS/ePmDHm7wWSpgbYGSReSlkjddH
   VqVxXV5PQobCxyzO+z1pKNc6DtHZ1tEcrb4btl4suvcNV5EXfahv8dimK
   E5hWtXHX7EqHur5BNErXgGnzvHyjIjJ+1MYypKf0AAjMZI4+KgEyGMMFQ
   EzxZc9fCcTFDBca8f9bowL4b/0OWkQb0/HnwgK2RkZKstDo2GCh3twCJ8
   LN9r0OKaWdYtVqiZeUXEw+WPylJ00xzIZlqvQW/2GWi26mG0L7jvOpP+h
   QEVu9m/J1BZfLQVyUzwrJF47WTs2WH9Gn9Lo3Y/fRC7BueYtQADeDBZUO
   g==;
X-CSE-ConnectionGUID: U3EVK4yeRBabfB+6FK5ThA==
X-CSE-MsgGUID: 9RYf95X/Qn+CvAgcjWRDrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87516902"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="87516902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:41:15 -0700
X-CSE-ConnectionGUID: NbWLz20BQ0uSL4KXeslg7g==
X-CSE-MsgGUID: XhVPiD5pQQyqU9PKjzYiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="281255464"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2026 07:41:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkjkP-00000000SpM-18SS;
	Fri, 17 Jul 2026 14:41:07 +0000
Date: Fri, 17 Jul 2026 22:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-16 311/311]
 sound/soc/soc-component.c:1889:2: error: call to undeclared function
 'snd_soc_unregister_component_by_driver'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202607172252.wSErSxwz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-16
head:   e51d2e02d8d4c974132f00eec9d2215a476084f0
commit: e5f6e49182359560489330edda8ea8db0fe3e07b [311/311] ASoC: soc-component: remove compatible definition
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260717/202607172252.wSErSxwz-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172252.wSErSxwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172252.wSErSxwz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-component.c:1889:2: error: call to undeclared function 'snd_soc_unregister_component_by_driver'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1889 |         snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
         |         ^
   1 error generated.


vim +/snd_soc_unregister_component_by_driver +1889 sound/soc/soc-component.c

f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1884  
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1885  static void devm_component_release(struct device *dev, void *res)
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1886  {
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1887  	const struct snd_soc_component_driver **cmpnt_drv = res;
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1888  
f547a858c9abcb1 Kuninori Morimoto 2026-07-08 @1889  	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1890  }
f547a858c9abcb1 Kuninori Morimoto 2026-07-08  1891  

:::::: The code at line 1889 was first introduced by commit
:::::: f547a858c9abcb132c18ff0f09700d925b069c21 ASoC: soc-component: move devm_snd_soc_component_register()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
