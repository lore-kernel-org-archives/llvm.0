Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBD1AA785;
	Sat,  2 Nov 2024 20:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581077; cv=none; b=ihqz/EAx2HNDwEHX++vo0jW33JB1yJMFbOImoWwd265ZM1Z1M1wjU+WJunBgNHJ7+6BfGEjZ7veZ/8inT/ofxv9U8ECXmPCiX4Io+vq2BxkUCKEtlMDPWK1Uh+xaQ4c+7vo9EWgMM1TyfyzOYAHn2fETJyenr6wZab5wBffrYXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581077; c=relaxed/simple;
	bh=RWLIYNtRXOUxUlvgvTp6NpHWcpn2rh/vcs6KeLo7onI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G13GMMKxE/by8yGXJF1gy5dK/AK7EhkYf5NQWqDmX5Syjvum4pxK3YPfSq3HykqhMNhaVxsADIHn3bRwdzLHq2aj2PiB2A1Wsb7H06ZkOzH9Q1vnGfWP5lm62V4gLW4iwUKfjHUMi0WY/qW5Z1nF4JtCo3IL0Sm8q1U8TYoldts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N76lwCG8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N76lwCG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730581075; x=1762117075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWLIYNtRXOUxUlvgvTp6NpHWcpn2rh/vcs6KeLo7onI=;
  b=N76lwCG8Z3ynMycdsHZu2xn/fml0wwPoDCIaOOJR8MIusAk0Lwyj402+
   nss1RL4Rs1Zw2csxwn7DG9+1addNP8jNuPoy1sqMgmTwIudM6spOUeVIU
   Nmzg5ZzCju4+jKjLsr9+rzA02kqnejfpI3dkTD8vBBasdfD/GBQXFMZhU
   OBI8fSgc7tqcl9qcA3BLQ0H+e3ro644/boPyTlZoTUHsFTLd9Wit6oFQy
   ESboTQwUpvs9XFe3hOiK9/dwnvhydPwBXdOoMDQpsGj8g1IBlNK9ei4rU
   Ov+dmvT9ECSBYTUvWLoXdPTz8VOwX/WoBaTjHl4bNIQjIG4tRtZmjfjcX
   Q==;
X-CSE-ConnectionGUID: ak6DXKLjSqqF0BWaoR/j3A==
X-CSE-MsgGUID: zQPvDbhATEm7VBZpwYGSDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29738525"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="29738525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 13:57:55 -0700
X-CSE-ConnectionGUID: z8pL+MLzTWW1MGgup2ZIBw==
X-CSE-MsgGUID: WtVB4dm2QnS9jTdxkAT6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120726404"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 13:57:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7LBv-000jLK-1Z;
	Sat, 02 Nov 2024 20:57:51 +0000
Date: Sun, 3 Nov 2024 04:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 21/24]
 arch/x86/kernel/uprobes.c:1344:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202411030452.Y47VNErv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: 0200936b03cfee067eb7db4b44079104b561b726 [21/24] uprobes/x86: Add support to optimize uprobes
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241103/202411030452.Y47VNErv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030452.Y47VNErv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030452.Y47VNErv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/uprobes.c:12:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
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
>> arch/x86/kernel/uprobes.c:1344:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1344 |         if (!area)
         |             ^~~~~
   arch/x86/kernel/uprobes.c:1359:9: note: uninitialized use occurs here
    1359 |         return ret;
         |                ^~~
   arch/x86/kernel/uprobes.c:1344:2: note: remove the 'if' if its condition is always false
    1344 |         if (!area)
         |         ^~~~~~~~~~
    1345 |                 goto fail;
         |                 ~~~~~~~~~
   arch/x86/kernel/uprobes.c:1340:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1340 |         if (PAGE_SIZE - (vaddr & ~PAGE_MASK) < 5)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/page_types.h:11:20: note: expanded from macro 'PAGE_SIZE'
      11 | #define PAGE_SIZE               (_AC(1,UL) << PAGE_SHIFT)
         |                                 ^
   arch/x86/kernel/uprobes.c:1359:9: note: uninitialized use occurs here
    1359 |         return ret;
         |                ^~~
   arch/x86/kernel/uprobes.c:1340:2: note: remove the 'if' if its condition is always false
    1340 |         if (PAGE_SIZE - (vaddr & ~PAGE_MASK) < 5)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1341 |                 goto fail;
         |                 ~~~~~~~~~
   arch/x86/kernel/uprobes.c:1337:9: note: initialize the variable 'ret' to silence this warning
    1337 |         int ret;
         |                ^
         |                 = 0
   6 warnings generated.


vim +1344 arch/x86/kernel/uprobes.c

  1331	
  1332	static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct *mm,
  1333					  unsigned long vaddr)
  1334	{
  1335		struct tramp_area *area = NULL;
  1336		char call[5];
  1337		int ret;
  1338	
  1339		/* We can't do cross page atomic writes yet. */
  1340		if (PAGE_SIZE - (vaddr & ~PAGE_MASK) < 5)
  1341			goto fail;
  1342	
  1343		area = get_tramp_area(vaddr);
> 1344		if (!area)
  1345			goto fail;
  1346	
  1347		relative_call(call, (void *) vaddr, (void *) area->vaddr);
  1348		ret = uprobe_write_opcode(auprobe, mm, vaddr, call, 5, (void *) 1);
  1349		if (ret)
  1350			goto fail;
  1351	
  1352		set_bit(ARCH_UPROBE_FLAG_OPTIMIZED, &auprobe->flags);
  1353		return 0;
  1354	
  1355	fail:
  1356		/* Once we fail we never try again. */
  1357		put_tramp_area(area);
  1358		clear_bit(ARCH_UPROBE_FLAG_CAN_OPTIMIZE, &auprobe->flags);
  1359		return ret;
  1360	}
  1361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
