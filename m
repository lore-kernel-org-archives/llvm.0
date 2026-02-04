Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7724A288B1;
	Wed,  4 Feb 2026 00:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165784; cv=none; b=pLCLqbaLGvfa9umjGN0T55F3npGFVVbtsX0dqWsWz/2TKVWXNkpl0Qkbus3pSpIIByEXGkzzWSYQXs9Xhz+ME3T1+EZQxKAgSS52ITvMLtQFlZrt9kMPlqMMISXfKijZwq9ME39y757XgBbNwfs/7XYpHLKV7AsKsiwBSrK4oE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165784; c=relaxed/simple;
	bh=W3AchGhubWgEpG6dGSM0ekdwpOsqAHtTGWKSZnxll8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDyZuew1YmqJmuUp04Yx0J+YUXOOxTKU/kRv93kIF4OCmPEwJ++ItxWsTSkTu9gJvnqmWzNm09Z+sk9J1jSQyR//rFJbKFYCHps16xi7OgdidmS1u141MnhcJRMlkJCnrWDMP7/X9ZDAskLjACL0igTlxtlMrEtbdC0sXf+FR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNZhiyRs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNZhiyRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770165782; x=1801701782;
  h=date:from:to:cc:subject:message-id;
  bh=W3AchGhubWgEpG6dGSM0ekdwpOsqAHtTGWKSZnxll8c=;
  b=QNZhiyRsNgVuMfXPZFfogE6Tdf7nJRH7gtqur9PDzpJwEXb7H75CtXqM
   dQtG/DsQf98ZjvMzeQjX5M6hDVKtBKIvY+XAe9lWEr/5opYXb0E8yPdvv
   e7PlqMcLtAvAycX2+IaEpWQ+HlDwI5GK2453NGdLlBi9Dw+34jiyCHenZ
   LmGjs8qzQ21T151aAYphafepYRO9WIv7yKP+naNAnp5HDoBGleoHRCtUH
   hZyFcgxtEGWQLoqzU4ZgAb+pVNVhx05nwTAwkHM0613LOiS81CP0QbsJ6
   eZOJbqKbPi6Z/gO3mn5e5DIlhajA/ad2BA6OMddrAG+Y9XQl2VzJvYWgD
   w==;
X-CSE-ConnectionGUID: aplt0wD6T3iiCSHqg0E4MA==
X-CSE-MsgGUID: SI3eMScpQk2KDuYsH6expA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71429924"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71429924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:43:01 -0800
X-CSE-ConnectionGUID: TJ1PvDDwQZOcdmfBG0cDOA==
X-CSE-MsgGUID: 3edZYeKgTK2w9Dk761Kl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214552135"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2026 16:42:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQyu-00000000hKS-3yol;
	Wed, 04 Feb 2026 00:42:56 +0000
Date: Wed, 04 Feb 2026 08:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 5/12]
 kernel/bpf/verifier.c:25077:13: error: call to undeclared function
 'is_tracing_multi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602040813.9BYiQyXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   ae091d7daa68f465679351da2b52a948a8beab4b
commit: 77aa4fa6d9229bb6508b7e5b09cd459bd9754166 [5/12] bpf: Add multi tracing attach types
config: riscv-randconfig-002-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040813.9BYiQyXC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040813.9BYiQyXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040813.9BYiQyXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   include/linux/bpf.h:1545:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1551:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/verifier.c:25077:13: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    25077 |         } else if (is_tracing_multi(prog->expected_attach_type))
          |                    ^
   9 warnings and 1 error generated.
