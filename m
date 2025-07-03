Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D572BE634;
	Thu,  3 Jul 2025 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581649; cv=none; b=Fmm/HaFNIndd1A2TmG7Z4XjzC2ayG1qEVlS6agXCXwLnCx1Bemq4FzvcFtNiNWk+8b3c39kUoaC56PExR7/Mn0v/Ov0gpBHKvzMMMz3c/urLUNlZnnXL+lT7YHdFoBhJcce9Fw6tLWGtiWd1aWkSMop4fp2LXhykU95u4tBPeuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581649; c=relaxed/simple;
	bh=ObfX3msw3124TPv/HKi1XUGNEdyd2o67QroCfTIA5a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5Mi10zJT/aJiUraotvGCi+DCNyN8/y8CfHwPuotrWbL7DdZllr6BLmDo3OtrLzwOqDL+UbKkBKOvDyZesV0Y8RI7QQV01pS2ALDDo9RaNr910xy1394ytKnugSfDtWWg2nhUr4z4ZZ9R7R4knnQw/Bg4mhpbif4FlNGv37/Z/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOQkSrGw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOQkSrGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751581648; x=1783117648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObfX3msw3124TPv/HKi1XUGNEdyd2o67QroCfTIA5a8=;
  b=MOQkSrGwNyNSHnCZ1veW3YpEyesvFvryEYKmr9OtZvRRSQzBOeluKqOf
   I0RTofNXVFN1ttYpWzYYcJkHI84xqjVWVW7QZT4nqZHwJyl6FLl4aURBN
   1HlLgTtlSR5qZA8qYv/8l1r01ZPlMATFtHN1w3nK9D35xelSLw30bwyw/
   WPm/AJ88wDfAoflyZf+BaEB6IxAVo7+sob/dPjNC70eFE9aeWDbEvEqDT
   n7snisN8G2+v71POppm2avlVGLaL3OH02PDONg0PVSNsAMfnFLO5DBpna
   s1oc8QeyRo5giw5749yV2He4DZpAfnFoZdpnFWxXDayNjSBdE36G97lJg
   A==;
X-CSE-ConnectionGUID: XuLCqN7mSXmVd3oyvdlc8A==
X-CSE-MsgGUID: PVIz6h8TRuex8gBqwEfEGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76467843"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="76467843"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 15:27:25 -0700
X-CSE-ConnectionGUID: nBkfHea4Rw6fILBy3DoRMA==
X-CSE-MsgGUID: uEVSX2XfQVG3YgSJ7PQcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154250581"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 15:27:24 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXSOn-00034O-2Z;
	Thu, 03 Jul 2025 22:27:21 +0000
Date: Fri, 4 Jul 2025 06:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:unwind/perf 7/25] include/linux/unwind_deferred_types.h:16:2:
 error: unknown type name 'local64_t'; did you mean 'local_t'?
Message-ID: <202507040623.6dwWd1ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/perf
head:   e00f51618c68b5b6fd6054488212504592c9e392
commit: a9bb466c2613f39f468e7ac392dd2e2b611a0544 [7/25] unwind_user/deferred: Make unwind deferral requests NMI-safe
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250704/202507040623.6dwWd1ej-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040623.6dwWd1ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040623.6dwWd1ej-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:10:
   In file included from include/linux/u64_stats_sync.h:71:
   In file included from ./arch/x86/include/generated/asm/local64.h:1:
   In file included from include/asm-generic/local64.h:5:
   In file included from include/linux/percpu.h:12:
   In file included from include/linux/sched.h:49:
>> include/linux/unwind_deferred_types.h:16:2: error: unknown type name 'local64_t'; did you mean 'local_t'?
      16 |         local64_t               timestamp;
         |         ^~~~~~~~~
         |         local_t
   arch/x86/include/asm/local.h:12:3: note: 'local_t' declared here
      12 | } local_t;
         |   ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/net/netdevsim/macsec.c:3:
   In file included from include/net/macsec.h:11:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:38:


vim +16 include/linux/unwind_deferred_types.h

    12	
    13	struct unwind_task_info {
    14		struct unwind_cache	*cache;
    15		struct callback_head	work;
  > 16		local64_t		timestamp;
    17		local_t			pending;
    18	};
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
