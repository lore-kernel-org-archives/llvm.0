Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7291D319B;
	Thu, 21 Nov 2024 12:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732193761; cv=none; b=g5TkxhILRnmS1N3SMbr1XNZ8l8D3564Wu77cQeI3puHXe9boa0xGM3pCliIjNUibIILVfL6eLIxzEkMRjZc3b4hYoVMnr2vF9uwH2BJINpJaH7Ed0OkNC+T1jAMMXs/Ai0o97G1a2+elvLZbd6iAsfQ0V9WHOX5T9Ve07FRhkEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732193761; c=relaxed/simple;
	bh=bHOyq/FmWi8QaB3zxvC12MprASo/B6ulI5arHtrkvv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR+vmBr08VODmkcy5yxZ22Lp44h4OB0do8Q5gKwgY+6rl98HJdC+xpWmkjG788K4VF0/GJbvc8JrmtdtZcH5Mjl67VsVWbH3bZsj8IDV+lq05PSm1PD25BoZeVGQcRwnub/uAH9IMeWLqQvdrTsIHAbcEUskUmhi/DXqNM0ujhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eni4DINq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eni4DINq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732193759; x=1763729759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bHOyq/FmWi8QaB3zxvC12MprASo/B6ulI5arHtrkvv4=;
  b=eni4DINqpwgfKpmrlKzQmT1FA/V8uU2XcKODwiq2gSiQJOokXVLfSaGo
   7fDdVz/jnhZFGYJwxmXHNwKRurGs2/LD2+ONgQP3fNcSqN8MshnnWW4Iz
   GebOce3ZLv6+XdimaD4PHleqcg83uh7Z0XFhH5fbpTduWN+HtWoenpWyu
   WC39Kx5v+BbFmgtV1vqxhdJ8yYvJuDtQW2rj7a8AgH0USYwTZRrgT9AlB
   GMDovJapr9SqsEX2bmeGAflfvtKq8QvtC+r1XVkPr+Q1d/vfJwW6Gy9CR
   pilqJxJUr/m53riBAcalkSE67+XeObWzNXJfXnjyncbO5vHpGoGMzYRXF
   A==;
X-CSE-ConnectionGUID: J4TCtpyLQhGxNC//7PCS7w==
X-CSE-MsgGUID: S1FbFeFcRXmGL3v15gGQfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32418767"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="32418767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 04:55:58 -0800
X-CSE-ConnectionGUID: L0WysU/8RfGwBhLCiUXBkQ==
X-CSE-MsgGUID: 7aCjPoKMTM6v37vDpni/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="94324441"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 04:55:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE6ix-0002zd-00;
	Thu, 21 Nov 2024 12:55:55 +0000
