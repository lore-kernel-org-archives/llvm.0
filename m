Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1440BF8;
	Thu,  7 Dec 2023 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEFHDEQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701957048; x=1733493048;
  h=date:from:cc:subject:message-id:mime-version;
  bh=k+f3OZpmCLtnLbHqadNXpNqqOnHD5nx6njBDd5aKZxw=;
  b=PEFHDEQ0IAvPIDGLUPrc74hMogP3Q/eHEFQBSrglxGpgW5KM8Lzdh8kM
   sxFoJTnI6sliVGf8Nj3p6szrqZ68B795B1yPwviJq7eR8wSBv/wy507ta
   xWR9Evm0EdTQOgJt/r6GeCKxWAUho+8Ur4wKToa2b6+0e9mMD81Ycae/R
   BX/MlyKJvVwR8wlb0g6Xjn+ZmxfWf+B7x1+AwtBUWgYm0wMWPmTdQAOoE
   sZL3895+CBwh2oSS/JF3OzIzTLRtfpOwIulxSXwYcooqLSlZXwOUKFcRM
   V8IOyelq2w7ZJ+60FFfmwyDT340VOidosp4m8H9FoVE+hY+1kko7hmRwQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="374397069"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="374397069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 05:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775412309"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="775412309"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2023 05:50:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBEm4-000CJS-0m;
	Thu, 07 Dec 2023 13:50:44 +0000
Date: Thu, 7 Dec 2023 21:50:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 7/11] vmlinux.o: warning: objtool:
 ftrace_regs_caller+0x194: unannotated intra-function call
Message-ID: <202312072151.lvbfkK0B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: a150ba8e3e8f68327fb4d6a2ea801313e653ac63 [7/11] objtool: Convert ANNOTATE_INTRA_FUNCTION_CALLS to ANNOTATE
config: x86_64-buildonly-randconfig-005-20231202 (https://download.01.org/0day-ci/archive/20231207/202312072151.lvbfkK0B-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072151.lvbfkK0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072151.lvbfkK0B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ftrace_regs_caller+0x194: unannotated intra-function call


objdump-func vmlinux.o ftrace_regs_caller:
0000 000000000006c4d0 <ftrace_regs_caller>:
0000    6c4d0:	f3 0f 1e fa          	endbr64
0004    6c4d4:	9c                   	pushf
0005    6c4d5:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
000c    6c4dc:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0011    6c4e1:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
0016    6c4e6:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
001b    6c4eb:	48 89 74 24 68       	mov    %rsi,0x68(%rsp)
0020    6c4f0:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
0025    6c4f5:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
002a    6c4fa:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
002f    6c4ff:	48 c7 44 24 78 00 00 00 00 	movq   $0x0,0x78(%rsp)
0038    6c508:	48 89 ea             	mov    %rbp,%rdx
003b    6c50b:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
0040    6c510:	48 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%rsi
0048    6c518:	48 8b bc 24 b0 00 00 00 	mov    0xb0(%rsp),%rdi
0050    6c520:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
0058    6c528:	48 83 ef 05          	sub    $0x5,%rdi
0000 000000000006c52c <ftrace_regs_caller_op_ptr>:
0000    6c52c:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 6c533 <ftrace_regs_caller_op_ptr+0x7>	6c52f: R_X86_64_PC32	function_trace_op-0x4
0007    6c533:	4c 89 3c 24          	mov    %r15,(%rsp)
000b    6c537:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
0010    6c53c:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
0015    6c541:	4c 89 64 24 18       	mov    %r12,0x18(%rsp)
001a    6c546:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
001f    6c54b:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
0024    6c550:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0029    6c555:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
0031    6c55d:	48 89 8c 24 90 00 00 00 	mov    %rcx,0x90(%rsp)
0039    6c565:	48 c7 c1 18 00 00 00 	mov    $0x18,%rcx
0040    6c56c:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
0048    6c574:	48 c7 c1 10 00 00 00 	mov    $0x10,%rcx
004f    6c57b:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
0057    6c583:	48 8d 8c 24 b8 00 00 00 	lea    0xb8(%rsp),%rcx
005f    6c58b:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
0067    6c593:	48 8d 0c 24          	lea    (%rsp),%rcx
0000 000000000006c5e9 <ftrace_regs_caller_jmp>:
0000    6c5e9:	75 31                	jne    6c61c <ftrace_regs_caller_end+0x1>
0002    6c5eb:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
0007    6c5f0:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
000c    6c5f5:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
0011    6c5fa:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
0016    6c5ff:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
001b    6c604:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
0020    6c609:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
0025    6c60e:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
002a    6c613:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
0031    6c61a:	9d                   	popf
0000 000000000006c61b <ftrace_regs_caller_end>:
0000    6c61b:	c3                   	ret
0001    6c61c:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
0009    6c624:	48 89 bc 24 a0 00 00 00 	mov    %rdi,0xa0(%rsp)
0011    6c62c:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
0019    6c634:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
001e    6c639:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
0023    6c63e:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
0028    6c643:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
002d    6c648:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
0032    6c64d:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
0037    6c652:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
003c    6c657:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0041    6c65c:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
0048    6c663:	9d                   	popf
0049    6c664:	e8 01 00 00 00       	call   6c66a <ftrace_regs_caller_end+0x4f>
004e    6c669:	cc                   	int3
004f    6c66a:	48 83 c4 08          	add    $0x8,%rsp
0053    6c66e:	c3                   	ret
0054    6c66f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
