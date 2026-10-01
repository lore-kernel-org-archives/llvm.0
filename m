Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CE417993;
	Thu,  1 Oct 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825021; cv=none; b=M2P/gqZnLgBXEW43N4KorV5e9eho7/xLrDjMqrczkwKkzZ4qwSzGuKpFt41vDhIM5tGiKKa30Yu/wqN2jMlS9FNlDIk/lagEGsBSUJo5LhJsBtCVMutWohgUowg4wdxYpHNzaT559TatLAXls8nZNZUsUpSokZGPLaCl7L/lUgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825021; c=relaxed/simple;
	bh=n0VQUkM7psVneHq6eE2kgJarDqW8jDcm13ZW76pLkeY=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUfY0zIcizeLhL5K8RM7IgvWzgr56jMaI4OQ/i0PlFeBZPRyDFRPOief1jrXieL4amRDGKI0dolDw1v4EcRwQXxD6Udjeca9ZanT7pbDgoHPXHmtB5DXNxuVk0vvpkdgEKosMpKjSy5EGMqDSkdMPocTQutbbSDEMu8CLB+E+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9ixlXPN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9ixlXPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790825019; x=1822361019;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=n0VQUkM7psVneHq6eE2kgJarDqW8jDcm13ZW76pLkeY=;
  b=k9ixlXPNt7DgWeEbS7cEyCXINjdpkIXt9p/dh/byeemZs/owpfYsMuIX
   +CsrnZwjnivGvncL9E5PGwZYQygg5zHhN2ZDhPLOfdWlrowBeFdjrkT2m
   fbL3j4h4rk/i/Ov1bBQlTqhzycL1VBm3Fvdud1tBTGNTEEiDOiwBJ1+O5
   xWaQ0dEY/SDJbSZOQbP5CV9WXQ69kt5HGeMglCzM3TGVwHJjC8HAKHY2X
   r5awJUjiW8/M4LsPp+VScEWl4sIyW9BoBYteRzwz5b0PHeTyjo7Z6QJTK
   wqiZi+RE24ADfRmMpV/Ysg88Ax8M52EtxtL8k65r7j7GlI69I36zLq/PB
   g==;
X-CSE-ConnectionGUID: nwxAaAE5SymQTxrckjcMGw==
X-CSE-MsgGUID: 882v1VBgQAC40kaeoBlhOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90786325"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90786325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 20:23:39 -0700
X-CSE-ConnectionGUID: 8plhJ/9eTPal6t+DJrxbdQ==
X-CSE-MsgGUID: 5JI6zPWvRimmmlEsNKyTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275417031"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Sep 2026 20:23:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC7OQ-00000000RRv-3Qxr;
	Thu, 01 Oct 2026 03:23:34 +0000
Date: Thu, 1 Oct 2026 11:22:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: tracing: Make branch profiler counters atomic
Message-ID: <202610011126.EYAl850m-lkp@intel.com>
References: <202610011126.EYAl850m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610011126.EYAl850m-lkp@intel.com>

