Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468DA3A7591;
	Wed, 15 Apr 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260531; cv=none; b=phBoxKrSq2PRnsmqt/WBQMH49UcKL9DQ90N557616du9xcpDd0Wp31TBNoXJNBCDh0mVI3On991Hig4rSefEh73rqCal/JIJYp3KElWOKa4ersiVKtNzD8zhbVuDSxV+JRNvwA/bNQI5b6GEH4DILuu3s79odBHnKr/UN+eaSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260531; c=relaxed/simple;
	bh=0HTYWMYt65OMqLOGoQAxXTWi/323rhZ+/DjmFzpyHzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPqiPmcYhT35/GenyAARlgUYtk747BezliotPhDUjifK85EUB9/iA4XVjudsUh1MfugiKAbdoHDC8bORXsIyDFgCZCupWO6yltubpkSPn3w0cz/GR5V7bsgWwLqDL2K40bUuf84n4A+SNQUb3yZUc24GLZnNIW29FIR+5Ub9Loc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsAB+r5Q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsAB+r5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776260530; x=1807796530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0HTYWMYt65OMqLOGoQAxXTWi/323rhZ+/DjmFzpyHzs=;
  b=dsAB+r5Qjj8ST7lr67SUevI/lBlAUXJ0goDmy3yHpJLWG6Mkoj0JWvTV
   3syLfyB/95q2Hs2xyQCMahgzsmwrajcpvuANT4yzCIYclaArdk5vDK7nv
   AWXfUnghSL6SKA3N6aTdGSiT1FLzo6oBqlfkj2Ukriu2nSWfPUPXWVrUw
   n3oH54jPgBbKnJ67Xzz4yy/ozgqa5YqxjvXTv8SMVcVBeorc42N6api2+
   cReCK0IFeJoE/XjmUUnkuYTqkUVBT4wnsJ++V7e3t6bUhlMbr5RIXheqM
   a6YgSKRz7N2YhApJ7ewvsLKKxyGEHaenAZks+xz2iLhwgTajvs3wGVwAT
   w==;
X-CSE-ConnectionGUID: OAwKGFyyTgKdaANZwsWQ+Q==
X-CSE-MsgGUID: aur2iO0sS9an4hxtjHZkig==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99878910"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="99878910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:42:10 -0700
X-CSE-ConnectionGUID: Bdg7FMd8RK+j/wxqc1O7Gg==
X-CSE-MsgGUID: cmO6siA9S7m3kvxlbla7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230670547"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2026 06:42:08 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD0VK-000000000Y1-1N8x;
	Wed, 15 Apr 2026 13:42:06 +0000
Date: Wed, 15 Apr 2026 21:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <202604152110.yr5hvLpq-lkp@intel.com>
References: <20260410114336.983057-1-brian.ruley@gehealthcare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410114336.983057-1-brian.ruley@gehealthcare.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm/for-next]
[also build test WARNING on akpm-mm/mm-everything arm-perf/for-next/perf arm64/for-next/core linus/master arm/fixes v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Ruley/test-mm-arm-pgtable-remove-young-bit-check-for-pte_valid_user/20260414-235000
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260410114336.983057-1-brian.ruley%40gehealthcare.com
patch subject: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for pte_valid_user
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604152110.yr5hvLpq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152110.yr5hvLpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152110.yr5hvLpq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:64:6: warning: no previous prototype for function 'migrate_exec_log_add' [-Wmissing-prototypes]
      64 | void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
         |      ^
   mm/migrate.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      64 | void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
         | ^
         | static 
>> mm/migrate.c:79:6: warning: no previous prototype for function 'migrate_exec_log_dump' [-Wmissing-prototypes]
      79 | void migrate_exec_log_dump(unsigned long fault_addr)
         |      ^
   mm/migrate.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | void migrate_exec_log_dump(unsigned long fault_addr)
         | ^
         | static 
   2 warnings generated.


vim +/migrate_exec_log_add +64 mm/migrate.c

    63	
  > 64	void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
    65				  unsigned long new_pfn, bool flushed)
    66	{
    67		unsigned int idx = __this_cpu_read(migrate_exec_idx);
    68		struct migrate_exec_entry *log = this_cpu_ptr(migrate_exec_log);
    69		struct migrate_exec_entry *e = &log[idx];
    70	
    71		e->addr = addr;
    72		e->old_pfn = old_pfn;
    73		e->new_pfn = new_pfn;
    74		e->pid = current->pid;
    75		e->flushed = flushed;
    76		__this_cpu_write(migrate_exec_idx, (idx + 1) % MIGRATE_EXEC_LOG_SIZE);
    77	}
    78	
  > 79	void migrate_exec_log_dump(unsigned long fault_addr)
    80	{
    81		int cpu;
    82	
    83		pr_err("SIGILL at %lx pid %d, recent exec migrations:\n",
    84		       fault_addr, current->pid);
    85		for_each_online_cpu(cpu) {
    86			struct migrate_exec_entry *log = per_cpu(migrate_exec_log, cpu);
    87			int i;
    88			for (i = 0; i < MIGRATE_EXEC_LOG_SIZE; i++) {
    89				if (log[i].addr == 0)
    90					continue;
    91				pr_err("  cpu%d: addr=%lx old_pfn=%lx new_pfn=%lx pid=%d flushed=%d%s\n",
    92				       cpu, log[i].addr, log[i].old_pfn, log[i].new_pfn,
    93				       log[i].pid, log[i].flushed,
    94				       (PAGE_ALIGN(fault_addr) == PAGE_ALIGN(log[i].addr)) ?
    95				       " *** MATCH ***" : "");
    96			}
    97		}
    98	}
    99	#include "internal.h"
   100	#include "swap.h"
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
