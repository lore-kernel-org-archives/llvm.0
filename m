Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526E3207;
	Sat, 21 Jan 2023 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674330884; x=1705866884;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ojuyjwKqRgqvwHjXCHeoMbJUYhEsAnyRCoGcEGaunLU=;
  b=D787t6ftQkyKkXgFnTapBxUMsYtW9VObjEAu8G6G1adu45c2GhrxCuwI
   +XTvbkPyu8bzz9USQseOEPe3egcUAkeao3RRq9o0TOyzdWjbqwa7/QPoB
   EwuScm7BnLii5xMke7qtN3GUUCnjoupOS97C0Ipa+jJflagMqLRSpeD4e
   sNOuSaP3D+PT/Ju1H7y18t+LCackIxex+q4H0OYdU7Jr6J7MTK+zcHyi8
   +T3izytnaM7UJ/IhKs1l1ISy4bcx/6B4IADKlcBED7PtD7RYKXtv0smGQ
   R2//kCVt/2oVdzLgTEYCYSf1JASwQu9sB5PGkT05K7zeL7O51YsjiVi1w
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324510022"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324510022"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 11:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="654151150"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="654151150"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2023 11:54:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJJwn-0004Q6-0g;
	Sat, 21 Jan 2023 19:54:41 +0000
Date: Sun, 22 Jan 2023 03:54:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:sched/core 4/6] vmlinux.o: warning: objtool:
 pvclock_clocksource_read+0xf7: call to pvclock_touch_watchdogs() leaves
 .noinstr.text section
Message-ID: <202301220352.TKlPleZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   af7b5d0c6bcd8c2d4cd1ca01e6f6f89e66b6512d
commit: 42aabb7fdf8521fb7be017270dbcc0fce0b3592a [4/6] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230122/202301220352.TKlPleZF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=42aabb7fdf8521fb7be017270dbcc0fce0b3592a
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 42aabb7fdf8521fb7be017270dbcc0fce0b3592a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __asan_memset+0x34: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x54: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x54: call to __memcpy() with UACCESS enabled
>> vmlinux.o: warning: objtool: pvclock_clocksource_read+0xf7: call to pvclock_touch_watchdogs() leaves .noinstr.text section


