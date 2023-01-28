Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89F6FD7;
	Sat, 28 Jan 2023 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674930408; x=1706466408;
  h=date:from:cc:subject:message-id:mime-version;
  bh=I3vX1pUQm9R/YDan066kBrNQPJLrTXZ6jPsjpr5GuzU=;
  b=CsauQmyXXT1CWOcEdO72S7U12xICKre9R0bvkrrbbqf1j54Zoja76dnJ
   eu3z9J4/MMGpphWVtnd+3uP4A6w4ve67N+MiExF3ywEtO81C+d/YHovTx
   SV/z/dpwrblW4zfs30Il4sjwAAA+PGSSLcS76vYaW3Ga/wmdR9tAx4iKn
   nt/UTSUCOlGYiJ3jJDCRxlxkYvCJwdZ/v5XOtgwCVHTbWFs85wKxsSM0K
   TsuQKKWf+K1cGz3NiNlz6e6R+b3ZJ3SSopJ/r1AIYRvFrakqBagjURbxF
   1IBl5ThnBRw0GQiDXvGnr0zjvzsQnyKYk7YiliR70TIY3Hj0atzHf7c8f
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="307660935"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="307660935"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613556305"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="613556305"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 10:26:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLpuX-0000z6-26;
	Sat, 28 Jan 2023 18:26:45 +0000
Date: Sun, 29 Jan 2023 02:26:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/tdx 3/7] vmlinux.o: warning: objtool: __tdx_hypercall+0x7f:
 return with modified stack frame
Message-ID: <202301290255.buUBs99R-lkp@intel.com>
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
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>

Hi Kirill,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
head:   8de62af018cc9262649d7688f7eb1409b2d8f594
commit: c30c4b2555ba93b845559a036293fcaf7ffd2b82 [3/7] x86/tdx: Refactor __tdx_hypercall() to allow pass down more arguments
config: x86_64-randconfig-a013-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290255.buUBs99R-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=c30c4b2555ba93b845559a036293fcaf7ffd2b82
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/tdx
        git checkout c30c4b2555ba93b845559a036293fcaf7ffd2b82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __tdx_hypercall+0x7f: return with modified stack frame
   vmlinux.o: warning: objtool: ibt_selftest+0x14: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sync_regs+0x27: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x2d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame


objdump-func vmlinux.o __tdx_hypercall:
0000 00000000000052a0 <__tdx_hypercall>:
0000     52a0:	f3 0f 1e fa          	endbr64
0004     52a4:	55                   	push   %rbp
0005     52a5:	48 89 e5             	mov    %rsp,%rbp
0008     52a8:	41 57                	push   %r15
000a     52aa:	41 56                	push   %r14
000c     52ac:	41 55                	push   %r13
000e     52ae:	41 54                	push   %r12
0010     52b0:	55                   	push   %rbp
0011     52b1:	48 89 f8             	mov    %rdi,%rax
0014     52b4:	48 89 f5             	mov    %rsi,%rbp
0017     52b7:	4c 8b 50 10          	mov    0x10(%rax),%r10
001b     52bb:	4c 8b 58 18          	mov    0x18(%rax),%r11
001f     52bf:	4c 8b 60 20          	mov    0x20(%rax),%r12
0023     52c3:	4c 8b 68 28          	mov    0x28(%rax),%r13
0027     52c7:	4c 8b 70 30          	mov    0x30(%rax),%r14
002b     52cb:	4c 8b 78 38          	mov    0x38(%rax),%r15
002f     52cf:	50                   	push   %rax
0030     52d0:	31 c0                	xor    %eax,%eax
0032     52d2:	b9 00 fc 00 00       	mov    $0xfc00,%ecx
0037     52d7:	48 f7 c5 02 00 00 00 	test   $0x2,%rbp
003e     52de:	74 01                	je     52e1 <__tdx_hypercall+0x41>
0040     52e0:	fb                   	sti
0041     52e1:	66 0f 01 cc          	tdcall
0045     52e5:	48 85 c0             	test   %rax,%rax
0048     52e8:	75 36                	jne    5320 <__tdx_hypercall+0x80>
004a     52ea:	58                   	pop    %rax
004b     52eb:	48 f7 c5 01 00 00 00 	test   $0x1,%rbp
0052     52f2:	74 18                	je     530c <__tdx_hypercall+0x6c>
0054     52f4:	4c 89 50 10          	mov    %r10,0x10(%rax)
0058     52f8:	4c 89 58 18          	mov    %r11,0x18(%rax)
005c     52fc:	4c 89 60 20          	mov    %r12,0x20(%rax)
0060     5300:	4c 89 68 28          	mov    %r13,0x28(%rax)
0064     5304:	4c 89 70 30          	mov    %r14,0x30(%rax)
0068     5308:	4c 89 78 38          	mov    %r15,0x38(%rax)
006c     530c:	4c 89 d0             	mov    %r10,%rax
006f     530f:	45 31 d2             	xor    %r10d,%r10d
0072     5312:	45 31 db             	xor    %r11d,%r11d
0075     5315:	5d                   	pop    %rbp
0076     5316:	41 5c                	pop    %r12
0078     5318:	41 5d                	pop    %r13
007a     531a:	41 5e                	pop    %r14
007c     531c:	41 5f                	pop    %r15
007e     531e:	5d                   	pop    %rbp
007f     531f:	c3                   	ret
0080     5320:	e8 00 00 00 00       	call   5325 <__tdx_hypercall+0x85>	5321: R_X86_64_PLT32	__tdx_hypercall_failed-0x4
0085     5325:	eb f9                	jmp    5320 <__tdx_hypercall+0x80>
0087     5327:	cc                   	int3
0088     5328:	cc                   	int3
0089     5329:	cc                   	int3
008a     532a:	cc                   	int3
008b     532b:	cc                   	int3
008c     532c:	cc                   	int3
008d     532d:	cc                   	int3
008e     532e:	cc                   	int3
008f     532f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
