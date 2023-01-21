Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F967E;
	Sat, 21 Jan 2023 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674318036; x=1705854036;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kSyZ4MX19UHPh7lmTs5UrtmddhZuIOOiYKkz89fGsG4=;
  b=ZB/PV1zxdSVbhURM0gRHUuKFc6TFdHYhv/1nULTkVwX1Kmi2tuzIbww3
   YoZ1M6KCx4czQn04vZWspIc5D5oTySOUjKeRdz0PMIqwH83NvJL1Gj9m7
   dHynpOpE7ywApaXYgiZV5pcZ1Ujjqc4coknXaE6n0zH1Ft9FzEEdoJKB4
   0cDV4EAHj488FHD160J7d0oUB/pZpFmHdRm0UaQ4RrytyEO4fzhg4uCRn
   TEU39IfAJdYyD7v09hj0Sk8veXxO7IP+ZE+hYxGYAaSnF4ETquRe4Uqc7
   GZxX/neyFRW2nqkjNTKQ22hwnmyhOcPiCEhB3OOhLaHHgeQt9SHoZCwsk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="305467649"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="305467649"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 08:20:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="693185522"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="693185522"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Jan 2023 08:20:33 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJGbY-0004Fi-39;
	Sat, 21 Jan 2023 16:20:32 +0000
Date: Sun, 22 Jan 2023 00:19:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:sched/core 3/5] vmlinux.o: warning: objtool:
 pvclock_clocksource_read+0x14a: call to pvclock_touch_watchdogs() leaves
 .noinstr.text section
Message-ID: <202301220014.IOed1Kg3-lkp@intel.com>
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
head:   2f4db18052727418ff37088ea7b08d5380aa91ad
commit: 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589 [3/5] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230122/202301220014.IOed1Kg3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 60b4bbc6b378aeb9625a39f0afc9dcaee6f78589
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __asan_memset+0x3c: call to __memset() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memmove+0x64: call to __memmove() with UACCESS enabled
   vmlinux.o: warning: objtool: __asan_memcpy+0x64: call to __memcpy() with UACCESS enabled
   vmlinux.o: warning: objtool: handle_bug+0x5: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmware_sched_clock+0x24: call to mul_u64_u32_shr() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pvclock_clocksource_read+0x14a: call to pvclock_touch_watchdogs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x4: call to perf_lopwr_cb() leaves .noinstr.text section


