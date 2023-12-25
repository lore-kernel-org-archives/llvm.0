Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D501106;
	Mon, 25 Dec 2023 05:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+Kkzozk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703483986; x=1735019986;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ewk+XWFQC0XkzjX1gTataZ17xmX9G8SHzamdJ94B/Sk=;
  b=V+KkzozkO3xbDu1JyIaNb3LuRmcJmcli16eatOaCA0Ru6xN6C0J3Ok6/
   6MpT7WsSnQl/u/9xVq4U5+d1jVlE+SuGEnQht8APTwoagxbjfg3QW8DW1
   gt2/GVVPmNGhBQTjsRmNHk4oZPe6vBayop26phvdCqTtRut7ypJCPu+UW
   WTxtvwV4J1XYckcGuUuoYeH9ngE09Aswy/Z8b/PBRrvvk/cFX7xN5ZIKL
   4bJpeMbSfyMsmSzyk55X5SmTaTWN9kYsd3U8pc9N2i8nlufv2Vs1TVHA1
   Vc+fZCsQJFQEjFEpTWZvUl379YLySuvfzkjfovTPKBGOqFPA3JhL9soHn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="396001002"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="396001002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 21:59:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="19373784"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2023 21:59:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHdzF-000D0l-0q;
	Mon, 25 Dec 2023 05:59:13 +0000
