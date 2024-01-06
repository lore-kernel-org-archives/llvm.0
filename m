Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A605380;
	Sat,  6 Jan 2024 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ersglfnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704531752; x=1736067752;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XO/LwpVWlXM2z00feCt4vkZwiuUN6dkKT4qsfdig7jg=;
  b=ersglfnbLsByBDTVWPVuSUiozRuXIFj+Dz16C2ftQr6D6elqHqYn9F6U
   C7dfT27gzIxtADQeXrCohKteKB5nzvZRgaycKt7pwa2qUadYIpghhbxqy
   FI/jz1xaoxu+qzW+4LbieWiIaimwKNQuJfAAvsiq5MgtDRlYRYrQy1SAb
   tf1bq8w/5AkGC0Lr4bjPrM1j1jcHMnZTXUXrrlRrz8CIZG+j35zRu9xF0
   ij3b2veQ1kymZgXekQqpLroDdiLCoSFkskv6nnpYBxqxeBzQBFzwonZhf
   ocEekfx5fjBpaZlAyPT4SS1Dy31Zy+nuzlLAF0r75j7x9lng4nDrxgcxy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="397371835"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="397371835"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 01:02:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="954172020"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="954172020"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Jan 2024 01:02:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM2ZX-0002Fg-2A;
	Sat, 06 Jan 2024 09:02:27 +0000
Date: Sat, 6 Jan 2024 17:01:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x45: relocation to
 !ENDBR: machine_kexec+0x1e2
Message-ID: <202401061645.Z4D02kFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Pengfei Xu <pengfei.xu@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Dmitry Vyukov <dvyukov@google.com>

Hi Pengfei,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95c8a35f1c017327eab3b6a2ff5c04255737c856
commit: 0d345996e4cb573f8cc81d49b3ee9a7fd2035bef x86/kernel: increase kcov coverage under arch/x86/kernel folder
date:   5 months ago
config: x86_64-randconfig-012-20240105 (https://download.01.org/0day-ci/archive/20240106/202401061645.Z4D02kFl-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061645.Z4D02kFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061645.Z4D02kFl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x45: relocation to !ENDBR: machine_kexec+0x1e2


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 000000000009fda0 <set_ftrace_ops_ro>:
0000    9fda0:	f3 0f 1e fa          	endbr64
0004    9fda4:	41 57                	push   %r15
0006    9fda6:	41 56                	push   %r14
0008    9fda8:	41 55                	push   %r13
000a    9fdaa:	41 54                	push   %r12
000c    9fdac:	53                   	push   %rbx
000d    9fdad:	e8 00 00 00 00       	call   9fdb2 <set_ftrace_ops_ro+0x12>	9fdae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0012    9fdb2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 9fdb9 <set_ftrace_ops_ro+0x19>	9fdb5: R_X86_64_PC32	ftrace_ops_list-0x4
0019    9fdb9:	e8 00 00 00 00       	call   9fdbe <set_ftrace_ops_ro+0x1e>	9fdba: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
001e    9fdbe:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	9fdc1: R_X86_64_32S	ftrace_list_end
0025    9fdc5:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	9fdc8: R_X86_64_32S	ftrace_regs_caller
002c    9fdcc:	48 f7 d8             	neg    %rax
002f    9fdcf:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	9fdd3: R_X86_64_32S	ftrace_regs_caller_end+0x100c
0037    9fdd7:	49 c1 ef 0c          	shr    $0xc,%r15
003b    9fddb:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	9fdde: R_X86_64_32S	ftrace_caller
0042    9fde2:	48 f7 d8             	neg    %rax
0045    9fde5:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	9fde9: R_X86_64_32S	ftrace_caller_end+0x100c
004d    9fded:	49 c1 ec 0c          	shr    $0xc,%r12
0051    9fdf1:	4c 8b 6b 10          	mov    0x10(%rbx),%r13
0055    9fdf5:	41 f7 c5 00 08 00 00 	test   $0x800,%r13d
005c    9fdfc:	75 07                	jne    9fe05 <set_ftrace_ops_ro+0x65>
005e    9fdfe:	e8 00 00 00 00       	call   9fe03 <set_ftrace_ops_ro+0x63>	9fdff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0063    9fe03:	eb 1c                	jmp    9fe21 <set_ftrace_ops_ro+0x81>
0065    9fe05:	e8 00 00 00 00       	call   9fe0a <set_ftrace_ops_ro+0x6a>	9fe06: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006a    9fe0a:	41 f6 c5 04          	test   $0x4,%r13b
006e    9fe0e:	48 8b bb 60 01 00 00 	mov    0x160(%rbx),%rdi
0075    9fe15:	44 89 fe             	mov    %r15d,%esi
0078    9fe18:	41 0f 44 f4          	cmove  %r12d,%esi
007c    9fe1c:	e8 00 00 00 00       	call   9fe21 <set_ftrace_ops_ro+0x81>	9fe1d: R_X86_64_PLT32	set_memory_ro-0x4
0081    9fe21:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0085    9fe25:	e8 00 00 00 00       	call   9fe2a <set_ftrace_ops_ro+0x8a>	9fe26: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
008a    9fe2a:	48 85 db             	test   %rbx,%rbx
008d    9fe2d:	74 0c                	je     9fe3b <set_ftrace_ops_ro+0x9b>
008f    9fe2f:	4c 39 f3             	cmp    %r14,%rbx
0092    9fe32:	74 07                	je     9fe3b <set_ftrace_ops_ro+0x9b>
0094    9fe34:	e8 00 00 00 00       	call   9fe39 <set_ftrace_ops_ro+0x99>	9fe35: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0099    9fe39:	eb b6                	jmp    9fdf1 <set_ftrace_ops_ro+0x51>
009b    9fe3b:	e8 00 00 00 00       	call   9fe40 <set_ftrace_ops_ro+0xa0>	9fe3c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a0    9fe40:	5b                   	pop    %rbx
00a1    9fe41:	41 5c                	pop    %r12
00a3    9fe43:	41 5d                	pop    %r13
00a5    9fe45:	41 5e                	pop    %r14
00a7    9fe47:	41 5f                	pop    %r15
00a9    9fe49:	31 c0                	xor    %eax,%eax
00ab    9fe4b:	31 ff                	xor    %edi,%edi
00ad    9fe4d:	31 f6                	xor    %esi,%esi
00af    9fe4f:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
