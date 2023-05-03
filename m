Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D2BA55;
	Wed,  3 May 2023 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683116178; x=1714652178;
  h=date:from:cc:subject:message-id:mime-version;
  bh=LmhZbIpJerUZEW+rF7a3cFyE0iTyBVb8n7Yno2AJHKc=;
  b=RwdAl/EkNtgZ2gjGtFB6TT9tBHUf45EAo8W2F/SN0rm5Qgmx0IqdxuC1
   juWzqr6h75vppC3ntZejRuLkdgwkUI2/W+McbdhpwjBCmws38/b2/IwfZ
   eTaCJjc6kE11yt78r4bx2xhWlkJwDPl2C5LH0zobDfDTkxm2NxcessvgG
   3hXZxdPa9gwBZ4qdQU0Tc7VtfxF9xufeyZaRQX8ItmHgvji4hHwsXEHX3
   2wLWz7MMReBnvg8KfpS3DX+0rzlzclodIXjv0AkVo5TBKT8IjG58RPamc
   7r4yBymSrBbNLdag7rzzdz0b+GnrfwZXz8xsZrqbsFtLsUkH+5Rdp7JiB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="333001862"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="333001862"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 05:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870914109"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; 
   d="scan'208";a="870914109"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2023 05:16:17 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puBP6-000204-1a;
	Wed, 03 May 2023 12:16:16 +0000
Date: Wed, 3 May 2023 20:15:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [paulmck-rcu:dev.2023.04.27a 50/66] vmlinux.o: warning: objtool:
 exc_nmi+0x120: call to __const_udelay() leaves .noinstr.text section
Message-ID: <202305032045.PEBBGXO5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.04.27a
head:   36b9b35fd508ed4a59d8c8011ac1c43b2752928c
commit: fa41ffc56783c1b612a2c8ec645bdf79717a878e [50/66] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: x86_64-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230503/202305032045.PEBBGXO5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=fa41ffc56783c1b612a2c8ec645bdf79717a878e
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.04.27a
        git checkout fa41ffc56783c1b612a2c8ec645bdf79717a878e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305032045.PEBBGXO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: exc_nmi+0x120: call to __const_udelay() leaves .noinstr.text section


