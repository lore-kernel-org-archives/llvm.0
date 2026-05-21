Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5973BCD36;
	Thu, 21 May 2026 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362467; cv=none; b=XYMqfKG+jLzj10tluKnrT0MGZIOOpZUeQnBENaxfkY1VW1EVvnKHIBHsm86cthUqdXheC/wGmWwUVf2hIncWivEcp5Esjp7L0+mZokSn2XMCxVwk9+ZjFuDrDSbVkbEYqbPDTyGhiapYZ1RH9YG8sa4FtS4pRKdoUcG1mmMTm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362467; c=relaxed/simple;
	bh=WUm6zmdFqh0mEvVJdV6krXjVoydqlOpvjl9nqwtbNfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qVkSNGoEPBtzW8E2Ru0Gy+wuTBP+YwUkWSaGCQnpaiNXQYaVtl732RpgNNkahSpD/TY5qRdbZcUUjJfXAL4FeyaDf1qjMGHpWTs4relgTFAt1zAVtAuCg21PoJPPpGLiXs7vYdmRatnkCriJTBQ8fBQl/o3QzXzleudA5HFrhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RI+XI/Or; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RI+XI/Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779362465; x=1810898465;
  h=date:from:to:cc:subject:message-id;
  bh=WUm6zmdFqh0mEvVJdV6krXjVoydqlOpvjl9nqwtbNfU=;
  b=RI+XI/Or74HoGSFI2x7umKrOKhYkeTG0yzHlicEjdULzdP/2h+MQolVo
   Wk0MVahVani+cJrAhXzvbufqYjih8SszbHHqkJhMk5Byv9F2U9BOJfHKx
   g5Cgqp6q16+j5G+HGQS2avYta9oce9uM/ag8PgMKLmDWrT1eRJrkya4I7
   Mpxui7MEb/cUf5a0g3thCPma3uMX9oTEpEKf4vijc1wVshbYf7QDAD4v1
   2Wm8QjdsxAytgdpOudpafyiXC5hnLVbmsBuqnUjkTrV0IEQmQumWCovzA
   smoZaSY6qXs7sKkn0ceoSmxNJdWDbA/XTALU5cV2r7TgUSXhWG3Rn7cef
   Q==;
X-CSE-ConnectionGUID: wSeRVh6zTZyunbQaeKt69A==
X-CSE-MsgGUID: 5XY1rRAnTwe35NdWMVPKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90575443"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90575443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:21:05 -0700
X-CSE-ConnectionGUID: ouI0VVN7TmSuoQRUaUE5iQ==
X-CSE-MsgGUID: NsG5znNHQ9qNZD1kHrKBtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236248554"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 04:21:03 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1SW-000000000C1-2enX;
	Thu, 21 May 2026 11:21:00 +0000
Date: Thu, 21 May 2026 19:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 454/1130]
 include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined
Message-ID: <202605211921.5geSahUF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 9aa5dc60f6d4d5572283cb169018137aa3ae11cf [454/1130] [CHERRY-PICK] arch: add compat helpers specific to 64-bit
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605211921.5geSahUF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211921.5geSahUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211921.5geSahUF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ipc/compat.c:24:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   1 warning generated.
--
   In file included from ipc/sem.c:73:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   ipc/sem.c:1824:1: error: conflicting types for 'compat_sys_semctl'
    1824 | COMPAT_SYSCALL_DEFINE4(semctl, int, semid, int, semnum, int, cmd, compat_ulong_t, arg)
         | ^
   include/linux/compat.h:66:2: note: expanded from macro 'COMPAT_SYSCALL_DEFINE4'
      66 |         COMPAT_SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |         ^
   include/linux/compat.h:82:18: note: expanded from macro 'COMPAT_SYSCALL_DEFINEx'
      82 |         asmlinkage long compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))        \
         |                         ^
   <scratch space>:79:1: note: expanded from here
      79 | compat_sys_semctl
         | ^
   include/linux/compat.h:912:17: note: previous declaration is here
     912 | asmlinkage long compat_sys_semctl(int semid, int semnum, int cmd, int arg);
         |                 ^
   1 warning and 1 error generated.
--
   In file included from mm/process_vm_access.c:8:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   mm/process_vm_access.c:217:4: error: call to undeclared function '__c_pa_u'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     217 |                         __c_pa_u(rvec[i].iov_base), rvec[i].iov_len,
         |                         ^
   1 warning and 1 error generated.
--
   In file included from kernel/trace/ftrace.c:45:
   In file included from kernel/trace/trace_output.h:6:
   In file included from kernel/trace/trace.h:30:
   In file included from arch/sparc/include/asm/syscall.h:7:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   kernel/trace/ftrace.c:1043:13: warning: variable 'update_all_ops' set but not used [-Wunused-but-set-global]
    1043 | static bool update_all_ops;
         |             ^
   2 warnings generated.