Hi nanshuaibo,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/nanshuaibo/tracing-Make-branch-profiler-counters-atomic/20260930-110728
base:   
patch link:    https://lore.kernel.org/r/202610011126.EYAl850m-lkp%40intel.com
config: s390-randconfig-1001-20260930 (https://download.01.org/0day-ci/archive/20261001/202610011126.EYAl850m-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011126.EYAl850m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011126.EYAl850m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kernel/nmi.c:63:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
      63 |         if (!nmi_needs_mcesa())
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
>> arch/s390/kernel/nmi.c:63:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:66:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
      66 |         if (cpu_has_gs())
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:66:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:76:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
      76 |         if (!nmi_needs_mcesa())
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:76:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:79:11: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
      79 |         origin = kmalloc(size, GFP_KERNEL);
         |                  ^
   include/linux/slab.h:1056:32: note: expanded from macro 'kmalloc'
    1056 | #define kmalloc(size, flags)                    alloc_hooks(kmalloc_noprof(size, flags))
         |                                                 ^
   include/linux/alloc_tag.h:270:2: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:257:2: note: expanded from macro 'alloc_hooks_tag'
     257 |         if (mem_alloc_profiling_enabled()) {                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   arch/s390/kernel/nmi.c:79:11: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/slab.h:1056:32: note: expanded from macro 'kmalloc'
    1056 | #define kmalloc(size, flags)                    alloc_hooks(kmalloc_noprof(size, flags))
         |                                                 ^
   include/linux/alloc_tag.h:270:2: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |         ^
   include/linux/alloc_tag.h:257:2: note: expanded from macro 'alloc_hooks_tag'
     257 |         if (mem_alloc_profiling_enabled()) {                            \
         |         ^
--
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:589:3: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     589 |                 if (IS_ERR(hw_ptr)) {
         |                 ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:589:3: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:597:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     597 |         if (ret)
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:597:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:10:
   In file included from include/linux/mailbox_client.h:10:
   In file included from include/linux/device.h:31:
   include/linux/device/devres.h:175:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     175 |         if (ret)
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:10:
   In file included from include/linux/mailbox_client.h:10:
   In file included from include/linux/device.h:31:
   include/linux/device/devres.h:175:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:11:
>> include/linux/mailbox/riscv-rpmi-message.h:234:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     234 |         if (ret < 0)
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:11:
>> include/linux/mailbox/riscv-rpmi-message.h:234:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:158:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     158 |         if (ret)
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:158:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:162:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     162 |         if (!resp || resp->status)
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   drivers/clk/clk-rpmi.c:162:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:80:4: note: expanded from macro '__trace_if_value'
      80 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[0]), 0);\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:8:
   In file included from include/linux/clk-provider.h:10:
   In file included from include/linux/of.h:15:
   In file included from include/linux/bitops.h:6:
   In file included from include/linux/bits.h:32:
   include/linux/overflow.h:353:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
     353 |         if (check_add_overflow(addend1, addend2, &bytes))
         |         ^
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^
   include/linux/compiler.h:79:4: note: expanded from macro '__trace_if_value'
      79 |                 (ftrace_branch_counter_inc(__if_trace.miss_hit[1]), 1) :\
         |                  ^
   include/linux/compiler.h:24:2: note: expanded from macro 'ftrace_branch_counter_inc'
      24 |         __atomic_fetch_add(&(counter), 1, __ATOMIC_RELAXED)
         |         ^
   In file included from drivers/clk/clk-rpmi.c:8:
   In file included from include/linux/clk-provider.h:10:
   In file included from include/linux/of.h:15:
   In file included from include/linux/bitops.h:6:
   In file included from include/linux/bits.h:32:
   include/linux/overflow.h:353:2: warning: misaligned atomic operation may incur significant performance penalty; the expected alignment (8 bytes) exceeds the actual alignment (4 bytes) [-Watomic-alignment]
   include/linux/compiler.h:65:28: note: expanded from macro 'if'
      65 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^
   include/linux/compiler.h:67:69: note: expanded from macro '__trace_if_var'
      67 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^


vim +63 arch/s390/kernel/nmi.c

6c81511ca1f52a Martin Schwidefsky 2017-10-12  60  
c7ed509b21b656 Alexander Gordeev  2021-12-10  61  void __init nmi_alloc_mcesa_early(u64 *mcesad)
6c81511ca1f52a Martin Schwidefsky 2017-10-12  62  {
6c81511ca1f52a Martin Schwidefsky 2017-10-12 @63  	if (!nmi_needs_mcesa())
6c81511ca1f52a Martin Schwidefsky 2017-10-12  64  		return;
c7ed509b21b656 Alexander Gordeev  2021-12-10  65  	*mcesad = __pa(&boot_mcesa);
42805261fcea80 Heiko Carstens     2025-02-07  66  	if (cpu_has_gs())
c7ed509b21b656 Alexander Gordeev  2021-12-10  67  		*mcesad |= ilog2(MCESA_MAX_SIZE);
6c81511ca1f52a Martin Schwidefsky 2017-10-12  68  }
6c81511ca1f52a Martin Schwidefsky 2017-10-12  69  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
