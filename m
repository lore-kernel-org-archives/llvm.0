Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C708610C;
	Mon, 31 Jul 2023 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690789686; x=1722325686;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cq24cfWExdtm07AyYf/XYHBMhmFWwn4Ul5/m0GlJvCU=;
  b=gxpVoe5TTFuVXHgEHoqOLmL+lrRqj2EnKznncVjaMTqbZUocIJhH5aNC
   gA2vV/4cUPnarktGeI00Htb05g3cgT+lcqFCYbMBy0rMCw4cnjAU5dy6I
   bc0Q1BM58F7QuyQ5xbFx8zOIOE9pq7u3bIXPpEvySijd1JACBrE1WCgV0
   xMh78JRrDqssEio2gIijUH7HcsmWIzXUIcEZb1EOpm0Him+Tf4cg9sioF
   dxqtukfMcqsapCm/Kr/cHBxxYOJGFKeDvbW+8U8Jl/tJ9qvgBitLgQkKJ
   WRXsJrMtSN50fTlfA0ARBMhA836FI10nc9Xo7jgCBEONl4krvck3GFC1q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349248460"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="349248460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 00:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="763274035"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="763274035"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 00:48:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQNdL-00050N-0I;
	Mon, 31 Jul 2023 07:48:03 +0000
Date: Mon, 31 Jul 2023 15:47:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x42: relocation to
 !ENDBR: __cfi_kprobe_emulate_jmp_indirect+0x4
Message-ID: <202307311511.BH5ohu8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: Florent Revest <revest@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
commit: fee86a4ed536f4e521f3a4530242e152dd2a466b ftrace: selftest: remove broken trace_direct_tramp
date:   4 months ago
config: x86_64-randconfig-r015-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311511.BH5ohu8v-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311511.BH5ohu8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311511.BH5ohu8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: enter_from_user_mode+0xda: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x358: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0xe7: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0xda: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x42: relocation to !ENDBR: __cfi_kprobe_emulate_jmp_indirect+0x4


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000000c2ff0 <set_ftrace_ops_ro>:
0000    c2ff0:	f3 0f 1e fa          	endbr64
0004    c2ff4:	55                   	push   %rbp
0005    c2ff5:	48 89 e5             	mov    %rsp,%rbp
0008    c2ff8:	41 57                	push   %r15
000a    c2ffa:	41 56                	push   %r14
000c    c2ffc:	41 54                	push   %r12
000e    c2ffe:	53                   	push   %rbx
000f    c2fff:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # c3006 <set_ftrace_ops_ro+0x16>	c3002: R_X86_64_PC32	ftrace_ops_list-0x4
0016    c3006:	e8 00 00 00 00       	call   c300b <set_ftrace_ops_ro+0x1b>	c3007: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
001b    c300b:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	c300e: R_X86_64_32S	ftrace_list_end
0022    c3012:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	c3015: R_X86_64_32S	ftrace_regs_caller
0029    c3019:	48 f7 d8             	neg    %rax
002c    c301c:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	c3020: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0034    c3024:	49 c1 ef 0c          	shr    $0xc,%r15
0038    c3028:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	c302b: R_X86_64_32S	ftrace_caller
003f    c302f:	48 f7 d8             	neg    %rax
0042    c3032:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	c3036: R_X86_64_32S	ftrace_caller_end+0x1008
004a    c303a:	49 c1 ec 0c          	shr    $0xc,%r12
004e    c303e:	48 8b 43 10          	mov    0x10(%rbx),%rax
0052    c3042:	a9 00 08 00 00       	test   $0x800,%eax
0057    c3047:	74 15                	je     c305e <set_ftrace_ops_ro+0x6e>
0059    c3049:	a8 04                	test   $0x4,%al
005b    c304b:	48 8b bb 90 01 00 00 	mov    0x190(%rbx),%rdi
0062    c3052:	44 89 fe             	mov    %r15d,%esi
0065    c3055:	41 0f 44 f4          	cmove  %r12d,%esi
0069    c3059:	e8 00 00 00 00       	call   c305e <set_ftrace_ops_ro+0x6e>	c305a: R_X86_64_PLT32	set_memory_ro-0x4
006e    c305e:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0072    c3062:	e8 00 00 00 00       	call   c3067 <set_ftrace_ops_ro+0x77>	c3063: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0077    c3067:	48 85 db             	test   %rbx,%rbx
007a    c306a:	74 05                	je     c3071 <set_ftrace_ops_ro+0x81>
007c    c306c:	4c 39 f3             	cmp    %r14,%rbx
007f    c306f:	75 cd                	jne    c303e <set_ftrace_ops_ro+0x4e>
0081    c3071:	5b                   	pop    %rbx
0082    c3072:	41 5c                	pop    %r12
0084    c3074:	41 5e                	pop    %r14
0086    c3076:	41 5f                	pop    %r15
0088    c3078:	5d                   	pop    %rbp
0089    c3079:	31 c0                	xor    %eax,%eax
008b    c307b:	31 ff                	xor    %edi,%edi
008d    c307d:	31 f6                	xor    %esi,%esi
008f    c307f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
