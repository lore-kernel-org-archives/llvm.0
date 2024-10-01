Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F901CEE85;
	Tue,  1 Oct 2024 22:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727823133; cv=none; b=NQh6XcQnY3ah5bGA5H+p4QYo6TVsoUn2YI9mQtfZA3USkr0MW/o7SUGE92i8T1EOvCxw+iskPweC9beq8mH56cjQtsxIwvrsTwMj4HSwCK9DFB9fBPqIHh7n8zSotPE94WVcnJIQsgnQZRthk8AXkbM5DHTUHaQSuf0KhVlzht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727823133; c=relaxed/simple;
	bh=FLR5uYtD4ww1LELva7aJRL8wzBxdI7fpAsp+zVKzfH4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MeRiDxSPG8TQCuW+ad7cqy+GRrjvi2r8EhjsdLJX8d0dwIfJdL+eJcdRNEtXvZWv7whVFP9LjIMlLCKfAgIUSsjBRXtQ/e1Jk+G5NYtQyVmLfN6ULIAanrMOsfOPn/1QoISYIkXeF5tgfstsOu4qyjp5CuKJcZjHFCFMjvE/wRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvCfLin6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvCfLin6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727823131; x=1759359131;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FLR5uYtD4ww1LELva7aJRL8wzBxdI7fpAsp+zVKzfH4=;
  b=QvCfLin6yx/i1gFc4hnzALa2kHhWYNSUGUco4ZHcY8wwep3uCwMh6xV7
   O4A6sr1c6WdmXDZOyCfzRDbPF9ubIWJdkEPAhFNqCkjAupC6uBb9BEoND
   1zNQZ0h4HNHGK7gVGmv58U4x6UJl/tb90CTvVv/UtBCdaAHEVRWIMz6XR
   ZR40R+nd80AQPmmjgcgxcCo+aXl4a253dzbHCxhdCYhATwILTYYupMkTR
   w2vt2OLaHp7lmrnEWNJpY5ERustrmuKJzzugx7MrFyMOVR34OFC+73WfI
   f4XDqKNi+Hw88fqXlbhMc+7C7hGH3uelq5mxrWHEulIj/J02kok4zuqqf
   A==;
X-CSE-ConnectionGUID: foDT9VjMTVSHL1vtbHyZrQ==
X-CSE-MsgGUID: WgcVLMUGS1SMZAniwzi5CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26785096"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="26785096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 15:52:10 -0700
X-CSE-ConnectionGUID: lluGDBtFQjeMZTejBeYSUQ==
X-CSE-MsgGUID: WW0PTfmSS9q9kV4qAZUzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="111292811"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Oct 2024 15:52:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svlix-000RFb-0q;
	Tue, 01 Oct 2024 22:52:07 +0000
Date: Wed, 2 Oct 2024 06:51:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x31: relocation to
 !ENDBR: arch_kexec_apply_relocations_add+0x2a8
