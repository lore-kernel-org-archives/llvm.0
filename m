Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5EC21D3E4;
	Sun, 17 May 2026 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779000989; cv=none; b=Qqd6sQhs1rM9+nvS4AeF9T0WeQ6GS+onjRdT3F3BpYyOmTMI2PJmUuPJI+MpWsGonsb5OmOfwk2Pf0TMXkqpzDg1vGTrsED9hz3oFqYeyxPIRiyiafrw4U1aR+xmuL7+j94lOvgKh9nvfsXFPWgdmST0WghyteQ08n8tnKKTAJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779000989; c=relaxed/simple;
	bh=Mvi4RKTP15B/Ix7mGNa3Z2Jt5QqDaF0TPTSNRpY9qfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r0Nc3Yjd8Bbeh1cxGNgziVlQrfcHf5DQ90aL6WvR2wtulYh1nxDVqwM76u+fZT2NdYIDPPkQfussFkLtMb+OhuREjBB6De39BvgP1XRH1f4BcdPUIJConEURW0nuZxgoq/bhSzwrvCUHukv+bR50DM6s7nNEaOsbHEIr2uEgco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ap6M8GqC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ap6M8GqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779000985; x=1810536985;
  h=date:from:to:cc:subject:message-id;
  bh=Mvi4RKTP15B/Ix7mGNa3Z2Jt5QqDaF0TPTSNRpY9qfY=;
  b=ap6M8GqCffPcBqEfqRdPg8nBQ4e7LRmiMJI4DpUm0Y+ibRpbgvk9kyHQ
   9AZHnfDojDHro48mXgIEozQ1cFBaYVlOmkA0AGfpLKZgI577iPe0/4kqJ
   Jbq4YyKMFkC/Cgs/Qu4NwEK4kTzBDfkBx0nRzsn+vaFkZlQXVuuhHBCJl
   Zv0krQnj9bek2OLstJ7XuOECSbwU4uQjf9OMo2VJV5VwTpve6qvHQJ4/1
   rN5zUBAXeI72lGI9pnsOgTJUFw2C7YkPjM+P1Fb/hnwQd5pPD3xCQitsI
   i7Lua6Do96Av6dC2E2DalgN1HV+2QcBXm2NZ28aLbtnKLxHivjMsHvPTd
   g==;
X-CSE-ConnectionGUID: n4bkO2x1RY+e+9miURRq5w==
X-CSE-MsgGUID: /ttm4bzlS2Kzaer+xcDNGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79605443"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79605443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 23:56:23 -0700
X-CSE-ConnectionGUID: Gg8kyCPwRnis/VfzPOQzeA==
X-CSE-MsgGUID: HmnQXJOqR5S3Owt05SQ0QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="236069666"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 May 2026 23:56:20 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOVQ9-000000001QS-3jNi;
	Sun, 17 May 2026 06:56:17 +0000
Date: Sun, 17 May 2026 14:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 MD Danish Anwar <danishanwar@ti.com>
Subject: [mda-next:icssg-dev 1/8] include/linux/skbuff.h:5103:21:
 error: static declaration of 'skb_ext_find' follows non-static declaration
Message-ID: <202605171434.q7Sc5Ih7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   7aa6108bf5c5328d646e91a0451eeae42a672801
commit: e17c003c093dccaf3baf0a53b4a3111642960b32 [1/8] hsr: Allow to send a specific port and with HSR header
config: powerpc64-randconfig-002-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171434.q7Sc5Ih7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171434.q7Sc5Ih7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605171434.q7Sc5Ih7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   include/linux/skbuff.h:5058:7: error: conflicting types for 'skb_ext_add'
    5058 | void *skb_ext_add(struct sk_buff *skb, enum skb_ext_id id);
         |       ^
   include/linux/if_hsr.h:99:12: note: previous implicit declaration is here
      99 |         ptp_ext = skb_ext_add(skb, SKB_EXT_HSR);
         |                   ^
   In file included from net/dsa/dsa.c:15:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
>> include/linux/skbuff.h:5103:21: error: static declaration of 'skb_ext_find' follows non-static declaration
    5103 | static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
         |                     ^
   include/linux/if_hsr.h:58:12: note: previous implicit declaration is here
      58 |         ptp_ext = skb_ext_find(skb, SKB_EXT_HSR);
         |                   ^
   53 warnings and 10 errors generated.


vim +/skb_ext_find +5103 include/linux/skbuff.h

df5042f4c5b9326 Florian Westphal 2018-12-18  5102  
df5042f4c5b9326 Florian Westphal 2018-12-18 @5103  static inline void *skb_ext_find(const struct sk_buff *skb, enum skb_ext_id id)
df5042f4c5b9326 Florian Westphal 2018-12-18  5104  {
df5042f4c5b9326 Florian Westphal 2018-12-18  5105  	if (skb_ext_exist(skb, id)) {
df5042f4c5b9326 Florian Westphal 2018-12-18  5106  		struct skb_ext *ext = skb->extensions;
df5042f4c5b9326 Florian Westphal 2018-12-18  5107  
df5042f4c5b9326 Florian Westphal 2018-12-18  5108  		return (void *)ext + (ext->offset[id] << 3);
df5042f4c5b9326 Florian Westphal 2018-12-18  5109  	}
df5042f4c5b9326 Florian Westphal 2018-12-18  5110  
df5042f4c5b9326 Florian Westphal 2018-12-18  5111  	return NULL;
df5042f4c5b9326 Florian Westphal 2018-12-18  5112  }
174e23810cd3183 Florian Westphal 2019-09-26  5113  

:::::: The code at line 5103 was first introduced by commit
:::::: df5042f4c5b9326c593bf2e31ed859ebc3b4130a sk_buff: add skb extension infrastructure

:::::: TO: Florian Westphal <fw@strlen.de>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