objdump-func vmlinux.o pvclock_clocksource_read:
0000 0000000000003b40 <pvclock_clocksource_read>:
0000     3b40:	f3 0f 1e fa          	endbr64
0004     3b44:	55                   	push   %rbp
0005     3b45:	41 57                	push   %r15
0007     3b47:	41 56                	push   %r14
0009     3b49:	41 55                	push   %r13
000b     3b4b:	41 54                	push   %r12
000d     3b4d:	53                   	push   %rbx
000e     3b4e:	50                   	push   %rax
000f     3b4f:	49 89 fe             	mov    %rdi,%r14
0012     3b52:	44 8b 2f             	mov    (%rdi),%r13d
0015     3b55:	eb 4e                	jmp    3ba5 <pvclock_clocksource_read+0x65>
0017     3b57:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3b5f <pvclock_clocksource_read+0x1f>	3b5a: R_X86_64_PC32	.bss+0x99deb
001f     3b5f:	45 89 fc             	mov    %r15d,%r12d
0022     3b62:	41 80 ff 40          	cmp    $0x40,%r15b
0026     3b66:	0f 83 96 00 00 00    	jae    3c02 <pvclock_clocksource_read+0xc2>
002c     3b6c:	44 89 e1             	mov    %r12d,%ecx
002f     3b6f:	48 d3 e3             	shl    %cl,%rbx
0032     3b72:	48 89 2c 24          	mov    %rbp,(%rsp)
0036     3b76:	48 89 d8             	mov    %rbx,%rax
0039     3b79:	48 f7 24 24          	mulq   (%rsp)
003d     3b7d:	48 0f ac d0 20       	shrd   $0x20,%rdx,%rax
0042     3b82:	48 89 c3             	mov    %rax,%rbx
0045     3b85:	4d 8b 7e 10          	mov    0x10(%r14),%r15
0049     3b89:	41 0f b6 6e 1d       	movzbl 0x1d(%r14),%ebp
004e     3b8e:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3b96 <pvclock_clocksource_read+0x56>	3b91: R_X86_64_PC32	.bss+0x99d23
0056     3b96:	41 8b 06             	mov    (%r14),%eax
0059     3b99:	44 39 e8             	cmp    %r13d,%eax
005c     3b9c:	41 89 c5             	mov    %eax,%r13d
005f     3b9f:	0f 84 98 00 00 00    	je     3c3d <pvclock_clocksource_read+0xfd>
0065     3ba5:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3bad <pvclock_clocksource_read+0x6d>	3ba8: R_X86_64_PC32	.bss+0x99d1b
006d     3bad:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3bb5 <pvclock_clocksource_read+0x75>	3bb0: R_X86_64_PC32	.bss+0x99d33
0075     3bb5:	0f 31                	rdtsc
0077     3bb7:	90                   	nop
0078     3bb8:	90                   	nop
0079     3bb9:	90                   	nop
007a     3bba:	48 89 d3             	mov    %rdx,%rbx
007d     3bbd:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3bc5 <pvclock_clocksource_read+0x85>	3bc0: R_X86_64_PC32	.bss+0x99d2b
0085     3bc5:	48 c1 e3 20          	shl    $0x20,%rbx
0089     3bc9:	48 09 c3             	or     %rax,%rbx
008c     3bcc:	49 2b 5e 08          	sub    0x8(%r14),%rbx
0090     3bd0:	41 83 e5 fe          	and    $0xfffffffe,%r13d
0094     3bd4:	41 8b 6e 18          	mov    0x18(%r14),%ebp
0098     3bd8:	45 0f be 7e 1c       	movsbl 0x1c(%r14),%r15d
009d     3bdd:	45 85 ff             	test   %r15d,%r15d
00a0     3be0:	0f 89 71 ff ff ff    	jns    3b57 <pvclock_clocksource_read+0x17>
00a6     3be6:	41 f7 df             	neg    %r15d
00a9     3be9:	41 83 ff 40          	cmp    $0x40,%r15d
00ad     3bed:	73 32                	jae    3c21 <pvclock_clocksource_read+0xe1>
00af     3bef:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3bf7 <pvclock_clocksource_read+0xb7>	3bf2: R_X86_64_PC32	.bss+0x99dfb
00b7     3bf7:	44 89 f9             	mov    %r15d,%ecx
00ba     3bfa:	48 d3 eb             	shr    %cl,%rbx
00bd     3bfd:	e9 70 ff ff ff       	jmp    3b72 <pvclock_clocksource_read+0x32>
00c2     3c02:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3c0a <pvclock_clocksource_read+0xca>	3c05: R_X86_64_PC32	.bss+0x99e03
00ca     3c0a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3c0d: R_X86_64_32S	.data+0x98640
00d1     3c11:	48 89 de             	mov    %rbx,%rsi
00d4     3c14:	4c 89 e2             	mov    %r12,%rdx
00d7     3c17:	e8 00 00 00 00       	call   3c1c <pvclock_clocksource_read+0xdc>	3c18: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
00dc     3c1c:	e9 4b ff ff ff       	jmp    3b6c <pvclock_clocksource_read+0x2c>
00e1     3c21:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 3c29 <pvclock_clocksource_read+0xe9>	3c24: R_X86_64_PC32	.bss+0x99df3
00e9     3c29:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	3c2c: R_X86_64_32S	.data+0x98620
00f0     3c30:	48 89 de             	mov    %rbx,%rsi
00f3     3c33:	4c 89 fa             	mov    %r15,%rdx
00f6     3c36:	e8 00 00 00 00       	call   3c3b <pvclock_clocksource_read+0xfb>	3c37: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
00fb     3c3b:	eb b2                	jmp    3bef <pvclock_clocksource_read+0xaf>
00fd     3c3d:	40 f6 c5 02          	test   $0x2,%bpl
0101     3c41:	75 42                	jne    3c85 <pvclock_clocksource_read+0x145>
0103     3c43:	49 01 df             	add    %rbx,%r15
0106     3c46:	f6 05 00 00 00 00 01 	testb  $0x1,0x0(%rip)        # 3c4d <pvclock_clocksource_read+0x10d>	3c48: R_X86_64_PC32	.data..read_mostly+0x20ab
010d     3c4d:	74 05                	je     3c54 <pvclock_clocksource_read+0x114>
010f     3c4f:	83 e5 01             	and    $0x1,%ebp
0112     3c52:	75 1a                	jne    3c6e <pvclock_clocksource_read+0x12e>
0114     3c54:	e8 00 00 00 00       	call   3c59 <pvclock_clocksource_read+0x119>	3c55: R_X86_64_PLT32	.text+0x19fa3c
0119     3c59:	49 39 c7             	cmp    %rax,%r15
011c     3c5c:	72 22                	jb     3c80 <pvclock_clocksource_read+0x140>
011e     3c5e:	48 89 c7             	mov    %rax,%rdi
0121     3c61:	4c 89 fe             	mov    %r15,%rsi
0124     3c64:	e8 00 00 00 00       	call   3c69 <pvclock_clocksource_read+0x129>	3c65: R_X86_64_PLT32	.text+0x19fa7c
0129     3c69:	4c 39 f8             	cmp    %r15,%rax
012c     3c6c:	75 eb                	jne    3c59 <pvclock_clocksource_read+0x119>
012e     3c6e:	4c 89 f8             	mov    %r15,%rax
0131     3c71:	48 83 c4 08          	add    $0x8,%rsp
0135     3c75:	5b                   	pop    %rbx
0136     3c76:	41 5c                	pop    %r12
0138     3c78:	41 5d                	pop    %r13
013a     3c7a:	41 5e                	pop    %r14
013c     3c7c:	41 5f                	pop    %r15
013e     3c7e:	5d                   	pop    %rbp
013f     3c7f:	c3                   	ret
0140     3c80:	49 89 c7             	mov    %rax,%r15
0143     3c83:	eb e9                	jmp    3c6e <pvclock_clocksource_read+0x12e>
0145     3c85:	41 80 66 1d fd       	andb   $0xfd,0x1d(%r14)
014a     3c8a:	e8 00 00 00 00       	call   3c8f <pvclock_clocksource_read+0x14f>	3c8b: R_X86_64_PLT32	pvclock_touch_watchdogs-0x4
014f     3c8f:	eb b2                	jmp    3c43 <pvclock_clocksource_read+0x103>
0151     3c91:	cc                   	int3
0152     3c92:	cc                   	int3
0153     3c93:	cc                   	int3
0154     3c94:	cc                   	int3
0155     3c95:	cc                   	int3
0156     3c96:	cc                   	int3
0157     3c97:	cc                   	int3
0158     3c98:	cc                   	int3
0159     3c99:	cc                   	int3
015a     3c9a:	cc                   	int3
015b     3c9b:	cc                   	int3
015c     3c9c:	cc                   	int3
015d     3c9d:	cc                   	int3
015e     3c9e:	cc                   	int3
015f     3c9f:	cc                   	int3
0160     3ca0:	cc                   	int3
0161     3ca1:	cc                   	int3
0162     3ca2:	cc                   	int3
0163     3ca3:	cc                   	int3
0164     3ca4:	cc                   	int3
0165     3ca5:	cc                   	int3
0166     3ca6:	cc                   	int3
0167     3ca7:	cc                   	int3
0168     3ca8:	cc                   	int3
0169     3ca9:	cc                   	int3
016a     3caa:	cc                   	int3
016b     3cab:	cc                   	int3
016c     3cac:	cc                   	int3
016d     3cad:	cc                   	int3
016e     3cae:	cc                   	int3
016f     3caf:	cc                   	int3
0170     3cb0:	cc                   	int3
0171     3cb1:	cc                   	int3
0172     3cb2:	cc                   	int3
0173     3cb3:	cc                   	int3
0174     3cb4:	cc                   	int3
0175     3cb5:	cc                   	int3
0176     3cb6:	cc                   	int3
0177     3cb7:	cc                   	int3
0178     3cb8:	cc                   	int3
0179     3cb9:	cc                   	int3
017a     3cba:	cc                   	int3
017b     3cbb:	cc                   	int3
017c     3cbc:	cc                   	int3
017d     3cbd:	cc                   	int3
017e     3cbe:	cc                   	int3
017f     3cbf:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