Date: Thu, 21 Nov 2024 20:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH 4/4] x86/cpu: Remove 'x86_cpu_desc' infrastructure
Message-ID: <202411212030.c7gvyPiO-lkp@intel.com>
References: <20241120202414.071D4237@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120202414.071D4237@davehans-spike.ostc.intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core tip/x86/core perf-tools/perf-tools linus/master v6.12 next-20241121]
[cannot apply to tip/auto-latest acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-Introduce-new-microcode-matching-helper/20241121-135056
base:   tip/master
patch link:    https://lore.kernel.org/r/20241120202414.071D4237%40davehans-spike.ostc.intel.com
patch subject: [RFC][PATCH 4/4] x86/cpu: Remove 'x86_cpu_desc' infrastructure
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241121/202411212030.c7gvyPiO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212030.c7gvyPiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411212030.c7gvyPiO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/power/cpu.c:10:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2225:
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
>> arch/x86/power/cpu.c:467:6: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     467 |         m = x86_match_cpu(msr_save_cpu_table);
         |             ^
>> arch/x86/power/cpu.c:467:4: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
     467 |         m = x86_match_cpu(msr_save_cpu_table);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
--
>> arch/x86/kernel/tsc_msr.c:175:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |         id = x86_match_cpu(tsc_msr_cpu_ids);
         |              ^
>> arch/x86/kernel/tsc_msr.c:175:5: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
     175 |         id = x86_match_cpu(tsc_msr_cpu_ids);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from arch/x86/kernel/smpboot.c:50:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2225:
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
>> arch/x86/kernel/smpboot.c:450:32: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     450 |         const struct x86_cpu_id *id = x86_match_cpu(intel_cod_cpu);
         |                                       ^
>> arch/x86/kernel/smpboot.c:450:27: error: incompatible integer to pointer conversion initializing 'const struct x86_cpu_id *' with an expression of type 'int' [-Wint-conversion]
     450 |         const struct x86_cpu_id *id = x86_match_cpu(intel_cod_cpu);
         |                                  ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
--
   In file included from arch/x86/kvm/pmu.c:15:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2225:
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
>> arch/x86/kvm/pmu.c:154:24: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |         if ((pmc->idx == 0 && x86_match_cpu(vmx_pebs_pdist_cpu)) ||
         |                               ^
   4 warnings and 1 error generated.
--
   In file included from arch/x86/mm/init.c:4:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2225:
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
>> arch/x86/mm/init.c:289:22: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     289 |         invlpg_miss_match = x86_match_cpu(invlpg_miss_ids);
         |                             ^
>> arch/x86/mm/init.c:289:20: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
     289 |         invlpg_miss_match = x86_match_cpu(invlpg_miss_ids);
         |                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
--
>> drivers/acpi/mipi-disco-img.c:771:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     771 |                     x86_match_cpu(dell_broken_mipi_disco_cpu_gens))
         |                     ^
   1 error generated.
--
>> drivers/cpufreq/speedstep-centrino.c:542:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     542 |         if (!x86_match_cpu(centrino_ids))
         |              ^
   1 error generated.
--
   In file included from drivers/cpufreq/intel_pstate.c:30:
   In file included from include/trace/events/power.h:12:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2225:
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
>> drivers/cpufreq/intel_pstate.c:1785:6: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1785 |         if (x86_match_cpu(intel_pstate_cpu_ee_disable_ids)) {
         |             ^
   drivers/cpufreq/intel_pstate.c:1807:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1807 |                 if (x86_match_cpu(intel_pstate_cpu_ee_disable_ids))
         |                     ^
   drivers/cpufreq/intel_pstate.c:3572:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3572 |         id = x86_match_cpu(intel_pstate_cpu_oob_ids);
         |              ^
>> drivers/cpufreq/intel_pstate.c:3572:5: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
    3572 |         id = x86_match_cpu(intel_pstate_cpu_oob_ids);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:3683:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3683 |         id = x86_match_cpu(hwp_support_ids);
         |              ^
   drivers/cpufreq/intel_pstate.c:3683:5: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
    3683 |         id = x86_match_cpu(hwp_support_ids);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:3720:6: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
    3720 |                 id = x86_match_cpu(intel_pstate_cpu_ids);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/intel_pstate.c:3763:28: error: incompatible integer to pointer conversion initializing 'const struct x86_cpu_id *' with an expression of type 'int' [-Wint-conversion]
    3763 |                 const struct x86_cpu_id *id = x86_match_cpu(intel_epp_default);
         |                                          ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:3764:28: error: incompatible integer to pointer conversion initializing 'const struct x86_cpu_id *' with an expression of type 'int' [-Wint-conversion]
    3764 |                 const struct x86_cpu_id *hybrid_id = x86_match_cpu(intel_hybrid_scaling_factor);
         |                                          ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:3800:6: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
    3800 |                 id = x86_match_cpu(intel_pstate_cpu_ee_disable_ids);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 10 errors generated.
--
   In file included from arch/x86/events/intel/uncore.c:6:
   In file included from arch/x86/events/intel/uncore.h:3:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2225:
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
>> arch/x86/events/intel/uncore.c:1929:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1929 |         id = x86_match_cpu(intel_uncore_match);
         |              ^
>> arch/x86/events/intel/uncore.c:1929:5: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
    1929 |         id = x86_match_cpu(intel_uncore_match);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
--
>> drivers/thermal/intel/intel_tcc.c:127:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         id = x86_match_cpu(intel_tcc_cpu_ids);
         |              ^
>> drivers/thermal/intel/intel_tcc.c:127:5: error: incompatible integer to pointer conversion assigning to 'const struct x86_cpu_id *' from 'int' [-Wint-conversion]
     127 |         id = x86_match_cpu(intel_tcc_cpu_ids);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/thermal/intel/intel_powerclamp.c:722:7: error: call to undeclared function 'x86_match_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     722 |         if (!x86_match_cpu(intel_powerclamp_ids)) {
         |              ^
   1 error generated.
..


vim +/x86_match_cpu +467 arch/x86/power/cpu.c

c49a0a80137c7ca Tom Lendacky 2019-08-19  460  
c49a0a80137c7ca Tom Lendacky 2019-08-19  461  typedef int (*pm_cpu_match_t)(const struct x86_cpu_id *);
c49a0a80137c7ca Tom Lendacky 2019-08-19  462  static int pm_cpu_check(const struct x86_cpu_id *c)
c49a0a80137c7ca Tom Lendacky 2019-08-19  463  {
c49a0a80137c7ca Tom Lendacky 2019-08-19  464  	const struct x86_cpu_id *m;
c49a0a80137c7ca Tom Lendacky 2019-08-19  465  	int ret = 0;
c49a0a80137c7ca Tom Lendacky 2019-08-19  466  
c49a0a80137c7ca Tom Lendacky 2019-08-19 @467  	m = x86_match_cpu(msr_save_cpu_table);
c49a0a80137c7ca Tom Lendacky 2019-08-19  468  	if (m) {
c49a0a80137c7ca Tom Lendacky 2019-08-19  469  		pm_cpu_match_t fn;
c49a0a80137c7ca Tom Lendacky 2019-08-19  470  
c49a0a80137c7ca Tom Lendacky 2019-08-19  471  		fn = (pm_cpu_match_t)m->driver_data;
c49a0a80137c7ca Tom Lendacky 2019-08-19  472  		ret = fn(m);
c49a0a80137c7ca Tom Lendacky 2019-08-19  473  	}
c49a0a80137c7ca Tom Lendacky 2019-08-19  474  
c49a0a80137c7ca Tom Lendacky 2019-08-19  475  	return ret;
c49a0a80137c7ca Tom Lendacky 2019-08-19  476  }
c49a0a80137c7ca Tom Lendacky 2019-08-19  477  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