objdump-func vmlinux.o exc_nmi:
0000 00000000000014b0 <exc_nmi>:
0000     14b0:	55                   	push   %rbp
0001     14b1:	41 57                	push   %r15
0003     14b3:	41 56                	push   %r14
0005     14b5:	53                   	push   %rbx
0006     14b6:	49 89 fe             	mov    %rdi,%r14
0009     14b9:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 14c0 <exc_nmi+0x10>	14bb: R_X86_64_PC32	nmi_halt1-0x5
0010     14c0:	74 0f                	je     14d1 <exc_nmi+0x21>
0012     14c2:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 14c9 <exc_nmi+0x19>	14c4: R_X86_64_PC32	nmi_halt1-0x5
0019     14c9:	0f 85 c3 01 00 00    	jne    1692 <exc_nmi+0x1e2>
001f     14cf:	eb 14                	jmp    14e5 <exc_nmi+0x35>
0021     14d1:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 14d8 <exc_nmi+0x28>	14d4: R_X86_64_PC32	nmi_stats+0x2c
0028     14d8:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 14df <exc_nmi+0x2f>	14da: R_X86_64_PC32	nmi_halt1-0x5
002f     14df:	0f 85 ad 01 00 00    	jne    1692 <exc_nmi+0x1e2>
0035     14e5:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 14ec <exc_nmi+0x3c>	14e7: R_X86_64_PC32	nmi_halt2-0x5
003c     14ec:	0f 85 a0 01 00 00    	jne    1692 <exc_nmi+0x1e2>
0042     14f2:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 14f8 <exc_nmi+0x48>	14f4: R_X86_64_PC32	nmi_state-0x4
0048     14f8:	85 c0                	test   %eax,%eax
004a     14fa:	74 0f                	je     150b <exc_nmi+0x5b>
004c     14fc:	c7 05 00 00 00 00 02 00 00 00 	movl   $0x2,0x0(%rip)        # 1506 <exc_nmi+0x56>	14fe: R_X86_64_PC32	nmi_state-0x8
0056     1506:	e9 87 01 00 00       	jmp    1692 <exc_nmi+0x1e2>
005b     150b:	c7 05 00 00 00 00 01 00 00 00 	movl   $0x1,0x0(%rip)        # 1515 <exc_nmi+0x65>	150d: R_X86_64_PC32	nmi_state-0x8
0065     1515:	0f 20 d0             	mov    %cr2,%rax
0068     1518:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 151f <exc_nmi+0x6f>	151b: R_X86_64_PC32	nmi_cr2-0x4
006f     151f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1526 <exc_nmi+0x76>	1522: R_X86_64_PC32	nmi_stats+0x14
0076     1526:	48 83 c0 01          	add    $0x1,%rax
007a     152a:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 1531 <exc_nmi+0x81>	152d: R_X86_64_PC32	nmi_stats+0x14
0081     1531:	a8 01                	test   $0x1,%al
0083     1533:	0f 84 60 01 00 00    	je     1699 <exc_nmi+0x1e9>
0089     1539:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1540 <exc_nmi+0x90>	153c: R_X86_64_PC32	jiffies-0x4
0090     1540:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 1547 <exc_nmi+0x97>	1543: R_X86_64_PC32	nmi_stats+0xc
0097     1547:	45 31 ff             	xor    %r15d,%r15d
009a     154a:	e9 00 00 00 00       	jmp    154f <exc_nmi+0x9f>	154b: R_X86_64_PLT32	.altinstr_aux+0x3ec
009f     154f:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1556 <exc_nmi+0xa6>	1552: R_X86_64_PC32	cpu_dr7-0x4
00a6     1556:	a8 aa                	test   $0xaa,%al
00a8     1558:	74 11                	je     156b <exc_nmi+0xbb>
00aa     155a:	0f 21 f8             	mov    %db7,%rax
00ad     155d:	48 25 ff fb ff ff    	and    $0xfffffffffffffbff,%rax
00b3     1563:	74 04                	je     1569 <exc_nmi+0xb9>
00b5     1565:	41 0f 23 ff          	mov    %r15,%db7
00b9     1569:	eb 02                	jmp    156d <exc_nmi+0xbd>
00bb     156b:	31 c0                	xor    %eax,%eax
00bd     156d:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 1574 <exc_nmi+0xc4>	1570: R_X86_64_PC32	nmi_dr7-0x4
00c4     1574:	4c 89 f7             	mov    %r14,%rdi
00c7     1577:	e8 00 00 00 00       	call   157c <exc_nmi+0xcc>	1578: R_X86_64_PLT32	irqentry_nmi_enter-0x4
00cc     157c:	89 c3                	mov    %eax,%ebx
00ce     157e:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 1584 <exc_nmi+0xd4>	1580: R_X86_64_PC32	irq_stat-0x4
00d4     1584:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0(%rip)        # 158b <exc_nmi+0xdb>	1586: R_X86_64_PC32	.data..read_mostly+0x1fbb
00db     158b:	74 0a                	je     1597 <exc_nmi+0xe7>
00dd     158d:	48 83 05 00 00 00 00 01 	addq   $0x1,0x0(%rip)        # 1595 <exc_nmi+0xe5>	1590: R_X86_64_PC32	nmi_stats+0x23
00e5     1595:	eb 64                	jmp    15fb <exc_nmi+0x14b>
00e7     1597:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 159e <exc_nmi+0xee>	1599: R_X86_64_PC32	nmi_halt3-0x5
00ee     159e:	75 5b                	jne    15fb <exc_nmi+0x14b>
00f0     15a0:	69 2d 00 00 00 00 e8 03 00 00 	imul   $0x3e8,0x0(%rip),%ebp        # 15aa <exc_nmi+0xfa>	15a2: R_X86_64_PC32	nmi_delay-0x8
00fa     15aa:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 15b1 <exc_nmi+0x101>	15ad: R_X86_64_PC32	nmi_stats+0x1c
0101     15b1:	48 83 c0 01          	add    $0x1,%rax
0105     15b5:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 15bc <exc_nmi+0x10c>	15b8: R_X86_64_PC32	nmi_stats+0x1c
010c     15bc:	a8 01                	test   $0x1,%al
010e     15be:	0f 84 83 00 00 00    	je     1647 <exc_nmi+0x197>
0114     15c4:	85 ed                	test   %ebp,%ebp
0116     15c6:	7e 15                	jle    15dd <exc_nmi+0x12d>
0118     15c8:	83 c5 01             	add    $0x1,%ebp
011b     15cb:	bf 58 89 41 00       	mov    $0x418958,%edi
0120     15d0:	e8 00 00 00 00       	call   15d5 <exc_nmi+0x125>	15d1: R_X86_64_PLT32	__const_udelay-0x4
0125     15d5:	83 c5 ff             	add    $0xffffffff,%ebp
0128     15d8:	83 fd 01             	cmp    $0x1,%ebp
012b     15db:	77 ee                	ja     15cb <exc_nmi+0x11b>
012d     15dd:	4c 89 f7             	mov    %r14,%rdi
0130     15e0:	e8 cb 00 00 00       	call   16b0 <default_do_nmi>
0135     15e5:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 15ec <exc_nmi+0x13c>	15e8: R_X86_64_PC32	nmi_stats+0x1c
013c     15ec:	48 83 c0 01          	add    $0x1,%rax
0140     15f0:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 15f7 <exc_nmi+0x147>	15f3: R_X86_64_PC32	nmi_stats+0x1c
0147     15f7:	a8 01                	test   $0x1,%al
0149     15f9:	75 5a                	jne    1655 <exc_nmi+0x1a5>
014b     15fb:	0f b6 f3             	movzbl %bl,%esi
014e     15fe:	4c 89 f7             	mov    %r14,%rdi
0151     1601:	e8 00 00 00 00       	call   1606 <exc_nmi+0x156>	1602: R_X86_64_PLT32	irqentry_nmi_exit-0x4
0156     1606:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 160d <exc_nmi+0x15d>	1609: R_X86_64_PC32	nmi_dr7-0x4
015d     160d:	48 85 c0             	test   %rax,%rax
0160     1610:	74 03                	je     1615 <exc_nmi+0x165>
0162     1612:	0f 23 f8             	mov    %rax,%db7
0165     1615:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 161c <exc_nmi+0x16c>	1618: R_X86_64_PC32	nmi_cr2-0x4
016c     161c:	0f 20 d1             	mov    %cr2,%rcx
016f     161f:	48 39 c8             	cmp    %rcx,%rax
0172     1622:	75 17                	jne    163b <exc_nmi+0x18b>
0174     1624:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
0179     1629:	0f c1 05 00 00 00 00 	xadd   %eax,0x0(%rip)        # 1630 <exc_nmi+0x180>	162c: R_X86_64_PC32	nmi_state-0x4
0180     1630:	83 f8 01             	cmp    $0x1,%eax
0183     1633:	0f 85 11 ff ff ff    	jne    154a <exc_nmi+0x9a>
0189     1639:	eb 20                	jmp    165b <exc_nmi+0x1ab>
018b     163b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1642 <exc_nmi+0x192>	163e: R_X86_64_PC32	nmi_cr2-0x4
0192     1642:	0f 22 d0             	mov    %rax,%cr2
0195     1645:	eb dd                	jmp    1624 <exc_nmi+0x174>
0197     1647:	90                   	nop
0198     1648:	0f 0b                	ud2
019a     164a:	90                   	nop
019b     164b:	85 ed                	test   %ebp,%ebp
019d     164d:	0f 8f 75 ff ff ff    	jg     15c8 <exc_nmi+0x118>
01a3     1653:	eb 88                	jmp    15dd <exc_nmi+0x12d>
01a5     1655:	90                   	nop
01a6     1656:	0f 0b                	ud2
01a8     1658:	90                   	nop
01a9     1659:	eb a0                	jmp    15fb <exc_nmi+0x14b>
01ab     165b:	41 f6 86 88 00 00 00 03 	testb  $0x3,0x88(%r14)
01b3     1663:	74 09                	je     166e <exc_nmi+0x1be>
01b5     1665:	eb 07                	jmp    166e <exc_nmi+0x1be>
01b7     1667:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 166e <exc_nmi+0x1be>	166a: R_X86_64_PC32	.rodata+0x2479c
01be     166e:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1675 <exc_nmi+0x1c5>	1671: R_X86_64_PC32	nmi_stats+0x14
01c5     1675:	48 83 c0 01          	add    $0x1,%rax
01c9     1679:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 1680 <exc_nmi+0x1d0>	167c: R_X86_64_PC32	nmi_stats+0x14
01d0     1680:	a8 01                	test   $0x1,%al
01d2     1682:	75 1e                	jne    16a2 <exc_nmi+0x1f2>
01d4     1684:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 168b <exc_nmi+0x1db>	1687: R_X86_64_PC32	jiffies-0x4
01db     168b:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 1692 <exc_nmi+0x1e2>	168e: R_X86_64_PC32	nmi_stats+0xc
01e2     1692:	5b                   	pop    %rbx
01e3     1693:	41 5e                	pop    %r14
01e5     1695:	41 5f                	pop    %r15
01e7     1697:	5d                   	pop    %rbp
01e8     1698:	c3                   	ret
01e9     1699:	90                   	nop
01ea     169a:	0f 0b                	ud2
01ec     169c:	90                   	nop
01ed     169d:	e9 97 fe ff ff       	jmp    1539 <exc_nmi+0x89>
01f2     16a2:	90                   	nop
01f3     16a3:	0f 0b                	ud2
01f5     16a5:	90                   	nop
01f6     16a6:	eb dc                	jmp    1684 <exc_nmi+0x1d4>
01f8     16a8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
