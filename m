Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFF79F1;
	Mon, 21 Aug 2023 15:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692632180; x=1724168180;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LLr7f1tqvsHf4GXpWB+4g385BtuMw5ip75u7KeEtKbk=;
  b=jyWP7XG+AULU6eKq/a6vIVfZZZFHO4NKbNOLg1M1ZicR2TqQi1mRZruF
   ZPJDtHbwBjH8CgqJslKRwPO7cJcFUIyAeejVKxtN/canww9bGYgUlDYFh
   hVTPG4niB5ZvMoZ7HdukaMDzGOipM0Wl7mfxMXkxJ9Wf+ppb8m9TaOXJ+
   DnaUzdEPXWuZGQahPahVglMDl/irpPBH6I54PJ6FvZ/vgDzhi74F60WjK
   0qsQJ0+Nrze6efwhm/DDSWYLCt5es5/ABuuWlHtrOqjlM4c4nX0ECBrqT
   RwUCMcp78/uhjHJmQ7q/HxtjJCFLi2tCCEFNKyH3uQFwMZpMB2QUln9sV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="459987571"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="459987571"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735859923"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="735859923"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 08:36:18 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY6wv-0000e7-0M;
	Mon, 21 Aug 2023 15:36:13 +0000
Date: Mon, 21 Aug 2023 23:35:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: handle_bug+0x8: call to
 kmsan_unpoison_entry_regs() leaves .noinstr.text section
Message-ID: <202308212328.jPUdPhgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Alexander Potapenko <glider@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: ba54d194f8daad8943802d6dfe06e205f882c391 x86/traps: avoid KMSAN bugs originating from handle_bug()
date:   10 months ago
config: x86_64-buildonly-randconfig-001-20230821 (https://download.01.org/0day-ci/archive/20230821/202308212328.jPUdPhgk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212328.jPUdPhgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212328.jPUdPhgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: handle_bug+0x8: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section


objdump-func vmlinux.o handle_bug:
0000 0000000000001640 <handle_bug>:
0000     1640:	55                   	push   %rbp
0001     1641:	48 89 e5             	mov    %rsp,%rbp
0004     1644:	53                   	push   %rbx
0005     1645:	48 89 fb             	mov    %rdi,%rbx
0008     1648:	e8 00 00 00 00       	call   164d <handle_bug+0xd>	1649: R_X86_64_PLT32	kmsan_unpoison_entry_regs-0x4
000d     164d:	48 8b 83 80 00 00 00 	mov    0x80(%rbx),%rax
0014     1654:	48 b9 00 f0 ff ff ff 7f 00 00 	movabs $0x7ffffffff000,%rcx
001e     165e:	48 39 c8             	cmp    %rcx,%rax
0021     1661:	72 41                	jb     16a4 <handle_bug+0x64>
0023     1663:	0f b7 00             	movzwl (%rax),%eax
0026     1666:	3d 0f 0b 00 00       	cmp    $0xb0f,%eax
002b     166b:	75 37                	jne    16a4 <handle_bug+0x64>
002d     166d:	90                   	nop
002e     166e:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
0035     1675:	74 01                	je     1678 <handle_bug+0x38>
0037     1677:	fb                   	sti
0038     1678:	48 8b bb 80 00 00 00 	mov    0x80(%rbx),%rdi
003f     167f:	48 89 de             	mov    %rbx,%rsi
0042     1682:	e8 00 00 00 00       	call   1687 <handle_bug+0x47>	1683: R_X86_64_PLT32	report_bug-0x4
0047     1687:	83 f8 01             	cmp    $0x1,%eax
004a     168a:	0f 94 c0             	sete   %al
004d     168d:	75 08                	jne    1697 <handle_bug+0x57>
004f     168f:	48 83 83 80 00 00 00 02 	addq   $0x2,0x80(%rbx)
0057     1697:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
005e     169e:	74 01                	je     16a1 <handle_bug+0x61>
0060     16a0:	fa                   	cli
0061     16a1:	90                   	nop
0062     16a2:	eb 02                	jmp    16a6 <handle_bug+0x66>
0064     16a4:	31 c0                	xor    %eax,%eax
0066     16a6:	5b                   	pop    %rbx
0067     16a7:	5d                   	pop    %rbp
0068     16a8:	31 c9                	xor    %ecx,%ecx
006a     16aa:	31 ff                	xor    %edi,%edi
006c     16ac:	31 f6                	xor    %esi,%esi
006e     16ae:	c3                   	ret
006f     16af:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
007e     16be:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
