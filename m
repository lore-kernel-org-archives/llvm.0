Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45113212;
	Sun,  2 Jul 2023 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688340172; x=1719876172;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ojjAXdmP/payrI9w9HaL2lqszhs4yJa4IB7Lk+jijyk=;
  b=WxJ3/5AW0MSEwDiYs/g4Xm2N/c0OdjC/tPiFiNi6lVgqTBBspeJllrD6
   pCNeiVPtupmLrG2Pf2h6mKjh2ihGTsPqSrtChQwlpduWmkk+et9s36PK0
   8rCEzFn3WOOrzc0CxeOh/ChIpQD2iFzK6mmA3p06IjZCrRhYxcs3nAGdT
   4IZrd1m22R1yBxgYzOQQXRUj/lXh2e3arpjlozBssb1j2Haayab+lHuqt
   sj/F4L+V36EFKigDPlFg4bRChqC3wg1GZ0lyZ+2A2dHKi64IpNSX3n+pP
   GQuP9ezkw7VSNd+Fzvpvuk1EQFdkqDfYEkJYferqBsSa+WdR2NQq1jj50
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="428793528"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="428793528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 16:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="808374810"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="808374810"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2023 16:22:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qG6P4-000Gw3-0C;
	Sun, 02 Jul 2023 23:22:50 +0000
Date: Mon, 3 Jul 2023 07:22:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: rust_begin_unwind+0x5f:
 rust_helper_BUG() is missing a __noreturn annotation
Message-ID: <202307030746.1CDDibVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a901a3568fd26ca9c4a82d8bc5ed5b3ed844d451
commit: 0ae612299621b5ae76bec55cc92503b6ed3f554b Revert "nios2: Convert __pte_free_tlb() to use ptdescs"
date:   5 days ago
config: x86_64-randconfig-x002-20230703 (https://download.01.org/0day-ci/archive/20230703/202307030746.1CDDibVq-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307030746.1CDDibVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307030746.1CDDibVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: rust_begin_unwind+0x5f: rust_helper_BUG() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: do_user_addr_fault+0x302: unreachable instruction
>> vmlinux.o: warning: objtool: de_thread+0x4a0: unreachable instruction


objdump-func vmlinux.o rust_begin_unwind:
0000 0000000000045d6f <rust_begin_unwind>:
0000    45d6f:	55                   	push   %rbp
0001    45d70:	48 89 e5             	mov    %rsp,%rbp
0004    45d73:	48 83 ec 50          	sub    $0x50,%rsp
0008    45d77:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
000c    45d7b:	48 89 38             	mov    %rdi,(%rax)
000f    45d7e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
0013    45d82:	48 89 01             	mov    %rax,(%rcx)
0016    45d85:	48 c7 41 08 00 00 00 00 	movq   $0x0,0x8(%rcx)	45d89: R_X86_64_32S	_RNvXsX_NtCsjQkEVdlX3YU_4core3fmtRNtNtNtB7_5panic10panic_info9PanicInfoNtB5_7Display3fmtCscRhiiH9rU7O_6kernel
001e    45d8d:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
0022    45d91:	48 c7 02 00 00 00 00 	movq   $0x0,(%rdx)
0029    45d98:	48 c7 42 10 00 00 00 00 	movq   $0x0,0x10(%rdx)	45d9c: R_X86_64_32S	.rodata+0x13db8
0031    45da0:	48 c7 42 18 02 00 00 00 	movq   $0x2,0x18(%rdx)
0039    45da8:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
003d    45dac:	48 c7 42 28 01 00 00 00 	movq   $0x1,0x28(%rdx)
0045    45db4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	45db7: R_X86_64_32S	_RNvNtNtCscRhiiH9rU7O_6kernel5print14format_strings5EMERG
004c    45dbb:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	45dbe: R_X86_64_32S	.rodata+0x13a80
0053    45dc2:	31 c0                	xor    %eax,%eax
0055    45dc4:	e8 00 00 00 00       	call   45dc9 <rust_begin_unwind+0x5a>	45dc5: R_X86_64_PLT32	_printk-0x4
005a    45dc9:	e8 00 00 00 00       	call   45dce <rust_begin_unwind+0x5f>	45dca: R_X86_64_PLT32	rust_helper_BUG-0x4
005f    45dce:	eb fe                	jmp    45dce <rust_begin_unwind+0x5f>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