Date: Mon, 25 Dec 2023 13:55:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH V4 2/2] mm: add swapiness= arg to memory.reclaim
Message-ID: <202312251322.grmZJZq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20231213013807.897742-3-schatzberg.dan@gmail.com>
References: <20231213013807.897742-3-schatzberg.dan@gmail.com>
TO: Dan Schatzberg <schatzberg.dan@gmail.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
TO: Yosry Ahmed <yosryahmed@google.com>
TO: Huan Yang <link@vivo.com>
CC: linux-kernel@vger.kernel.org
CC: cgroups@vger.kernel.org
CC: linux-mm@kvack.org
CC: Tejun Heo <tj@kernel.org>
CC: Zefan Li <lizefan.x@bytedance.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Michal Hocko <mhocko@kernel.org>
CC: Shakeel Butt <shakeelb@google.com>
CC: Muchun Song <muchun.song@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Dan Schatzberg <schatzberg.dan@gmail.com>
CC: Yue Zhao <findns94@gmail.com>
CC: Hugh Dickins <hughd@google.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-cgroup/for-next]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Schatzberg/mm-add-swapiness-arg-to-memory-reclaim/20231213-103846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20231213013807.897742-3-schatzberg.dan%40gmail.com
patch subject: [PATCH V4 2/2] mm: add swapiness= arg to memory.reclaim
config: x86_64-buildonly-randconfig-005-20231225 (https://download.01.org/0day-ci/archive/20231225/202312251322.grmZJZq1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251322.grmZJZq1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251322.grmZJZq1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec+0x668: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 000000000060a080 <shrink_lruvec>:
0000   60a080:	e8 00 00 00 00       	call   60a085 <shrink_lruvec+0x5>	60a081: R_X86_64_PLT32	__fentry__-0x4
0005   60a085:	55                   	push   %rbp
0006   60a086:	48 89 e5             	mov    %rsp,%rbp
0009   60a089:	41 57                	push   %r15
000b   60a08b:	41 56                	push   %r14
000d   60a08d:	41 55                	push   %r13
000f   60a08f:	41 54                	push   %r12
0011   60a091:	53                   	push   %rbx
0012   60a092:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016   60a096:	48 81 ec b0 01 00 00 	sub    $0x1b0,%rsp
001d   60a09d:	48 89 f3             	mov    %rsi,%rbx
0020   60a0a0:	49 89 fd             	mov    %rdi,%r13
0023   60a0a3:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
0027   60a0a7:	e8 00 00 00 00       	call   60a0ac <shrink_lruvec+0x2c>	60a0a8: R_X86_64_PLT32	__tsan_func_entry-0x4
002c   60a0ac:	e8 00 00 00 00       	call   60a0b1 <shrink_lruvec+0x31>	60a0ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0031   60a0b1:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
0039   60a0b9:	ba 28 00 00 00       	mov    $0x28,%edx
003e   60a0be:	31 f6                	xor    %esi,%esi
0040   60a0c0:	e8 00 00 00 00       	call   60a0c5 <shrink_lruvec+0x45>	60a0c1: R_X86_64_PLT32	__tsan_memset-0x4
0045   60a0c5:	48 8d bc 24 50 01 00 00 	lea    0x150(%rsp),%rdi
004d   60a0cd:	ba 28 00 00 00       	mov    $0x28,%edx
0052   60a0d2:	31 f6                	xor    %esi,%esi
0054   60a0d4:	e8 00 00 00 00       	call   60a0d9 <shrink_lruvec+0x59>	60a0d5: R_X86_64_PLT32	__tsan_memset-0x4
0059   60a0d9:	48 89 df             	mov    %rbx,%rdi
005c   60a0dc:	e8 00 00 00 00       	call   60a0e1 <shrink_lruvec+0x61>	60a0dd: R_X86_64_PLT32	__tsan_read8-0x4
0061   60a0e1:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
0066   60a0e6:	48 8b 03             	mov    (%rbx),%rax
0069   60a0e9:	48 89 84 24 38 01 00 00 	mov    %rax,0x138(%rsp)
0071   60a0f1:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
0079   60a0f9:	ba 28 00 00 00       	mov    $0x28,%edx
007e   60a0fe:	31 f6                	xor    %esi,%esi
0080   60a100:	e8 00 00 00 00       	call   60a105 <shrink_lruvec+0x85>	60a101: R_X86_64_PLT32	__tsan_memset-0x4
0085   60a105:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a108: R_X86_64_32S	memory_cgrp_subsys_enabled_key
008c   60a10c:	e8 00 00 00 00       	call   60a111 <shrink_lruvec+0x91>	60a10d: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0091   60a111:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60a117 <shrink_lruvec+0x97>	60a113: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0097   60a117:	bf 01 00 00 00       	mov    $0x1,%edi
009c   60a11c:	89 de                	mov    %ebx,%esi
009e   60a11e:	e8 00 00 00 00       	call   60a123 <shrink_lruvec+0xa3>	60a11f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00a3   60a123:	85 db                	test   %ebx,%ebx
00a5   60a125:	7e 1a                	jle    60a141 <shrink_lruvec+0xc1>
00a7   60a127:	e8 00 00 00 00       	call   60a12c <shrink_lruvec+0xac>	60a128: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ac   60a12c:	49 8d bd 88 05 00 00 	lea    0x588(%r13),%rdi
00b3   60a133:	e8 00 00 00 00       	call   60a138 <shrink_lruvec+0xb8>	60a134: R_X86_64_PLT32	__tsan_read8-0x4
00b8   60a138:	49 8b 85 88 05 00 00 	mov    0x588(%r13),%rax
00bf   60a13f:	eb 07                	jmp    60a148 <shrink_lruvec+0xc8>
00c1   60a141:	e8 00 00 00 00       	call   60a146 <shrink_lruvec+0xc6>	60a142: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c6   60a146:	31 c0                	xor    %eax,%eax
00c8   60a148:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
00cd   60a14d:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
00d2   60a152:	49 8d 7e 2c          	lea    0x2c(%r14),%rdi
00d6   60a156:	e8 00 00 00 00       	call   60a15b <shrink_lruvec+0xdb>	60a157: R_X86_64_PLT32	__tsan_read4-0x4
00db   60a15b:	49 63 5e 2c          	movslq 0x2c(%r14),%rbx
00df   60a15f:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
00e7   60a167:	ba 10 00 00 00       	mov    $0x10,%edx
00ec   60a16c:	31 f6                	xor    %esi,%esi
00ee   60a16e:	e8 00 00 00 00       	call   60a173 <shrink_lruvec+0xf3>	60a16f: R_X86_64_PLT32	__tsan_memset-0x4
00f3   60a173:	4d 8d 66 28          	lea    0x28(%r14),%r12
00f7   60a177:	4c 89 e7             	mov    %r12,%rdi
00fa   60a17a:	e8 00 00 00 00       	call   60a17f <shrink_lruvec+0xff>	60a17b: R_X86_64_PLT32	__tsan_read2-0x4
00ff   60a17f:	45 0f b7 76 28       	movzwl 0x28(%r14),%r14d
0104   60a184:	44 89 f6             	mov    %r14d,%esi
0107   60a187:	83 e6 40             	and    $0x40,%esi
010a   60a18a:	31 ff                	xor    %edi,%edi
010c   60a18c:	e8 00 00 00 00       	call   60a191 <shrink_lruvec+0x111>	60a18d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0111   60a191:	41 83 e6 40          	and    $0x40,%r14d
0115   60a195:	75 0a                	jne    60a1a1 <shrink_lruvec+0x121>
0117   60a197:	e8 00 00 00 00       	call   60a19c <shrink_lruvec+0x11c>	60a198: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
011c   60a19c:	e9 9a 01 00 00       	jmp    60a33b <shrink_lruvec+0x2bb>
0121   60a1a1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0126   60a1a6:	48 85 ff             	test   %rdi,%rdi
0129   60a1a9:	74 22                	je     60a1cd <shrink_lruvec+0x14d>
012b   60a1ab:	e8 00 00 00 00       	call   60a1b0 <shrink_lruvec+0x130>	60a1ac: R_X86_64_PLT32	mem_cgroup_get_nr_swap_pages-0x4
0130   60a1b0:	49 89 c6             	mov    %rax,%r14
0133   60a1b3:	31 ff                	xor    %edi,%edi
0135   60a1b5:	48 89 c6             	mov    %rax,%rsi
0138   60a1b8:	e8 00 00 00 00       	call   60a1bd <shrink_lruvec+0x13d>	60a1b9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
013d   60a1bd:	4d 85 f6             	test   %r14,%r14
0140   60a1c0:	0f 8e ac 00 00 00    	jle    60a272 <shrink_lruvec+0x1f2>
0146   60a1c6:	e8 00 00 00 00       	call   60a1cb <shrink_lruvec+0x14b>	60a1c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
014b   60a1cb:	eb 41                	jmp    60a20e <shrink_lruvec+0x18e>
014d   60a1cd:	be 08 00 00 00       	mov    $0x8,%esi
0152   60a1d2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a1d5: R_X86_64_32S	nr_swap_pages
0159   60a1d9:	ba 04 00 00 00       	mov    $0x4,%edx
015e   60a1de:	e8 00 00 00 00       	call   60a1e3 <shrink_lruvec+0x163>	60a1df: R_X86_64_PLT32	__kcsan_check_access-0x4
0163   60a1e3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a1e6: R_X86_64_32S	nr_swap_pages
016a   60a1ea:	e8 00 00 00 00       	call   60a1ef <shrink_lruvec+0x16f>	60a1eb: R_X86_64_PLT32	__tsan_volatile_read8-0x4
016f   60a1ef:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 60a1f6 <shrink_lruvec+0x176>	60a1f2: R_X86_64_PC32	nr_swap_pages-0x4
0176   60a1f6:	31 ff                	xor    %edi,%edi
0178   60a1f8:	4c 89 f6             	mov    %r14,%rsi
017b   60a1fb:	e8 00 00 00 00       	call   60a200 <shrink_lruvec+0x180>	60a1fc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0180   60a200:	4d 85 f6             	test   %r14,%r14
0183   60a203:	0f 8e 11 01 00 00    	jle    60a31a <shrink_lruvec+0x29a>
0189   60a209:	e8 00 00 00 00       	call   60a20e <shrink_lruvec+0x18e>	60a20a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
018e   60a20e:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
0193   60a213:	49 8d 7e 10          	lea    0x10(%r14),%rdi
0197   60a217:	e8 00 00 00 00       	call   60a21c <shrink_lruvec+0x19c>	60a218: R_X86_64_PLT32	__tsan_read8-0x4
019c   60a21c:	4d 8b 76 10          	mov    0x10(%r14),%r14
01a0   60a220:	31 ff                	xor    %edi,%edi
01a2   60a222:	89 de                	mov    %ebx,%esi
01a4   60a224:	e8 00 00 00 00       	call   60a229 <shrink_lruvec+0x1a9>	60a225: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
01a9   60a229:	4d 85 f6             	test   %r14,%r14
01ac   60a22c:	74 0e                	je     60a23c <shrink_lruvec+0x1bc>
01ae   60a22e:	85 db                	test   %ebx,%ebx
01b0   60a230:	75 0a                	jne    60a23c <shrink_lruvec+0x1bc>
01b2   60a232:	e8 00 00 00 00       	call   60a237 <shrink_lruvec+0x1b7>	60a233: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b7   60a237:	e9 ff 00 00 00       	jmp    60a33b <shrink_lruvec+0x2bb>
01bc   60a23c:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
01c1   60a241:	49 8d 7e 31          	lea    0x31(%r14),%rdi
01c5   60a245:	e8 00 00 00 00       	call   60a24a <shrink_lruvec+0x1ca>	60a246: R_X86_64_PLT32	__tsan_read1-0x4
01ca   60a24a:	45 0f b6 76 31       	movzbl 0x31(%r14),%r14d
01cf   60a24f:	31 ff                	xor    %edi,%edi
01d1   60a251:	44 89 f6             	mov    %r14d,%esi
01d4   60a254:	e8 00 00 00 00       	call   60a259 <shrink_lruvec+0x1d9>	60a255: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
01d9   60a259:	45 85 f6             	test   %r14d,%r14d
01dc   60a25c:	75 1e                	jne    60a27c <shrink_lruvec+0x1fc>
01de   60a25e:	85 db                	test   %ebx,%ebx
01e0   60a260:	74 1a                	je     60a27c <shrink_lruvec+0x1fc>
01e2   60a262:	e8 00 00 00 00       	call   60a267 <shrink_lruvec+0x1e7>	60a263: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01e7   60a267:	31 c0                	xor    %eax,%eax
01e9   60a269:	31 c9                	xor    %ecx,%ecx
01eb   60a26b:	31 ff                	xor    %edi,%edi
01ed   60a26d:	e9 d5 00 00 00       	jmp    60a347 <shrink_lruvec+0x2c7>
01f2   60a272:	e8 00 00 00 00       	call   60a277 <shrink_lruvec+0x1f7>	60a273: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01f7   60a277:	e9 bf 00 00 00       	jmp    60a33b <shrink_lruvec+0x2bb>
01fc   60a27c:	4c 89 e7             	mov    %r12,%rdi
01ff   60a27f:	e8 00 00 00 00       	call   60a284 <shrink_lruvec+0x204>	60a280: R_X86_64_PLT32	__tsan_read2-0x4
0204   60a284:	45 0f b7 34 24       	movzwl (%r12),%r14d
0209   60a289:	44 89 f6             	mov    %r14d,%esi
020c   60a28c:	81 e6 00 20 00 00    	and    $0x2000,%esi
0212   60a292:	31 ff                	xor    %edi,%edi
0214   60a294:	e8 00 00 00 00       	call   60a299 <shrink_lruvec+0x219>	60a295: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0219   60a299:	44 89 f0             	mov    %r14d,%eax
021c   60a29c:	25 00 20 00 00       	and    $0x2000,%eax
0221   60a2a1:	75 7e                	jne    60a321 <shrink_lruvec+0x2a1>
0223   60a2a3:	41 81 e6 00 10 00 00 	and    $0x1000,%r14d
022a   60a2aa:	31 ff                	xor    %edi,%edi
022c   60a2ac:	44 89 f6             	mov    %r14d,%esi
022f   60a2af:	e8 00 00 00 00       	call   60a2b4 <shrink_lruvec+0x234>	60a2b0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0234   60a2b4:	45 85 f6             	test   %r14d,%r14d
0237   60a2b7:	75 7d                	jne    60a336 <shrink_lruvec+0x2b6>
0239   60a2b9:	e8 00 00 00 00       	call   60a2be <shrink_lruvec+0x23e>	60a2ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
023e   60a2be:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
0243   60a2c3:	49 8d 7f 18          	lea    0x18(%r15),%rdi
0247   60a2c7:	e8 00 00 00 00       	call   60a2cc <shrink_lruvec+0x24c>	60a2c8: R_X86_64_PLT32	__tsan_read8-0x4
024c   60a2cc:	4d 8b 77 18          	mov    0x18(%r15),%r14
0250   60a2d0:	49 8d 7f 20          	lea    0x20(%r15),%rdi
0254   60a2d4:	e8 00 00 00 00       	call   60a2d9 <shrink_lruvec+0x259>	60a2d5: R_X86_64_PLT32	__tsan_read8-0x4
0259   60a2d9:	49 8b 47 20          	mov    0x20(%r15),%rax
025d   60a2dd:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
0261   60a2e1:	4a 8d 0c 32          	lea    (%rdx,%r14,1),%rcx
0265   60a2e5:	48 8d 3c 10          	lea    (%rax,%rdx,1),%rdi
0269   60a2e9:	48 ff c7             	inc    %rdi
026c   60a2ec:	48 01 f9             	add    %rdi,%rcx
026f   60a2ef:	48 89 c8             	mov    %rcx,%rax
0272   60a2f2:	48 0f af c3          	imul   %rbx,%rax
0276   60a2f6:	49 8d 34 16          	lea    (%r14,%rdx,1),%rsi
027a   60a2fa:	48 ff c6             	inc    %rsi
027d   60a2fd:	48 89 c2             	mov    %rax,%rdx
0280   60a300:	48 09 f2             	or     %rsi,%rdx
0283   60a303:	48 c1 ea 20          	shr    $0x20,%rdx
0287   60a307:	0f 84 03 15 00 00    	je     60b810 <shrink_lruvec+0x1790>
028d   60a30d:	31 d2                	xor    %edx,%edx
028f   60a30f:	48 f7 f6             	div    %rsi
0292   60a312:	48 89 c6             	mov    %rax,%rsi
0295   60a315:	e9 fc 14 00 00       	jmp    60b816 <shrink_lruvec+0x1796>
029a   60a31a:	e8 00 00 00 00       	call   60a31f <shrink_lruvec+0x29f>	60a31b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
029f   60a31f:	eb 1a                	jmp    60a33b <shrink_lruvec+0x2bb>
02a1   60a321:	e8 00 00 00 00       	call   60a326 <shrink_lruvec+0x2a6>	60a322: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02a6   60a326:	bf 02 00 00 00       	mov    $0x2,%edi
02ab   60a32b:	31 c0                	xor    %eax,%eax
02ad   60a32d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
02b2   60a332:	31 c9                	xor    %ecx,%ecx
02b4   60a334:	eb 16                	jmp    60a34c <shrink_lruvec+0x2cc>
02b6   60a336:	e8 00 00 00 00       	call   60a33b <shrink_lruvec+0x2bb>	60a337: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02bb   60a33b:	bf 03 00 00 00       	mov    $0x3,%edi
02c0   60a340:	b9 01 00 00 00       	mov    $0x1,%ecx
02c5   60a345:	31 c0                	xor    %eax,%eax
02c7   60a347:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
02cc   60a34c:	48 89 8c 24 80 00 00 00 	mov    %rcx,0x80(%rsp)
02d4   60a354:	49 8d 8d c0 00 00 00 	lea    0xc0(%r13),%rcx
02db   60a35b:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
02e3   60a363:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
02e8   60a368:	48 8d 51 32          	lea    0x32(%rcx),%rdx
02ec   60a36c:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
02f1   60a371:	48 8d 51 10          	lea    0x10(%rcx),%rdx
02f5   60a375:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
02fa   60a37a:	48 8d 96 28 01 00 00 	lea    0x128(%rsi),%rdx
0301   60a381:	48 89 94 24 a8 00 00 00 	mov    %rdx,0xa8(%rsp)
0309   60a389:	48 8d 96 40 01 00 00 	lea    0x140(%rsi),%rdx
0310   60a390:	48 89 94 24 a0 00 00 00 	mov    %rdx,0xa0(%rsp)
0318   60a398:	48 8d 49 31          	lea    0x31(%rcx),%rcx
031c   60a39c:	48 89 8c 24 e8 00 00 00 	mov    %rcx,0xe8(%rsp)
0324   60a3a4:	48 8d 4e 54          	lea    0x54(%rsi),%rcx
0328   60a3a8:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
032d   60a3ad:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0332   60a3b2:	48 ff c8             	dec    %rax
0335   60a3b5:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
033d   60a3bd:	b8 d0 05 00 00       	mov    $0x5d0,%eax
0342   60a3c2:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0347   60a3c7:	89 f8                	mov    %edi,%eax
0349   60a3c9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
034e   60a3ce:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	60a3d2: R_X86_64_32S	.rodata+0x45bf40
0356   60a3d6:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
035b   60a3db:	31 c0                	xor    %eax,%eax
035d   60a3dd:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0362   60a3e2:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
0367   60a3e7:	4c 89 24 24          	mov    %r12,(%rsp)
036b   60a3eb:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0370   60a3f0:	89 c3                	mov    %eax,%ebx
0372   60a3f2:	83 e3 fe             	and    $0xfffffffe,%ebx
0375   60a3f5:	bf 02 00 00 00       	mov    $0x2,%edi
037a   60a3fa:	48 89 de             	mov    %rbx,%rsi
037d   60a3fd:	e8 00 00 00 00       	call   60a402 <shrink_lruvec+0x382>	60a3fe: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0382   60a402:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0387   60a407:	48 83 fb 02          	cmp    $0x2,%rbx
038b   60a40b:	0f 94 44 24 44       	sete   0x44(%rsp)
0390   60a410:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
0395   60a415:	48 89 df             	mov    %rbx,%rdi
0398   60a418:	e8 00 00 00 00       	call   60a41d <shrink_lruvec+0x39d>	60a419: R_X86_64_PLT32	__tsan_read1-0x4
039d   60a41d:	0f b6 1b             	movzbl (%rbx),%ebx
03a0   60a420:	31 ff                	xor    %edi,%edi
03a2   60a422:	89 de                	mov    %ebx,%esi
03a4   60a424:	e8 00 00 00 00       	call   60a429 <shrink_lruvec+0x3a9>	60a425: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
03a9   60a429:	84 db                	test   %bl,%bl
03ab   60a42b:	0f 88 1c 01 00 00    	js     60a54d <shrink_lruvec+0x4cd>
03b1   60a431:	4c 69 e3 28 06 00 00 	imul   $0x628,%rbx,%r12
03b8   60a438:	45 31 f6             	xor    %r14d,%r14d
03bb   60a43b:	45 31 ed             	xor    %r13d,%r13d
03be   60a43e:	31 c0                	xor    %eax,%eax
03c0   60a440:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
03c5   60a445:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
03cd   60a44d:	48 89 df             	mov    %rbx,%rdi
03d0   60a450:	e8 00 00 00 00       	call   60a455 <shrink_lruvec+0x3d5>	60a451: R_X86_64_PLT32	__tsan_read8-0x4
03d5   60a455:	48 8b 1b             	mov    (%rbx),%rbx
03d8   60a458:	4e 8d 3c 33          	lea    (%rbx,%r14,1),%r15
03dc   60a45c:	49 81 c7 80 00 00 00 	add    $0x80,%r15
03e3   60a463:	be 08 00 00 00       	mov    $0x8,%esi
03e8   60a468:	4c 89 ff             	mov    %r15,%rdi
03eb   60a46b:	ba 04 00 00 00       	mov    $0x4,%edx
03f0   60a470:	e8 00 00 00 00       	call   60a475 <shrink_lruvec+0x3f5>	60a471: R_X86_64_PLT32	__kcsan_check_access-0x4
03f5   60a475:	4c 89 ff             	mov    %r15,%rdi
03f8   60a478:	e8 00 00 00 00       	call   60a47d <shrink_lruvec+0x3fd>	60a479: R_X86_64_PLT32	__tsan_volatile_read8-0x4
03fd   60a47d:	4e 8b bc 33 80 00 00 00 	mov    0x80(%rbx,%r14,1),%r15
0405   60a485:	31 ff                	xor    %edi,%edi
0407   60a487:	4c 89 fe             	mov    %r15,%rsi
040a   60a48a:	e8 00 00 00 00       	call   60a48f <shrink_lruvec+0x40f>	60a48b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
040f   60a48f:	4d 85 ff             	test   %r15,%r15
0412   60a492:	74 50                	je     60a4e4 <shrink_lruvec+0x464>
0414   60a494:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a497: R_X86_64_32S	memory_cgrp_subsys_enabled_key
041b   60a49b:	e8 00 00 00 00       	call   60a4a0 <shrink_lruvec+0x420>	60a49c: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0420   60a4a0:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 60a4a7 <shrink_lruvec+0x427>	60a4a3: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0427   60a4a7:	bf 01 00 00 00       	mov    $0x1,%edi
042c   60a4ac:	44 89 fe             	mov    %r15d,%esi
042f   60a4af:	e8 00 00 00 00       	call   60a4b4 <shrink_lruvec+0x434>	60a4b0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0434   60a4b4:	45 85 ff             	test   %r15d,%r15d
0437   60a4b7:	7e 37                	jle    60a4f0 <shrink_lruvec+0x470>
0439   60a4b9:	e8 00 00 00 00       	call   60a4be <shrink_lruvec+0x43e>	60a4ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
043e   60a4be:	4a 8d 04 ad 00 00 00 00 	lea    0x0(,%r13,4),%rax
0446   60a4c6:	4c 01 e8             	add    %r13,%rax
0449   60a4c9:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
044e   60a4ce:	48 8d 04 c1          	lea    (%rcx,%rax,8),%rax
0452   60a4d2:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0457   60a4d7:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
045b   60a4db:	48 81 c3 a8 04 00 00 	add    $0x4a8,%rbx
0462   60a4e2:	eb 2b                	jmp    60a50f <shrink_lruvec+0x48f>
0464   60a4e4:	e8 00 00 00 00       	call   60a4e9 <shrink_lruvec+0x469>	60a4e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0469   60a4e9:	4d 39 f4             	cmp    %r14,%r12
046c   60a4ec:	75 3b                	jne    60a529 <shrink_lruvec+0x4a9>
046e   60a4ee:	eb 4d                	jmp    60a53d <shrink_lruvec+0x4bd>
0470   60a4f0:	e8 00 00 00 00       	call   60a4f5 <shrink_lruvec+0x475>	60a4f1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0475   60a4f5:	48 03 5c 24 48       	add    0x48(%rsp),%rbx
047a   60a4fa:	4c 01 f3             	add    %r14,%rbx
047d   60a4fd:	be 08 00 00 00       	mov    $0x8,%esi
0482   60a502:	48 89 df             	mov    %rbx,%rdi
0485   60a505:	ba 04 00 00 00       	mov    $0x4,%edx
048a   60a50a:	e8 00 00 00 00       	call   60a50f <shrink_lruvec+0x48f>	60a50b: R_X86_64_PLT32	__kcsan_check_access-0x4
048f   60a50f:	48 89 df             	mov    %rbx,%rdi
0492   60a512:	e8 00 00 00 00       	call   60a517 <shrink_lruvec+0x497>	60a513: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0497   60a517:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
049c   60a51c:	48 03 03             	add    (%rbx),%rax
049f   60a51f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
04a4   60a524:	4d 39 f4             	cmp    %r14,%r12
04a7   60a527:	74 14                	je     60a53d <shrink_lruvec+0x4bd>
04a9   60a529:	e8 00 00 00 00       	call   60a52e <shrink_lruvec+0x4ae>	60a52a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04ae   60a52e:	49 81 c6 28 06 00 00 	add    $0x628,%r14
04b5   60a535:	49 ff c5             	inc    %r13
04b8   60a538:	e9 08 ff ff ff       	jmp    60a445 <shrink_lruvec+0x3c5>
04bd   60a53d:	e8 00 00 00 00       	call   60a542 <shrink_lruvec+0x4c2>	60a53e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04c2   60a542:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
04c7   60a547:	4c 8b 24 24          	mov    (%rsp),%r12
04cb   60a54b:	eb 0c                	jmp    60a559 <shrink_lruvec+0x4d9>
04cd   60a54d:	e8 00 00 00 00       	call   60a552 <shrink_lruvec+0x4d2>	60a54e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04d2   60a552:	31 c0                	xor    %eax,%eax
04d4   60a554:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
04d9   60a559:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
04de   60a55e:	48 89 df             	mov    %rbx,%rdi
04e1   60a561:	e8 00 00 00 00       	call   60a566 <shrink_lruvec+0x4e6>	60a562: R_X86_64_PLT32	__tsan_read8-0x4
04e6   60a566:	4c 8b 33             	mov    (%rbx),%r14
04e9   60a569:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a56c: R_X86_64_32S	memory_cgrp_subsys_enabled_key
04f0   60a570:	e8 00 00 00 00       	call   60a575 <shrink_lruvec+0x4f5>	60a571: R_X86_64_PLT32	__tsan_volatile_read4-0x4
04f5   60a575:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60a57b <shrink_lruvec+0x4fb>	60a577: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
04fb   60a57b:	bf 01 00 00 00       	mov    $0x1,%edi
0500   60a580:	89 de                	mov    %ebx,%esi
0502   60a582:	e8 00 00 00 00       	call   60a587 <shrink_lruvec+0x507>	60a583: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0507   60a587:	4c 3b 74 24 10       	cmp    0x10(%rsp),%r14
050c   60a58c:	74 59                	je     60a5e7 <shrink_lruvec+0x567>
050e   60a58e:	85 db                	test   %ebx,%ebx
0510   60a590:	7e 55                	jle    60a5e7 <shrink_lruvec+0x567>
0512   60a592:	48 8b 9c 24 a8 00 00 00 	mov    0xa8(%rsp),%rbx
051a   60a59a:	48 89 df             	mov    %rbx,%rdi
051d   60a59d:	e8 00 00 00 00       	call   60a5a2 <shrink_lruvec+0x522>	60a59e: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0522   60a5a2:	48 8b 1b             	mov    (%rbx),%rbx
0525   60a5a5:	4c 8b b4 24 a0 00 00 00 	mov    0xa0(%rsp),%r14
052d   60a5ad:	4c 89 f7             	mov    %r14,%rdi
0530   60a5b0:	e8 00 00 00 00       	call   60a5b5 <shrink_lruvec+0x535>	60a5b1: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0535   60a5b5:	4d 8b 26             	mov    (%r14),%r12
0538   60a5b8:	31 ff                	xor    %edi,%edi
053a   60a5ba:	48 89 de             	mov    %rbx,%rsi
053d   60a5bd:	e8 00 00 00 00       	call   60a5c2 <shrink_lruvec+0x542>	60a5be: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0542   60a5c2:	31 ff                	xor    %edi,%edi
0544   60a5c4:	4c 89 e6             	mov    %r12,%rsi
0547   60a5c7:	e8 00 00 00 00       	call   60a5cc <shrink_lruvec+0x54c>	60a5c8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
054c   60a5cc:	48 89 d8             	mov    %rbx,%rax
054f   60a5cf:	4c 09 e0             	or     %r12,%rax
0552   60a5d2:	75 22                	jne    60a5f6 <shrink_lruvec+0x576>
0554   60a5d4:	e8 00 00 00 00       	call   60a5d9 <shrink_lruvec+0x559>	60a5d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0559   60a5d9:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
055e   60a5de:	4c 8b 24 24          	mov    (%rsp),%r12
0562   60a5e2:	e9 c2 00 00 00       	jmp    60a6a9 <shrink_lruvec+0x629>
0567   60a5e7:	e8 00 00 00 00       	call   60a5ec <shrink_lruvec+0x56c>	60a5e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
056c   60a5ec:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
0571   60a5f1:	e9 b3 00 00 00       	jmp    60a6a9 <shrink_lruvec+0x629>
0576   60a5f6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
057b   60a5fb:	e8 00 00 00 00       	call   60a600 <shrink_lruvec+0x580>	60a5fc: R_X86_64_PLT32	mem_cgroup_size-0x4
0580   60a600:	49 89 c7             	mov    %rax,%r15
0583   60a603:	4c 8b 34 24          	mov    (%rsp),%r14
0587   60a607:	4c 89 f7             	mov    %r14,%rdi
058a   60a60a:	e8 00 00 00 00       	call   60a60f <shrink_lruvec+0x58f>	60a60b: R_X86_64_PLT32	__tsan_read2-0x4
058f   60a60f:	45 0f b7 36          	movzwl (%r14),%r14d
0593   60a613:	44 89 f6             	mov    %r14d,%esi
0596   60a616:	81 e6 00 01 00 00    	and    $0x100,%esi
059c   60a61c:	31 ff                	xor    %edi,%edi
059e   60a61e:	e8 00 00 00 00       	call   60a623 <shrink_lruvec+0x5a3>	60a61f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
05a3   60a623:	4c 89 e7             	mov    %r12,%rdi
05a6   60a626:	48 89 de             	mov    %rbx,%rsi
05a9   60a629:	e8 00 00 00 00       	call   60a62e <shrink_lruvec+0x5ae>	60a62a: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
05ae   60a62e:	44 89 f0             	mov    %r14d,%eax
05b1   60a631:	25 00 01 00 00       	and    $0x100,%eax
05b6   60a636:	75 26                	jne    60a65e <shrink_lruvec+0x5de>
05b8   60a638:	49 39 dc             	cmp    %rbx,%r12
05bb   60a63b:	76 21                	jbe    60a65e <shrink_lruvec+0x5de>
05bd   60a63d:	e8 00 00 00 00       	call   60a642 <shrink_lruvec+0x5c2>	60a63e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05c2   60a642:	41 81 ce 00 02 00 00 	or     $0x200,%r14d
05c9   60a649:	48 8b 1c 24          	mov    (%rsp),%rbx
05cd   60a64d:	48 89 df             	mov    %rbx,%rdi
05d0   60a650:	e8 00 00 00 00       	call   60a655 <shrink_lruvec+0x5d5>	60a651: R_X86_64_PLT32	__tsan_write2-0x4
05d5   60a655:	66 44 89 33          	mov    %r14w,(%rbx)
05d9   60a659:	4c 89 e3             	mov    %r12,%rbx
05dc   60a65c:	eb 05                	jmp    60a663 <shrink_lruvec+0x5e3>
05de   60a65e:	e8 00 00 00 00       	call   60a663 <shrink_lruvec+0x5e3>	60a65f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05e3   60a663:	49 39 df             	cmp    %rbx,%r15
05e6   60a666:	4c 0f 46 fb          	cmovbe %rbx,%r15
05ea   60a66a:	48 0f af 5c 24 08    	imul   0x8(%rsp),%rbx
05f0   60a670:	49 ff c7             	inc    %r15
05f3   60a673:	48 89 d8             	mov    %rbx,%rax
05f6   60a676:	4c 09 f8             	or     %r15,%rax
05f9   60a679:	48 c1 e8 20          	shr    $0x20,%rax
05fd   60a67d:	74 0a                	je     60a689 <shrink_lruvec+0x609>
05ff   60a67f:	48 89 d8             	mov    %rbx,%rax
0602   60a682:	31 d2                	xor    %edx,%edx
0604   60a684:	49 f7 f7             	div    %r15
0607   60a687:	eb 07                	jmp    60a690 <shrink_lruvec+0x610>
0609   60a689:	89 d8                	mov    %ebx,%eax
060b   60a68b:	31 d2                	xor    %edx,%edx
060d   60a68d:	41 f7 f7             	div    %r15d
0610   60a690:	4c 8b 24 24          	mov    (%rsp),%r12
0614   60a694:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
0619   60a699:	48 29 c3             	sub    %rax,%rbx
061c   60a69c:	48 83 fb 21          	cmp    $0x21,%rbx
0620   60a6a0:	b8 20 00 00 00       	mov    $0x20,%eax
0625   60a6a5:	48 0f 42 d8          	cmovb  %rax,%rbx
0629   60a6a9:	4c 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%r14
0631   60a6b1:	4c 89 f7             	mov    %r14,%rdi
0634   60a6b4:	e8 00 00 00 00       	call   60a6b9 <shrink_lruvec+0x639>	60a6b5: R_X86_64_PLT32	__tsan_read1-0x4
0639   60a6b9:	45 0f b6 3e          	movzbl (%r14),%r15d
063d   60a6bd:	44 89 f9             	mov    %r15d,%ecx
0640   60a6c0:	48 d3 eb             	shr    %cl,%rbx
0643   60a6c3:	31 ff                	xor    %edi,%edi
0645   60a6c5:	48 89 de             	mov    %rbx,%rsi
0648   60a6c8:	e8 00 00 00 00       	call   60a6cd <shrink_lruvec+0x64d>	60a6c9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
064d   60a6cd:	48 85 db             	test   %rbx,%rbx
0650   60a6d0:	74 24                	je     60a6f6 <shrink_lruvec+0x676>
0652   60a6d2:	e8 00 00 00 00       	call   60a6d7 <shrink_lruvec+0x657>	60a6d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0657   60a6d7:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
065c   60a6dc:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	60a6df: R_X86_64_32S	.data+0x93f00
0663   60a6e3:	e8 00 00 00 00       	call   60a6e8 <shrink_lruvec+0x668>	60a6e4: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0668   60a6e8:	ff 64 24 58          	jmp    *0x58(%rsp)
066c   60a6ec:	e8 00 00 00 00       	call   60a6f1 <shrink_lruvec+0x671>	60a6ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0671   60a6f1:	e9 4d 01 00 00       	jmp    60a843 <shrink_lruvec+0x7c3>
0676   60a6f6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a6f9: R_X86_64_32S	memory_cgrp_subsys_enabled_key
067d   60a6fd:	e8 00 00 00 00       	call   60a702 <shrink_lruvec+0x682>	60a6fe: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0682   60a702:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60a708 <shrink_lruvec+0x688>	60a704: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0688   60a708:	bf 01 00 00 00       	mov    $0x1,%edi
068d   60a70d:	89 de                	mov    %ebx,%esi
068f   60a70f:	e8 00 00 00 00       	call   60a714 <shrink_lruvec+0x694>	60a710: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0694   60a714:	85 db                	test   %ebx,%ebx
0696   60a716:	0f 8e 56 01 00 00    	jle    60a872 <shrink_lruvec+0x7f2>
069c   60a71c:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
06a1   60a721:	48 89 df             	mov    %rbx,%rdi
06a4   60a724:	e8 00 00 00 00       	call   60a729 <shrink_lruvec+0x6a9>	60a725: R_X86_64_PLT32	__tsan_read4-0x4
06a9   60a729:	8b 1b                	mov    (%rbx),%ebx
06ab   60a72b:	89 de                	mov    %ebx,%esi
06ad   60a72d:	83 e6 02             	and    $0x2,%esi
06b0   60a730:	31 ff                	xor    %edi,%edi
06b2   60a732:	e8 00 00 00 00       	call   60a737 <shrink_lruvec+0x6b7>	60a733: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06b7   60a737:	83 e3 02             	and    $0x2,%ebx
06ba   60a73a:	0f 85 3e 01 00 00    	jne    60a87e <shrink_lruvec+0x7fe>
06c0   60a740:	e8 00 00 00 00       	call   60a745 <shrink_lruvec+0x6c5>	60a741: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06c5   60a745:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
06ca   60a74a:	48 83 fb 20          	cmp    $0x20,%rbx
06ce   60a74e:	b8 20 00 00 00       	mov    $0x20,%eax
06d3   60a753:	48 0f 43 d8          	cmovae %rax,%rbx
06d7   60a757:	e9 7b ff ff ff       	jmp    60a6d7 <shrink_lruvec+0x657>
06dc   60a75c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60a75f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
06e3   60a763:	e8 00 00 00 00       	call   60a768 <shrink_lruvec+0x6e8>	60a764: R_X86_64_PLT32	__tsan_volatile_read4-0x4
06e8   60a768:	44 8b 25 00 00 00 00 	mov    0x0(%rip),%r12d        # 60a76f <shrink_lruvec+0x6ef>	60a76b: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
06ef   60a76f:	bf 01 00 00 00       	mov    $0x1,%edi
06f4   60a774:	44 89 e6             	mov    %r12d,%esi
06f7   60a777:	e8 00 00 00 00       	call   60a77c <shrink_lruvec+0x6fc>	60a778: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06fc   60a77c:	45 85 e4             	test   %r12d,%r12d
06ff   60a77f:	0f 8e 05 01 00 00    	jle    60a88a <shrink_lruvec+0x80a>
0705   60a785:	4c 8b 74 24 78       	mov    0x78(%rsp),%r14
070a   60a78a:	4c 89 f7             	mov    %r14,%rdi
070d   60a78d:	e8 00 00 00 00       	call   60a792 <shrink_lruvec+0x712>	60a78e: R_X86_64_PLT32	__tsan_read4-0x4
0712   60a792:	45 8b 36             	mov    (%r14),%r14d
0715   60a795:	44 89 f6             	mov    %r14d,%esi
0718   60a798:	83 e6 02             	and    $0x2,%esi
071b   60a79b:	31 ff                	xor    %edi,%edi
071d   60a79d:	e8 00 00 00 00       	call   60a7a2 <shrink_lruvec+0x722>	60a79e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0722   60a7a2:	41 83 e6 02          	and    $0x2,%r14d
0726   60a7a6:	0f 85 e5 00 00 00    	jne    60a891 <shrink_lruvec+0x811>
072c   60a7ac:	45 31 f6             	xor    %r14d,%r14d
072f   60a7af:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
0734   60a7b4:	41 0f 94 c6          	sete   %r14b
0738   60a7b8:	e8 00 00 00 00       	call   60a7bd <shrink_lruvec+0x73d>	60a7b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
073d   60a7bd:	4a 0f af 9c f4 00 01 00 00 	imul   0x100(%rsp,%r14,8),%rbx
0746   60a7c6:	48 03 9c 24 98 00 00 00 	add    0x98(%rsp),%rbx
074e   60a7ce:	48 89 d8             	mov    %rbx,%rax
0751   60a7d1:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
0756   60a7d6:	48 09 c8             	or     %rcx,%rax
0759   60a7d9:	48 c1 e8 20          	shr    $0x20,%rax
075d   60a7dd:	0f 84 fb 00 00 00    	je     60a8de <shrink_lruvec+0x85e>
0763   60a7e3:	48 89 d8             	mov    %rbx,%rax
0766   60a7e6:	31 d2                	xor    %edx,%edx
0768   60a7e8:	48 f7 f1             	div    %rcx
076b   60a7eb:	48 89 c3             	mov    %rax,%rbx
076e   60a7ee:	4c 8b 24 24          	mov    (%rsp),%r12
0772   60a7f2:	eb 4f                	jmp    60a843 <shrink_lruvec+0x7c3>
0774   60a7f4:	44 88 7c 24 08       	mov    %r15b,0x8(%rsp)
0779   60a7f9:	4d 89 ef             	mov    %r13,%r15
077c   60a7fc:	e8 00 00 00 00       	call   60a801 <shrink_lruvec+0x781>	60a7fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0781   60a801:	eb 0d                	jmp    60a810 <shrink_lruvec+0x790>
0783   60a803:	44 88 7c 24 08       	mov    %r15b,0x8(%rsp)
0788   60a808:	4d 89 ef             	mov    %r13,%r15
078b   60a80b:	e8 00 00 00 00       	call   60a810 <shrink_lruvec+0x790>	60a80c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0790   60a810:	45 31 ed             	xor    %r13d,%r13d
0793   60a813:	0f b6 44 24 44       	movzbl 0x44(%rsp),%eax
0798   60a818:	41 88 c5             	mov    %al,%r13b
079b   60a81b:	4c 8b b4 24 80 00 00 00 	mov    0x80(%rsp),%r14
07a3   60a823:	44 89 f7             	mov    %r14d,%edi
07a6   60a826:	44 89 ee             	mov    %r13d,%esi
07a9   60a829:	e8 00 00 00 00       	call   60a82e <shrink_lruvec+0x7ae>	60a82a: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
07ae   60a82e:	45 39 ee             	cmp    %r13d,%r14d
07b1   60a831:	b8 00 00 00 00       	mov    $0x0,%eax
07b6   60a836:	48 0f 45 d8          	cmovne %rax,%rbx
07ba   60a83a:	4d 89 fd             	mov    %r15,%r13
07bd   60a83d:	44 0f b6 7c 24 08    	movzbl 0x8(%rsp),%r15d
07c3   60a843:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
07c8   60a848:	48 89 9c c4 b0 00 00 00 	mov    %rbx,0xb0(%rsp,%rax,8)
07d0   60a850:	48 ff c0             	inc    %rax
07d3   60a853:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
07d8   60a858:	48 83 f8 04          	cmp    $0x4,%rax
07dc   60a85c:	0f 84 8d 00 00 00    	je     60a8ef <shrink_lruvec+0x86f>
07e2   60a862:	e8 00 00 00 00       	call   60a867 <shrink_lruvec+0x7e7>	60a863: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07e7   60a867:	48 83 44 24 48 08    	addq   $0x8,0x48(%rsp)
07ed   60a86d:	e9 79 fb ff ff       	jmp    60a3eb <shrink_lruvec+0x36b>
07f2   60a872:	e8 00 00 00 00       	call   60a877 <shrink_lruvec+0x7f7>	60a873: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f7   60a877:	31 db                	xor    %ebx,%ebx
07f9   60a879:	e9 59 fe ff ff       	jmp    60a6d7 <shrink_lruvec+0x657>
07fe   60a87e:	e8 00 00 00 00       	call   60a883 <shrink_lruvec+0x803>	60a87f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0803   60a883:	31 db                	xor    %ebx,%ebx
0805   60a885:	e9 4d fe ff ff       	jmp    60a6d7 <shrink_lruvec+0x657>
080a   60a88a:	e8 00 00 00 00       	call   60a88f <shrink_lruvec+0x80f>	60a88b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
080f   60a88f:	eb 05                	jmp    60a896 <shrink_lruvec+0x816>
0811   60a891:	e8 00 00 00 00       	call   60a896 <shrink_lruvec+0x816>	60a892: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0816   60a896:	4c 8b 24 24          	mov    (%rsp),%r12
081a   60a89a:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
081f   60a89f:	31 c0                	xor    %eax,%eax
0821   60a8a1:	83 f9 02             	cmp    $0x2,%ecx
0824   60a8a4:	0f 94 c0             	sete   %al
0827   60a8a7:	48 0f af 9c c4 00 01 00 00 	imul   0x100(%rsp,%rax,8),%rbx
0830   60a8b0:	48 89 d8             	mov    %rbx,%rax
0833   60a8b3:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
0838   60a8b8:	48 09 c8             	or     %rcx,%rax
083b   60a8bb:	48 c1 e8 20          	shr    $0x20,%rax
083f   60a8bf:	74 10                	je     60a8d1 <shrink_lruvec+0x851>
0841   60a8c1:	48 89 d8             	mov    %rbx,%rax
0844   60a8c4:	31 d2                	xor    %edx,%edx
0846   60a8c6:	48 f7 f1             	div    %rcx
0849   60a8c9:	48 89 c3             	mov    %rax,%rbx
084c   60a8cc:	e9 72 ff ff ff       	jmp    60a843 <shrink_lruvec+0x7c3>
0851   60a8d1:	89 d8                	mov    %ebx,%eax
0853   60a8d3:	31 d2                	xor    %edx,%edx
0855   60a8d5:	f7 f1                	div    %ecx
0857   60a8d7:	89 c3                	mov    %eax,%ebx
0859   60a8d9:	e9 65 ff ff ff       	jmp    60a843 <shrink_lruvec+0x7c3>
085e   60a8de:	89 d8                	mov    %ebx,%eax
0860   60a8e0:	31 d2                	xor    %edx,%edx
0862   60a8e2:	f7 f1                	div    %ecx
0864   60a8e4:	89 c3                	mov    %eax,%ebx
0866   60a8e6:	4c 8b 24 24          	mov    (%rsp),%r12
086a   60a8ea:	e9 54 ff ff ff       	jmp    60a843 <shrink_lruvec+0x7c3>
086f   60a8ef:	48 8d bc 24 50 01 00 00 	lea    0x150(%rsp),%rdi
0877   60a8f7:	48 8d b4 24 b0 00 00 00 	lea    0xb0(%rsp),%rsi
087f   60a8ff:	ba 28 00 00 00       	mov    $0x28,%edx
0884   60a904:	e8 00 00 00 00       	call   60a909 <shrink_lruvec+0x889>	60a905: R_X86_64_PLT32	__tsan_memcpy-0x4
0889   60a909:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
088e   60a90e:	48 89 df             	mov    %rbx,%rdi
0891   60a911:	e8 00 00 00 00       	call   60a916 <shrink_lruvec+0x896>	60a912: R_X86_64_PLT32	__tsan_read8-0x4
0896   60a916:	48 83 3b 00          	cmpq   $0x0,(%rbx)
089a   60a91a:	74 0f                	je     60a92b <shrink_lruvec+0x8ab>
089c   60a91c:	e8 00 00 00 00       	call   60a921 <shrink_lruvec+0x8a1>	60a91d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08a1   60a921:	c7 44 24 6c 00 00 00 00 	movl   $0x0,0x6c(%rsp)
08a9   60a929:	eb 42                	jmp    60a96d <shrink_lruvec+0x8ed>
08ab   60a92b:	e8 00 00 00 00       	call   60a930 <shrink_lruvec+0x8b0>	60a92c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08b0   60a930:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 60a937 <shrink_lruvec+0x8b7>	60a933: R_X86_64_PC32	pcpu_hot-0x4
08b7   60a937:	48 8d 7b 2c          	lea    0x2c(%rbx),%rdi
08bb   60a93b:	e8 00 00 00 00       	call   60a940 <shrink_lruvec+0x8c0>	60a93c: R_X86_64_PLT32	__tsan_read4-0x4
08c0   60a940:	be 00 00 02 00       	mov    $0x20000,%esi
08c5   60a945:	23 73 2c             	and    0x2c(%rbx),%esi
08c8   60a948:	0f 94 c3             	sete   %bl
08cb   60a94b:	31 ff                	xor    %edi,%edi
08cd   60a94d:	e8 00 00 00 00       	call   60a952 <shrink_lruvec+0x8d2>	60a94e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08d2   60a952:	41 0f b6 f7          	movzbl %r15b,%esi
08d6   60a956:	bf 0c 00 00 00       	mov    $0xc,%edi
08db   60a95b:	e8 00 00 00 00       	call   60a960 <shrink_lruvec+0x8e0>	60a95c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
08e0   60a960:	41 80 ff 0c          	cmp    $0xc,%r15b
08e4   60a964:	0f 94 c0             	sete   %al
08e7   60a967:	20 d8                	and    %bl,%al
08e9   60a969:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
08ed   60a96d:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
08f5   60a975:	e8 00 00 00 00       	call   60a97a <shrink_lruvec+0x8fa>	60a976: R_X86_64_PLT32	blk_start_plug-0x4
08fa   60a97a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
08ff   60a97f:	48 8d 48 34          	lea    0x34(%rax),%rcx
0903   60a983:	48 89 8c 24 e0 00 00 00 	mov    %rcx,0xe0(%rsp)
090b   60a98b:	49 8d 4d 50          	lea    0x50(%r13),%rcx
090f   60a98f:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
0914   60a994:	49 8d 8d 88 05 00 00 	lea    0x588(%r13),%rcx
091b   60a99b:	48 89 8c 24 80 00 00 00 	mov    %rcx,0x80(%rsp)
0923   60a9a3:	48 8d 48 48          	lea    0x48(%rax),%rcx
0927   60a9a7:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
092f   60a9af:	48 8d 48 50          	lea    0x50(%rax),%rcx
0933   60a9b3:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
093b   60a9bb:	48 8d 48 4c          	lea    0x4c(%rax),%rcx
093f   60a9bf:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
0944   60a9c4:	48 8d 48 54          	lea    0x54(%rax),%rcx
0948   60a9c8:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
094d   60a9cd:	48 8d 48 58          	lea    0x58(%rax),%rcx
0951   60a9d1:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
0959   60a9d9:	48 8d 48 60          	lea    0x60(%rax),%rcx
095d   60a9dd:	48 89 8c 24 48 01 00 00 	mov    %rcx,0x148(%rsp)
0965   60a9e5:	48 83 c0 5c          	add    $0x5c,%rax
0969   60a9e9:	48 89 84 24 40 01 00 00 	mov    %rax,0x140(%rsp)
0971   60a9f1:	45 31 ff             	xor    %r15d,%r15d
0974   60a9f4:	eb 0a                	jmp    60aa00 <shrink_lruvec+0x980>
0976   60a9f6:	e8 00 00 00 00       	call   60a9fb <shrink_lruvec+0x97b>	60a9f7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
097b   60a9fb:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
0980   60aa00:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
0988   60aa08:	31 ff                	xor    %edi,%edi
098a   60aa0a:	48 89 de             	mov    %rbx,%rsi
098d   60aa0d:	e8 00 00 00 00       	call   60aa12 <shrink_lruvec+0x992>	60aa0e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0992   60aa12:	48 85 db             	test   %rbx,%rbx
0995   60aa15:	74 07                	je     60aa1e <shrink_lruvec+0x99e>
0997   60aa17:	e8 00 00 00 00       	call   60aa1c <shrink_lruvec+0x99c>	60aa18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
099c   60aa1c:	eb 3e                	jmp    60aa5c <shrink_lruvec+0x9dc>
099e   60aa1e:	48 8b 9c 24 c8 00 00 00 	mov    0xc8(%rsp),%rbx
09a6   60aa26:	31 ff                	xor    %edi,%edi
09a8   60aa28:	48 89 de             	mov    %rbx,%rsi
09ab   60aa2b:	e8 00 00 00 00       	call   60aa30 <shrink_lruvec+0x9b0>	60aa2c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09b0   60aa30:	48 85 db             	test   %rbx,%rbx
09b3   60aa33:	74 07                	je     60aa3c <shrink_lruvec+0x9bc>
09b5   60aa35:	e8 00 00 00 00       	call   60aa3a <shrink_lruvec+0x9ba>	60aa36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ba   60aa3a:	eb 20                	jmp    60aa5c <shrink_lruvec+0x9dc>
09bc   60aa3c:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
09c4   60aa44:	31 ff                	xor    %edi,%edi
09c6   60aa46:	48 89 de             	mov    %rbx,%rsi
09c9   60aa49:	e8 00 00 00 00       	call   60aa4e <shrink_lruvec+0x9ce>	60aa4a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09ce   60aa4e:	48 85 db             	test   %rbx,%rbx
09d1   60aa51:	0f 84 10 0c 00 00    	je     60b667 <shrink_lruvec+0x15e7>
09d7   60aa57:	e8 00 00 00 00       	call   60aa5c <shrink_lruvec+0x9dc>	60aa58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09dc   60aa5c:	45 31 ed             	xor    %r13d,%r13d
09df   60aa5f:	4a 8b 9c ec b0 00 00 00 	mov    0xb0(%rsp,%r13,8),%rbx
09e7   60aa67:	31 ff                	xor    %edi,%edi
09e9   60aa69:	48 89 de             	mov    %rbx,%rsi
09ec   60aa6c:	e8 00 00 00 00       	call   60aa71 <shrink_lruvec+0x9f1>	60aa6d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09f1   60aa71:	48 85 db             	test   %rbx,%rbx
09f4   60aa74:	0f 84 a4 00 00 00    	je     60ab1e <shrink_lruvec+0xa9e>
09fa   60aa7a:	48 83 fb 20          	cmp    $0x20,%rbx
09fe   60aa7e:	b8 20 00 00 00       	mov    $0x20,%eax
0a03   60aa83:	48 0f 42 c3          	cmovb  %rbx,%rax
0a07   60aa87:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
0a0c   60aa8c:	48 29 c3             	sub    %rax,%rbx
0a0f   60aa8f:	4a 89 9c ec b0 00 00 00 	mov    %rbx,0xb0(%rsp,%r13,8)
0a17   60aa97:	44 89 eb             	mov    %r13d,%ebx
0a1a   60aa9a:	81 e3 fd ff ff 7f    	and    $0x7ffffffd,%ebx
0a20   60aaa0:	bf 01 00 00 00       	mov    $0x1,%edi
0a25   60aaa5:	89 de                	mov    %ebx,%esi
0a27   60aaa7:	e8 00 00 00 00       	call   60aaac <shrink_lruvec+0xa2c>	60aaa8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a2c   60aaac:	83 fb 01             	cmp    $0x1,%ebx
0a2f   60aaaf:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
0a34   60aab4:	75 7c                	jne    60ab32 <shrink_lruvec+0xab2>
0a36   60aab6:	4c 89 e7             	mov    %r12,%rdi
0a39   60aab9:	e8 00 00 00 00       	call   60aabe <shrink_lruvec+0xa3e>	60aaba: R_X86_64_PLT32	__tsan_read2-0x4
0a3e   60aabe:	45 0f b7 34 24       	movzwl (%r12),%r14d
0a43   60aac3:	44 89 eb             	mov    %r13d,%ebx
0a46   60aac6:	81 e3 fe ff ff 7f    	and    $0x7ffffffe,%ebx
0a4c   60aacc:	bf 02 00 00 00       	mov    $0x2,%edi
0a51   60aad1:	89 de                	mov    %ebx,%esi
0a53   60aad3:	e8 00 00 00 00       	call   60aad8 <shrink_lruvec+0xa58>	60aad4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a58   60aad8:	83 fb 02             	cmp    $0x2,%ebx
0a5b   60aadb:	0f 94 c1             	sete   %cl
0a5e   60aade:	bb 01 00 00 00       	mov    $0x1,%ebx
0a63   60aae3:	d3 e3                	shl    %cl,%ebx
0a65   60aae5:	44 89 f6             	mov    %r14d,%esi
0a68   60aae8:	21 de                	and    %ebx,%esi
0a6a   60aaea:	31 ff                	xor    %edi,%edi
0a6c   60aaec:	e8 00 00 00 00       	call   60aaf1 <shrink_lruvec+0xa71>	60aaed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a71   60aaf1:	44 21 f3             	and    %r14d,%ebx
0a74   60aaf4:	0f 84 6d 01 00 00    	je     60ac67 <shrink_lruvec+0xbe7>
0a7a   60aafa:	e8 00 00 00 00       	call   60aaff <shrink_lruvec+0xa7f>	60aafb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a7f   60aaff:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
0a84   60ab04:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
0a89   60ab09:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
0a8e   60ab0e:	44 89 e9             	mov    %r13d,%ecx
0a91   60ab11:	e8 ea 67 00 00       	call   611300 <shrink_active_list>
0a96   60ab16:	45 31 f6             	xor    %r14d,%r14d
0a99   60ab19:	e9 a0 08 00 00       	jmp    60b3be <shrink_lruvec+0x133e>
0a9e   60ab1e:	e8 00 00 00 00       	call   60ab23 <shrink_lruvec+0xaa3>	60ab1f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aa3   60ab23:	49 83 fd 03          	cmp    $0x3,%r13
0aa7   60ab27:	0f 85 a3 08 00 00    	jne    60b3d0 <shrink_lruvec+0x1350>
0aad   60ab2d:	e9 75 09 00 00       	jmp    60b4a7 <shrink_lruvec+0x1427>
0ab2   60ab32:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
0ab7   60ab37:	4c 8d a4 24 88 00 00 00 	lea    0x88(%rsp),%r12
0abf   60ab3f:	4c 89 e7             	mov    %r12,%rdi
0ac2   60ab42:	e8 00 00 00 00       	call   60ab47 <shrink_lruvec+0xac7>	60ab43: R_X86_64_PLT32	__tsan_write8-0x4
0ac7   60ab47:	4c 89 a4 24 88 00 00 00 	mov    %r12,0x88(%rsp)
0acf   60ab4f:	4c 89 a4 24 90 00 00 00 	mov    %r12,0x90(%rsp)
0ad7   60ab57:	48 c7 84 24 f8 00 00 00 00 00 00 00 	movq   $0x0,0xf8(%rsp)
0ae3   60ab63:	ba 2c 00 00 00       	mov    $0x2c,%edx
0ae8   60ab68:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
0af0   60ab70:	31 f6                	xor    %esi,%esi
0af2   60ab72:	e8 00 00 00 00       	call   60ab77 <shrink_lruvec+0xaf7>	60ab73: R_X86_64_PLT32	__tsan_memset-0x4
0af7   60ab77:	41 81 e5 fe ff ff 7f 	and    $0x7ffffffe,%r13d
0afe   60ab7e:	bf 02 00 00 00       	mov    $0x2,%edi
0b03   60ab83:	44 89 ee             	mov    %r13d,%esi
0b06   60ab86:	e8 00 00 00 00       	call   60ab8b <shrink_lruvec+0xb0b>	60ab87: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b0b   60ab8b:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
0b13   60ab93:	48 89 df             	mov    %rbx,%rdi
0b16   60ab96:	e8 00 00 00 00       	call   60ab9b <shrink_lruvec+0xb1b>	60ab97: R_X86_64_PLT32	__tsan_read8-0x4
0b1b   60ab9b:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 60aba2 <shrink_lruvec+0xb22>	60ab9e: R_X86_64_PC32	pcpu_hot-0x4
0b22   60aba2:	49 8d 7e 2c          	lea    0x2c(%r14),%rdi
0b26   60aba6:	45 31 ff             	xor    %r15d,%r15d
0b29   60aba9:	44 89 6c 24 44       	mov    %r13d,0x44(%rsp)
0b2e   60abae:	41 83 fd 02          	cmp    $0x2,%r13d
0b32   60abb2:	41 0f 94 c5          	sete   %r13b
0b36   60abb6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	60abb9: R_X86_64_32S	vm_node_stat
0b3d   60abbd:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	60abc0: R_X86_64_32S	vm_node_stat+0x10
0b44   60abc4:	48 0f 44 c8          	cmove  %rax,%rcx
0b48   60abc8:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
0b4d   60abcd:	48 8b 03             	mov    (%rbx),%rax
0b50   60abd0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0b55   60abd5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	60abd8: R_X86_64_32S	vm_node_stat+0x38
0b5c   60abdc:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	60abdf: R_X86_64_32S	vm_node_stat+0x40
0b63   60abe3:	48 0f 44 c8          	cmove  %rax,%rcx
0b67   60abe7:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
0b6c   60abec:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
0b71   60abf1:	e8 00 00 00 00       	call   60abf6 <shrink_lruvec+0xb76>	60abf2: R_X86_64_PLT32	__tsan_read4-0x4
0b76   60abf6:	41 8b 5e 2c          	mov    0x2c(%r14),%ebx
0b7a   60abfa:	be 00 00 02 00       	mov    $0x20000,%esi
0b7f   60abff:	21 de                	and    %ebx,%esi
0b81   60ac01:	31 ff                	xor    %edi,%edi
0b83   60ac03:	e8 00 00 00 00       	call   60ac08 <shrink_lruvec+0xb88>	60ac04: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b88   60ac08:	b8 00 00 02 00       	mov    $0x20000,%eax
0b8d   60ac0d:	21 c3                	and    %eax,%ebx
0b8f   60ac0f:	75 3d                	jne    60ac4e <shrink_lruvec+0xbce>
0b91   60ac11:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0b96   60ac16:	48 89 df             	mov    %rbx,%rdi
0b99   60ac19:	e8 00 00 00 00       	call   60ac1e <shrink_lruvec+0xb9e>	60ac1a: R_X86_64_PLT32	__tsan_read8-0x4
0b9e   60ac1e:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0ba2   60ac22:	74 61                	je     60ac85 <shrink_lruvec+0xc05>
0ba4   60ac24:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60ac27: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
0bab   60ac2b:	e8 00 00 00 00       	call   60ac30 <shrink_lruvec+0xbb0>	60ac2c: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0bb0   60ac30:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60ac36 <shrink_lruvec+0xbb6>	60ac32: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
0bb6   60ac36:	31 ff                	xor    %edi,%edi
0bb8   60ac38:	89 de                	mov    %ebx,%esi
0bba   60ac3a:	e8 00 00 00 00       	call   60ac3f <shrink_lruvec+0xbbf>	60ac3b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bbf   60ac3f:	85 db                	test   %ebx,%ebx
0bc1   60ac41:	0f 8e 99 01 00 00    	jle    60ade0 <shrink_lruvec+0xd60>
0bc7   60ac47:	e8 00 00 00 00       	call   60ac4c <shrink_lruvec+0xbcc>	60ac48: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bcc   60ac4c:	eb 3c                	jmp    60ac8a <shrink_lruvec+0xc0a>
0bce   60ac4e:	e8 00 00 00 00       	call   60ac53 <shrink_lruvec+0xbd3>	60ac4f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bd3   60ac53:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
0bd8   60ac58:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0bdd   60ac5d:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
0be2   60ac62:	e9 4e 02 00 00       	jmp    60aeb5 <shrink_lruvec+0xe35>
0be7   60ac67:	e8 00 00 00 00       	call   60ac6c <shrink_lruvec+0xbec>	60ac68: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bec   60ac6c:	41 83 ce 08          	or     $0x8,%r14d
0bf0   60ac70:	4c 89 e7             	mov    %r12,%rdi
0bf3   60ac73:	e8 00 00 00 00       	call   60ac78 <shrink_lruvec+0xbf8>	60ac74: R_X86_64_PLT32	__tsan_write2-0x4
0bf8   60ac78:	66 45 89 34 24       	mov    %r14w,(%r12)
0bfd   60ac7d:	45 31 f6             	xor    %r14d,%r14d
0c00   60ac80:	e9 39 07 00 00       	jmp    60b3be <shrink_lruvec+0x133e>
0c05   60ac85:	e8 00 00 00 00       	call   60ac8a <shrink_lruvec+0xc0a>	60ac86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c0a   60ac8a:	45 88 ef             	mov    %r13b,%r15b
0c0d   60ac8d:	4e 8d 3c fd 38 00 00 00 	lea    0x38(,%r15,8),%r15
0c15   60ac95:	be 08 00 00 00       	mov    $0x8,%esi
0c1a   60ac9a:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0c1f   60ac9f:	48 89 df             	mov    %rbx,%rdi
0c22   60aca2:	ba 04 00 00 00       	mov    $0x4,%edx
0c27   60aca7:	e8 00 00 00 00       	call   60acac <shrink_lruvec+0xc2c>	60aca8: R_X86_64_PLT32	__kcsan_check_access-0x4
0c2c   60acac:	48 89 df             	mov    %rbx,%rdi
0c2f   60acaf:	e8 00 00 00 00       	call   60acb4 <shrink_lruvec+0xc34>	60acb0: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0c34   60acb4:	4c 8b 23             	mov    (%rbx),%r12
0c37   60acb7:	be 08 00 00 00       	mov    $0x8,%esi
0c3c   60acbc:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0c41   60acc1:	48 89 df             	mov    %rbx,%rdi
0c44   60acc4:	ba 04 00 00 00       	mov    $0x4,%edx
0c49   60acc9:	e8 00 00 00 00       	call   60acce <shrink_lruvec+0xc4e>	60acca: R_X86_64_PLT32	__kcsan_check_access-0x4
0c4e   60acce:	48 89 df             	mov    %rbx,%rdi
0c51   60acd1:	e8 00 00 00 00       	call   60acd6 <shrink_lruvec+0xc56>	60acd2: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0c56   60acd6:	4c 89 bc 24 d8 00 00 00 	mov    %r15,0xd8(%rsp)
0c5e   60acde:	49 8b 9f 00 00 00 00 	mov    0x0(%r15),%rbx	60ace1: R_X86_64_32S	vm_node_stat
0c65   60ace5:	4c 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%r15
0c6d   60aced:	4c 89 ff             	mov    %r15,%rdi
0c70   60acf0:	e8 00 00 00 00       	call   60acf5 <shrink_lruvec+0xc75>	60acf1: R_X86_64_PLT32	__tsan_read4-0x4
0c75   60acf5:	45 8b 2f             	mov    (%r15),%r13d
0c78   60acf8:	b8 c0 00 00 00       	mov    $0xc0,%eax
0c7d   60acfd:	41 21 c5             	and    %eax,%r13d
0c80   60ad00:	bf c0 00 00 00       	mov    $0xc0,%edi
0c85   60ad05:	44 89 ee             	mov    %r13d,%esi
0c88   60ad08:	e8 00 00 00 00       	call   60ad0d <shrink_lruvec+0xc8d>	60ad09: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0c8d   60ad0d:	4d 89 e7             	mov    %r12,%r15
0c90   60ad10:	49 c1 ef 03          	shr    $0x3,%r15
0c94   60ad14:	41 81 fd c0 00 00 00 	cmp    $0xc0,%r13d
0c9b   60ad1b:	4d 0f 45 fc          	cmovne %r12,%r15
0c9f   60ad1f:	48 89 df             	mov    %rbx,%rdi
0ca2   60ad22:	4c 89 fe             	mov    %r15,%rsi
0ca5   60ad25:	e8 00 00 00 00       	call   60ad2a <shrink_lruvec+0xcaa>	60ad26: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0caa   60ad2a:	4c 39 fb             	cmp    %r15,%rbx
0cad   60ad2d:	76 54                	jbe    60ad83 <shrink_lruvec+0xd03>
0caf   60ad2f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0cb4   60ad34:	be 01 00 00 00       	mov    $0x1,%esi
0cb9   60ad39:	e8 00 00 00 00       	call   60ad3e <shrink_lruvec+0xcbe>	60ad3a: R_X86_64_PLT32	reclaim_throttle-0x4
0cbe   60ad3e:	be 08 00 00 00       	mov    $0x8,%esi
0cc3   60ad43:	4c 89 f7             	mov    %r14,%rdi
0cc6   60ad46:	ba 04 00 00 00       	mov    $0x4,%edx
0ccb   60ad4b:	e8 00 00 00 00       	call   60ad50 <shrink_lruvec+0xcd0>	60ad4c: R_X86_64_PLT32	__kcsan_check_access-0x4
0cd0   60ad50:	4c 89 f7             	mov    %r14,%rdi
0cd3   60ad53:	e8 00 00 00 00       	call   60ad58 <shrink_lruvec+0xcd8>	60ad54: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0cd8   60ad58:	49 8b 1e             	mov    (%r14),%rbx
0cdb   60ad5b:	48 89 de             	mov    %rbx,%rsi
0cde   60ad5e:	48 83 e6 04          	and    $0x4,%rsi
0ce2   60ad62:	31 ff                	xor    %edi,%edi
0ce4   60ad64:	e8 00 00 00 00       	call   60ad69 <shrink_lruvec+0xce9>	60ad65: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0ce9   60ad69:	48 83 e3 04          	and    $0x4,%rbx
0ced   60ad6d:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
0cf2   60ad72:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
0cf7   60ad77:	75 71                	jne    60adea <shrink_lruvec+0xd6a>
0cf9   60ad79:	e8 00 00 00 00       	call   60ad7e <shrink_lruvec+0xcfe>	60ad7a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cfe   60ad7e:	e9 9f 00 00 00       	jmp    60ae22 <shrink_lruvec+0xda2>
0d03   60ad83:	e8 00 00 00 00       	call   60ad88 <shrink_lruvec+0xd08>	60ad84: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d08   60ad88:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
0d0d   60ad8d:	4c 8d a4 24 88 00 00 00 	lea    0x88(%rsp),%r12
0d15   60ad95:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
0d1a   60ad9a:	49 8d 9f 48 1a 00 00 	lea    0x1a48(%r15),%rbx
0d21   60ada1:	48 89 df             	mov    %rbx,%rdi
0d24   60ada4:	e8 00 00 00 00       	call   60ada9 <shrink_lruvec+0xd29>	60ada5: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0d29   60ada9:	49 8b 87 48 1a 00 00 	mov    0x1a48(%r15),%rax
0d30   60adb0:	48 39 d8             	cmp    %rbx,%rax
0d33   60adb3:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
0d38   60adb8:	0f 84 de 00 00 00    	je     60ae9c <shrink_lruvec+0xe1c>
0d3e   60adbe:	e8 00 00 00 00       	call   60adc3 <shrink_lruvec+0xd43>	60adbf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d43   60adc3:	49 8d bf 08 1a 00 00 	lea    0x1a08(%r15),%rdi
0d4a   60adca:	be 03 00 00 00       	mov    $0x3,%esi
0d4f   60adcf:	ba 01 00 00 00       	mov    $0x1,%edx
0d54   60add4:	31 c9                	xor    %ecx,%ecx
0d56   60add6:	e8 00 00 00 00       	call   60addb <shrink_lruvec+0xd5b>	60add7: R_X86_64_PLT32	__wake_up-0x4
0d5b   60addb:	e9 c1 00 00 00       	jmp    60aea1 <shrink_lruvec+0xe21>
0d60   60ade0:	e8 00 00 00 00       	call   60ade5 <shrink_lruvec+0xd65>	60ade1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d65   60ade5:	e9 69 fe ff ff       	jmp    60ac53 <shrink_lruvec+0xbd3>
0d6a   60adea:	49 81 c6 70 05 00 00 	add    $0x570,%r14
0d71   60adf1:	4c 89 f7             	mov    %r14,%rdi
0d74   60adf4:	e8 00 00 00 00       	call   60adf9 <shrink_lruvec+0xd79>	60adf5: R_X86_64_PLT32	__tsan_read8-0x4
0d79   60adf9:	49 8b 1e             	mov    (%r14),%rbx
0d7c   60adfc:	be 00 01 00 00       	mov    $0x100,%esi
0d81   60ae01:	48 21 de             	and    %rbx,%rsi
0d84   60ae04:	31 ff                	xor    %edi,%edi
0d86   60ae06:	e8 00 00 00 00       	call   60ae0b <shrink_lruvec+0xd8b>	60ae07: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0d8b   60ae0b:	b8 00 01 00 00       	mov    $0x100,%eax
0d90   60ae10:	48 21 c3             	and    %rax,%rbx
0d93   60ae13:	4c 8b 24 24          	mov    (%rsp),%r12
0d97   60ae17:	0f 85 c0 05 00 00    	jne    60b3dd <shrink_lruvec+0x135d>
0d9d   60ae1d:	e8 00 00 00 00       	call   60ae22 <shrink_lruvec+0xda2>	60ae1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0da2   60ae22:	4c 8d a4 24 88 00 00 00 	lea    0x88(%rsp),%r12
0daa   60ae2a:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0daf   60ae2f:	48 89 df             	mov    %rbx,%rdi
0db2   60ae32:	e8 00 00 00 00       	call   60ae37 <shrink_lruvec+0xdb7>	60ae33: R_X86_64_PLT32	__tsan_read4-0x4
0db7   60ae37:	8b 1b                	mov    (%rbx),%ebx
0db9   60ae39:	be 00 00 02 00       	mov    $0x20000,%esi
0dbe   60ae3e:	21 de                	and    %ebx,%esi
0dc0   60ae40:	31 ff                	xor    %edi,%edi
0dc2   60ae42:	e8 00 00 00 00       	call   60ae47 <shrink_lruvec+0xdc7>	60ae43: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0dc7   60ae47:	b8 00 00 02 00       	mov    $0x20000,%eax
0dcc   60ae4c:	21 c3                	and    %eax,%ebx
0dce   60ae4e:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
0dd3   60ae53:	4d 89 ef             	mov    %r13,%r15
0dd6   60ae56:	75 53                	jne    60aeab <shrink_lruvec+0xe2b>
0dd8   60ae58:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
0ddd   60ae5d:	48 89 df             	mov    %rbx,%rdi
0de0   60ae60:	e8 00 00 00 00       	call   60ae65 <shrink_lruvec+0xde5>	60ae61: R_X86_64_PLT32	__tsan_read8-0x4
0de5   60ae65:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0de9   60ae69:	0f 84 7b 05 00 00    	je     60b3ea <shrink_lruvec+0x136a>
0def   60ae6f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60ae72: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
0df6   60ae76:	e8 00 00 00 00       	call   60ae7b <shrink_lruvec+0xdfb>	60ae77: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0dfb   60ae7b:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60ae81 <shrink_lruvec+0xe01>	60ae7d: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
0e01   60ae81:	31 ff                	xor    %edi,%edi
0e03   60ae83:	89 de                	mov    %ebx,%esi
0e05   60ae85:	e8 00 00 00 00       	call   60ae8a <shrink_lruvec+0xe0a>	60ae86: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0e0a   60ae8a:	85 db                	test   %ebx,%ebx
0e0c   60ae8c:	0f 8e 0b 06 00 00    	jle    60b49d <shrink_lruvec+0x141d>
0e12   60ae92:	e8 00 00 00 00       	call   60ae97 <shrink_lruvec+0xe17>	60ae93: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e17   60ae97:	e9 53 05 00 00       	jmp    60b3ef <shrink_lruvec+0x136f>
0e1c   60ae9c:	e8 00 00 00 00       	call   60aea1 <shrink_lruvec+0xe21>	60ae9d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e21   60aea1:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0e26   60aea6:	4d 89 ef             	mov    %r13,%r15
0e29   60aea9:	eb 0a                	jmp    60aeb5 <shrink_lruvec+0xe35>
0e2b   60aeab:	e8 00 00 00 00       	call   60aeb0 <shrink_lruvec+0xe30>	60aeac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e30   60aeb0:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0e35   60aeb5:	45 31 ed             	xor    %r13d,%r13d
0e38   60aeb8:	83 7c 24 44 02       	cmpl   $0x2,0x44(%rsp)
0e3d   60aebd:	41 0f 94 c5          	sete   %r13b
0e41   60aec1:	e8 00 00 00 00       	call   60aec6 <shrink_lruvec+0xe46>	60aec2: R_X86_64_PLT32	lru_add_drain-0x4
0e46   60aec6:	48 89 df             	mov    %rbx,%rdi
0e49   60aec9:	e8 00 00 00 00       	call   60aece <shrink_lruvec+0xe4e>	60aeca: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
0e4e   60aece:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
0e53   60aed3:	4c 89 fe             	mov    %r15,%rsi
0e56   60aed6:	4c 89 e2             	mov    %r12,%rdx
0e59   60aed9:	48 8d 8c 24 f8 00 00 00 	lea    0xf8(%rsp),%rcx
0e61   60aee1:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
0e66   60aee6:	45 89 f1             	mov    %r14d,%r9d
0e69   60aee9:	e8 d2 6b 00 00       	call   611ac0 <isolate_lru_folios>
0e6e   60aeee:	49 89 c4             	mov    %rax,%r12
0e71   60aef1:	4d 63 fc             	movslq %r12d,%r15
0e74   60aef4:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0e79   60aef9:	4b 8d 1c ee          	lea    (%r14,%r13,8),%rbx
0e7d   60aefd:	48 81 c3 f8 1c 00 00 	add    $0x1cf8,%rbx
0e84   60af04:	be 08 00 00 00       	mov    $0x8,%esi
0e89   60af09:	48 89 df             	mov    %rbx,%rdi
0e8c   60af0c:	ba 07 00 00 00       	mov    $0x7,%edx
0e91   60af11:	e8 00 00 00 00       	call   60af16 <shrink_lruvec+0xe96>	60af12: R_X86_64_PLT32	__kcsan_check_access-0x4
0e96   60af16:	4f 01 bc ee f8 1c 00 00 	add    %r15,0x1cf8(%r14,%r13,8)
0e9e   60af1e:	4e 8d 34 ed 00 00 00 00 	lea    0x0(,%r13,8),%r14	60af22: R_X86_64_32S	vm_node_stat+0x38
0ea6   60af26:	be 08 00 00 00       	mov    $0x8,%esi
0eab   60af2b:	4c 89 f7             	mov    %r14,%rdi
0eae   60af2e:	ba 07 00 00 00       	mov    $0x7,%edx
0eb3   60af33:	e8 00 00 00 00       	call   60af38 <shrink_lruvec+0xeb8>	60af34: R_X86_64_PLT32	__kcsan_check_access-0x4
0eb8   60af38:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
0ebd   60af3d:	4e 01 3c ed 00 00 00 00 	add    %r15,0x0(,%r13,8)	60af41: R_X86_64_32S	vm_node_stat+0x38
0ec5   60af45:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
0eca   60af4a:	4c 89 ff             	mov    %r15,%rdi
0ecd   60af4d:	e8 00 00 00 00       	call   60af52 <shrink_lruvec+0xed2>	60af4e: R_X86_64_PLT32	__tsan_read4-0x4
0ed2   60af52:	45 8b 3f             	mov    (%r15),%r15d
0ed5   60af55:	be 00 00 02 00       	mov    $0x20000,%esi
0eda   60af5a:	44 21 fe             	and    %r15d,%esi
0edd   60af5d:	31 ff                	xor    %edi,%edi
0edf   60af5f:	e8 00 00 00 00       	call   60af64 <shrink_lruvec+0xee4>	60af60: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0ee4   60af64:	b8 00 00 02 00       	mov    $0x20000,%eax
0ee9   60af69:	41 21 c7             	and    %eax,%r15d
0eec   60af6c:	75 14                	jne    60af82 <shrink_lruvec+0xf02>
0eee   60af6e:	e8 00 00 00 00       	call   60af73 <shrink_lruvec+0xef3>	60af6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ef3   60af73:	e8 00 00 00 00       	call   60af78 <shrink_lruvec+0xef8>	60af74: R_X86_64_PLT32	current_is_khugepaged-0x4
0ef8   60af78:	44 0f b6 e8          	movzbl %al,%r13d
0efc   60af7c:	41 83 cd 20          	or     $0x20,%r13d
0f00   60af80:	eb 0b                	jmp    60af8d <shrink_lruvec+0xf0d>
0f02   60af82:	e8 00 00 00 00       	call   60af87 <shrink_lruvec+0xf07>	60af83: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f07   60af87:	41 bd 1f 00 00 00    	mov    $0x1f,%r13d
0f0d   60af8d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60af90: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0f14   60af94:	e8 00 00 00 00       	call   60af99 <shrink_lruvec+0xf19>	60af95: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0f19   60af99:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 60afa0 <shrink_lruvec+0xf20>	60af9c: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0f20   60afa0:	bf 01 00 00 00       	mov    $0x1,%edi
0f25   60afa5:	44 89 fe             	mov    %r15d,%esi
0f28   60afa8:	e8 00 00 00 00       	call   60afad <shrink_lruvec+0xf2d>	60afa9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f2d   60afad:	45 85 ff             	test   %r15d,%r15d
0f30   60afb0:	7e 1a                	jle    60afcc <shrink_lruvec+0xf4c>
0f32   60afb2:	e8 00 00 00 00       	call   60afb7 <shrink_lruvec+0xf37>	60afb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f37   60afb7:	4c 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%r15
0f3f   60afbf:	4c 89 ff             	mov    %r15,%rdi
0f42   60afc2:	e8 00 00 00 00       	call   60afc7 <shrink_lruvec+0xf47>	60afc3: R_X86_64_PLT32	__tsan_read8-0x4
0f47   60afc7:	49 8b 3f             	mov    (%r15),%rdi
0f4a   60afca:	eb 07                	jmp    60afd3 <shrink_lruvec+0xf53>
0f4c   60afcc:	e8 00 00 00 00       	call   60afd1 <shrink_lruvec+0xf51>	60afcd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f51   60afd1:	31 ff                	xor    %edi,%edi
0f53   60afd3:	48 8b 94 24 f8 00 00 00 	mov    0xf8(%rsp),%rdx
0f5b   60afdb:	44 89 ee             	mov    %r13d,%esi
0f5e   60afde:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
0f63   60afe3:	e8 00 00 00 00       	call   60afe8 <shrink_lruvec+0xf68>	60afe4: R_X86_64_PLT32	__count_memcg_events-0x4
0f68   60afe8:	4c 8b 7c 24 28       	mov    0x28(%rsp),%r15
0f6d   60afed:	4c 89 ff             	mov    %r15,%rdi
0f70   60aff0:	e8 00 00 00 00       	call   60aff5 <shrink_lruvec+0xf75>	60aff1: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
0f75   60aff5:	31 ff                	xor    %edi,%edi
0f77   60aff7:	4c 89 e6             	mov    %r12,%rsi
0f7a   60affa:	e8 00 00 00 00       	call   60afff <shrink_lruvec+0xf7f>	60affb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0f7f   60afff:	4d 85 e4             	test   %r12,%r12
0f82   60b002:	0f 84 a8 00 00 00    	je     60b0b0 <shrink_lruvec+0x1030>
0f88   60b008:	4c 8d ac 24 88 00 00 00 	lea    0x88(%rsp),%r13
0f90   60b010:	4c 89 ef             	mov    %r13,%rdi
0f93   60b013:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
0f98   60b018:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
0f9d   60b01d:	48 8d 8c 24 00 01 00 00 	lea    0x100(%rsp),%rcx
0fa5   60b025:	45 31 c0             	xor    %r8d,%r8d
0fa8   60b028:	e8 d3 ab ff ff       	call   605c00 <shrink_folio_list>
0fad   60b02d:	89 44 24 50          	mov    %eax,0x50(%rsp)
0fb1   60b031:	4c 89 ff             	mov    %r15,%rdi
0fb4   60b034:	e8 00 00 00 00       	call   60b039 <shrink_lruvec+0xfb9>	60b035: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
0fb9   60b039:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
0fbe   60b03e:	4c 89 ee             	mov    %r13,%rsi
0fc1   60b041:	e8 3a 75 00 00       	call   612580 <move_folios_to_lru>
0fc6   60b046:	44 89 e0             	mov    %r12d,%eax
0fc9   60b049:	f7 d8                	neg    %eax
0fcb   60b04b:	4c 63 f8             	movslq %eax,%r15
0fce   60b04e:	be 08 00 00 00       	mov    $0x8,%esi
0fd3   60b053:	48 89 df             	mov    %rbx,%rdi
0fd6   60b056:	ba 07 00 00 00       	mov    $0x7,%edx
0fdb   60b05b:	e8 00 00 00 00       	call   60b060 <shrink_lruvec+0xfe0>	60b05c: R_X86_64_PLT32	__kcsan_check_access-0x4
0fe0   60b060:	4c 01 3b             	add    %r15,(%rbx)
0fe3   60b063:	be 08 00 00 00       	mov    $0x8,%esi
0fe8   60b068:	4c 89 f7             	mov    %r14,%rdi
0feb   60b06b:	ba 07 00 00 00       	mov    $0x7,%edx
0ff0   60b070:	e8 00 00 00 00       	call   60b075 <shrink_lruvec+0xff5>	60b071: R_X86_64_PLT32	__kcsan_check_access-0x4
0ff5   60b075:	4d 01 3e             	add    %r15,(%r14)
0ff8   60b078:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0ffd   60b07d:	48 89 df             	mov    %rbx,%rdi
1000   60b080:	e8 00 00 00 00       	call   60b085 <shrink_lruvec+0x1005>	60b081: R_X86_64_PLT32	__tsan_read4-0x4
1005   60b085:	8b 1b                	mov    (%rbx),%ebx
1007   60b087:	be 00 00 02 00       	mov    $0x20000,%esi
100c   60b08c:	21 de                	and    %ebx,%esi
100e   60b08e:	31 ff                	xor    %edi,%edi
1010   60b090:	e8 00 00 00 00       	call   60b095 <shrink_lruvec+0x1015>	60b091: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1015   60b095:	b8 00 00 02 00       	mov    $0x20000,%eax
101a   60b09a:	21 c3                	and    %eax,%ebx
101c   60b09c:	75 1f                	jne    60b0bd <shrink_lruvec+0x103d>
101e   60b09e:	e8 00 00 00 00       	call   60b0a3 <shrink_lruvec+0x1023>	60b09f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1023   60b0a3:	e8 00 00 00 00       	call   60b0a8 <shrink_lruvec+0x1028>	60b0a4: R_X86_64_PLT32	current_is_khugepaged-0x4
1028   60b0a8:	0f b6 d8             	movzbl %al,%ebx
102b   60b0ab:	83 cb 1a             	or     $0x1a,%ebx
102e   60b0ae:	eb 17                	jmp    60b0c7 <shrink_lruvec+0x1047>
1030   60b0b0:	e8 00 00 00 00       	call   60b0b5 <shrink_lruvec+0x1035>	60b0b1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1035   60b0b5:	45 31 f6             	xor    %r14d,%r14d
1038   60b0b8:	e9 e2 02 00 00       	jmp    60b39f <shrink_lruvec+0x131f>
103d   60b0bd:	e8 00 00 00 00       	call   60b0c2 <shrink_lruvec+0x1042>	60b0be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1042   60b0c2:	bb 19 00 00 00       	mov    $0x19,%ebx
1047   60b0c7:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
104c   60b0cc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b0cf: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1053   60b0d3:	e8 00 00 00 00       	call   60b0d8 <shrink_lruvec+0x1058>	60b0d4: R_X86_64_PLT32	__tsan_volatile_read4-0x4
1058   60b0d8:	44 8b 35 00 00 00 00 	mov    0x0(%rip),%r14d        # 60b0df <shrink_lruvec+0x105f>	60b0db: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
105f   60b0df:	bf 01 00 00 00       	mov    $0x1,%edi
1064   60b0e4:	44 89 f6             	mov    %r14d,%esi
1067   60b0e7:	e8 00 00 00 00       	call   60b0ec <shrink_lruvec+0x106c>	60b0e8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
106c   60b0ec:	45 85 f6             	test   %r14d,%r14d
106f   60b0ef:	7e 1a                	jle    60b10b <shrink_lruvec+0x108b>
1071   60b0f1:	e8 00 00 00 00       	call   60b0f6 <shrink_lruvec+0x1076>	60b0f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1076   60b0f6:	4c 8b b4 24 80 00 00 00 	mov    0x80(%rsp),%r14
107e   60b0fe:	4c 89 f7             	mov    %r14,%rdi
1081   60b101:	e8 00 00 00 00       	call   60b106 <shrink_lruvec+0x1086>	60b102: R_X86_64_PLT32	__tsan_read8-0x4
1086   60b106:	49 8b 3e             	mov    (%r14),%rdi
1089   60b109:	eb 07                	jmp    60b112 <shrink_lruvec+0x1092>
108b   60b10b:	e8 00 00 00 00       	call   60b110 <shrink_lruvec+0x1090>	60b10c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1090   60b110:	31 ff                	xor    %edi,%edi
1092   60b112:	45 31 ff             	xor    %r15d,%r15d
1095   60b115:	83 7c 24 44 02       	cmpl   $0x2,0x44(%rsp)
109a   60b11a:	41 0f 94 c7          	sete   %r15b
109e   60b11e:	45 89 ee             	mov    %r13d,%r14d
10a1   60b121:	89 de                	mov    %ebx,%esi
10a3   60b123:	4c 89 f2             	mov    %r14,%rdx
10a6   60b126:	e8 00 00 00 00       	call   60b12b <shrink_lruvec+0x10ab>	60b127: R_X86_64_PLT32	__count_memcg_events-0x4
10ab   60b12b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
10b0   60b130:	e8 00 00 00 00       	call   60b135 <shrink_lruvec+0x10b5>	60b131: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
10b5   60b135:	8b 94 24 14 01 00 00 	mov    0x114(%rsp),%edx
10bc   60b13c:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
10c1   60b141:	89 c1                	mov    %eax,%ecx
10c3   60b143:	44 29 e9             	sub    %r13d,%ecx
10c6   60b146:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
10cb   60b14b:	44 89 fe             	mov    %r15d,%esi
10ce   60b14e:	e8 00 00 00 00       	call   60b153 <shrink_lruvec+0x10d3>	60b14f: R_X86_64_PLT32	lru_note_cost-0x4
10d3   60b153:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b156: R_X86_64_32S	memory_cgrp_subsys_enabled_key
10da   60b15a:	e8 00 00 00 00       	call   60b15f <shrink_lruvec+0x10df>	60b15b: R_X86_64_PLT32	__tsan_volatile_read4-0x4
10df   60b15f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60b165 <shrink_lruvec+0x10e5>	60b161: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
10e5   60b165:	bf 01 00 00 00       	mov    $0x1,%edi
10ea   60b16a:	89 de                	mov    %ebx,%esi
10ec   60b16c:	e8 00 00 00 00       	call   60b171 <shrink_lruvec+0x10f1>	60b16d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10f1   60b171:	85 db                	test   %ebx,%ebx
10f3   60b173:	7e 17                	jle    60b18c <shrink_lruvec+0x110c>
10f5   60b175:	e8 00 00 00 00       	call   60b17a <shrink_lruvec+0x10fa>	60b176: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10fa   60b17a:	48 8d 9c 24 88 00 00 00 	lea    0x88(%rsp),%rbx
1102   60b182:	48 89 df             	mov    %rbx,%rdi
1105   60b185:	e8 00 00 00 00       	call   60b18a <shrink_lruvec+0x110a>	60b186: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
110a   60b18a:	eb 0d                	jmp    60b199 <shrink_lruvec+0x1119>
110c   60b18c:	e8 00 00 00 00       	call   60b191 <shrink_lruvec+0x1111>	60b18d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1111   60b191:	48 8d 9c 24 88 00 00 00 	lea    0x88(%rsp),%rbx
1119   60b199:	48 89 df             	mov    %rbx,%rdi
111c   60b19c:	e8 00 00 00 00       	call   60b1a1 <shrink_lruvec+0x1121>	60b19d: R_X86_64_PLT32	free_unref_page_list-0x4
1121   60b1a1:	8b 9c 24 04 01 00 00 	mov    0x104(%rsp),%ebx
1128   60b1a8:	4c 89 e7             	mov    %r12,%rdi
112b   60b1ab:	48 89 de             	mov    %rbx,%rsi
112e   60b1ae:	e8 00 00 00 00       	call   60b1b3 <shrink_lruvec+0x1133>	60b1af: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1133   60b1b3:	49 39 dc             	cmp    %rbx,%r12
1136   60b1b6:	75 46                	jne    60b1fe <shrink_lruvec+0x117e>
1138   60b1b8:	bf 01 00 00 00       	mov    $0x1,%edi
113d   60b1bd:	e8 00 00 00 00       	call   60b1c2 <shrink_lruvec+0x1142>	60b1be: R_X86_64_PLT32	wakeup_flusher_threads-0x4
1142   60b1c2:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
1147   60b1c7:	4c 89 ff             	mov    %r15,%rdi
114a   60b1ca:	e8 00 00 00 00       	call   60b1cf <shrink_lruvec+0x114f>	60b1cb: R_X86_64_PLT32	__tsan_read8-0x4
114f   60b1cf:	49 83 3f 00          	cmpq   $0x0,(%r15)
1153   60b1d3:	74 30                	je     60b205 <shrink_lruvec+0x1185>
1155   60b1d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b1d8: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
115c   60b1dc:	e8 00 00 00 00       	call   60b1e1 <shrink_lruvec+0x1161>	60b1dd: R_X86_64_PLT32	__tsan_volatile_read4-0x4
1161   60b1e1:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 60b1e8 <shrink_lruvec+0x1168>	60b1e4: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
1168   60b1e8:	31 ff                	xor    %edi,%edi
116a   60b1ea:	44 89 fe             	mov    %r15d,%esi
116d   60b1ed:	e8 00 00 00 00       	call   60b1f2 <shrink_lruvec+0x1172>	60b1ee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1172   60b1f2:	45 85 ff             	test   %r15d,%r15d
1175   60b1f5:	7e 15                	jle    60b20c <shrink_lruvec+0x118c>
1177   60b1f7:	e8 00 00 00 00       	call   60b1fc <shrink_lruvec+0x117c>	60b1f8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
117c   60b1fc:	eb 1f                	jmp    60b21d <shrink_lruvec+0x119d>
117e   60b1fe:	e8 00 00 00 00       	call   60b203 <shrink_lruvec+0x1183>	60b1ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1183   60b203:	eb 18                	jmp    60b21d <shrink_lruvec+0x119d>
1185   60b205:	e8 00 00 00 00       	call   60b20a <shrink_lruvec+0x118a>	60b206: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
118a   60b20a:	eb 11                	jmp    60b21d <shrink_lruvec+0x119d>
118c   60b20c:	e8 00 00 00 00       	call   60b211 <shrink_lruvec+0x1191>	60b20d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1191   60b211:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1196   60b216:	31 f6                	xor    %esi,%esi
1198   60b218:	e8 00 00 00 00       	call   60b21d <shrink_lruvec+0x119d>	60b219: R_X86_64_PLT32	reclaim_throttle-0x4
119d   60b21d:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
11a5   60b225:	e8 00 00 00 00       	call   60b22a <shrink_lruvec+0x11aa>	60b226: R_X86_64_PLT32	__tsan_read4-0x4
11aa   60b22a:	4c 8b ac 24 a8 00 00 00 	mov    0xa8(%rsp),%r13
11b2   60b232:	45 8b 7d 00          	mov    0x0(%r13),%r15d
11b6   60b236:	44 03 bc 24 00 01 00 00 	add    0x100(%rsp),%r15d
11be   60b23e:	4c 89 ef             	mov    %r13,%rdi
11c1   60b241:	e8 00 00 00 00       	call   60b246 <shrink_lruvec+0x11c6>	60b242: R_X86_64_PLT32	__tsan_read_write4-0x4
11c6   60b246:	45 89 7d 00          	mov    %r15d,0x0(%r13)
11ca   60b24a:	4c 8b ac 24 a0 00 00 00 	mov    0xa0(%rsp),%r13
11d2   60b252:	45 8b 7d 00          	mov    0x0(%r13),%r15d
11d6   60b256:	44 03 bc 24 08 01 00 00 	add    0x108(%rsp),%r15d
11de   60b25e:	4c 89 ef             	mov    %r13,%rdi
11e1   60b261:	e8 00 00 00 00       	call   60b266 <shrink_lruvec+0x11e6>	60b262: R_X86_64_PLT32	__tsan_read_write4-0x4
11e6   60b266:	45 89 7d 00          	mov    %r15d,0x0(%r13)
11ea   60b26a:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
11ef   60b26f:	41 03 1f             	add    (%r15),%ebx
11f2   60b272:	4c 89 ff             	mov    %r15,%rdi
11f5   60b275:	e8 00 00 00 00       	call   60b27a <shrink_lruvec+0x11fa>	60b276: R_X86_64_PLT32	__tsan_read_write4-0x4
11fa   60b27a:	41 89 1f             	mov    %ebx,(%r15)
11fd   60b27d:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
1202   60b282:	41 8b 1f             	mov    (%r15),%ebx
1205   60b285:	03 9c 24 0c 01 00 00 	add    0x10c(%rsp),%ebx
120c   60b28c:	4c 89 ff             	mov    %r15,%rdi
120f   60b28f:	e8 00 00 00 00       	call   60b294 <shrink_lruvec+0x1214>	60b290: R_X86_64_PLT32	__tsan_read_write4-0x4
1214   60b294:	41 89 1f             	mov    %ebx,(%r15)
1217   60b297:	4c 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%r15
121f   60b29f:	41 8b 1f             	mov    (%r15),%ebx
1222   60b2a2:	03 9c 24 10 01 00 00 	add    0x110(%rsp),%ebx
1229   60b2a9:	4c 89 ff             	mov    %r15,%rdi
122c   60b2ac:	e8 00 00 00 00       	call   60b2b1 <shrink_lruvec+0x1231>	60b2ad: R_X86_64_PLT32	__tsan_read_write4-0x4
1231   60b2b1:	41 89 1f             	mov    %ebx,(%r15)
1234   60b2b4:	4c 8b bc 24 48 01 00 00 	mov    0x148(%rsp),%r15
123c   60b2bc:	41 8b 1f             	mov    (%r15),%ebx
123f   60b2bf:	44 01 e3             	add    %r12d,%ebx
1242   60b2c2:	4c 89 ff             	mov    %r15,%rdi
1245   60b2c5:	e8 00 00 00 00       	call   60b2ca <shrink_lruvec+0x124a>	60b2c6: R_X86_64_PLT32	__tsan_read_write4-0x4
124a   60b2ca:	41 89 1f             	mov    %ebx,(%r15)
124d   60b2cd:	83 7c 24 44 02       	cmpl   $0x2,0x44(%rsp)
1252   60b2d2:	75 20                	jne    60b2f4 <shrink_lruvec+0x1274>
1254   60b2d4:	e8 00 00 00 00       	call   60b2d9 <shrink_lruvec+0x1259>	60b2d5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1259   60b2d9:	4c 8b bc 24 40 01 00 00 	mov    0x140(%rsp),%r15
1261   60b2e1:	41 8b 1f             	mov    (%r15),%ebx
1264   60b2e4:	44 01 e3             	add    %r12d,%ebx
1267   60b2e7:	4c 89 ff             	mov    %r15,%rdi
126a   60b2ea:	e8 00 00 00 00       	call   60b2ef <shrink_lruvec+0x126f>	60b2eb: R_X86_64_PLT32	__tsan_read_write4-0x4
126f   60b2ef:	41 89 1f             	mov    %ebx,(%r15)
1272   60b2f2:	eb 05                	jmp    60b2f9 <shrink_lruvec+0x1279>
1274   60b2f4:	e8 00 00 00 00       	call   60b2f9 <shrink_lruvec+0x1279>	60b2f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1279   60b2f9:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
127e   60b2fe:	48 8d bb 10 19 00 00 	lea    0x1910(%rbx),%rdi
1285   60b305:	e8 00 00 00 00       	call   60b30a <shrink_lruvec+0x128a>	60b306: R_X86_64_PLT32	__tsan_read4-0x4
128a   60b30a:	8b 9b 10 19 00 00    	mov    0x1910(%rbx),%ebx
1290   60b310:	4c 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%r15
1298   60b318:	4c 89 ff             	mov    %r15,%rdi
129b   60b31b:	e8 00 00 00 00       	call   60b320 <shrink_lruvec+0x12a0>	60b31c: R_X86_64_PLT32	__tsan_read1-0x4
12a0   60b320:	45 0f be 27          	movsbl (%r15),%r12d
12a4   60b324:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b327: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x8
12ab   60b32b:	e8 00 00 00 00       	call   60b330 <shrink_lruvec+0x12b0>	60b32c: R_X86_64_PLT32	__tsan_volatile_read4-0x4
12b0   60b330:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 60b337 <shrink_lruvec+0x12b7>	60b333: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x4
12b7   60b337:	31 ff                	xor    %edi,%edi
12b9   60b339:	44 89 fe             	mov    %r15d,%esi
12bc   60b33c:	e8 00 00 00 00       	call   60b341 <shrink_lruvec+0x12c1>	60b33d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
12c1   60b341:	45 85 ff             	test   %r15d,%r15d
12c4   60b344:	7e 54                	jle    60b39a <shrink_lruvec+0x131a>
12c6   60b346:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 60b34c <shrink_lruvec+0x12cc>	60b348: R_X86_64_PC32	pcpu_hot+0x4
12cc   60b34c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b34f: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x40
12d3   60b353:	e8 00 00 00 00       	call   60b358 <shrink_lruvec+0x12d8>	60b354: R_X86_64_PLT32	__tsan_volatile_read8-0x4
12d8   60b358:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 60b35f <shrink_lruvec+0x12df>	60b35b: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x3c
12df   60b35f:	4d 85 ff             	test   %r15,%r15
12e2   60b362:	74 46                	je     60b3aa <shrink_lruvec+0x132a>
12e4   60b364:	e8 00 00 00 00       	call   60b369 <shrink_lruvec+0x12e9>	60b365: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12e9   60b369:	49 8d 7f 08          	lea    0x8(%r15),%rdi
12ed   60b36d:	e8 00 00 00 00       	call   60b372 <shrink_lruvec+0x12f2>	60b36e: R_X86_64_PLT32	__tsan_read8-0x4
12f2   60b372:	49 8b 7f 08          	mov    0x8(%r15),%rdi
12f6   60b376:	89 de                	mov    %ebx,%esi
12f8   60b378:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
12fd   60b37d:	4c 89 f1             	mov    %r14,%rcx
1300   60b380:	4c 8d 84 24 00 01 00 00 	lea    0x100(%rsp),%r8
1308   60b388:	45 89 e1             	mov    %r12d,%r9d
130b   60b38b:	ff 74 24 58          	push   0x58(%rsp)
130f   60b38f:	e8 00 00 00 00       	call   60b394 <shrink_lruvec+0x1314>	60b390: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
1314   60b394:	48 83 c4 08          	add    $0x8,%rsp
1318   60b398:	eb 15                	jmp    60b3af <shrink_lruvec+0x132f>
131a   60b39a:	e8 00 00 00 00       	call   60b39f <shrink_lruvec+0x131f>	60b39b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
131f   60b39f:	4c 8b 24 24          	mov    (%rsp),%r12
1323   60b3a3:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1328   60b3a8:	eb 14                	jmp    60b3be <shrink_lruvec+0x133e>
132a   60b3aa:	e8 00 00 00 00       	call   60b3af <shrink_lruvec+0x132f>	60b3ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
132f   60b3af:	4c 8b 24 24          	mov    (%rsp),%r12
1333   60b3b3:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1338   60b3b8:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 60b3be <shrink_lruvec+0x133e>	60b3ba: R_X86_64_PC32	pcpu_hot+0x4
133e   60b3be:	4d 01 f7             	add    %r14,%r15
1341   60b3c1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
1346   60b3c6:	49 83 fd 03          	cmp    $0x3,%r13
134a   60b3ca:	0f 84 d7 00 00 00    	je     60b4a7 <shrink_lruvec+0x1427>
1350   60b3d0:	e8 00 00 00 00       	call   60b3d5 <shrink_lruvec+0x1355>	60b3d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1355   60b3d5:	49 ff c5             	inc    %r13
1358   60b3d8:	e9 82 f6 ff ff       	jmp    60aa5f <shrink_lruvec+0x9df>
135d   60b3dd:	e8 00 00 00 00       	call   60b3e2 <shrink_lruvec+0x1362>	60b3de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1362   60b3e2:	41 be 20 00 00 00    	mov    $0x20,%r14d
1368   60b3e8:	eb d4                	jmp    60b3be <shrink_lruvec+0x133e>
136a   60b3ea:	e8 00 00 00 00       	call   60b3ef <shrink_lruvec+0x136f>	60b3eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
136f   60b3ef:	4c 8b b4 24 d8 00 00 00 	mov    0xd8(%rsp),%r14
1377   60b3f7:	be 08 00 00 00       	mov    $0x8,%esi
137c   60b3fc:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
1381   60b401:	48 89 df             	mov    %rbx,%rdi
1384   60b404:	ba 04 00 00 00       	mov    $0x4,%edx
1389   60b409:	e8 00 00 00 00       	call   60b40e <shrink_lruvec+0x138e>	60b40a: R_X86_64_PLT32	__kcsan_check_access-0x4
138e   60b40e:	48 89 df             	mov    %rbx,%rdi
1391   60b411:	e8 00 00 00 00       	call   60b416 <shrink_lruvec+0x1396>	60b412: R_X86_64_PLT32	__tsan_volatile_read8-0x4
1396   60b416:	4c 8b 23             	mov    (%rbx),%r12
1399   60b419:	be 08 00 00 00       	mov    $0x8,%esi
139e   60b41e:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
13a3   60b423:	48 89 df             	mov    %rbx,%rdi
13a6   60b426:	ba 04 00 00 00       	mov    $0x4,%edx
13ab   60b42b:	e8 00 00 00 00       	call   60b430 <shrink_lruvec+0x13b0>	60b42c: R_X86_64_PLT32	__kcsan_check_access-0x4
13b0   60b430:	48 89 df             	mov    %rbx,%rdi
13b3   60b433:	e8 00 00 00 00       	call   60b438 <shrink_lruvec+0x13b8>	60b434: R_X86_64_PLT32	__tsan_volatile_read8-0x4
13b8   60b438:	49 8b 9e 00 00 00 00 	mov    0x0(%r14),%rbx	60b43b: R_X86_64_32S	vm_node_stat
13bf   60b43f:	4c 8b b4 24 e0 00 00 00 	mov    0xe0(%rsp),%r14
13c7   60b447:	4c 89 f7             	mov    %r14,%rdi
13ca   60b44a:	e8 00 00 00 00       	call   60b44f <shrink_lruvec+0x13cf>	60b44b: R_X86_64_PLT32	__tsan_read4-0x4
13cf   60b44f:	45 8b 36             	mov    (%r14),%r14d
13d2   60b452:	b8 c0 00 00 00       	mov    $0xc0,%eax
13d7   60b457:	41 21 c6             	and    %eax,%r14d
13da   60b45a:	bf c0 00 00 00       	mov    $0xc0,%edi
13df   60b45f:	44 89 f6             	mov    %r14d,%esi
13e2   60b462:	e8 00 00 00 00       	call   60b467 <shrink_lruvec+0x13e7>	60b463: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
13e7   60b467:	4d 89 e7             	mov    %r12,%r15
13ea   60b46a:	49 c1 ef 03          	shr    $0x3,%r15
13ee   60b46e:	41 81 fe c0 00 00 00 	cmp    $0xc0,%r14d
13f5   60b475:	4d 0f 45 fc          	cmovne %r12,%r15
13f9   60b479:	48 89 df             	mov    %rbx,%rdi
13fc   60b47c:	4c 89 fe             	mov    %r15,%rsi
13ff   60b47f:	e8 00 00 00 00       	call   60b484 <shrink_lruvec+0x1404>	60b480: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1404   60b484:	4c 39 fb             	cmp    %r15,%rbx
1407   60b487:	76 0a                	jbe    60b493 <shrink_lruvec+0x1413>
1409   60b489:	e8 00 00 00 00       	call   60b48e <shrink_lruvec+0x140e>	60b48a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
140e   60b48e:	e9 22 fc ff ff       	jmp    60b0b5 <shrink_lruvec+0x1035>
1413   60b493:	e8 00 00 00 00       	call   60b498 <shrink_lruvec+0x1418>	60b494: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1418   60b498:	e9 f0 f8 ff ff       	jmp    60ad8d <shrink_lruvec+0xd0d>
141d   60b49d:	e8 00 00 00 00       	call   60b4a2 <shrink_lruvec+0x1422>	60b49e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1422   60b4a2:	e9 09 fa ff ff       	jmp    60aeb0 <shrink_lruvec+0xe30>
1427   60b4a7:	e8 00 00 00 00       	call   60b4ac <shrink_lruvec+0x142c>	60b4a8: R_X86_64_PLT32	__cond_resched-0x4
142c   60b4ac:	4c 89 ff             	mov    %r15,%rdi
142f   60b4af:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
1437   60b4b7:	48 89 de             	mov    %rbx,%rsi
143a   60b4ba:	e8 00 00 00 00       	call   60b4bf <shrink_lruvec+0x143f>	60b4bb: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
143f   60b4bf:	49 39 df             	cmp    %rbx,%r15
1442   60b4c2:	0f 92 c0             	setb   %al
1445   60b4c5:	0a 44 24 6c          	or     0x6c(%rsp),%al
1449   60b4c9:	3c 01                	cmp    $0x1,%al
144b   60b4cb:	0f 84 25 f5 ff ff    	je     60a9f6 <shrink_lruvec+0x976>
1451   60b4d1:	4c 89 7c 24 20       	mov    %r15,0x20(%rsp)
1456   60b4d6:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
145e   60b4de:	4c 8b b4 24 c8 00 00 00 	mov    0xc8(%rsp),%r14
1466   60b4e6:	48 03 9c 24 b0 00 00 00 	add    0xb0(%rsp),%rbx
146e   60b4ee:	4c 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%r15
1476   60b4f6:	4b 8d 34 3e          	lea    (%r14,%r15,1),%rsi
147a   60b4fa:	31 ff                	xor    %edi,%edi
147c   60b4fc:	e8 00 00 00 00       	call   60b501 <shrink_lruvec+0x1481>	60b4fd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1481   60b501:	31 ff                	xor    %edi,%edi
1483   60b503:	48 89 de             	mov    %rbx,%rsi
1486   60b506:	e8 00 00 00 00       	call   60b50b <shrink_lruvec+0x148b>	60b507: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
148b   60b50b:	4d 01 fe             	add    %r15,%r14
148e   60b50e:	0f 84 42 01 00 00    	je     60b656 <shrink_lruvec+0x15d6>
1494   60b514:	48 85 db             	test   %rbx,%rbx
1497   60b517:	0f 84 39 01 00 00    	je     60b656 <shrink_lruvec+0x15d6>
149d   60b51d:	4c 89 f7             	mov    %r14,%rdi
14a0   60b520:	48 89 de             	mov    %rbx,%rsi
14a3   60b523:	e8 00 00 00 00       	call   60b528 <shrink_lruvec+0x14a8>	60b524: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
14a8   60b528:	49 39 de             	cmp    %rbx,%r14
14ab   60b52b:	76 20                	jbe    60b54d <shrink_lruvec+0x14cd>
14ad   60b52d:	e8 00 00 00 00       	call   60b532 <shrink_lruvec+0x14b2>	60b52e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14b2   60b532:	45 31 ed             	xor    %r13d,%r13d
14b5   60b535:	41 bc 02 00 00 00    	mov    $0x2,%r12d
14bb   60b53b:	4c 8b b4 24 50 01 00 00 	mov    0x150(%rsp),%r14
14c3   60b543:	4c 8d bc 24 58 01 00 00 	lea    0x158(%rsp),%r15
14cb   60b54b:	eb 24                	jmp    60b571 <shrink_lruvec+0x14f1>
14cd   60b54d:	e8 00 00 00 00       	call   60b552 <shrink_lruvec+0x14d2>	60b54e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14d2   60b552:	41 bd 02 00 00 00    	mov    $0x2,%r13d
14d8   60b558:	45 31 e4             	xor    %r12d,%r12d
14db   60b55b:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
14e3   60b563:	4c 8d bc 24 68 01 00 00 	lea    0x168(%rsp),%r15
14eb   60b56b:	4c 89 f3             	mov    %r14,%rbx
14ee   60b56e:	49 89 c6             	mov    %rax,%r14
14f1   60b571:	4c 89 ff             	mov    %r15,%rdi
14f4   60b574:	e8 00 00 00 00       	call   60b579 <shrink_lruvec+0x14f9>	60b575: R_X86_64_PLT32	__tsan_read8-0x4
14f9   60b579:	49 8b 07             	mov    (%r15),%rax
14fc   60b57c:	49 8d 0c 06          	lea    (%r14,%rax,1),%rcx
1500   60b580:	48 ff c1             	inc    %rcx
1503   60b583:	48 6b c3 64          	imul   $0x64,%rbx,%rax
1507   60b587:	48 89 c2             	mov    %rax,%rdx
150a   60b58a:	48 09 ca             	or     %rcx,%rdx
150d   60b58d:	48 c1 ea 20          	shr    $0x20,%rdx
1511   60b591:	74 07                	je     60b59a <shrink_lruvec+0x151a>
1513   60b593:	31 d2                	xor    %edx,%edx
1515   60b595:	48 f7 f1             	div    %rcx
1518   60b598:	eb 04                	jmp    60b59e <shrink_lruvec+0x151e>
151a   60b59a:	31 d2                	xor    %edx,%edx
151c   60b59c:	f7 f1                	div    %ecx
151e   60b59e:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
1523   60b5a3:	b9 64 00 00 00       	mov    $0x64,%ecx
1528   60b5a8:	44 89 ea             	mov    %r13d,%edx
152b   60b5ab:	48 c7 84 d4 b0 00 00 00 00 00 00 00 	movq   $0x0,0xb0(%rsp,%rdx,8)
1537   60b5b7:	41 83 cd 01          	or     $0x1,%r13d
153b   60b5bb:	4a c7 84 ec b0 00 00 00 00 00 00 00 	movq   $0x0,0xb0(%rsp,%r13,8)
1547   60b5c7:	44 89 e6             	mov    %r12d,%esi
154a   60b5ca:	48 8b 94 f4 50 01 00 00 	mov    0x150(%rsp,%rsi,8),%rdx
1552   60b5d2:	48 89 d7             	mov    %rdx,%rdi
1555   60b5d5:	48 2b bc f4 b0 00 00 00 	sub    0xb0(%rsp,%rsi,8),%rdi
155d   60b5dd:	48 29 c1             	sub    %rax,%rcx
1560   60b5e0:	48 0f af d1          	imul   %rcx,%rdx
1564   60b5e4:	48 c1 ea 02          	shr    $0x2,%rdx
1568   60b5e8:	48 89 d0             	mov    %rdx,%rax
156b   60b5eb:	49 b8 c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%r8
1575   60b5f5:	49 f7 e0             	mul    %r8
1578   60b5f8:	48 c1 ea 02          	shr    $0x2,%rdx
157c   60b5fc:	48 29 fa             	sub    %rdi,%rdx
157f   60b5ff:	bf 00 00 00 00       	mov    $0x0,%edi
1584   60b604:	48 0f 42 d7          	cmovb  %rdi,%rdx
1588   60b608:	48 89 94 f4 b0 00 00 00 	mov    %rdx,0xb0(%rsp,%rsi,8)
1590   60b610:	41 83 cc 01          	or     $0x1,%r12d
1594   60b614:	4a 8b 84 e4 50 01 00 00 	mov    0x150(%rsp,%r12,8),%rax
159c   60b61c:	48 0f af c8          	imul   %rax,%rcx
15a0   60b620:	48 89 c6             	mov    %rax,%rsi
15a3   60b623:	4a 2b b4 e4 b0 00 00 00 	sub    0xb0(%rsp,%r12,8),%rsi
15ab   60b62b:	48 c1 e9 02          	shr    $0x2,%rcx
15af   60b62f:	48 89 c8             	mov    %rcx,%rax
15b2   60b632:	49 f7 e0             	mul    %r8
15b5   60b635:	48 c1 ea 02          	shr    $0x2,%rdx
15b9   60b639:	48 29 f2             	sub    %rsi,%rdx
15bc   60b63c:	48 0f 42 d7          	cmovb  %rdi,%rdx
15c0   60b640:	4a 89 94 e4 b0 00 00 00 	mov    %rdx,0xb0(%rsp,%r12,8)
15c8   60b648:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
15cd   60b64d:	4c 8b 24 24          	mov    (%rsp),%r12
15d1   60b651:	e9 aa f3 ff ff       	jmp    60aa00 <shrink_lruvec+0x980>
15d6   60b656:	e8 00 00 00 00       	call   60b65b <shrink_lruvec+0x15db>	60b657: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15db   60b65b:	4c 8b 7c 24 20       	mov    0x20(%rsp),%r15
15e0   60b660:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
15e5   60b665:	eb 05                	jmp    60b66c <shrink_lruvec+0x15ec>
15e7   60b667:	e8 00 00 00 00       	call   60b66c <shrink_lruvec+0x15ec>	60b668: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15ec   60b66c:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
15f4   60b674:	e8 00 00 00 00       	call   60b679 <shrink_lruvec+0x15f9>	60b675: R_X86_64_PLT32	blk_finish_plug-0x4
15f9   60b679:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
15fe   60b67e:	48 8d 7b 40          	lea    0x40(%rbx),%rdi
1602   60b682:	4c 03 7b 40          	add    0x40(%rbx),%r15
1606   60b686:	e8 00 00 00 00       	call   60b68b <shrink_lruvec+0x160b>	60b687: R_X86_64_PLT32	__tsan_read_write8-0x4
160b   60b68b:	4c 89 7b 40          	mov    %r15,0x40(%rbx)
160f   60b68f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b692: R_X86_64_32S	total_swap_pages
1616   60b696:	e8 00 00 00 00       	call   60b69b <shrink_lruvec+0x161b>	60b697: R_X86_64_PLT32	__tsan_read8-0x4
161b   60b69b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 60b6a2 <shrink_lruvec+0x1622>	60b69e: R_X86_64_PC32	total_swap_pages-0x4
1622   60b6a2:	31 ff                	xor    %edi,%edi
1624   60b6a4:	48 89 de             	mov    %rbx,%rsi
1627   60b6a7:	e8 00 00 00 00       	call   60b6ac <shrink_lruvec+0x162c>	60b6a8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
162c   60b6ac:	48 85 db             	test   %rbx,%rbx
162f   60b6af:	7e 30                	jle    60b6e1 <shrink_lruvec+0x1661>
1631   60b6b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b6b4: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1638   60b6b8:	e8 00 00 00 00       	call   60b6bd <shrink_lruvec+0x163d>	60b6b9: R_X86_64_PLT32	__tsan_volatile_read4-0x4
163d   60b6bd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60b6c3 <shrink_lruvec+0x1643>	60b6bf: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
1643   60b6c3:	bf 01 00 00 00       	mov    $0x1,%edi
1648   60b6c8:	89 de                	mov    %ebx,%esi
164a   60b6ca:	e8 00 00 00 00       	call   60b6cf <shrink_lruvec+0x164f>	60b6cb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
164f   60b6cf:	85 db                	test   %ebx,%ebx
1651   60b6d1:	7e 18                	jle    60b6eb <shrink_lruvec+0x166b>
1653   60b6d3:	e8 00 00 00 00       	call   60b6d8 <shrink_lruvec+0x1658>	60b6d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1658   60b6d8:	49 8d 9d d0 00 00 00 	lea    0xd0(%r13),%rbx
165f   60b6df:	eb 2c                	jmp    60b70d <shrink_lruvec+0x168d>
1661   60b6e1:	e8 00 00 00 00       	call   60b6e6 <shrink_lruvec+0x1666>	60b6e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1666   60b6e6:	e9 01 01 00 00       	jmp    60b7ec <shrink_lruvec+0x176c>
166b   60b6eb:	e8 00 00 00 00       	call   60b6f0 <shrink_lruvec+0x1670>	60b6ec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1670   60b6f0:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	60b6f3: R_X86_64_32S	vm_node_stat
1677   60b6f7:	be 08 00 00 00       	mov    $0x8,%esi
167c   60b6fc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b6ff: R_X86_64_32S	vm_node_stat
1683   60b703:	ba 04 00 00 00       	mov    $0x4,%edx
1688   60b708:	e8 00 00 00 00       	call   60b70d <shrink_lruvec+0x168d>	60b709: R_X86_64_PLT32	__kcsan_check_access-0x4
168d   60b70d:	48 89 df             	mov    %rbx,%rdi
1690   60b710:	e8 00 00 00 00       	call   60b715 <shrink_lruvec+0x1695>	60b711: R_X86_64_PLT32	__tsan_volatile_read8-0x4
1695   60b715:	4c 8b 3b             	mov    (%rbx),%r15
1698   60b718:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b71b: R_X86_64_32S	memory_cgrp_subsys_enabled_key
169f   60b71f:	e8 00 00 00 00       	call   60b724 <shrink_lruvec+0x16a4>	60b720: R_X86_64_PLT32	__tsan_volatile_read4-0x4
16a4   60b724:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 60b72a <shrink_lruvec+0x16aa>	60b726: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
16aa   60b72a:	bf 01 00 00 00       	mov    $0x1,%edi
16af   60b72f:	89 de                	mov    %ebx,%esi
16b1   60b731:	e8 00 00 00 00       	call   60b736 <shrink_lruvec+0x16b6>	60b732: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
16b6   60b736:	85 db                	test   %ebx,%ebx
16b8   60b738:	7e 0e                	jle    60b748 <shrink_lruvec+0x16c8>
16ba   60b73a:	e8 00 00 00 00       	call   60b73f <shrink_lruvec+0x16bf>	60b73b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16bf   60b73f:	49 8d 9d d8 00 00 00 	lea    0xd8(%r13),%rbx
16c6   60b746:	eb 22                	jmp    60b76a <shrink_lruvec+0x16ea>
16c8   60b748:	e8 00 00 00 00       	call   60b74d <shrink_lruvec+0x16cd>	60b749: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16cd   60b74d:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	60b750: R_X86_64_32S	vm_node_stat+0x8
16d4   60b754:	be 08 00 00 00       	mov    $0x8,%esi
16d9   60b759:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	60b75c: R_X86_64_32S	vm_node_stat+0x8
16e0   60b760:	ba 04 00 00 00       	mov    $0x4,%edx
16e5   60b765:	e8 00 00 00 00       	call   60b76a <shrink_lruvec+0x16ea>	60b766: R_X86_64_PLT32	__kcsan_check_access-0x4
16ea   60b76a:	48 89 df             	mov    %rbx,%rdi
16ed   60b76d:	e8 00 00 00 00       	call   60b772 <shrink_lruvec+0x16f2>	60b76e: R_X86_64_PLT32	__tsan_volatile_read8-0x4
16f2   60b772:	48 8b 1b             	mov    (%rbx),%rbx
16f5   60b775:	4e 8d 34 3b          	lea    (%rbx,%r15,1),%r14
16f9   60b779:	bf 00 00 04 00       	mov    $0x40000,%edi
16fe   60b77e:	4c 89 f6             	mov    %r14,%rsi
1701   60b781:	e8 00 00 00 00       	call   60b786 <shrink_lruvec+0x1706>	60b782: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1706   60b786:	49 81 fe ff ff 03 00 	cmp    $0x3ffff,%r14
170d   60b78d:	77 0d                	ja     60b79c <shrink_lruvec+0x171c>
170f   60b78f:	e8 00 00 00 00       	call   60b794 <shrink_lruvec+0x1714>	60b790: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1714   60b794:	41 be 01 00 00 00    	mov    $0x1,%r14d
171a   60b79a:	eb 19                	jmp    60b7b5 <shrink_lruvec+0x1735>
171c   60b79c:	e8 00 00 00 00       	call   60b7a1 <shrink_lruvec+0x1721>	60b79d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1721   60b7a1:	49 c1 ee 11          	shr    $0x11,%r14
1725   60b7a5:	49 83 e6 fe          	and    $0xfffffffffffffffe,%r14
1729   60b7a9:	4b 8d 3c b6          	lea    (%r14,%r14,4),%rdi
172d   60b7ad:	e8 00 00 00 00       	call   60b7b2 <shrink_lruvec+0x1732>	60b7ae: R_X86_64_PLT32	int_sqrt-0x4
1732   60b7b2:	49 89 c6             	mov    %rax,%r14
1735   60b7b5:	4d 0f af f7          	imul   %r15,%r14
1739   60b7b9:	4c 89 f7             	mov    %r14,%rdi
173c   60b7bc:	48 89 de             	mov    %rbx,%rsi
173f   60b7bf:	e8 00 00 00 00       	call   60b7c4 <shrink_lruvec+0x1744>	60b7c0: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1744   60b7c4:	49 39 de             	cmp    %rbx,%r14
1747   60b7c7:	73 1e                	jae    60b7e7 <shrink_lruvec+0x1767>
1749   60b7c9:	e8 00 00 00 00       	call   60b7ce <shrink_lruvec+0x174e>	60b7ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
174e   60b7ce:	bf 20 00 00 00       	mov    $0x20,%edi
1753   60b7d3:	4c 89 ee             	mov    %r13,%rsi
1756   60b7d6:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
175b   60b7db:	b9 01 00 00 00       	mov    $0x1,%ecx
1760   60b7e0:	e8 1b 5b 00 00       	call   611300 <shrink_active_list>
1765   60b7e5:	eb 05                	jmp    60b7ec <shrink_lruvec+0x176c>
1767   60b7e7:	e8 00 00 00 00       	call   60b7ec <shrink_lruvec+0x176c>	60b7e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
176c   60b7ec:	e8 00 00 00 00       	call   60b7f1 <shrink_lruvec+0x1771>	60b7ed: R_X86_64_PLT32	__tsan_func_exit-0x4
1771   60b7f1:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
1775   60b7f5:	5b                   	pop    %rbx
1776   60b7f6:	41 5c                	pop    %r12
1778   60b7f8:	41 5d                	pop    %r13
177a   60b7fa:	41 5e                	pop    %r14
177c   60b7fc:	41 5f                	pop    %r15
177e   60b7fe:	5d                   	pop    %rbp
177f   60b7ff:	31 c0                	xor    %eax,%eax
1781   60b801:	31 c9                	xor    %ecx,%ecx
1783   60b803:	31 ff                	xor    %edi,%edi
1785   60b805:	31 d2                	xor    %edx,%edx
1787   60b807:	31 f6                	xor    %esi,%esi
1789   60b809:	45 31 c0             	xor    %r8d,%r8d
178c   60b80c:	45 31 c9             	xor    %r9d,%r9d
178f   60b80f:	c3                   	ret
1790   60b810:	31 d2                	xor    %edx,%edx
1792   60b812:	f7 f6                	div    %esi
1794   60b814:	89 c6                	mov    %eax,%esi
1796   60b816:	b8 c8 00 00 00       	mov    $0xc8,%eax
179b   60b81b:	29 d8                	sub    %ebx,%eax
179d   60b81d:	48 98                	cltq
179f   60b81f:	48 0f af c8          	imul   %rax,%rcx
17a3   60b823:	48 89 c8             	mov    %rcx,%rax
17a6   60b826:	48 09 f8             	or     %rdi,%rax
17a9   60b829:	48 c1 e8 20          	shr    $0x20,%rax
17ad   60b82d:	74 0a                	je     60b839 <shrink_lruvec+0x17b9>
17af   60b82f:	48 89 c8             	mov    %rcx,%rax
17b2   60b832:	31 d2                	xor    %edx,%edx
17b4   60b834:	48 f7 f7             	div    %rdi
17b7   60b837:	eb 06                	jmp    60b83f <shrink_lruvec+0x17bf>
17b9   60b839:	89 c8                	mov    %ecx,%eax
17bb   60b83b:	31 d2                	xor    %edx,%edx
17bd   60b83d:	f7 f7                	div    %edi
17bf   60b83f:	48 89 b4 24 00 01 00 00 	mov    %rsi,0x100(%rsp)
17c7   60b847:	48 89 84 24 08 01 00 00 	mov    %rax,0x108(%rsp)
17cf   60b84f:	48 01 f0             	add    %rsi,%rax
17d2   60b852:	bf 01 00 00 00       	mov    $0x1,%edi
17d7   60b857:	31 c9                	xor    %ecx,%ecx
17d9   60b859:	e9 e9 ea ff ff       	jmp    60a347 <shrink_lruvec+0x2c7>
17de   60b85e:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
17ed   60b86d:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
17fc   60b87c:	0f 1f 40 00          	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