--
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/bpf/syscall.c:5:
   include/linux/bpf.h:1545:51: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                   ^
   include/linux/bpf.h:1551:53: warning: declaration of 'struct bpf_tramp_link' will not be visible outside of this function [-Wvisibility]
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                     ^
>> kernel/bpf/syscall.c:2959:15: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2959 |         multi_func = is_tracing_multi(attr->expected_attach_type);
         |                      ^
   kernel/bpf/syscall.c:3520:42: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3520 |         WARN_ON_ONCE(bpf_trampoline_unlink_prog(&tr_link->link.node,
         |                                                 ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:25: note: expanded from macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   include/linux/bpf.h:1551:69: note: passing argument to parameter 'link' here
    1551 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
         |                                                                     ^
   kernel/bpf/syscall.c:3757:33: error: incompatible pointer types passing 'struct bpf_tramp_node *' to parameter of type 'struct bpf_tramp_link *' [-Wincompatible-pointer-types]
    3757 |         err = bpf_trampoline_link_prog(&link->link.node, tr, tgt_prog);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/bpf.h:1545:67: note: passing argument to parameter 'link' here
    1545 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
         |                                                                   ^
   9 warnings and 3 errors generated.


vim +/is_tracing_multi +25077 kernel/bpf/verifier.c

 25017	
 25018	static int check_attach_btf_id(struct bpf_verifier_env *env)
 25019	{
 25020		struct bpf_prog *prog = env->prog;
 25021		struct bpf_prog *tgt_prog = prog->aux->dst_prog;
 25022		struct bpf_attach_target_info tgt_info = {};
 25023		u32 btf_id = prog->aux->attach_btf_id;
 25024		struct bpf_trampoline *tr;
 25025		int ret;
 25026		u64 key;
 25027	
 25028		if (prog->type == BPF_PROG_TYPE_SYSCALL) {
 25029			if (prog->sleepable)
 25030				/* attach_btf_id checked to be zero already */
 25031				return 0;
 25032			verbose(env, "Syscall programs can only be sleepable\n");
 25033			return -EINVAL;
 25034		}
 25035	
 25036		if (prog->sleepable && !can_be_sleepable(prog)) {
 25037			verbose(env, "Only fentry/fexit/fmod_ret, lsm, iter, uprobe, and struct_ops programs can be sleepable\n");
 25038			return -EINVAL;
 25039		}
 25040	
 25041		if (prog->type == BPF_PROG_TYPE_STRUCT_OPS)
 25042			return check_struct_ops_btf_id(env);
 25043	
 25044		if (prog->type != BPF_PROG_TYPE_TRACING &&
 25045		    prog->type != BPF_PROG_TYPE_LSM &&
 25046		    prog->type != BPF_PROG_TYPE_EXT)
 25047			return 0;
 25048	
 25049		ret = bpf_check_attach_target(&env->log, prog, tgt_prog, btf_id, &tgt_info);
 25050		if (ret)
 25051			return ret;
 25052	
 25053		if (tgt_prog && prog->type == BPF_PROG_TYPE_EXT) {
 25054			/* to make freplace equivalent to their targets, they need to
 25055			 * inherit env->ops and expected_attach_type for the rest of the
 25056			 * verification
 25057			 */
 25058			env->ops = bpf_verifier_ops[tgt_prog->type];
 25059			prog->expected_attach_type = tgt_prog->expected_attach_type;
 25060		}
 25061	
 25062		/* store info about the attachment target that will be used later */
 25063		prog->aux->attach_func_proto = tgt_info.tgt_type;
 25064		prog->aux->attach_func_name = tgt_info.tgt_name;
 25065		prog->aux->mod = tgt_info.tgt_mod;
 25066	
 25067		if (tgt_prog) {
 25068			prog->aux->saved_dst_prog_type = tgt_prog->type;
 25069			prog->aux->saved_dst_attach_type = tgt_prog->expected_attach_type;
 25070		}
 25071	
 25072		if (prog->expected_attach_type == BPF_TRACE_RAW_TP) {
 25073			prog->aux->attach_btf_trace = true;
 25074			return 0;
 25075		} else if (prog->expected_attach_type == BPF_TRACE_ITER) {
 25076			return bpf_iter_prog_supported(prog);
 25077		} else if (is_tracing_multi(prog->expected_attach_type))
 25078			return prog->type == BPF_PROG_TYPE_TRACING ? 0 : -EINVAL;
 25079	
 25080		if (prog->type == BPF_PROG_TYPE_LSM) {
 25081			ret = bpf_lsm_verify_prog(&env->log, prog);
 25082			if (ret < 0)
 25083				return ret;
 25084		} else if (prog->type == BPF_PROG_TYPE_TRACING &&
 25085			   btf_id_set_contains(&btf_id_deny, btf_id)) {
 25086			verbose(env, "Attaching tracing programs to function '%s' is rejected.\n",
 25087				tgt_info.tgt_name);
 25088			return -EINVAL;
 25089		} else if ((prog->expected_attach_type == BPF_TRACE_FEXIT ||
 25090			   prog->expected_attach_type == BPF_TRACE_FSESSION ||
 25091			   prog->expected_attach_type == BPF_MODIFY_RETURN) &&
 25092			   btf_id_set_contains(&noreturn_deny, btf_id)) {
 25093			verbose(env, "Attaching fexit/fsession/fmod_ret to __noreturn function '%s' is rejected.\n",
 25094				tgt_info.tgt_name);
 25095			return -EINVAL;
 25096		}
 25097	
 25098		key = bpf_trampoline_compute_key(tgt_prog, prog->aux->attach_btf, btf_id);
 25099		tr = bpf_trampoline_get(key, &tgt_info);
 25100		if (!tr)
 25101			return -ENOMEM;
 25102	
 25103		if (tgt_prog && tgt_prog->aux->tail_call_reachable)
 25104			tr->flags = BPF_TRAMP_F_TAIL_CALL_CTX;
 25105	
 25106		prog->aux->dst_trampoline = tr;
 25107		return 0;
 25108	}
 25109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
