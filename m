Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C5C129;
	Sat, 23 Mar 2024 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711184217; cv=none; b=keTLOOn6aXwXemARfGGlnysMh4R9CFtwPBOHMhX2kUmEsDqYDoHV6pd0/quKm4o66mRro1ixpPE8uafF7EXmOyuV4ZJ+c1RA8wxAF/w7bDyqPDhBxm3BBEMvTdppDj4Y8xTcCB66amyEhS/OsjyMwlz7URDZd5Y6Wla+OYchVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711184217; c=relaxed/simple;
	bh=yghlkVlIZIPJklJIGF7udiZw66Cf95iANjgDkhz2KIE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKNh+Uq7qkwXwaldMkjI3uiGeyYH+CuUFa4qn4USFNKNocAwmp9NIvh/KLW3T0cjsn+c6WEem9EPzRcRWIBEt3pINgbz70VcGaL1yjLXfjh0w5sQlNGn+nVboqEm9XLvJCumKYYo5lMxM2bnzjeBF52V1vIB6E8HwzLdJZyto7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpR1+M6s; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpR1+M6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711184215; x=1742720215;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yghlkVlIZIPJklJIGF7udiZw66Cf95iANjgDkhz2KIE=;
  b=OpR1+M6swQsyLcqvBx76AVHw6l5ZkwOeT4G095Hl55OSIJL6hj++41g8
   Yh5+axJOFsLZxordo3y+CVTCVBpFSuiZPbVcWWnKf4LxjIWqgWyF5pCif
   vVmkKAEfgmavC9w5p28NR4y1+Hb3B3E91Jgn5R0QK2iXuqEYt9Em5h9pW
   fgo3vaydE9NmQnDRXbQxTbT1d3CGgxYnrLV9rUuDlYSqb/AunT5K7Osy+
   NMBZGRUlGrK/XjCId6MorP1fa5fnXViRbC0VLsqwbnvM+7v/9GKRUIv/N
   yrhCQ83st+nhWtAZzuydpvytR9mEom44jH25TdJ0fsvqHm5Y0RKg9yh3L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10040461"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="10040461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 01:56:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="15235682"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2024 01:56:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnxBK-000L0R-2y;
	Sat, 23 Mar 2024 08:56:50 +0000
Date: Sat, 23 Mar 2024 16:56:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to
 !ENDBR: kprobe_emulate_jcc+0xe
Message-ID: <202403231600.Vaj7L4lC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jinghao Jia <jinghao7@illinois.edu>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfa8f18691ed2e978e4dd51190569c434f93e268
commit: e4778a0ef322834718f8e42da3901eb99fef1208 x86/kprobes: Refactor can_{probe,boost} return type to bool
date:   2 weeks ago
config: x86_64-buildonly-randconfig-002-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231600.Vaj7L4lC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231600.Vaj7L4lC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231600.Vaj7L4lC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !ENDBR: kprobe_emulate_jcc+0xe


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000005d390 <set_ftrace_ops_ro>:
0000    5d390:	f3 0f 1e fa          	endbr64
0004    5d394:	41 57                	push   %r15
0006    5d396:	41 56                	push   %r14
0008    5d398:	41 54                	push   %r12
000a    5d39a:	53                   	push   %rbx
000b    5d39b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 5d3a2 <set_ftrace_ops_ro+0x12>	5d39e: R_X86_64_PC32	ftrace_ops_list-0x4
0012    5d3a2:	e8 00 00 00 00       	call   5d3a7 <set_ftrace_ops_ro+0x17>	5d3a3: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0017    5d3a7:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	5d3aa: R_X86_64_32S	ftrace_list_end
001e    5d3ae:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	5d3b1: R_X86_64_32S	ftrace_regs_caller
0025    5d3b5:	48 f7 d8             	neg    %rax
0028    5d3b8:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	5d3bc: R_X86_64_32S	ftrace_regs_caller_end+0x1008
0030    5d3c0:	49 c1 ef 0c          	shr    $0xc,%r15
0034    5d3c4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	5d3c7: R_X86_64_32S	ftrace_caller
003b    5d3cb:	48 f7 d8             	neg    %rax
003e    5d3ce:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	5d3d2: R_X86_64_32S	ftrace_caller_end+0x1008
0046    5d3d6:	49 c1 ec 0c          	shr    $0xc,%r12
004a    5d3da:	48 8b 43 10          	mov    0x10(%rbx),%rax
004e    5d3de:	a9 00 08 00 00       	test   $0x800,%eax
0053    5d3e3:	74 15                	je     5d3fa <set_ftrace_ops_ro+0x6a>
0055    5d3e5:	a8 04                	test   $0x4,%al
0057    5d3e7:	48 8b bb 60 01 00 00 	mov    0x160(%rbx),%rdi
005e    5d3ee:	44 89 fe             	mov    %r15d,%esi
0061    5d3f1:	41 0f 44 f4          	cmove  %r12d,%esi
0065    5d3f5:	e8 00 00 00 00       	call   5d3fa <set_ftrace_ops_ro+0x6a>	5d3f6: R_X86_64_PLT32	set_memory_ro-0x4
006a    5d3fa:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
006e    5d3fe:	e8 00 00 00 00       	call   5d403 <set_ftrace_ops_ro+0x73>	5d3ff: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
0073    5d403:	48 85 db             	test   %rbx,%rbx
0076    5d406:	74 05                	je     5d40d <set_ftrace_ops_ro+0x7d>
0078    5d408:	4c 39 f3             	cmp    %r14,%rbx
007b    5d40b:	75 cd                	jne    5d3da <set_ftrace_ops_ro+0x4a>
007d    5d40d:	5b                   	pop    %rbx
007e    5d40e:	41 5c                	pop    %r12
0080    5d410:	41 5e                	pop    %r14
0082    5d412:	41 5f                	pop    %r15
0084    5d414:	c3                   	ret
0085    5d415:	66 66 2e 0f 1f 84 00 00 00 00 00 	data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