Message-ID: <202410020624.PPc1OWux-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kent Overstreet <kent.overstreet@linux.dev>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocation tagging
date:   5 months ago
config: x86_64-buildonly-randconfig-006-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020624.PPc1OWux-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020624.PPc1OWux-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020624.PPc1OWux-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: jffs2_erase_pending_blocks() falls through to next function list_move()
>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x31: relocation to !ENDBR: arch_kexec_apply_relocations_add+0x2a8


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000007fd80 <set_ftrace_ops_ro>:
0000    7fd80:	f3 0f 1e fa          	endbr64
0004    7fd84:	55                   	push   %rbp
0005    7fd85:	48 89 e5             	mov    %rsp,%rbp
0008    7fd88:	41 57                	push   %r15
000a    7fd8a:	41 56                	push   %r14
000c    7fd8c:	41 54                	push   %r12
000e    7fd8e:	53                   	push   %rbx
000f    7fd8f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 7fd96 <set_ftrace_ops_ro+0x16>	7fd92: R_X86_64_PC32	ftrace_ops_list-0x4
0016    7fd96:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	7fd99: R_X86_64_32S	ftrace_regs_caller
001d    7fd9d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	7fda0: R_X86_64_32S	ftrace_caller
0024    7fda4:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	7fda7: R_X86_64_32S	_ftrace_branch+0x19f38
002b    7fdab:	48 f7 d8             	neg    %rax
002e    7fdae:	48 f7 d9             	neg    %rcx
0031    7fdb1:	4c 8d 3c 0d 00 00 00 00 	lea    0x0(,%rcx,1),%r15	7fdb5: R_X86_64_32S	ftrace_caller_end+0x100c
0039    7fdb9:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	7fdbd: R_X86_64_32S	ftrace_regs_caller_end+0x100c
0041    7fdc1:	48 8b 43 10          	mov    0x10(%rbx),%rax
0045    7fdc5:	0f ba e0 0b          	bt     $0xb,%eax
0049    7fdc9:	72 09                	jb     7fdd4 <set_ftrace_ops_ro+0x54>
004b    7fdcb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 7fdd2 <set_ftrace_ops_ro+0x52>	7fdce: R_X86_64_PC32	_ftrace_branch+0x19f2c
0052    7fdd2:	eb 2e                	jmp    7fe02 <set_ftrace_ops_ro+0x82>
0054    7fdd4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 7fddb <set_ftrace_ops_ro+0x5b>	7fdd7: R_X86_64_PC32	_ftrace_branch+0x19f24
005b    7fddb:	a8 04                	test   $0x4,%al
005d    7fddd:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	7fde0: R_X86_64_32S	_ftrace_branch+0x19f40
0064    7fde4:	4c 89 e6             	mov    %r12,%rsi
0067    7fde7:	49 0f 44 c6          	cmove  %r14,%rax
006b    7fdeb:	49 0f 44 f7          	cmove  %r15,%rsi
006f    7fdef:	48 ff 00             	incq   (%rax)
0072    7fdf2:	48 c1 ee 0c          	shr    $0xc,%rsi
0076    7fdf6:	48 8b bb b0 00 00 00 	mov    0xb0(%rbx),%rdi
007d    7fdfd:	e8 00 00 00 00       	call   7fe02 <set_ftrace_ops_ro+0x82>	7fdfe: R_X86_64_PLT32	set_memory_ro-0x4
0082    7fe02:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0086    7fe06:	31 f6                	xor    %esi,%esi
0088    7fe08:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7fe0b: R_X86_64_32S	_ftrace_annotated_branch+0xf570
008f    7fe0f:	ba 01 00 00 00       	mov    $0x1,%edx
0094    7fe14:	48 85 db             	test   %rbx,%rbx
0097    7fe17:	40 0f 95 c6          	setne  %sil
009b    7fe1b:	31 c9                	xor    %ecx,%ecx
009d    7fe1d:	e8 00 00 00 00       	call   7fe22 <set_ftrace_ops_ro+0xa2>	7fe1e: R_X86_64_PLT32	ftrace_likely_update-0x4
00a2    7fe22:	48 85 db             	test   %rbx,%rbx
00a5    7fe25:	74 2a                	je     7fe51 <set_ftrace_ops_ro+0xd1>
00a7    7fe27:	31 f6                	xor    %esi,%esi
00a9    7fe29:	48 81 fb 00 00 00 00 	cmp    $0x0,%rbx	7fe2c: R_X86_64_32S	ftrace_list_end
00b0    7fe30:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	7fe33: R_X86_64_32S	_ftrace_annotated_branch+0xf5a0
00b7    7fe37:	40 0f 95 c6          	setne  %sil
00bb    7fe3b:	31 d2                	xor    %edx,%edx
00bd    7fe3d:	31 c9                	xor    %ecx,%ecx
00bf    7fe3f:	e8 00 00 00 00       	call   7fe44 <set_ftrace_ops_ro+0xc4>	7fe40: R_X86_64_PLT32	ftrace_likely_update-0x4
00c4    7fe44:	48 81 fb 00 00 00 00 	cmp    $0x0,%rbx	7fe47: R_X86_64_32S	ftrace_list_end
00cb    7fe4b:	0f 85 70 ff ff ff    	jne    7fdc1 <set_ftrace_ops_ro+0x41>
00d1    7fe51:	5b                   	pop    %rbx
00d2    7fe52:	41 5c                	pop    %r12
00d4    7fe54:	41 5e                	pop    %r14
00d6    7fe56:	41 5f                	pop    %r15
00d8    7fe58:	5d                   	pop    %rbp
00d9    7fe59:	31 c0                	xor    %eax,%eax
00db    7fe5b:	31 c9                	xor    %ecx,%ecx
00dd    7fe5d:	31 ff                	xor    %edi,%edi
00df    7fe5f:	31 d2                	xor    %edx,%edx
00e1    7fe61:	31 f6                	xor    %esi,%esi
00e3    7fe63:	c3                   	ret
00e4    7fe64:	cc                   	int3
00e5    7fe65:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00ef    7fe6f:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
00f9    7fe79:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
