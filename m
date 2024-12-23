Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117D4EEB5;
	Mon, 23 Dec 2024 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734941416; cv=none; b=ih579CQC46am1nFAd79PBIs93EO1j+V7hqBlBllDtJfjIwELTW5MEasksUJk0SqFrtRFrXMhgk14k7zxEUtK68JUjTDEQrF7QKaRnzefUV39CSW2rPDhMia6EmEvBDShvJgK0Hw2n5krblBgIvgPHRNqNQy5NVjqrcSGuk/9TD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734941416; c=relaxed/simple;
	bh=HD2G2UNRJBsalTqHqAztT7pnUSwz6t4dZqbr7RGqVkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pd5fwYc5O5BsLU+grLOu5Wd/vi9pROZAaJtxo4WFGdBViLsuv75Bz3LNVjEvc80oBEarYr4HmNtEfA2lkpC35KLmsUHjwC1RsydOvBS/o0J+iHS1gfHInAeGojtN4miZppJ49I9BRmJffiQ1yrXYMig3wyYzqJID2Wa1LySSKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of/yQyZN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of/yQyZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734941413; x=1766477413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD2G2UNRJBsalTqHqAztT7pnUSwz6t4dZqbr7RGqVkg=;
  b=Of/yQyZNLLj0gNOtmwqSJNsC3ilDHGm64YlxuDne/GFjdMnlqArdu9n0
   C32FwogdvGijp2yh4x7eXS4Z3O9YJT1KicKk5WQ44JpDtXjoJjZ6RUM+k
   bJqRYpw9s6yjss8v7GPowgHcX5pkuaUexCcTXbzn4m5IfqOQJJshS/AjG
   toIucB1uuliM+FQARTrZeaFYeHQqt6IxNbO4qhLhr/DgM0OeQsWGTdeHc
   WB9pfzjow8pY0R5qdeszQYQ2YmT0VzRlwdzEaSyXaijnb2af+Jagsl+eN
   pp92u6PV7pPMWDskUonFhXMkFVHx3jLslX47dEmSa2MSLGA7uGNY50Tr8
   A==;
X-CSE-ConnectionGUID: oTkyCYpcSv629AWMfpcldA==
X-CSE-MsgGUID: HRR7qfbnTdm3jJcRYITdIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="45893779"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="45893779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 00:10:12 -0800
X-CSE-ConnectionGUID: QHqE4StoRvm0vVlHe5StWQ==
X-CSE-MsgGUID: FZlKYtADQMyVsAVia8uZ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99005132"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2024 00:10:11 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPdVw-0003U3-20;
	Mon, 23 Dec 2024 08:10:08 +0000
Date: Mon, 23 Dec 2024 16:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 42/46]
 arch/riscv/kernel/hw_breakpoint.c:58:6: warning: variable 'rc' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202412231642.st92KQwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   36a4c153b9a152c3eb136e4aced7c9ccbaae922d
commit: d869f0c459d0d190cabdccf1bf1de39332935dfb [42/46] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-001-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231642.st92KQwr-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231642.st92KQwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231642.st92KQwr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/hw_breakpoint.c:6:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2224:
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
>> arch/riscv/kernel/hw_breakpoint.c:58:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      58 |         if (ret.error) {
         |             ^~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:94:9: note: uninitialized use occurs here
      94 |         return rc;
         |                ^~
   arch/riscv/kernel/hw_breakpoint.c:58:2: note: remove the 'if' if its condition is always true
      58 |         if (ret.error) {
         |         ^~~~~~~~~~~~~~
   arch/riscv/kernel/hw_breakpoint.c:45:8: note: initialize the variable 'rc' to silence this warning
      45 |         int rc;
         |               ^
         |                = 0
   3 warnings generated.


vim +58 arch/riscv/kernel/hw_breakpoint.c

    39	
    40	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    41	{
    42		struct sbi_dbtr_shmem_entry *dbtr_shmem;
    43		unsigned long shmem_pa;
    44		struct sbiret ret;
    45		int rc;
    46	
    47		dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
    48		if (!dbtr_shmem) {
    49			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    50			return -ENODEV;
    51		}
    52	
    53		shmem_pa = __pa(dbtr_shmem);
    54	
    55		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
    56				MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
    57	
  > 58		if (ret.error) {
    59			switch(ret.error) {
    60			case SBI_ERR_DENIED:
    61				pr_warn("%s: Access denied for shared memory at %lx\n",
    62					__func__, shmem_pa);
    63				rc = -EPERM;
    64				break;
    65	
    66			case SBI_ERR_INVALID_PARAM:
    67			case SBI_ERR_INVALID_ADDRESS:
    68				pr_warn("%s: Invalid address parameter (%lu)\n",
    69					__func__, ret.error);
    70				rc = -EINVAL;
    71				break;
    72	
    73			case SBI_ERR_ALREADY_AVAILABLE:
    74				pr_warn("%s: Shared memory is already set\n",
    75					__func__);
    76				rc = -EADDRINUSE;
    77				break;
    78	
    79			case SBI_ERR_FAILURE:
    80				pr_err("%s: Internal sdtrig state error\n",
    81				       __func__);
    82				rc = -ENXIO;
    83				break;
    84	
    85			default:
    86				pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
    87				rc = -ENXIO;
    88				break;
    89			}
    90		}
    91	
    92		pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
    93	
    94		return rc;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
