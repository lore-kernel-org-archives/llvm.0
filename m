Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BB184C;
	Mon, 20 Mar 2023 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679312503; x=1710848503;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ghIZ/404OOZj1p0UYyD1OzZEsC4dSlAr6Cix6cTFhbo=;
  b=j9rZ4F9gised5H/xQ10cFwvBMk1idaHO3HfwWfAxmD3bg4tL8FFtRUwM
   UHW+2n6EjyRKYQnWEditsmIxrWRHZzZvU8++dYtzXFSeMdNQr3PAufDv4
   vINvxkYCMCVN3pue5aRo61WrQjfr73sh3fdIyIzC5CSuP9Tf1v+xBtQSO
   RennSc2up/X0UMj1/LjVd7Day36/mI4oYDtkYaoH5aPOyb/upQAHeCVyN
   IQeckdHqmYEe61JSGIuurMMRMwQ2lj32G6agxlBhJelY7Lnoz3r2n0TzN
   oS/F2JhIw/JwMUawSDWYkVGwjLNKNmQhhuYRyPHsI1+B5d02gkq2KY7tY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319039039"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="319039039"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="631094767"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="631094767"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2023 04:41:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peDtU-000B0k-35;
	Mon, 20 Mar 2023 11:41:40 +0000
Date: Mon, 20 Mar 2023 19:41:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: handle_bug+0x4: call to
 kmsan_unpoison_entry_regs() leaves .noinstr.text section
Message-ID: <202303201934.LNi7ToIP-lkp@intel.com>
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
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: ba54d194f8daad8943802d6dfe06e205f882c391 x86/traps: avoid KMSAN bugs originating from handle_bug()
date:   4 months ago
config: x86_64-buildonly-randconfig-r005-20230320 (https://download.01.org/0day-ci/archive/20230320/202303201934.LNi7ToIP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba54d194f8daad8943802d6dfe06e205f882c391
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ba54d194f8daad8943802d6dfe06e205f882c391
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303201934.LNi7ToIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: handle_bug+0x4: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section


objdump-func vmlinux.o handle_bug:
0000 0000000000000380 <handle_bug>:
0000      380:	53                   	push   %rbx
0001      381:	48 89 fb             	mov    %rdi,%rbx
0004      384:	e8 00 00 00 00       	call   389 <handle_bug+0x9>	385: R_X86_64_PLT32	kmsan_unpoison_entry_regs-0x4
0009      389:	48 8b 83 80 00 00 00 	mov    0x80(%rbx),%rax
0010      390:	48 b9 00 f0 ff ff ff 7f 00 00 	movabs $0x7ffffffff000,%rcx
001a      39a:	48 39 c8             	cmp    %rcx,%rax
001d      39d:	72 41                	jb     3e0 <handle_bug+0x60>
001f      39f:	0f b7 00             	movzwl (%rax),%eax
0022      3a2:	3d 0f 0b 00 00       	cmp    $0xb0f,%eax
0027      3a7:	75 37                	jne    3e0 <handle_bug+0x60>
0029      3a9:	90                   	nop
002a      3aa:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
0031      3b1:	74 01                	je     3b4 <handle_bug+0x34>
0033      3b3:	fb                   	sti
0034      3b4:	48 8b bb 80 00 00 00 	mov    0x80(%rbx),%rdi
003b      3bb:	48 89 de             	mov    %rbx,%rsi
003e      3be:	e8 00 00 00 00       	call   3c3 <handle_bug+0x43>	3bf: R_X86_64_PLT32	report_bug-0x4
0043      3c3:	83 f8 01             	cmp    $0x1,%eax
0046      3c6:	0f 94 c0             	sete   %al
0049      3c9:	75 08                	jne    3d3 <handle_bug+0x53>
004b      3cb:	48 83 83 80 00 00 00 02 	addq   $0x2,0x80(%rbx)
0053      3d3:	f6 83 91 00 00 00 02 	testb  $0x2,0x91(%rbx)
005a      3da:	74 01                	je     3dd <handle_bug+0x5d>
005c      3dc:	fa                   	cli
005d      3dd:	90                   	nop
005e      3de:	5b                   	pop    %rbx
005f      3df:	c3                   	ret
0060      3e0:	31 c0                	xor    %eax,%eax
0062      3e2:	5b                   	pop    %rbx
0063      3e3:	c3                   	ret
0064      3e4:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
006e      3ee:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0078      3f8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
