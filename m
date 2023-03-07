Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371FF36E;
	Tue,  7 Mar 2023 04:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678162432; x=1709698432;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+vsoqwoKRdT/80pF5ymjQBSvIegbvPfxXr40Z0h19Nc=;
  b=PMjE3+BYutqXk3ODK2lFC8U+vC32jlKhAQsrkAg1d/pZ1HmAuyZ3niGG
   9NHTaxYijHoi+3j/vVSdshiAcZ4bnT6zb4u9ZETzng/oRKOiG9QX5aHRy
   P4lUtREW3BFPJSo/MaWbIgDSJex9KX3WXw3AZ5/5BHDM+IpiTDdZXgDup
   B/oPQe9uCBXagGPQzgIlP9pne+5F/LKCYDVqLly8tMTYpGLIyMCJfmwFI
   2mbxrNect17hyCclkBGwmeE/knSBQfYOwseQX7CmMQRydPp68d4yo9gAv
   VYhpcKymJ8d8NfEnJKXT63sqWJBHRM6BujqzpRJEXXCRNjtY+xiuzdyjV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335777311"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335777311"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 20:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="800267826"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="800267826"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Mar 2023 20:13:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZOhx-0000wd-14;
	Tue, 07 Mar 2023 04:13:49 +0000
Date: Tue, 7 Mar 2023 12:12:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 107/108]
 vmlinux.o: warning: objtool: exc_nmi+0x124: call to __const_udelay() leaves
 .noinstr.text section
Message-ID: <202303071235.NvgrGJl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
commit: 80dd9f246f8a23a0fd0ed69e51dbdcb389806254 [107/108] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-randconfig-a015-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071235.NvgrGJl5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
        git checkout 80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071235.NvgrGJl5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x20: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_nmi+0x124: call to __const_udelay() leaves .noinstr.text section


