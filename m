Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D510E7;
	Sun, 17 Dec 2023 04:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdotCLY1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702785800; x=1734321800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t/qTR6EyvK63QS9CMfRhcGulhP3Wsk6PTryYCrPmWn0=;
  b=ZdotCLY1VCuWPBrcs45RigrYa9Y7vYqL3Vf3WsQDOITp2ZMbfxooCUpH
   cYXIYGSHMnMq4YRGUsWRjr1/WDI1M4Bx1mSMnP0At6loRUGsbS8lWV6Y6
   nsdSGzidtgodhPdqvVIY7I2Y4vzfylxNcIKWRkSTvcla0PssTDFSP5gk4
   Lk4rYNC8DiepCek9AKDfEe4zGWYP6HllAv4XE5huVRCnUy0566E9xFUXV
   dqSSMcd1s3XihwOJ9v8Y83w8Ec/j2yxx6RoALk+yK3jJn797XK/U9iGZu
   r7mK3A9Ab3B24nLhj+j6zLI6x3IABI6+fQw5wYnZQzFbreAALwQRAJLVb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2488745"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2488745"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 20:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="809413339"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="809413339"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 20:03:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEiN2-0002by-09;
	Sun, 17 Dec 2023 04:03:16 +0000
Date: Sun, 17 Dec 2023 12:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 6/10] include/linux/bpf.h:2497:13: error:
 static declaration of 'netif_tx_schedule_bpf_timer' follows non-static
 declaration
Message-ID: <202312171112.36aVRnKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   707bff6510161065e4e624c99c8c668b6c0114b6
commit: f78caa9ae49edb5ceb57001b249bf88a81e17423 [6/10] bpf: Support running timer callbacks in NET_TX_SOFTIRQ
config: i386-buildonly-randconfig-005-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171112.36aVRnKS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171112.36aVRnKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171112.36aVRnKS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:19:
   In file included from include/net/xdp.h:10:
   In file included from include/linux/filter.h:9:
>> include/linux/bpf.h:2497:13: error: static declaration of 'netif_tx_schedule_bpf_timer' follows non-static declaration
   static void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer)
               ^
   include/linux/netdevice.h:3323:6: note: previous declaration is here
   void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer);
        ^
   1 error generated.


vim +/netif_tx_schedule_bpf_timer +2497 include/linux/bpf.h

  2494	
  2495	void bpf_run_nettx_timers(struct bpf_timer_nettx *timer);
  2496	#ifndef CONFIG_NET
> 2497	static void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer)
  2498	{
  2499	}
  2500	#endif
  2501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
