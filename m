Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012033C8;
	Sat, 27 Apr 2024 02:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714185206; cv=none; b=Lmt2h+PsDKUXu7Y8AgEZsl2DOV+WdiZNf+3WHT+P2L6NTMg2F2WKq4ohSpENFSVdyWjr6lYxqsSA/o0dboUVW/qRFPQkFk9UauN15yUY3ojQF50bw3nymqseqPE1d0UC2z90HSD7E6KZH870I0MKu/oKUvG1K4lfnHY0XYmuN/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714185206; c=relaxed/simple;
	bh=5MvOBZAcUd8Ix6iKYO00W8YA93vrl4kPOX33+cwe0tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KfH3XaNLwOVLxg4nVPnHz1LaHAZ1bxj/TONSnyv5NZA9Ob5lPUoys1p+C8bksL8t7nK5wV4HIiasJvm0CXz2isn2jbpEYhCezF65VaNYxtcDB1YOp56WpsDowdNXeNEmzo35Rt/1bdTbE3X33EhSLRpeTt/0JPHo73cmt/gMwq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig5bz+EL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig5bz+EL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714185204; x=1745721204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MvOBZAcUd8Ix6iKYO00W8YA93vrl4kPOX33+cwe0tM=;
  b=Ig5bz+ELfysKQXDfjwMyCp9EZzoppYdNZW33ETO6s1n2WBbCBB+3NNpb
   GjFC62NTGBeM/C+vIwSCczUu84hGKhVoiCmnm1XgBDtrh4H0nxrFxJR55
   Xuf0bpCJ7FRvu5yOcvbSKVaD9wulFfKXhiAAXp1kNmDQNf7CyUn2hzW85
   1EI7lX8ySImS9sKZaRmF65VopmkcJE6MxSL5asjwxBPsP+lH6AtIT9RK6
   MzuACcMV6BI1d4Qec+oWOaCqmr/0/MfpwWQUrPL4WqxhWL9KoRhty8wDL
   kUE2eVA55dO+LFU8+YI17Q5qZy77b6Ogde9dEI50e96z8YE9ELgeQMpLX
   w==;
X-CSE-ConnectionGUID: JP2FA6r/Tdih/AkVyL4GUQ==
X-CSE-MsgGUID: 3k4eHBqwT02qjNQDI5Zpwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10041935"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="10041935"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 19:33:23 -0700
X-CSE-ConnectionGUID: Sccp0mJtSviHRv03kZw2Vg==
X-CSE-MsgGUID: 22DAZ0DdQeuvIMlHaeWdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30395655"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Apr 2024 19:33:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0XsM-0004aO-31;
	Sat, 27 Apr 2024 02:33:18 +0000
Date: Sat, 27 Apr 2024 10:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_2 12/15]
 include/uapi/asm-generic/unistd.h:849:11: error: use of undeclared
 identifier '__NR_uprobe'
Message-ID: <202404271020.JdSvPT5N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_2
head:   554d1563d6bebe03a19f9500907d0b71df555713
commit: 644d6511fa626aad8f835307c2ce93bb1d1db871 [12/15] uprobe: Add uprobe syscall to speed up uprobe
config: arm64-randconfig-001-20240427 (https://download.01.org/0day-ci/archive/20240427/202404271020.JdSvPT5N-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271020.JdSvPT5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271020.JdSvPT5N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/pi/map_kernel.c:13:
   In file included from arch/arm64/include/asm/pgalloc.h:13:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/pi/map_kernel.c:13:
   In file included from arch/arm64/include/asm/pgalloc.h:13:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:23:
   In file included from arch/arm64/include/asm/ftrace.h:52:
   In file included from include/linux/compat.h:20:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   6 warnings generated.
--
   In file included from <stdin>:2:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   1 warning generated.
--
>> clang diag: include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
   clang diag: include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
--
   In file included from arch/arm64/kernel/hw_breakpoint.c:12:
   In file included from include/linux/compat.h:20:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/hw_breakpoint.c:15:
   In file included from include/linux/hw_breakpoint.h:5:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from arch/arm64/kernel/syscall.c:7:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/syscall.c:9:
   In file included from include/linux/syscalls.h:89:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/syscall.c:16:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
   include/uapi/asm-generic/unistd.h:845:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     845 | #define __NR_uretprobe 462
         |         ^
   include/uapi/asm-generic/unistd.h:848:9: note: previous definition is here
     848 | #define __NR_uretprobe 463
         |         ^
   In file included from arch/arm64/kernel/syscall.c:16:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   8 warnings generated.
--
   In file included from arch/arm64/kernel/fpsimd.c:14:
   In file included from include/linux/compat.h:20:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/fpsimd.c:26:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/fpsimd.c:208:20: warning: unused function 'sme_free' [-Wunused-function]
     208 | static inline void sme_free(struct task_struct *t) { }
         |                    ^~~~~~~~
   7 warnings generated.
--
   In file included from arch/arm64/kernel/signal.c:10:
   In file included from include/linux/compat.h:20:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/signal.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/signal.c:29:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
   include/uapi/asm-generic/unistd.h:845:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     845 | #define __NR_uretprobe 462
         |         ^
   include/uapi/asm-generic/unistd.h:848:9: note: previous definition is here
     848 | #define __NR_uretprobe 463
         |         ^
   In file included from arch/arm64/kernel/signal.c:29:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   8 warnings generated.
--
   In file included from arch/arm64/kernel/sys.c:12:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/sys.c:16:
   In file included from include/linux/syscalls.h:89:
   In file included from include/uapi/linux/unistd.h:8:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/sys.c:53:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
   include/uapi/asm-generic/unistd.h:845:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     845 | #define __NR_uretprobe 462
         |         ^
   include/uapi/asm-generic/unistd.h:848:9: note: previous definition is here
     848 | #define __NR_uretprobe 463
         |         ^
   In file included from arch/arm64/kernel/sys.c:53:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
   In file included from arch/arm64/kernel/sys.c:60:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
   include/uapi/asm-generic/unistd.h:845:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     845 | #define __NR_uretprobe 462
         |         ^
   include/uapi/asm-generic/unistd.h:848:9: note: previous definition is here
     848 | #define __NR_uretprobe 463
         |         ^
   In file included from arch/arm64/kernel/sys.c:60:
   In file included from arch/arm64/include/asm/unistd.h:48:
   In file included from arch/arm64/include/uapi/asm/unistd.h:25:
>> include/uapi/asm-generic/unistd.h:848:9: warning: '__NR_uretprobe' macro redefined [-Wmacro-redefined]
     848 | #define __NR_uretprobe 463
         |         ^
   include/uapi/asm-generic/unistd.h:845:9: note: previous definition is here
     845 | #define __NR_uretprobe 462
         |         ^
>> include/uapi/asm-generic/unistd.h:849:11: error: use of undeclared identifier '__NR_uprobe'
     849 | __SYSCALL(__NR_uprobe, sys_uprobe)
         |           ^
   10 warnings and 1 error generated.
..


vim +/__NR_uprobe +849 include/uapi/asm-generic/unistd.h

   847	
 > 848	#define __NR_uretprobe 463
 > 849	__SYSCALL(__NR_uprobe, sys_uprobe)
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