--
   In file included from kernel/trace/trace_nop.c:12:
   In file included from kernel/trace/trace.h:30:
   In file included from arch/sparc/include/asm/syscall.h:7:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   kernel/trace/trace_nop.c:35:28: warning: variable 'ctx_trace' set but not used [-Wunused-but-set-global]
      35 | static struct trace_array       *ctx_trace;
         |                                  ^
   2 warnings generated.
--
   In file included from kernel/trace/fgraph.c:20:
   In file included from kernel/trace/trace.h:30:
   In file included from arch/sparc/include/asm/syscall.h:7:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   kernel/trace/fgraph.c:542:27: warning: variable 'fgraph_direct_gops' set but not used [-Wunused-but-set-global]
     542 | static struct fgraph_ops *fgraph_direct_gops = &fgraph_stub;
         |                           ^
   2 warnings generated.
--
   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:11:
>> include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
   kernel/trace/bpf_trace.c:377:65: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '____bpf_trace_printk' [-Wmissing-format-attribute]
     362 | BPF_CALL_5(bpf_trace_printk, char *, fmt, u32, fmt_size, u64, arg1,
         | __attribute__((format(printf, 1, 0))) 
     363 |            u64, arg2, u64, arg3)
     364 | {
     365 |         u64 args[MAX_TRACE_PRINTK_VARARGS] = { arg1, arg2, arg3 };
     366 |         struct bpf_bprintf_data data = {
     367 |                 .get_bin_args   = true,
     368 |                 .get_buf        = true,
     369 |         };
     370 |         int ret;
     371 | 
     372 |         ret = bpf_bprintf_prepare(fmt, fmt_size, args,
     373 |                                   MAX_TRACE_PRINTK_VARARGS, &data);
     374 |         if (ret < 0)
     375 |                 return ret;
     376 | 
     377 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |                                                                        ^
   kernel/trace/bpf_trace.c:362:1: note: '____bpf_trace_printk' declared here
     362 | BPF_CALL_5(bpf_trace_printk, char *, fmt, u32, fmt_size, u64, arg1,
         | ^
   include/linux/filter.h:628:31: note: expanded from macro 'BPF_CALL_5'
     628 | #define BPF_CALL_5(name, ...)   BPF_CALL_x(5, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:612:6: note: expanded from macro 'BPF_CALL_x'
     612 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:110:1: note: expanded from here
     110 | ____bpf_trace_printk
         | ^
   kernel/trace/bpf_trace.c:433:65: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '____bpf_trace_vprintk' [-Wmissing-format-attribute]
     415 |         ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt, data.bin_args);
         |                                                                        ^
   kernel/trace/bpf_trace.c:415:1: note: '____bpf_trace_vprintk' declared here
     415 | BPF_CALL_4(bpf_trace_vprintk, char *, fmt, u32, fmt_size, const void *, args,
         | ^
   include/linux/filter.h:627:31: note: expanded from macro 'BPF_CALL_4'
     627 | #define BPF_CALL_4(name, ...)   BPF_CALL_x(4, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:612:6: note: expanded from macro 'BPF_CALL_x'
     612 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:127:1: note: expanded from here
     127 | ____bpf_trace_vprintk
         | ^
   kernel/trace/bpf_trace.c:475:35: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of '____bpf_seq_printf' [-Wmissing-format-attribute]
     458 |         seq_bprintf(m, fmt, data.bin_args);
         |                                          ^
   kernel/trace/bpf_trace.c:458:1: note: '____bpf_seq_printf' declared here
     458 | BPF_CALL_5(bpf_seq_printf, struct seq_file *, m, char *, fmt, u32, fmt_size,
         | ^
   include/linux/filter.h:628:31: note: expanded from macro 'BPF_CALL_5'
     628 | #define BPF_CALL_5(name, ...)   BPF_CALL_x(5, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   include/linux/filter.h:612:6: note: expanded from macro 'BPF_CALL_x'
     612 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:142:1: note: expanded from here
     142 | ____bpf_seq_printf
         | ^
   4 warnings generated.


vim +/is_compat32_task +1106 include/linux/compat.h

  1096	
  1097	/*
  1098	 * For most but not all architectures, "am I in a compat syscall?" and
  1099	 * "am I a compat task?" are the same question.  For architectures on which
  1100	 * they aren't the same question, arch code can override in_compat_syscall.
  1101	 */
  1102	#ifndef in_compat_syscall
  1103	static inline bool in_compat_syscall(void) { return is_compat_task(); }
  1104	#endif
  1105	#ifndef CONFIG_COMPAT64
> 1106	#define is_compat32_task() is_compat_task()
  1107	#define is_compat64_task() (0)
  1108	#endif
  1109	#ifndef in_compat32_syscall
  1110	static inline bool in_compat32_syscall(void) { return is_compat32_task(); }
  1111	#endif
  1112	#ifndef in_compat64_syscall
  1113	static inline bool in_compat64_syscall(void) { return is_compat64_task(); }
  1114	#endif
  1115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
