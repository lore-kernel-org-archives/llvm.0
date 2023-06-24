Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022346B0;
	Sat, 24 Jun 2023 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687617908; x=1719153908;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ilNUh/KiGGUJFpHfWaERaFhlEZ5YZUyDKsiSQWDNu4o=;
  b=Ac8DX5/xDXWvp6uAaDc1+g2ZRvPAeBGAmH+ktIS77xiROWpMaMat9spa
   tTwV8+Owime0bfTdvWqjjjOSXBPPMW1nWuGfyr2pIium9l5nHdqHWGPHK
   7ktAqU5PKzuvzIr5/bUHeVnrsx1P2cieGPE3/VN/7GuLJuHjGFexmXhRk
   tpf7pE3KVTtLgKODukHppVExqeyKsP38I13UOEH5WkNqDz5DZbiQsKCFq
   2B6vI1mTROWFgX2gL3jFAykf8WD5lcI9lJxfujb7wQRTtIpJGT/Z0tQ1G
   BXybGNZhEHZJuKQbZfZhh9B1XM8dxZ7Zz1JaZ8edtECWTMBM2Kgm5k/5o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="345700818"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="345700818"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 07:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="962279542"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="962279542"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2023 07:45:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD4Vd-00098P-2o;
	Sat, 24 Jun 2023 14:45:05 +0000
Date: Sat, 24 Jun 2023 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/shstk 7/42] arch/x86/kernel/cet.o: warning: objtool:
 ibt_selftest+0xb: sibling call from callable instruction with modified stack
 frame
Message-ID: <202306242202.ddNeVqRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Kees Cook <keescook@chromium.org>

Hi Rick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   727f2a6ea02467c331f86ec5fde8e70dab418baa
commit: e17535957e6abd561790778fba0f8205eb0d4c50 [7/42] x86/traps: Move control protection handler to separate file
config: x86_64-randconfig-r034-20230624 (https://download.01.org/0day-ci/archive/20230624/202306242202.ddNeVqRp-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306242202.ddNeVqRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306242202.ddNeVqRp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cet.c:23:27: warning: no previous prototype for function 'exc_control_protection' [-Wmissing-prototypes]
   DEFINE_IDTENTRY_ERRORCODE(exc_control_protection)
                             ^
   arch/x86/kernel/cet.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   DEFINE_IDTENTRY_ERRORCODE(exc_control_protection)
   ^
   arch/x86/include/asm/idtentry.h:98:19: note: expanded from macro 'DEFINE_IDTENTRY_ERRORCODE'
   __visible noinstr void func(struct pt_regs *regs,                       \
                     ^
   1 warning generated.
>> arch/x86/kernel/cet.o: warning: objtool: ibt_selftest+0xb: sibling call from callable instruction with modified stack frame
   arch/x86/kernel/cet.o: warning: objtool: ibt_selftest+0x15: return with modified stack frame


objdump-func vmlinux.o ibt_selftest:
0000 0000000000117700 <ibt_selftest>:
0000   117700:	55                   	push   %rbp
0001   117701:	48 89 e5             	mov    %rsp,%rbp
0004   117704:	48 8d 05 02 00 00 00 	lea    0x2(%rip),%rax        # 11770d <ibt_selftest_ip>
000b   11770b:	ff e0                	jmp    *%rax
0000 000000000011770d <ibt_selftest_ip>:
0000   11770d:	90                   	nop
0001   11770e:	48 85 c0             	test   %rax,%rax
0004   117711:	0f 94 c0             	sete   %al
0007   117714:	5d                   	pop    %rbp
0008   117715:	c3                   	ret
0009   117716:	cc                   	int3
000a   117717:	cc                   	int3
000b   117718:	cc                   	int3
000c   117719:	cc                   	int3
000d   11771a:	cc                   	int3
000e   11771b:	cc                   	int3
000f   11771c:	cc                   	int3
0010   11771d:	cc                   	int3
0011   11771e:	cc                   	int3
0012   11771f:	cc                   	int3
0013   117720:	cc                   	int3
0014   117721:	cc                   	int3
0015   117722:	cc                   	int3
0016   117723:	cc                   	int3
0017   117724:	cc                   	int3
0018   117725:	cc                   	int3
0019   117726:	cc                   	int3
001a   117727:	cc                   	int3
001b   117728:	cc                   	int3
001c   117729:	cc                   	int3
001d   11772a:	cc                   	int3
001e   11772b:	cc                   	int3
001f   11772c:	cc                   	int3
0020   11772d:	cc                   	int3
0021   11772e:	cc                   	int3
0022   11772f:	cc                   	int3
0023   117730:	cc                   	int3
0024   117731:	cc                   	int3
0025   117732:	cc                   	int3
0026   117733:	cc                   	int3
0027   117734:	cc                   	int3
0028   117735:	cc                   	int3
0029   117736:	cc                   	int3
002a   117737:	cc                   	int3
002b   117738:	cc                   	int3
002c   117739:	cc                   	int3
002d   11773a:	cc                   	int3
002e   11773b:	cc                   	int3
002f   11773c:	cc                   	int3
0030   11773d:	cc                   	int3
0031   11773e:	cc                   	int3
0032   11773f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
