Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C31E51D;
	Sat,  9 Nov 2024 05:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731131139; cv=none; b=ikSBYXXwx3WMq+HlAxqOzegALBg+ssJ+JBiE6Je0HCg8d39SxSAvH2F7fV//KTFnoBXFt47y9Z3/BTkg9DKR69ArfN7lnS3sjQftZ9OZJTZONeHu9D6gHU8FvOKmM/lu9TL+nJhugl6ld3KKMHwaLFwCW2d8puwPjC3duPCAVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731131139; c=relaxed/simple;
	bh=7vW5JeGxQy+/KyLJe2zFNuH+Xv75pirG3cgdjNC3Urw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H8koeksGrvx79kgPicPjBVUPUjH2Fu0JW/3QzZzeeuGFHRmhRp1wjPMNtR/qQWRNHOU0gPDw9e+k+LGK8SzlP5XbEvujk5zILL/ipifIie/AjhNVFDHFF620H6rOJvu3Fv/300fmeOXi82PmlPlTxgbH42ijRNJ/A0NiwGIX0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwV9IdjU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwV9IdjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731131138; x=1762667138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vW5JeGxQy+/KyLJe2zFNuH+Xv75pirG3cgdjNC3Urw=;
  b=DwV9IdjU+lFewYmowlW309gb8NW8MwANY11I1E4EfYTLQCz847fVcLE5
   rk8Gslgk8aLMKFo2ZE/A0O957m21Bnv+BCsonZuJE0m8aOhHmFwW6jaSc
   hn/QUwh0rnuMMyDLARw3Qa3xShG5UaFVmIDp/AZpVD5TY29aP9Gf5pd9C
   P3NMbdpAk3AWp/k2j5SUY1PFsgFccWr2iOmaXgP6LI8jkUEL1f3hAutrD
   siaJhLF0+QPtH4Tfc2Y6XpTeUBunt/aX+wk2Zwot+TfUiQlCSPWSyrDmT
   kkzhrk/lSbH0ePy49K/7JaSRaO8GA+qIQaBPQ9jSJ5BUsKsFKTWmgf85d
   A==;
X-CSE-ConnectionGUID: 4w19BEauSoyIO9br8D3YyA==
X-CSE-MsgGUID: euiJVFMNQo6ETw1EH/GkOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34805320"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="34805320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 21:45:35 -0800
X-CSE-ConnectionGUID: +Sl1ERDIRJyt/6D7grcpbQ==
X-CSE-MsgGUID: l8jp5i0cTOmU6ki2fZLCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="90996118"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 21:45:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9eHr-000s6m-1Q;
	Sat, 09 Nov 2024 05:45:31 +0000
Date: Sat, 9 Nov 2024 13:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1029:7: error: call to undeclared function
 'arch_frace_get_symaddr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202411091312.JGB0J5W5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   45b6f29f12043a3d5cb155ac4e09fa61229ebb00
commit: 45b6f29f12043a3d5cb155ac4e09fa61229ebb00 [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241109/202411091312.JGB0J5W5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091312.JGB0J5W5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091312.JGB0J5W5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
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
   kernel/trace/bpf_trace.c:356:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     356 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:402:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     402 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:457:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     457 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:459:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     459 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:501:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     501 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:503:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     503 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:518:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     518 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:542:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     542 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:706:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     706 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1009:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1009 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>> kernel/trace/bpf_trace.c:1029:7: error: call to undeclared function 'arch_frace_get_symaddr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1029 |         if (!ftrace_get_symaddr(fentry_ip))
         |              ^
   arch/x86/include/asm/ftrace.h:56:39: note: expanded from macro 'ftrace_get_symaddr'
      56 | #define ftrace_get_symaddr(fentry_ip)   arch_frace_get_symaddr(fentry_ip)
         |                                         ^
   kernel/trace/bpf_trace.c:1029:7: note: did you mean 'arch_ftrace_get_symaddr'?
   arch/x86/include/asm/ftrace.h:56:39: note: expanded from macro 'ftrace_get_symaddr'
      56 | #define ftrace_get_symaddr(fentry_ip)   arch_frace_get_symaddr(fentry_ip)
         |                                         ^
   arch/x86/include/asm/ftrace.h:37:29: note: 'arch_ftrace_get_symaddr' declared here
      37 | static inline unsigned long arch_ftrace_get_symaddr(unsigned long fentry_ip)
         |                             ^
   kernel/trace/bpf_trace.c:1189:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1189 |         .arg3_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1206:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1206 |         .arg2_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1624:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1624 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1849:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1849 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1904:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1904 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   19 warnings and 1 error generated.


vim +/arch_frace_get_symaddr +1029 kernel/trace/bpf_trace.c

  1026	
  1027	static unsigned long get_entry_ip(unsigned long fentry_ip)
  1028	{
> 1029		if (!ftrace_get_symaddr(fentry_ip))
  1030			return fentry_ip;
  1031	}
  1032	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