objdump-func vmlinux.o exc_nmi:
0000 0000000000001190 <exc_nmi>:
0000     1190:	55                   	push   %rbp
0001     1191:	41 57                	push   %r15
0003     1193:	41 56                	push   %r14
0005     1195:	41 54                	push   %r12
0007     1197:	53                   	push   %rbx
0008     1198:	49 89 fe             	mov    %rdi,%r14
000b     119b:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	119e: R_X86_64_32S	nmi_stats
0012     11a2:	65 4c 03 3d 00 00 00 00 	add    %gs:0x0(%rip),%r15        # 11aa <exc_nmi+0x1a>	11a6: R_X86_64_PC32	this_cpu_off-0x4
001a     11aa:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 11b1 <exc_nmi+0x21>	11ac: R_X86_64_PC32	nmi_halt1-0x5
0021     11b1:	75 05                	jne    11b8 <exc_nmi+0x28>
0023     11b3:	f0 49 ff 47 30       	lock incq 0x30(%r15)
0028     11b8:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 11bf <exc_nmi+0x2f>	11ba: R_X86_64_PC32	nmi_halt1-0x5
002f     11bf:	0f 85 9e 01 00 00    	jne    1363 <exc_nmi+0x1d3>
0035     11c5:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 11cc <exc_nmi+0x3c>	11c7: R_X86_64_PC32	nmi_halt2-0x5
003c     11cc:	0f 85 91 01 00 00    	jne    1363 <exc_nmi+0x1d3>
0042     11d2:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 11d9 <exc_nmi+0x49>	11d5: R_X86_64_PC32	pcpu_hot+0x8
0049     11d9:	48 98                	cltq
004b     11db:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 11e3 <exc_nmi+0x53>	11df: R_X86_64_PC32	__cpu_online_mask-0x4
0053     11e3:	0f 83 7a 01 00 00    	jae    1363 <exc_nmi+0x1d3>
0059     11e9:	65 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%eax        # 11f0 <exc_nmi+0x60>	11ec: R_X86_64_PC32	nmi_state-0x4
0060     11f0:	85 c0                	test   %eax,%eax
0062     11f2:	74 10                	je     1204 <exc_nmi+0x74>
0064     11f4:	65 c7 05 00 00 00 00 02 00 00 00 	movl   $0x2,%gs:0x0(%rip)        # 11ff <exc_nmi+0x6f>	11f7: R_X86_64_PC32	nmi_state-0x8
006f     11ff:	e9 5f 01 00 00       	jmp    1363 <exc_nmi+0x1d3>
0074     1204:	65 c7 05 00 00 00 00 01 00 00 00 	movl   $0x1,%gs:0x0(%rip)        # 120f <exc_nmi+0x7f>	1207: R_X86_64_PC32	nmi_state-0x8
007f     120f:	0f 20 d0             	mov    %cr2,%rax
0082     1212:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 121a <exc_nmi+0x8a>	1216: R_X86_64_PC32	nmi_cr2-0x4
008a     121a:	49 8b 47 18          	mov    0x18(%r15),%rax
008e     121e:	48 ff c0             	inc    %rax
0091     1221:	49 89 47 18          	mov    %rax,0x18(%r15)
0095     1225:	a8 01                	test   $0x1,%al
0097     1227:	0f 84 3f 01 00 00    	je     136c <exc_nmi+0x1dc>
009d     122d:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1234 <exc_nmi+0xa4>	1230: R_X86_64_PC32	jiffies-0x4
00a4     1234:	49 89 47 10          	mov    %rax,0x10(%r15)
00a8     1238:	45 31 e4             	xor    %r12d,%r12d
00ab     123b:	e9 00 00 00 00       	jmp    1240 <exc_nmi+0xb0>	123c: R_X86_64_PLT32	.altinstr_aux+0xc2
00b0     1240:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1248 <exc_nmi+0xb8>	1244: R_X86_64_PC32	cpu_dr7-0x4
00b8     1248:	a8 aa                	test   $0xaa,%al
00ba     124a:	74 11                	je     125d <exc_nmi+0xcd>
00bc     124c:	0f 21 f8             	mov    %db7,%rax
00bf     124f:	48 25 ff fb ff ff    	and    $0xfffffffffffffbff,%rax
00c5     1255:	74 04                	je     125b <exc_nmi+0xcb>
00c7     1257:	41 0f 23 fc          	mov    %r12,%db7
00cb     125b:	eb 02                	jmp    125f <exc_nmi+0xcf>
00cd     125d:	31 c0                	xor    %eax,%eax
00cf     125f:	65 48 89 05 00 00 00 00 	mov    %rax,%gs:0x0(%rip)        # 1267 <exc_nmi+0xd7>	1263: R_X86_64_PC32	nmi_dr7-0x4
00d7     1267:	4c 89 f7             	mov    %r14,%rdi
00da     126a:	e8 00 00 00 00       	call   126f <exc_nmi+0xdf>	126b: R_X86_64_PLT32	irqentry_nmi_enter-0x4
00df     126f:	89 c3                	mov    %eax,%ebx
00e1     1271:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 1278 <exc_nmi+0xe8>	1274: R_X86_64_PC32	irq_stat-0x4
00e8     1278:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 127f <exc_nmi+0xef>	127a: R_X86_64_PC32	.data..read_mostly+0x52b
00ef     127f:	74 06                	je     1287 <exc_nmi+0xf7>
00f1     1281:	49 ff 47 28          	incq   0x28(%r15)
00f5     1285:	eb 50                	jmp    12d7 <exc_nmi+0x147>
00f7     1287:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 128e <exc_nmi+0xfe>	1289: R_X86_64_PC32	nmi_halt3-0x5
00fe     128e:	75 47                	jne    12d7 <exc_nmi+0x147>
0100     1290:	69 2d 00 00 00 00 e8 03 00 00 	imul   $0x3e8,0x0(%rip),%ebp        # 129a <exc_nmi+0x10a>	1292: R_X86_64_PC32	nmi_delay-0x8
010a     129a:	49 8b 47 20          	mov    0x20(%r15),%rax
010e     129e:	48 ff c0             	inc    %rax
0111     12a1:	49 89 47 20          	mov    %rax,0x20(%r15)
0115     12a5:	a8 01                	test   $0x1,%al
0117     12a7:	74 7e                	je     1327 <exc_nmi+0x197>
0119     12a9:	85 ed                	test   %ebp,%ebp
011b     12ab:	7e 13                	jle    12c0 <exc_nmi+0x130>
011d     12ad:	ff c5                	inc    %ebp
011f     12af:	bf 58 89 41 00       	mov    $0x418958,%edi
0124     12b4:	e8 00 00 00 00       	call   12b9 <exc_nmi+0x129>	12b5: R_X86_64_PLT32	__const_udelay-0x4
0129     12b9:	ff cd                	dec    %ebp
012b     12bb:	83 fd 01             	cmp    $0x1,%ebp
012e     12be:	77 ef                	ja     12af <exc_nmi+0x11f>
0130     12c0:	4c 89 f7             	mov    %r14,%rdi
0133     12c3:	e8 b8 00 00 00       	call   1380 <default_do_nmi>
0138     12c8:	49 8b 47 20          	mov    0x20(%r15),%rax
013c     12cc:	48 ff c0             	inc    %rax
013f     12cf:	49 89 47 20          	mov    %rax,0x20(%r15)
0143     12d3:	a8 01                	test   $0x1,%al
0145     12d5:	75 59                	jne    1330 <exc_nmi+0x1a0>
0147     12d7:	0f b6 f3             	movzbl %bl,%esi
014a     12da:	4c 89 f7             	mov    %r14,%rdi
014d     12dd:	e8 00 00 00 00       	call   12e2 <exc_nmi+0x152>	12de: R_X86_64_PLT32	irqentry_nmi_exit-0x4
0152     12e2:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 12ea <exc_nmi+0x15a>	12e6: R_X86_64_PC32	nmi_dr7-0x4
015a     12ea:	48 85 c0             	test   %rax,%rax
015d     12ed:	74 03                	je     12f2 <exc_nmi+0x162>
015f     12ef:	0f 23 f8             	mov    %rax,%db7
0162     12f2:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 12fa <exc_nmi+0x16a>	12f6: R_X86_64_PC32	nmi_cr2-0x4
016a     12fa:	0f 20 d1             	mov    %cr2,%rcx
016d     12fd:	48 39 c8             	cmp    %rcx,%rax
0170     1300:	75 18                	jne    131a <exc_nmi+0x18a>
0172     1302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0177     1307:	65 0f c1 05 00 00 00 00 	xadd   %eax,%gs:0x0(%rip)        # 130f <exc_nmi+0x17f>	130b: R_X86_64_PC32	nmi_state-0x4
017f     130f:	83 f8 01             	cmp    $0x1,%eax
0182     1312:	0f 85 23 ff ff ff    	jne    123b <exc_nmi+0xab>
0188     1318:	eb 1c                	jmp    1336 <exc_nmi+0x1a6>
018a     131a:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 1322 <exc_nmi+0x192>	131e: R_X86_64_PC32	nmi_cr2-0x4
0192     1322:	0f 22 d0             	mov    %rax,%cr2
0195     1325:	eb db                	jmp    1302 <exc_nmi+0x172>
0197     1327:	90                   	nop
0198     1328:	0f 0b                	ud2
019a     132a:	90                   	nop
019b     132b:	e9 79 ff ff ff       	jmp    12a9 <exc_nmi+0x119>
01a0     1330:	90                   	nop
01a1     1331:	0f 0b                	ud2
01a3     1333:	90                   	nop
01a4     1334:	eb a1                	jmp    12d7 <exc_nmi+0x147>
01a6     1336:	41 f6 86 88 00 00 00 03 	testb  $0x3,0x88(%r14)
01ae     133e:	74 09                	je     1349 <exc_nmi+0x1b9>
01b0     1340:	eb 07                	jmp    1349 <exc_nmi+0x1b9>
01b2     1342:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1349 <exc_nmi+0x1b9>	1345: R_X86_64_PC32	.rodata+0xc31c
01b9     1349:	49 8b 47 18          	mov    0x18(%r15),%rax
01bd     134d:	48 ff c0             	inc    %rax
01c0     1350:	49 89 47 18          	mov    %rax,0x18(%r15)
01c4     1354:	a8 01                	test   $0x1,%al
01c6     1356:	75 1d                	jne    1375 <exc_nmi+0x1e5>
01c8     1358:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 135f <exc_nmi+0x1cf>	135b: R_X86_64_PC32	jiffies-0x4
01cf     135f:	49 89 47 10          	mov    %rax,0x10(%r15)
01d3     1363:	5b                   	pop    %rbx
01d4     1364:	41 5c                	pop    %r12
01d6     1366:	41 5e                	pop    %r14
01d8     1368:	41 5f                	pop    %r15
01da     136a:	5d                   	pop    %rbp
01db     136b:	c3                   	ret
01dc     136c:	90                   	nop
01dd     136d:	0f 0b                	ud2
01df     136f:	90                   	nop
01e0     1370:	e9 b8 fe ff ff       	jmp    122d <exc_nmi+0x9d>
01e5     1375:	90                   	nop
01e6     1376:	0f 0b                	ud2
01e8     1378:	90                   	nop
01e9     1379:	eb dd                	jmp    1358 <exc_nmi+0x1c8>
01eb     137b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
