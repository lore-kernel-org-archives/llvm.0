Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E0313FD72;
	Sun, 24 Nov 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732486643; cv=none; b=kKCWnF9q1xs40aSl05kekllQKRJVBCTjiUaSloZlcldGailmDgAPgaqPoaFqyZYE8fjEHDu2oTcge4MfJUXVIGNMoMz/G28co4AkEfSqVnFuYuFMR+BZj+PRb5snMd9NOz/RU8y3EwD7KbhfDIisyhlXrLQh/gdj6t+0QiGX0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732486643; c=relaxed/simple;
	bh=HytEJPAsaxesTJrJKceL9NJGZe/5RNOHlyFFjHZDVBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ruTEAxE2fzx60q/rabg0sWdiYvAMIrIkXv2qIriaNR5AnPcjUNS+zXw6gOa+Bgr49jjfYA6dsyou7r0sVPgB4v5bUJCBb73I7+yFlKM0y9axRhF4QMWFJO7o5VwdtEoSjuB4IJ1ueH+tw1N27bSk3Ry82nQoefa9oMZhEXINmzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SG1Dxxue; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SG1Dxxue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732486642; x=1764022642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HytEJPAsaxesTJrJKceL9NJGZe/5RNOHlyFFjHZDVBE=;
  b=SG1DxxuemGlRlnT0bD9ZsgTd8zIFNnOgWTK5/XbsVCvcYIo6xPgxvK3+
   ZkVsWx220NPyevJJKxji5xxv9C5zB1XMH+RX/rgqF5k3NBcQc6/OYlCPc
   IoqJ40t4+UHpC51Pplrq4Ef820823DcwfjI2vu+fSYorSbr03YaiP5izz
   YviEW8mrYsQADHhjlAtkhAK4Z1EzzHN82m5arMA8a7Fbr4PgUmBz6053B
   BetpfKEsx1sTozVxiGnyqTpaE9ysqy5Oum6+g6TQVkn9JK8p7lL1spjOp
   ldmssfvUY0jxUazqGGTpIdiTT2KQ5oQYq80TnTid/zKCnsSDiLW3Z9TbE
   Q==;
X-CSE-ConnectionGUID: XAoPCk8ARcakF7vtOqICZw==
X-CSE-MsgGUID: gRcQJShtQLKAGrGsdS1kJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32316203"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="32316203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 14:17:22 -0800
X-CSE-ConnectionGUID: Aj4BwIgdSRiQelgwN/y84Q==
X-CSE-MsgGUID: JkUrlzQtTX2GjAaM97PlhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="122041851"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2024 14:17:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFKur-0005Fn-1g;
	Sun, 24 Nov 2024 22:17:17 +0000
Date: Mon, 25 Nov 2024 06:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 179/185] error[E0587]: type has conflicting
 packed and align representation hints
Message-ID: <202411250600.ROWGdWo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   66d7b0955f0bc982d6bbe4e0aa565b71831f744b
commit: cebdaabc3734d69461a644e3af52d389e8766d6f [179/185] rust: WIP(?): Various bits of rust glue for AOP series
config: x86_64-randconfig-002-20241125 (https://download.01.org/0day-ci/archive/20241125/202411250600.ROWGdWo8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250600.ROWGdWo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250600.ROWGdWo8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   4 warnings generated.
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>> error[E0587]: type has conflicting packed and align representation hints
   --> rust/bindings/bindings_generated.rs:102273:1
   |
   102273 | pub struct snd_dec_flac {
   | ^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
