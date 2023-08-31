Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12BF5399;
	Thu, 31 Aug 2023 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693516571; x=1725052571;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jgMCDHgsumRAMZTagsmXFaKoVWTjxA4sZxzkELYDGOk=;
  b=Urpy1w/30WIpp6FmDoK3VYDhj4Mt/gt32FCJmys3kHSSDJ3HAgRthDS4
   2YUFCJGTQ8RuCql2TN6FyentShLdMytMSdEzEAcedsR9KW9onDMDJIUPv
   JI16fgCQ/4kzC8hWAdnB0RulkdL72qPQF3FWjP0G/cab96s65jaC1PEye
   N+wwFeHNToCc+SJChCdR4a53yQlNB03Wzu5rfL0Y1RkdIvZDD0xfSM+vQ
   pgyEAji+CNhKiFXUwozbrAr+2E07ce2CzQv/hbw1FweJxRpDF+Y32ez7o
   rETshFCQmiwTVnsSeOD3Cvrom+z7+qh/KouMeNe01ZDkorGOl1p4N1SSe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462430906"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="462430906"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986405924"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="986405924"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 14:16:07 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbp1I-0000YR-34;
	Thu, 31 Aug 2023 21:16:04 +0000
Date: Fri, 1 Sep 2023 05:16:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x27: relocation to
 !ENDBR: kexec_mark_crashkres+0x1e
Message-ID: <202309010523.QPeXJq0g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Simon Horman <horms@kernel.org>

Hi Bjorn,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87dfd85c38923acd9517e8df4afc908565df0961
commit: 7982722ff7286596a1e2f343ec4219e309ddc82a x86/kexec: remove unnecessary arch_kexec_kernel_image_load()
date:   5 months ago
config: x86_64-buildonly-randconfig-006-20230901 (https://download.01.org/0day-ci/archive/20230901/202309010523.QPeXJq0g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010523.QPeXJq0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010523.QPeXJq0g-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __svm_vcpu_run+0x140: BP used as a scratch register
   vmlinux.o: warning: objtool: __svm_sev_es_vcpu_run+0x36: BP used as a scratch register
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x27: relocation to !ENDBR: kexec_mark_crashkres+0x1e
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3d: relocation to !ENDBR: arch_kexec_apply_relocations_add+0x1ff
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xfd: relocation to !ENDBR: native_write_cr4+0x4
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0x113: relocation to !ENDBR: native_write_cr4+0x5


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 00000000001426d5 <set_ftrace_ops_ro>:
0000   1426d5:	f3 0f 1e fa          	endbr64
0004   1426d9:	55                   	push   %rbp
0005   1426da:	48 89 e5             	mov    %rsp,%rbp
0008   1426dd:	41 57                	push   %r15
000a   1426df:	41 56                	push   %r14
000c   1426e1:	41 54                	push   %r12
000e   1426e3:	53                   	push   %rbx
000f   1426e4:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 1426eb <set_ftrace_ops_ro+0x16>	1426e7: R_X86_64_PC32	ftrace_ops_list-0x4
0016   1426eb:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	1426ee: R_X86_64_32S	ftrace_list_end
001d   1426f2:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1426f5: R_X86_64_32S	ftrace_regs_caller
0024   1426f9:	48 f7 d8             	neg    %rax
0027   1426fc:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	142700: R_X86_64_32S	ftrace_regs_caller_end+0x1008
002f   142704:	49 c1 ef 0c          	shr    $0xc,%r15
0033   142708:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	14270b: R_X86_64_32S	ftrace_caller
003a   14270f:	48 f7 d8             	neg    %rax
003d   142712:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	142716: R_X86_64_32S	ftrace_caller_end+0x1008
0045   14271a:	49 c1 ec 0c          	shr    $0xc,%r12
0049   14271e:	48 8b 43 10          	mov    0x10(%rbx),%rax
004d   142722:	0f ba e0 0b          	bt     $0xb,%eax
0051   142726:	73 15                	jae    14273d <set_ftrace_ops_ro+0x68>
0053   142728:	a8 04                	test   $0x4,%al
0055   14272a:	48 8b bb 80 00 00 00 	mov    0x80(%rbx),%rdi
005c   142731:	44 89 fe             	mov    %r15d,%esi
005f   142734:	41 0f 44 f4          	cmove  %r12d,%esi
0063   142738:	e8 00 00 00 00       	call   14273d <set_ftrace_ops_ro+0x68>	142739: R_X86_64_PLT32	set_memory_ro-0x4
0068   14273d:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
006c   142741:	31 f6                	xor    %esi,%esi
006e   142743:	48 85 db             	test   %rbx,%rbx
0071   142746:	40 0f 95 c6          	setne  %sil
0075   14274a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	14274d: R_X86_64_32S	_ftrace_annotated_branch+0x29160
007c   142751:	ba 01 00 00 00       	mov    $0x1,%edx
0081   142756:	31 c9                	xor    %ecx,%ecx
0083   142758:	e8 00 00 00 00       	call   14275d <set_ftrace_ops_ro+0x88>	142759: R_X86_64_PLT32	ftrace_likely_update-0x4
0088   14275d:	48 85 db             	test   %rbx,%rbx
008b   142760:	74 1e                	je     142780 <set_ftrace_ops_ro+0xab>
008d   142762:	31 f6                	xor    %esi,%esi
008f   142764:	4c 39 f3             	cmp    %r14,%rbx
0092   142767:	40 0f 95 c6          	setne  %sil
0096   14276b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	14276e: R_X86_64_32S	_ftrace_annotated_branch+0x29190
009d   142772:	31 d2                	xor    %edx,%edx
009f   142774:	31 c9                	xor    %ecx,%ecx
00a1   142776:	e8 00 00 00 00       	call   14277b <set_ftrace_ops_ro+0xa6>	142777: R_X86_64_PLT32	ftrace_likely_update-0x4
00a6   14277b:	4c 39 f3             	cmp    %r14,%rbx
00a9   14277e:	75 9e                	jne    14271e <set_ftrace_ops_ro+0x49>
00ab   142780:	5b                   	pop    %rbx
00ac   142781:	41 5c                	pop    %r12
00ae   142783:	41 5e                	pop    %r14
00b0   142785:	41 5f                	pop    %r15
00b2   142787:	5d                   	pop    %rbp
00b3   142788:	31 c0                	xor    %eax,%eax
00b5   14278a:	31 c9                	xor    %ecx,%ecx
00b7   14278c:	31 ff                	xor    %edi,%edi
00b9   14278e:	31 d2                	xor    %edx,%edx
00bb   142790:	31 f6                	xor    %esi,%esi
00bd   142792:	c3                   	ret
00be   142793:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