objdump-func vmlinux.o pvclock_clocksource_read:
0000 0000000000001f20 <pvclock_clocksource_read>:
0000     1f20:	f3 0f 1e fa          	endbr64
0004     1f24:	55                   	push   %rbp
0005     1f25:	41 57                	push   %r15
0007     1f27:	41 56                	push   %r14
0009     1f29:	41 55                	push   %r13
000b     1f2b:	41 54                	push   %r12
000d     1f2d:	53                   	push   %rbx
000e     1f2e:	50                   	push   %rax
000f     1f2f:	49 89 fe             	mov    %rdi,%r14
0012     1f32:	44 8b 2f             	mov    (%rdi),%r13d
0015     1f35:	0f 31                	rdtsc
0017     1f37:	90                   	nop
0018     1f38:	90                   	nop
0019     1f39:	90                   	nop
001a     1f3a:	48 89 d3             	mov    %rdx,%rbx
001d     1f3d:	48 c1 e3 20          	shl    $0x20,%rbx
0021     1f41:	48 09 c3             	or     %rax,%rbx
0024     1f44:	49 2b 5e 08          	sub    0x8(%r14),%rbx
0028     1f48:	41 83 e5 fe          	and    $0xfffffffe,%r13d
002c     1f4c:	41 8b 6e 18          	mov    0x18(%r14),%ebp
0030     1f50:	45 0f be 7e 1c       	movsbl 0x1c(%r14),%r15d
0035     1f55:	45 85 ff             	test   %r15d,%r15d
0038     1f58:	78 11                	js     1f6b <pvclock_clocksource_read+0x4b>
003a     1f5a:	45 89 fc             	mov    %r15d,%r12d
003d     1f5d:	41 80 ff 40          	cmp    $0x40,%r15b
0041     1f61:	73 40                	jae    1fa3 <pvclock_clocksource_read+0x83>
0043     1f63:	44 89 e1             	mov    %r12d,%ecx
0046     1f66:	48 d3 e3             	shl    %cl,%rbx
0049     1f69:	eb 0f                	jmp    1f7a <pvclock_clocksource_read+0x5a>
004b     1f6b:	41 f7 df             	neg    %r15d
004e     1f6e:	41 83 ff 40          	cmp    $0x40,%r15d
0052     1f72:	73 43                	jae    1fb7 <pvclock_clocksource_read+0x97>
0054     1f74:	44 89 f9             	mov    %r15d,%ecx
0057     1f77:	48 d3 eb             	shr    %cl,%rbx
005a     1f7a:	48 89 2c 24          	mov    %rbp,(%rsp)
005e     1f7e:	48 89 d8             	mov    %rbx,%rax
0061     1f81:	48 f7 24 24          	mulq   (%rsp)
0065     1f85:	48 0f ac d0 20       	shrd   $0x20,%rdx,%rax
006a     1f8a:	48 89 c3             	mov    %rax,%rbx
006d     1f8d:	4d 8b 7e 10          	mov    0x10(%r14),%r15
0071     1f91:	41 0f b6 6e 1d       	movzbl 0x1d(%r14),%ebp
0076     1f96:	41 8b 06             	mov    (%r14),%eax
0079     1f99:	44 39 e8             	cmp    %r13d,%eax
007c     1f9c:	41 89 c5             	mov    %eax,%r13d
007f     1f9f:	75 94                	jne    1f35 <pvclock_clocksource_read+0x15>
0081     1fa1:	eb 28                	jmp    1fcb <pvclock_clocksource_read+0xab>
0083     1fa3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1fa6: R_X86_64_32S	.data+0x66ac0
008a     1faa:	48 89 de             	mov    %rbx,%rsi
008d     1fad:	4c 89 e2             	mov    %r12,%rdx
0090     1fb0:	e8 00 00 00 00       	call   1fb5 <pvclock_clocksource_read+0x95>	1fb1: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0095     1fb5:	eb ac                	jmp    1f63 <pvclock_clocksource_read+0x43>
0097     1fb7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1fba: R_X86_64_32S	.data+0x66aa0
009e     1fbe:	48 89 de             	mov    %rbx,%rsi
00a1     1fc1:	4c 89 fa             	mov    %r15,%rdx
00a4     1fc4:	e8 00 00 00 00       	call   1fc9 <pvclock_clocksource_read+0xa9>	1fc5: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
00a9     1fc9:	eb a9                	jmp    1f74 <pvclock_clocksource_read+0x54>
00ab     1fcb:	40 f6 c5 02          	test   $0x2,%bpl
00af     1fcf:	75 41                	jne    2012 <pvclock_clocksource_read+0xf2>
00b1     1fd1:	49 01 df             	add    %rbx,%r15
00b4     1fd4:	f6 05 00 00 00 00 01 	testb  $0x1,0x0(%rip)        # 1fdb <pvclock_clocksource_read+0xbb>	1fd6: R_X86_64_PC32	.data..read_mostly+0xa23
00bb     1fdb:	74 05                	je     1fe2 <pvclock_clocksource_read+0xc2>
00bd     1fdd:	83 e5 01             	and    $0x1,%ebp
00c0     1fe0:	75 19                	jne    1ffb <pvclock_clocksource_read+0xdb>
00c2     1fe2:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1fe9 <pvclock_clocksource_read+0xc9>	1fe5: R_X86_64_PC32	.bss+0x1603c
00c9     1fe9:	49 39 c7             	cmp    %rax,%r15
00cc     1fec:	72 1f                	jb     200d <pvclock_clocksource_read+0xed>
00ce     1fee:	4c 0f b1 3d 00 00 00 00 	cmpxchg %r15,0x0(%rip)        # 1ff6 <pvclock_clocksource_read+0xd6>	1ff2: R_X86_64_PC32	.bss+0x1603c
00d6     1ff6:	4c 39 f8             	cmp    %r15,%rax
00d9     1ff9:	75 ee                	jne    1fe9 <pvclock_clocksource_read+0xc9>
00db     1ffb:	4c 89 f8             	mov    %r15,%rax
00de     1ffe:	48 83 c4 08          	add    $0x8,%rsp
00e2     2002:	5b                   	pop    %rbx
00e3     2003:	41 5c                	pop    %r12
00e5     2005:	41 5d                	pop    %r13
00e7     2007:	41 5e                	pop    %r14
00e9     2009:	41 5f                	pop    %r15
00eb     200b:	5d                   	pop    %rbp
00ec     200c:	c3                   	ret
00ed     200d:	49 89 c7             	mov    %rax,%r15
00f0     2010:	eb e9                	jmp    1ffb <pvclock_clocksource_read+0xdb>
00f2     2012:	41 80 66 1d fd       	andb   $0xfd,0x1d(%r14)
00f7     2017:	e8 00 00 00 00       	call   201c <pvclock_clocksource_read+0xfc>	2018: R_X86_64_PLT32	pvclock_touch_watchdogs-0x4
00fc     201c:	eb b3                	jmp    1fd1 <pvclock_clocksource_read+0xb1>
00fe     201e:	cc                   	int3
00ff     201f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
