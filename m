Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AC107B4;
	Mon, 10 Jul 2023 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689007646; x=1720543646;
  h=date:from:cc:subject:message-id:mime-version;
  bh=z5DGHSNiDT9m5Ci6Ti12SEeF+oZtg594GsoI+FDrtj0=;
  b=YcEhzcq9dEOGcC1507sltu0eob/8qp+4lYA00Vn+Wop2+0Spk87LbkEU
   8A6TicDbL41kP8mKOa2BNgAOCt8Ibtv3wxqqX5EcY5yURUgAniqTiB8V3
   lD1nvis1vmJjy70gyadtPNoJViALsRyLgh+tcNwc1+5+pD7UqXrqBIoh0
   6DQNEMbiVNbH4m0TE4/APEvNUaU2a9KUifKc2IrgmnGVWMC1IhXQS3UjG
   iBr/9zcY7EBOaOMTDfCbHW/5rzhScf84j5U1uVHcJ2idQ6a8uOcrd27so
   WriPbYFRvWgl9p55lC5EYG5jmFgyGuWMXRiguUU4cEgaGT8PHhb0iw+zh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344719130"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="344719130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 09:47:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051414556"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="1051414556"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2023 09:47:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIu2i-0003pE-22;
	Mon, 10 Jul 2023 16:47:20 +0000
Date: Tue, 11 Jul 2023 00:46:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: rust_begin_unwind+0x5c:
 rust_helper_BUG() is missing a __noreturn annotation
Message-ID: <202307110053.7fgkfbOw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Miroslav Benes <mbenes@suse.cz>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
commit: fedb724c3db5490234ddde0103811c28c2fedae0 objtool: Detect missing __noreturn annotations
date:   8 weeks ago
config: x86_64-randconfig-r022-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110053.7fgkfbOw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110053.7fgkfbOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110053.7fgkfbOw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: rust_begin_unwind+0x5c: rust_helper_BUG() is missing a __noreturn annotation


objdump-func vmlinux.o rust_begin_unwind:
0000 00000000000c0585 <rust_begin_unwind>:
0000    c0585:	48 83 ec 48          	sub    $0x48,%rsp
0004    c0589:	48 89 e0             	mov    %rsp,%rax
0007    c058c:	48 89 38             	mov    %rdi,(%rax)
000a    c058f:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
000f    c0594:	48 89 01             	mov    %rax,(%rcx)
0012    c0597:	48 c7 41 08 00 00 00 00 	movq   $0x0,0x8(%rcx)	c059b: R_X86_64_32S	_RNvXsR_NtCs3yuwAp0waWO_4core3fmtRNtNtNtB7_5panic10panic_info9PanicInfoNtB5_7Display3fmtCsfATHBUcknU9_6kernel
001a    c059f:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
001f    c05a4:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)	c05a7: R_X86_64_32S	.rodata+0x13758
0026    c05ab:	48 c7 42 08 02 00 00 00 	movq   $0x2,0x8(%rdx)
002e    c05b3:	48 c7 42 10 00 00 00 00 	movq   $0x0,0x10(%rdx)
0036    c05bb:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
003a    c05bf:	48 c7 42 28 01 00 00 00 	movq   $0x1,0x28(%rdx)
0042    c05c7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c05ca: R_X86_64_32S	_RNvNtNtCsfATHBUcknU9_6kernel5print14format_strings5EMERG
0049    c05ce:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	c05d1: R_X86_64_32S	.rodata+0x134e8
0050    c05d5:	31 c0                	xor    %eax,%eax
0052    c05d7:	e8 00 00 00 00       	call   c05dc <rust_begin_unwind+0x57>	c05d8: R_X86_64_PLT32	_printk-0x4
0057    c05dc:	e8 00 00 00 00       	call   c05e1 <rust_begin_unwind+0x5c>	c05dd: R_X86_64_PLT32	rust_helper_BUG-0x4
005c    c05e1:	eb fe                	jmp    c05e1 <rust_begin_unwind+0x5c>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
