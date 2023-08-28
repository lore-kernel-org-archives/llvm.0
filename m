Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48936D;
	Mon, 28 Aug 2023 01:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693186599; x=1724722599;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oy3L8GJc+5niIzpVu3KgZNqZiDOoCkp/TD9l0OSzYFc=;
  b=LaSMDY1SIbSPuykzrR6DwT6vmxddXTK/hx2l9fhiJNhZCXkzTfbFjoeu
   seMR+J4Jb9LdGKNxlA6kHjolpoSj4YeIIyJeLc9ylur27OqkQvp8+6zpH
   B4/6VGiWlLMbqPXoMN9X74EeQz9kwftN+/zAw/u4K5PRZ8ToQX/oMoc0+
   USl/tLix0poA6B/ImHPwSqLxOJUXlIeoBJXUie2cjGFUQ7E9gew7b1RRl
   /XTAjLcHmVaXnosur9DhTXzX2oSEahHoriRfMsC4NeB6Z0oRB4967WAak
   3MsKXDOgfT4fl/9wtJv2q9iIvfp+YDLYI0MnGGZhPSnTV50NmEaAY8fhi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="365190590"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="365190590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 18:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="741195676"
X-IronPort-AV: E=Sophos;i="6.02,206,1688454000"; 
   d="scan'208";a="741195676"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 18:36:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaRBD-0006Ox-35;
	Mon, 28 Aug 2023 01:36:35 +0000
Date: Mon, 28 Aug 2023 09:35:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 9990/9999] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x334: unsupported relocation in alternatives section
Message-ID: <202308280953.UQ6iJ10c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   5ddfe5cc87167343bd4c17f776de7b7aa1475b0c
commit: 43548590ad7e794392ad6f3f8c13d8c1593bdf61 [9990/9999] x86/cpu: Cleanup the untrain mess
config: x86_64-buildonly-randconfig-003-20230827 (https://download.01.org/0day-ci/archive/20230828/202308280953.UQ6iJ10c-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280953.UQ6iJ10c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308280953.UQ6iJ10c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x334: unsupported relocation in alternatives section
   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:30: unable to move location counter backward for: .text
   ld.lld: error: SRSO function pair won't alias
   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:30: unable to move location counter backward for: .text
   ld.lld: error: SRSO function pair won't alias
   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:30: unable to move location counter backward for: .text
   ld.lld: error: SRSO function pair won't alias


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	entry_untrain_ret-0x4
0005        5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	entry_ibpb-0x4
000a        a:	e9 00 00 00 00       	jmp    f <.altinstr_replacement+0xf>	b: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
000f        f:	48 c1 e1 07          	shl    $0x7,%rcx
0013       13:	48 c1 f9 07          	sar    $0x7,%rcx
0017       17:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
001e       1e:	e8 01 00 00 00       	call   24 <.altinstr_replacement+0x24>
0023       23:	cc                   	int3
0024       24:	e8 01 00 00 00       	call   2a <.altinstr_replacement+0x2a>
0029       29:	cc                   	int3
002a       2a:	48 83 c4 10          	add    $0x10,%rsp
002e       2e:	49 ff cc             	dec    %r12
0031       31:	75 eb                	jne    1e <.altinstr_replacement+0x1e>
0033       33:	0f ae e8             	lfence
0036       36:	e8 01 00 00 00       	call   3c <.altinstr_replacement+0x3c>
003b       3b:	cc                   	int3
003c       3c:	48 83 c4 08          	add    $0x8,%rsp
0040       40:	0f ae e8             	lfence
0043       43:	e8 00 00 00 00       	call   48 <.altinstr_replacement+0x48>	44: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0048       48:	0f ae e8             	lfence
004b       4b:	ff d3                	call   *%rbx
004d       4d:	e8 00 00 00 00       	call   52 <.altinstr_replacement+0x52>	4e: R_X86_64_PLT32	entry_untrain_ret-0x4
0052       52:	e8 00 00 00 00       	call   57 <.altinstr_replacement+0x57>	53: R_X86_64_PLT32	entry_ibpb-0x4
0057       57:	0f 01 ca             	clac
005a       5a:	e8 00 00 00 00       	call   5f <.altinstr_replacement+0x5f>	5b: R_X86_64_PLT32	.entry.text+0x10c
005f       5f:	0f 01 ca             	clac
0062       62:	e8 00 00 00 00       	call   67 <.altinstr_replacement+0x67>	63: R_X86_64_PLT32	.entry.text+0x10c
0067       67:	0f 01 ca             	clac
006a       6a:	e8 00 00 00 00       	call   6f <.altinstr_replacement+0x6f>	6b: R_X86_64_PLT32	.entry.text+0x10c
006f       6f:	0f 01 ca             	clac
0072       72:	e8 00 00 00 00       	call   77 <.altinstr_replacement+0x77>	73: R_X86_64_PLT32	.entry.text+0x10c
0077       77:	0f 01 ca             	clac
007a       7a:	e8 00 00 00 00       	call   7f <.altinstr_replacement+0x7f>	7b: R_X86_64_PLT32	.entry.text+0x10c
007f       7f:	0f 01 ca             	clac
0082       82:	e8 00 00 00 00       	call   87 <.altinstr_replacement+0x87>	83: R_X86_64_PLT32	.entry.text+0x10c
0087       87:	0f 01 ca             	clac
008a       8a:	e8 00 00 00 00       	call   8f <.altinstr_replacement+0x8f>	8b: R_X86_64_PLT32	.entry.text+0x10c
008f       8f:	0f 01 ca             	clac
0092       92:	e8 00 00 00 00       	call   97 <.altinstr_replacement+0x97>	93: R_X86_64_PLT32	.entry.text+0x10c
0097       97:	0f 01 ca             	clac
009a       9a:	e8 00 00 00 00       	call   9f <.altinstr_replacement+0x9f>	9b: R_X86_64_PLT32	.entry.text+0x10c
009f       9f:	0f 01 ca             	clac
00a2       a2:	e8 00 00 00 00       	call   a7 <.altinstr_replacement+0xa7>	a3: R_X86_64_PLT32	.entry.text+0x10c
00a7       a7:	0f 01 ca             	clac
00aa       aa:	e8 00 00 00 00       	call   af <.altinstr_replacement+0xaf>	ab: R_X86_64_PLT32	.entry.text+0x10c
00af       af:	0f 01 ca             	clac
00b2       b2:	e8 00 00 00 00       	call   b7 <.altinstr_replacement+0xb7>	b3: R_X86_64_PLT32	.entry.text+0x10c
00b7       b7:	0f 01 ca             	clac
00ba       ba:	e8 00 00 00 00       	call   bf <.altinstr_replacement+0xbf>	bb: R_X86_64_PLT32	.entry.text+0x10c
00bf       bf:	0f 01 ca             	clac
00c2       c2:	e8 00 00 00 00       	call   c7 <.altinstr_replacement+0xc7>	c3: R_X86_64_PLT32	.entry.text+0x10c
00c7       c7:	0f 01 ca             	clac
00ca       ca:	e8 00 00 00 00       	call   cf <.altinstr_replacement+0xcf>	cb: R_X86_64_PLT32	.entry.text+0x10c
00cf       cf:	0f 01 ca             	clac
00d2       d2:	e8 00 00 00 00       	call   d7 <.altinstr_replacement+0xd7>	d3: R_X86_64_PLT32	.entry.text+0x10c
00d7       d7:	0f 01 ca             	clac
00da       da:	e8 00 00 00 00       	call   df <.altinstr_replacement+0xdf>	db: R_X86_64_PLT32	.entry.text+0x10c
00df       df:	0f 01 ca             	clac
00e2       e2:	0f 01 ca             	clac
00e5       e5:	e8 00 00 00 00       	call   ea <.altinstr_replacement+0xea>	e6: R_X86_64_PLT32	.entry.text+0x10c
00ea       ea:	0f 01 ca             	clac
00ed       ed:	e8 00 00 00 00       	call   f2 <.altinstr_replacement+0xf2>	ee: R_X86_64_PLT32	.entry.text+0x10c
00f2       f2:	0f 01 ca             	clac
00f5       f5:	e8 00 00 00 00       	call   fa <.altinstr_replacement+0xfa>	f6: R_X86_64_PLT32	.entry.text+0x10c
00fa       fa:	0f 01 ca             	clac
00fd       fd:	e8 00 00 00 00       	call   102 <.altinstr_replacement+0x102>	fe: R_X86_64_PLT32	.entry.text+0x10c
0102      102:	0f 01 ca             	clac
0105      105:	e8 00 00 00 00       	call   10a <.altinstr_replacement+0x10a>	106: R_X86_64_PLT32	.entry.text+0x10c
010a      10a:	0f 01 ca             	clac
010d      10d:	e8 00 00 00 00       	call   112 <.altinstr_replacement+0x112>	10e: R_X86_64_PLT32	.entry.text+0x10c
0112      112:	0f 01 ca             	clac
0115      115:	e8 00 00 00 00       	call   11a <.altinstr_replacement+0x11a>	116: R_X86_64_PLT32	.entry.text+0x10c
011a      11a:	0f 01 ca             	clac
011d      11d:	e8 00 00 00 00       	call   122 <.altinstr_replacement+0x122>	11e: R_X86_64_PLT32	.entry.text+0x10c
0122      122:	0f 01 ca             	clac
0125      125:	e8 00 00 00 00       	call   12a <.altinstr_replacement+0x12a>	126: R_X86_64_PLT32	.entry.text+0x10c
012a      12a:	0f 01 ca             	clac
012d      12d:	e8 00 00 00 00       	call   132 <.altinstr_replacement+0x132>	12e: R_X86_64_PLT32	.entry.text+0x10c
0132      132:	0f 01 ca             	clac
0135      135:	e8 00 00 00 00       	call   13a <.altinstr_replacement+0x13a>	136: R_X86_64_PLT32	.entry.text+0x10c
013a      13a:	0f 01 ca             	clac
013d      13d:	e8 00 00 00 00       	call   142 <.altinstr_replacement+0x142>	13e: R_X86_64_PLT32	.entry.text+0x10c
0142      142:	0f 01 ca             	clac
0145      145:	e8 00 00 00 00       	call   14a <.altinstr_replacement+0x14a>	146: R_X86_64_PLT32	.entry.text+0x10c
014a      14a:	0f 01 ca             	clac
014d      14d:	e8 00 00 00 00       	call   152 <.altinstr_replacement+0x152>	14e: R_X86_64_PLT32	.entry.text+0x10c
0152      152:	0f 01 ca             	clac
0155      155:	e8 00 00 00 00       	call   15a <.altinstr_replacement+0x15a>	156: R_X86_64_PLT32	.entry.text+0x10c
015a      15a:	0f 01 ca             	clac
015d      15d:	e8 00 00 00 00       	call   162 <.altinstr_replacement+0x162>	15e: R_X86_64_PLT32	.entry.text+0x10c
0162      162:	0f 01 ca             	clac
0165      165:	e8 00 00 00 00       	call   16a <.altinstr_replacement+0x16a>	166: R_X86_64_PLT32	.entry.text+0x10c
016a      16a:	e8 00 00 00 00       	call   16f <.altinstr_replacement+0x16f>	16b: R_X86_64_PLT32	entry_untrain_ret-0x4
016f      16f:	e8 00 00 00 00       	call   174 <.altinstr_replacement+0x174>	170: R_X86_64_PLT32	entry_ibpb-0x4
0174      174:	0f ae f0             	mfence
0177      177:	b8 2b 00 00 00       	mov    $0x2b,%eax
017c      17c:	8e e8                	mov    %eax,%gs
017e      17e:	0f ae e8             	lfence
0181      181:	e8 00 00 00 00       	call   186 <.altinstr_replacement+0x186>	182: R_X86_64_PLT32	entry_untrain_ret-0x4
0186      186:	e8 00 00 00 00       	call   18b <.altinstr_replacement+0x18b>	187: R_X86_64_PLT32	entry_ibpb-0x4
018b      18b:	0f ae e8             	lfence
018e      18e:	e8 00 00 00 00       	call   193 <.altinstr_replacement+0x193>	18f: R_X86_64_PLT32	entry_untrain_ret-0x4
0193      193:	e8 00 00 00 00       	call   198 <.altinstr_replacement+0x198>	194: R_X86_64_PLT32	entry_ibpb-0x4
0198      198:	0f ae e8             	lfence
019b      19b:	0f ae e8             	lfence
019e      19e:	e8 00 00 00 00       	call   1a3 <.altinstr_replacement+0x1a3>	19f: R_X86_64_PLT32	entry_untrain_ret-0x4
01a3      1a3:	e8 00 00 00 00       	call   1a8 <.altinstr_replacement+0x1a8>	1a4: R_X86_64_PLT32	entry_ibpb-0x4
01a8      1a8:	0f 01 ca             	clac
01ab      1ab:	0f ae e8             	lfence
01ae      1ae:	e8 00 00 00 00       	call   1b3 <.altinstr_replacement+0x1b3>	1af: R_X86_64_PLT32	entry_untrain_ret-0x4
01b3      1b3:	e8 00 00 00 00       	call   1b8 <.altinstr_replacement+0x1b8>	1b4: R_X86_64_PLT32	entry_ibpb-0x4
01b8      1b8:	e8 00 00 00 00       	call   1bd <.altinstr_replacement+0x1bd>	1b9: R_X86_64_PLT32	__x86_indirect_thunk_r8-0x4
01bd      1bd:	0f ae e8             	lfence
01c0      1c0:	41 ff d0             	call   *%r8
01c3      1c3:	e9 00 00 00 00       	jmp    1c8 <.altinstr_replacement+0x1c8>	1c4: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
01c8      1c8:	0f ae e8             	lfence
01cb      1cb:	ff e7                	jmp    *%rdi
01cd      1cd:	0f 01 cb             	stac
01d0      1d0:	0f 01 ca             	clac
01d3      1d3:	0f 01 cb             	stac
01d6      1d6:	0f 01 ca             	clac
01d9      1d9:	0f 01 cb             	stac
01dc      1dc:	0f 01 ca             	clac
01df      1df:	0f 01 ca             	clac
01e2      1e2:	0f 01 ca             	clac
01e5      1e5:	0f 01 cb             	stac
01e8      1e8:	0f 01 ca             	clac
01eb      1eb:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
01f5      1f5:	0f 01 cb             	stac
01f8      1f8:	0f 01 ca             	clac
01fb      1fb:	48 ba ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rdx
0205      205:	0f 01 cb             	stac
0208      208:	0f 01 ca             	clac
020b      20b:	48 ba fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rdx
0215      215:	0f 01 cb             	stac
0218      218:	0f 01 ca             	clac
021b      21b:	48 ba f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rdx
0225      225:	0f 01 cb             	stac
0228      228:	0f 01 ca             	clac
022b      22b:	0f 01 cb             	stac
022e      22e:	0f ae e8             	lfence
0231      231:	0f 01 ca             	clac
0234      234:	0f 01 cb             	stac
0237      237:	0f ae e8             	lfence
023a      23a:	0f 01 ca             	clac
023d      23d:	0f 01 cb             	stac
0240      240:	0f ae e8             	lfence
0243      243:	0f 01 ca             	clac
0246      246:	0f 01 cb             	stac
0249      249:	0f ae e8             	lfence
024c      24c:	0f 01 ca             	clac
024f      24f:	0f 01 ca             	clac
0252      252:	e9 00 00 00 00       	jmp    257 <.altinstr_replacement+0x257>	253: R_X86_64_PLT32	.noinstr.text+0x3c
0257      257:	e9 00 00 00 00       	jmp    25c <.altinstr_replacement+0x25c>	258: R_X86_64_PLT32	.text+0x34c89
025c      25c:	e9 00 00 00 00       	jmp    261 <.altinstr_replacement+0x261>	25d: R_X86_64_PLT32	.text+0x34cdc
0261      261:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
026b      26b:	0f 01 cb             	stac
026e      26e:	0f 01 ca             	clac
0271      271:	48 bb ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rbx
027b      27b:	0f 01 cb             	stac
027e      27e:	0f 01 ca             	clac
0281      281:	48 bb fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rbx
028b      28b:	0f 01 cb             	stac
028e      28e:	0f 01 ca             	clac
0291      291:	48 bb f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rbx
029b      29b:	0f 01 cb             	stac
029e      29e:	0f 01 ca             	clac
02a1      2a1:	0f 01 ca             	clac
02a4      2a4:	0f ae e8             	lfence
02a7      2a7:	ff e0                	jmp    *%rax
02a9      2a9:	cc                   	int3
02aa      2aa:	ff e0                	jmp    *%rax
02ac      2ac:	0f ae e8             	lfence
02af      2af:	ff e1                	jmp    *%rcx
02b1      2b1:	cc                   	int3
02b2      2b2:	ff e1                	jmp    *%rcx
02b4      2b4:	0f ae e8             	lfence
02b7      2b7:	ff e2                	jmp    *%rdx
02b9      2b9:	cc                   	int3
02ba      2ba:	ff e2                	jmp    *%rdx
02bc      2bc:	0f ae e8             	lfence
02bf      2bf:	ff e3                	jmp    *%rbx
02c1      2c1:	cc                   	int3
02c2      2c2:	ff e3                	jmp    *%rbx
02c4      2c4:	0f ae e8             	lfence
02c7      2c7:	ff e4                	jmp    *%rsp
02c9      2c9:	cc                   	int3
02ca      2ca:	ff e4                	jmp    *%rsp
02cc      2cc:	0f ae e8             	lfence
02cf      2cf:	ff e5                	jmp    *%rbp
02d1      2d1:	cc                   	int3
02d2      2d2:	ff e5                	jmp    *%rbp
02d4      2d4:	0f ae e8             	lfence
02d7      2d7:	ff e6                	jmp    *%rsi
02d9      2d9:	cc                   	int3
02da      2da:	ff e6                	jmp    *%rsi
02dc      2dc:	0f ae e8             	lfence
02df      2df:	ff e7                	jmp    *%rdi
02e1      2e1:	cc                   	int3
02e2      2e2:	ff e7                	jmp    *%rdi
02e4      2e4:	0f ae e8             	lfence
02e7      2e7:	41 ff e0             	jmp    *%r8
02ea      2ea:	cc                   	int3
02eb      2eb:	41 ff e0             	jmp    *%r8
02ee      2ee:	0f ae e8             	lfence
02f1      2f1:	41 ff e1             	jmp    *%r9
02f4      2f4:	cc                   	int3
02f5      2f5:	41 ff e1             	jmp    *%r9
02f8      2f8:	0f ae e8             	lfence
02fb      2fb:	41 ff e2             	jmp    *%r10
02fe      2fe:	cc                   	int3
02ff      2ff:	41 ff e2             	jmp    *%r10
0302      302:	0f ae e8             	lfence
0305      305:	41 ff e3             	jmp    *%r11
0308      308:	cc                   	int3
0309      309:	41 ff e3             	jmp    *%r11
030c      30c:	0f ae e8             	lfence
030f      30f:	41 ff e4             	jmp    *%r12
0312      312:	cc                   	int3
0313      313:	41 ff e4             	jmp    *%r12
0316      316:	0f ae e8             	lfence
0319      319:	41 ff e5             	jmp    *%r13
031c      31c:	cc                   	int3
031d      31d:	41 ff e5             	jmp    *%r13
0320      320:	0f ae e8             	lfence
0323      323:	41 ff e6             	jmp    *%r14
0326      326:	cc                   	int3
0327      327:	41 ff e6             	jmp    *%r14
032a      32a:	0f ae e8             	lfence
032d      32d:	41 ff e7             	jmp    *%r15
0330      330:	cc                   	int3
0331      331:	41 ff e7             	jmp    *%r15
0334      334:	e9 00 00 00 00       	jmp    339 <.altinstr_replacement+0x339>	335: R_X86_64_PLT32	srso_untrain_ret-0x4
0339      339:	e9 00 00 00 00       	jmp    33e <.altinstr_replacement+0x33e>	33a: R_X86_64_PLT32	srso_alias_untrain_ret-0x4
033e      33e:	e8 00 00 00 00       	call   343 <.altinstr_replacement+0x343>	33f: R_X86_64_PLT32	clear_page_rep-0x4
0343      343:	e8 00 00 00 00       	call   348 <.altinstr_replacement+0x348>	344: R_X86_64_PLT32	clear_page_erms-0x4
0348      348:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0352      352:	e9 00 00 00 00       	jmp    357 <.altinstr_replacement+0x357>	353: R_X86_64_PLT32	.init.text+0x5049
0357      357:	e9 00 00 00 00       	jmp    35c <.altinstr_replacement+0x35c>	358: R_X86_64_PLT32	.init.text+0x505d
035c      35c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0361      361:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0366      366:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0370      370:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0375      375:	f3 48 0f b8 c7       	popcnt %rdi,%rax
037a      37a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
037f      37f:	0f ae e8             	lfence
0382      382:	0f 31                	rdtsc
0384      384:	0f 01 f9             	rdtscp
0387      387:	0f ae e8             	lfence
038a      38a:	0f 31                	rdtsc
038c      38c:	0f 01 f9             	rdtscp
038f      38f:	0f ae e8             	lfence
0392      392:	0f 31                	rdtsc
0394      394:	0f 01 f9             	rdtscp
0397      397:	e9 00 00 00 00       	jmp    39c <.altinstr_replacement+0x39c>	398: R_X86_64_PLT32	.init.text+0x7c97
039c      39c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03a1      3a1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03a6      3a6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03ab      3ab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
03b0      3b0:	e9 00 00 00 00       	jmp    3b5 <.altinstr_replacement+0x3b5>	3b1: R_X86_64_PLT32	.text.intel_pmu_lbr_swap_task_ctx+0x9f
03b5      3b5:	e9 00 00 00 00       	jmp    3ba <.altinstr_replacement+0x3ba>	3b6: R_X86_64_PLT32	.text.intel_pmu_lbr_swap_task_ctx+0xb1
03ba      3ba:	e9 00 00 00 00       	jmp    3bf <.altinstr_replacement+0x3bf>	3bb: R_X86_64_PLT32	.text.intel_pmu_lbr_swap_task_ctx+0xc3
03bf      3bf:	e9 00 00 00 00       	jmp    3c4 <.altinstr_replacement+0x3c4>	3c0: R_X86_64_PLT32	.text.intel_pmu_lbr_swap_task_ctx+0xd5
03c4      3c4:	e9 00 00 00 00       	jmp    3c9 <.altinstr_replacement+0x3c9>	3c5: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x1be
03c9      3c9:	e9 00 00 00 00       	jmp    3ce <.altinstr_replacement+0x3ce>	3ca: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x210
03ce      3ce:	e9 00 00 00 00       	jmp    3d3 <.altinstr_replacement+0x3d3>	3cf: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x1e1
03d3      3d3:	e9 00 00 00 00       	jmp    3d8 <.altinstr_replacement+0x3d8>	3d4: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x28f
03d8      3d8:	e9 00 00 00 00       	jmp    3dd <.altinstr_replacement+0x3dd>	3d9: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x2a7
03dd      3dd:	e9 00 00 00 00       	jmp    3e2 <.altinstr_replacement+0x3e2>	3de: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x2f7
03e2      3e2:	e9 00 00 00 00       	jmp    3e7 <.altinstr_replacement+0x3e7>	3e3: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x39e
03e7      3e7:	e9 00 00 00 00       	jmp    3ec <.altinstr_replacement+0x3ec>	3e8: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x2d8
03ec      3ec:	e9 00 00 00 00       	jmp    3f1 <.altinstr_replacement+0x3f1>	3ed: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x2c3
03f1      3f1:	e9 00 00 00 00       	jmp    3f6 <.altinstr_replacement+0x3f6>	3f2: R_X86_64_PLT32	.text.intel_pmu_lbr_sched_task+0x3e6
03f6      3f6:	e9 00 00 00 00       	jmp    3fb <.altinstr_replacement+0x3fb>	3f7: R_X86_64_PLT32	.text.intel_pmu_lbr_add+0x176
03fb      3fb:	e9 00 00 00 00       	jmp    400 <.altinstr_replacement+0x400>	3fc: R_X86_64_PLT32	.text.release_lbr_buffers+0xd5
0400      400:	e9 00 00 00 00       	jmp    405 <.altinstr_replacement+0x405>	401: R_X86_64_PLT32	.text.reserve_lbr_buffers+0xda
0405      405:	e9 00 00 00 00       	jmp    40a <.altinstr_replacement+0x40a>	406: R_X86_64_PLT32	.text.intel_pmu_lbr_del+0x14b
040a      40a:	e9 00 00 00 00       	jmp    40f <.altinstr_replacement+0x40f>	40b: R_X86_64_PLT32	.text.intel_pmu_lbr_enable_all+0x1c2
040f      40f:	e9 00 00 00 00       	jmp    414 <.altinstr_replacement+0x414>	410: R_X86_64_PLT32	.text.intel_pmu_lbr_enable_all+0x1db
0414      414:	e9 00 00 00 00       	jmp    419 <.altinstr_replacement+0x419>	415: R_X86_64_PLT32	.text.intel_pmu_lbr_enable_all+0x1f6
0419      419:	e9 00 00 00 00       	jmp    41e <.altinstr_replacement+0x41e>	41a: R_X86_64_PLT32	.text.intel_pmu_lbr_enable_all+0x20f
041e      41e:	e9 00 00 00 00       	jmp    423 <.altinstr_replacement+0x423>	41f: R_X86_64_PLT32	.text.intel_pmu_lbr_disable_all+0x9f
0423      423:	e9 00 00 00 00       	jmp    428 <.altinstr_replacement+0x428>	424: R_X86_64_PLT32	.text.intel_pmu_lbr_filter+0xb1e
0428      428:	e9 00 00 00 00       	jmp    42d <.altinstr_replacement+0x42d>	429: R_X86_64_PLT32	.text.intel_pmu_setup_lbr_filter+0x1e6
042d      42d:	e9 00 00 00 00       	jmp    432 <.altinstr_replacement+0x432>	42e: R_X86_64_PLT32	.text.intel_pmu_store_pebs_lbrs+0x6c
0432      432:	e9 00 00 00 00       	jmp    437 <.altinstr_replacement+0x437>	433: R_X86_64_PLT32	.text.intel_pmu_store_lbr+0x1e5
0437      437:	e9 00 00 00 00       	jmp    43c <.altinstr_replacement+0x43c>	438: R_X86_64_PLT32	.text.intel_pmu_store_lbr+0x27b
043c      43c:	e9 00 00 00 00       	jmp    441 <.altinstr_replacement+0x441>	43d: R_X86_64_PLT32	.text.intel_pmu_store_lbr+0x317
0441      441:	e9 00 00 00 00       	jmp    446 <.altinstr_replacement+0x446>	442: R_X86_64_PLT32	.text.intel_pmu_store_lbr+0x328
0446      446:	e8 00 00 00 00       	call   44b <.altinstr_replacement+0x44b>	447: R_X86_64_PLT32	clear_page_rep-0x4
044b      44b:	e8 00 00 00 00       	call   450 <.altinstr_replacement+0x450>	44c: R_X86_64_PLT32	clear_page_erms-0x4
0450      450:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0455      455:	f3 48 0f b8 c7       	popcnt %rdi,%rax
045a      45a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
045f      45f:	e9 00 00 00 00       	jmp    464 <.altinstr_replacement+0x464>	460: R_X86_64_PLT32	.text.__show_regs+0xd2
0464      464:	e9 00 00 00 00       	jmp    469 <.altinstr_replacement+0x469>	465: R_X86_64_PLT32	.text.__show_regs+0x2be
0469      469:	e9 00 00 00 00       	jmp    46e <.altinstr_replacement+0x46e>	46a: R_X86_64_PLT32	.text.current_save_fsgs+0xb1
046e      46e:	e9 00 00 00 00       	jmp    473 <.altinstr_replacement+0x473>	46f: R_X86_64_PLT32	.noinstr.text+0x2e7
0473      473:	e9 00 00 00 00       	jmp    478 <.altinstr_replacement+0x478>	474: R_X86_64_PLT32	.noinstr.text+0x33b
0478      478:	e9 00 00 00 00       	jmp    47d <.altinstr_replacement+0x47d>	479: R_X86_64_PLT32	.text.start_thread+0x9c
047d      47d:	e9 00 00 00 00       	jmp    482 <.altinstr_replacement+0x482>	47e: R_X86_64_PLT32	.text.__switch_to+0x3aa
0482      482:	e9 00 00 00 00       	jmp    487 <.altinstr_replacement+0x487>	483: R_X86_64_PLT32	.text.__switch_to+0x3cd
0487      487:	e9 00 00 00 00       	jmp    48c <.altinstr_replacement+0x48c>	488: R_X86_64_PLT32	.text.__switch_to+0x1c5
048c      48c:	e9 00 00 00 00       	jmp    491 <.altinstr_replacement+0x491>	48d: R_X86_64_PLT32	.text.__switch_to+0x1f8
0491      491:	e9 00 00 00 00       	jmp    496 <.altinstr_replacement+0x496>	492: R_X86_64_PLT32	.text.__switch_to+0x23b
0496      496:	e9 00 00 00 00       	jmp    49b <.altinstr_replacement+0x49b>	497: R_X86_64_PLT32	.text.__switch_to+0x6de
049b      49b:	e9 00 00 00 00       	jmp    4a0 <.altinstr_replacement+0x4a0>	49c: R_X86_64_PLT32	.text.__switch_to+0x6f8
04a0      4a0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
04aa      4aa:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
04b4      4b4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
04be      4be:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
04c8      4c8:	0f 01 cb             	stac
04cb      4cb:	0f ae e8             	lfence
04ce      4ce:	0f 01 ca             	clac
04d1      4d1:	0f 01 ca             	clac
04d4      4d4:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
04de      4de:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
04e8      4e8:	e9 00 00 00 00       	jmp    4ed <.altinstr_replacement+0x4ed>	4e9: R_X86_64_PLT32	.noinstr.text+0xa1c
04ed      4ed:	e9 00 00 00 00       	jmp    4f2 <.altinstr_replacement+0x4f2>	4ee: R_X86_64_PLT32	.noinstr.text+0xe61
04f2      4f2:	e9 00 00 00 00       	jmp    4f7 <.altinstr_replacement+0x4f7>	4f3: R_X86_64_PLT32	.text.get_kernel_gp_address+0x116
04f7      4f7:	e9 00 00 00 00       	jmp    4fc <.altinstr_replacement+0x4fc>	4f8: R_X86_64_PLT32	.text.get_kernel_gp_address+0x141
04fc      4fc:	e9 00 00 00 00       	jmp    501 <.altinstr_replacement+0x501>	4fd: R_X86_64_PLT32	.init.text+0xb51b
0501      501:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
050b      50b:	c6 07 00             	movb   $0x0,(%rdi)
050e      50e:	e9 00 00 00 00       	jmp    513 <.altinstr_replacement+0x513>	50f: R_X86_64_PLT32	.noinstr.text+0x175d
0513      513:	e9 00 00 00 00       	jmp    518 <.altinstr_replacement+0x518>	514: R_X86_64_PLT32	.text.load_mm_ldt+0x61
0518      518:	e9 00 00 00 00       	jmp    51d <.altinstr_replacement+0x51d>	519: R_X86_64_PLT32	.text.flush_ldt+0xfa
051d      51d:	e9 00 00 00 00       	jmp    522 <.altinstr_replacement+0x522>	51e: R_X86_64_PLT32	.init.text+0xb64d
0522      522:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
052c      52c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0536      536:	e9 00 00 00 00       	jmp    53b <.altinstr_replacement+0x53b>	537: R_X86_64_PLT32	.init.text+0xc995
053b      53b:	e9 00 00 00 00       	jmp    540 <.altinstr_replacement+0x540>	53c: R_X86_64_PLT32	.init.text+0xc9c3
0540      540:	e9 00 00 00 00       	jmp    545 <.altinstr_replacement+0x545>	541: R_X86_64_PLT32	.init.text+0xca01
0545      545:	e9 00 00 00 00       	jmp    54a <.altinstr_replacement+0x54a>	546: R_X86_64_PLT32	.init.text+0xca28
054a      54a:	e9 00 00 00 00       	jmp    54f <.altinstr_replacement+0x54f>	54b: R_X86_64_PLT32	.init.text+0xdbcb
054f      54f:	e9 00 00 00 00       	jmp    554 <.altinstr_replacement+0x554>	550: R_X86_64_PLT32	.init.text+0xdbfb
0554      554:	e9 00 00 00 00       	jmp    559 <.altinstr_replacement+0x559>	555: R_X86_64_PLT32	.text.text_poke_early+0xd5
0559      559:	e9 00 00 00 00       	jmp    55e <.altinstr_replacement+0x55e>	55a: R_X86_64_PLT32	.text.apply_retpolines+0x141
055e      55e:	e9 00 00 00 00       	jmp    563 <.altinstr_replacement+0x563>	55f: R_X86_64_PLT32	.text.apply_retpolines+0x50
0563      563:	e9 00 00 00 00       	jmp    568 <.altinstr_replacement+0x568>	564: R_X86_64_PLT32	.text.apply_retpolines+0x1a6
0568      568:	e9 00 00 00 00       	jmp    56d <.altinstr_replacement+0x56d>	569: R_X86_64_PLT32	.text.apply_returns+0x198
056d      56d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0572      572:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0577      577:	f3 48 0f b8 c7       	popcnt %rdi,%rax
057c      57c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0581      581:	e9 00 00 00 00       	jmp    586 <.altinstr_replacement+0x586>	582: R_X86_64_PLT32	.text.do_sync_core.llvm.18223257685277746969+0x15
0586      586:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0590      590:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
059a      59a:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05a4      5a4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
05a9      5a9:	0f ae e8             	lfence
05ac      5ac:	0f 31                	rdtsc
05ae      5ae:	0f 01 f9             	rdtscp
05b1      5b1:	e9 00 00 00 00       	jmp    5b6 <.altinstr_replacement+0x5b6>	5b2: R_X86_64_PLT32	.ref.text+0x70c
05b6      5b6:	e9 00 00 00 00       	jmp    5bb <.altinstr_replacement+0x5bb>	5b7: R_X86_64_PLT32	.text.copy_thread+0x121
05bb      5bb:	e9 00 00 00 00       	jmp    5c0 <.altinstr_replacement+0x5c0>	5bc: R_X86_64_PLT32	.text.flush_thread+0x4e
05c0      5c0:	e9 00 00 00 00       	jmp    5c5 <.altinstr_replacement+0x5c5>	5c1: R_X86_64_PLT32	.text.speculation_ctrl_update+0x100
05c5      5c5:	e9 00 00 00 00       	jmp    5ca <.altinstr_replacement+0x5ca>	5c6: R_X86_64_PLT32	.text.speculation_ctrl_update+0x1fd
05ca      5ca:	e9 00 00 00 00       	jmp    5cf <.altinstr_replacement+0x5cf>	5cb: R_X86_64_PLT32	.text.speculation_ctrl_update+0x243
05cf      5cf:	e9 00 00 00 00       	jmp    5d4 <.altinstr_replacement+0x5d4>	5d0: R_X86_64_PLT32	.text.speculation_ctrl_update+0x204
05d4      5d4:	e9 00 00 00 00       	jmp    5d9 <.altinstr_replacement+0x5d9>	5d5: R_X86_64_PLT32	.text.speculation_ctrl_update+0x94
05d9      5d9:	e9 00 00 00 00       	jmp    5de <.altinstr_replacement+0x5de>	5da: R_X86_64_PLT32	.text.__switch_to_xtra+0x27c
05de      5de:	e9 00 00 00 00       	jmp    5e3 <.altinstr_replacement+0x5e3>	5df: R_X86_64_PLT32	.text.__switch_to_xtra+0x38a
05e3      5e3:	e9 00 00 00 00       	jmp    5e8 <.altinstr_replacement+0x5e8>	5e4: R_X86_64_PLT32	.text.__switch_to_xtra+0x483
05e8      5e8:	e9 00 00 00 00       	jmp    5ed <.altinstr_replacement+0x5ed>	5e9: R_X86_64_PLT32	.text.__switch_to_xtra+0x4af
05ed      5ed:	e9 00 00 00 00       	jmp    5f2 <.altinstr_replacement+0x5f2>	5ee: R_X86_64_PLT32	.text.__switch_to_xtra+0x4fa
05f2      5f2:	e9 00 00 00 00       	jmp    5f7 <.altinstr_replacement+0x5f7>	5f3: R_X86_64_PLT32	.text.__switch_to_xtra+0x525
05f7      5f7:	e9 00 00 00 00       	jmp    5fc <.altinstr_replacement+0x5fc>	5f8: R_X86_64_PLT32	.text.__switch_to_xtra+0x48a
05fc      5fc:	e9 00 00 00 00       	jmp    601 <.altinstr_replacement+0x601>	5fd: R_X86_64_PLT32	.text.__switch_to_xtra+0x17c
0601      601:	e9 00 00 00 00       	jmp    606 <.altinstr_replacement+0x606>	602: R_X86_64_PLT32	.text.__switch_to_xtra+0x501
0606      606:	e9 00 00 00 00       	jmp    60b <.altinstr_replacement+0x60b>	607: R_X86_64_PLT32	.text.__switch_to_xtra+0x231
060b      60b:	e9 00 00 00 00       	jmp    610 <.altinstr_replacement+0x610>	60c: R_X86_64_PLT32	.text.save_fpregs_to_fpstate+0xb0
0610      610:	48 0f ae 37          	xsaveopt64 (%rdi)
0614      614:	48 0f c7 2f          	xsaves64 (%rdi)
0618      618:	e9 00 00 00 00       	jmp    61d <.altinstr_replacement+0x61d>	619: R_X86_64_PLT32	.text.__restore_fpregs_from_fpstate+0x60
061d      61d:	e9 00 00 00 00       	jmp    622 <.altinstr_replacement+0x622>	61e: R_X86_64_PLT32	.text.__restore_fpregs_from_fpstate+0x6e
0622      622:	48 0f c7 1f          	xrstors64 (%rdi)
0626      626:	e9 00 00 00 00       	jmp    62b <.altinstr_replacement+0x62b>	627: R_X86_64_PLT32	.text.kernel_fpu_begin_mask+0x1bf
062b      62b:	48 0f ae 37          	xsaveopt64 (%rdi)
062f      62f:	48 0f c7 2f          	xsaves64 (%rdi)
0633      633:	e9 00 00 00 00       	jmp    638 <.altinstr_replacement+0x638>	634: R_X86_64_PLT32	.text.fpu_sync_fpstate+0x215
0638      638:	48 0f ae 37          	xsaveopt64 (%rdi)
063c      63c:	48 0f c7 2f          	xsaves64 (%rdi)
0640      640:	e9 00 00 00 00       	jmp    645 <.altinstr_replacement+0x645>	641: R_X86_64_PLT32	.text.fpstate_init+0x62
0645      645:	e9 00 00 00 00       	jmp    64a <.altinstr_replacement+0x64a>	646: R_X86_64_PLT32	.text.fpu_clone+0x26e
064a      64a:	48 0f ae 37          	xsaveopt64 (%rdi)
064e      64e:	48 0f c7 2f          	xsaves64 (%rdi)
0652      652:	48 0f c7 1f          	xrstors64 (%rdi)
0656      656:	e9 00 00 00 00       	jmp    65b <.altinstr_replacement+0x65b>	657: R_X86_64_PLT32	.text.fpu__clear_user_states+0xe5
065b      65b:	48 0f c7 1f          	xrstors64 (%rdi)
065f      65f:	e9 00 00 00 00       	jmp    664 <.altinstr_replacement+0x664>	660: R_X86_64_PLT32	.text.fpu__clear_user_states+0xfb
0664      664:	e9 00 00 00 00       	jmp    669 <.altinstr_replacement+0x669>	665: R_X86_64_PLT32	.text.fpu_flush_thread+0x6f
0669      669:	e9 00 00 00 00       	jmp    66e <.altinstr_replacement+0x66e>	66a: R_X86_64_PLT32	.text.switch_fpu_return+0x16d
066e      66e:	e9 00 00 00 00       	jmp    673 <.altinstr_replacement+0x673>	66f: R_X86_64_PLT32	.text.switch_fpu_return+0x177
0673      673:	48 0f c7 1f          	xrstors64 (%rdi)
0677      677:	e9 00 00 00 00       	jmp    67c <.altinstr_replacement+0x67c>	678: R_X86_64_PLT32	.text.xfpregs_get+0x7c
067c      67c:	e9 00 00 00 00       	jmp    681 <.altinstr_replacement+0x681>	67d: R_X86_64_PLT32	.text.xfpregs_set+0x191
0681      681:	e8 00 00 00 00       	call   686 <.altinstr_replacement+0x686>	682: R_X86_64_PLT32	copy_user_generic_string-0x4
0686      686:	e8 00 00 00 00       	call   68b <.altinstr_replacement+0x68b>	687: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
068b      68b:	e9 00 00 00 00       	jmp    690 <.altinstr_replacement+0x690>	68c: R_X86_64_PLT32	.text.xstateregs_get+0x76
0690      690:	e9 00 00 00 00       	jmp    695 <.altinstr_replacement+0x695>	691: R_X86_64_PLT32	.text.xstateregs_set+0x146
0695      695:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
069f      69f:	e9 00 00 00 00       	jmp    6a4 <.altinstr_replacement+0x6a4>	6a0: R_X86_64_PLT32	.text.copy_fpstate_to_sigframe+0x27b
06a4      6a4:	0f 01 cb             	stac
06a7      6a7:	0f 01 ca             	clac
06aa      6aa:	0f 01 cb             	stac
06ad      6ad:	0f 01 ca             	clac
06b0      6b0:	e8 00 00 00 00       	call   6b5 <.altinstr_replacement+0x6b5>	6b1: R_X86_64_PLT32	copy_user_generic_string-0x4
06b5      6b5:	e8 00 00 00 00       	call   6ba <.altinstr_replacement+0x6ba>	6b6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06ba      6ba:	e9 00 00 00 00       	jmp    6bf <.altinstr_replacement+0x6bf>	6bb: R_X86_64_PLT32	.text.copy_fpstate_to_sigframe+0x3a5
06bf      6bf:	e9 00 00 00 00       	jmp    6c4 <.altinstr_replacement+0x6c4>	6c0: R_X86_64_PLT32	.text.fpu__restore_sig+0x468
06c4      6c4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
06ce      6ce:	e9 00 00 00 00       	jmp    6d3 <.altinstr_replacement+0x6d3>	6cf: R_X86_64_PLT32	.text.fpu__restore_sig+0x483
06d3      6d3:	e8 00 00 00 00       	call   6d8 <.altinstr_replacement+0x6d8>	6d4: R_X86_64_PLT32	copy_user_generic_string-0x4
06d8      6d8:	e8 00 00 00 00       	call   6dd <.altinstr_replacement+0x6dd>	6d9: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
06dd      6dd:	e9 00 00 00 00       	jmp    6e2 <.altinstr_replacement+0x6e2>	6de: R_X86_64_PLT32	.text.fpu__restore_sig+0x364
06e2      6e2:	0f 01 cb             	stac
06e5      6e5:	0f 01 ca             	clac
06e8      6e8:	0f 01 cb             	stac
06eb      6eb:	0f 01 ca             	clac
06ee      6ee:	48 0f c7 1f          	xrstors64 (%rdi)
06f2      6f2:	0f 01 cb             	stac
06f5      6f5:	0f 01 ca             	clac
06f8      6f8:	48 0f c7 1f          	xrstors64 (%rdi)
06fc      6fc:	e9 00 00 00 00       	jmp    701 <.altinstr_replacement+0x701>	6fd: R_X86_64_PLT32	.text.fpu__alloc_mathframe+0x70
0701      701:	e9 00 00 00 00       	jmp    706 <.altinstr_replacement+0x706>	702: R_X86_64_PLT32	.text.fpu__get_fpstate_size+0x2c
0706      706:	e9 00 00 00 00       	jmp    70b <.altinstr_replacement+0x70b>	707: R_X86_64_PLT32	.init.text+0x10ada
070b      70b:	e9 00 00 00 00       	jmp    710 <.altinstr_replacement+0x710>	70c: R_X86_64_PLT32	.init.text+0x10b0f
0710      710:	e9 00 00 00 00       	jmp    715 <.altinstr_replacement+0x715>	711: R_X86_64_PLT32	.text.fpu__resume_cpu+0x9b
0715      715:	e9 00 00 00 00       	jmp    71a <.altinstr_replacement+0x71a>	716: R_X86_64_PLT32	.text.fpu__resume_cpu+0xa9
071a      71a:	e9 00 00 00 00       	jmp    71f <.altinstr_replacement+0x71f>	71b: R_X86_64_PLT32	.text.arch_set_user_pkey_access+0xb6
071f      71f:	e9 00 00 00 00       	jmp    724 <.altinstr_replacement+0x724>	720: R_X86_64_PLT32	.text.arch_set_user_pkey_access+0xcc
0724      724:	e9 00 00 00 00       	jmp    729 <.altinstr_replacement+0x729>	725: R_X86_64_PLT32	.text.arch_set_user_pkey_access+0xf9
0729      729:	e9 00 00 00 00       	jmp    72e <.altinstr_replacement+0x72e>	72a: R_X86_64_PLT32	.text.arch_set_user_pkey_access+0x110
072e      72e:	e9 00 00 00 00       	jmp    733 <.altinstr_replacement+0x733>	72f: R_X86_64_PLT32	.text.xsaves+0xaf
0733      733:	e9 00 00 00 00       	jmp    738 <.altinstr_replacement+0x738>	734: R_X86_64_PLT32	.text.xrstors+0xaf
0738      738:	e9 00 00 00 00       	jmp    73d <.altinstr_replacement+0x73d>	739: R_X86_64_PLT32	.text.proc_pid_arch_status+0x99
073d      73d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0747      747:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0751      751:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
075b      75b:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0765      765:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
076f      76f:	e9 00 00 00 00       	jmp    774 <.altinstr_replacement+0x774>	770: R_X86_64_PLT32	.text.identify_cpu+0x4f0
0774      774:	e9 00 00 00 00       	jmp    779 <.altinstr_replacement+0x779>	775: R_X86_64_PLT32	.text.identify_cpu+0x780
0779      779:	e9 00 00 00 00       	jmp    77e <.altinstr_replacement+0x77e>	77a: R_X86_64_PLT32	.text.identify_cpu+0x780
077e      77e:	e9 00 00 00 00       	jmp    783 <.altinstr_replacement+0x783>	77f: R_X86_64_PLT32	.text.identify_cpu+0x780
0783      783:	e9 00 00 00 00       	jmp    788 <.altinstr_replacement+0x788>	784: R_X86_64_PLT32	.text.update_spec_ctrl_cond+0x4c
0788      788:	e9 00 00 00 00       	jmp    78d <.altinstr_replacement+0x78d>	789: R_X86_64_PLT32	.init.text+0x11f3f
078d      78d:	e9 00 00 00 00       	jmp    792 <.altinstr_replacement+0x792>	78e: R_X86_64_PLT32	.text.x86_virt_spec_ctrl+0x42
0792      792:	e9 00 00 00 00       	jmp    797 <.altinstr_replacement+0x797>	793: R_X86_64_PLT32	.text.x86_virt_spec_ctrl+0xe9
0797      797:	e9 00 00 00 00       	jmp    79c <.altinstr_replacement+0x79c>	798: R_X86_64_PLT32	.text.x86_virt_spec_ctrl+0xf5
079c      79c:	e9 00 00 00 00       	jmp    7a1 <.altinstr_replacement+0x7a1>	79d: R_X86_64_PLT32	.text.x86_virt_spec_ctrl+0x120
07a1      7a1:	0f 30                	wrmsr
07a3      7a3:	e9 00 00 00 00       	jmp    7a8 <.altinstr_replacement+0x7a8>	7a4: R_X86_64_PLT32	.init.text+0x1437f
07a8      7a8:	e9 00 00 00 00       	jmp    7ad <.altinstr_replacement+0x7ad>	7a9: R_X86_64_PLT32	.init.text+0x14392
07ad      7ad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07b2      7b2:	e9 00 00 00 00       	jmp    7b7 <.altinstr_replacement+0x7b7>	7b3: R_X86_64_PLT32	.text.get_this_hybrid_cpu_type+0x31
07b7      7b7:	e9 00 00 00 00       	jmp    7bc <.altinstr_replacement+0x7bc>	7b8: R_X86_64_PLT32	.text.tsx_dev_mode_disable+0xe7
07bc      7bc:	e9 00 00 00 00       	jmp    7c1 <.altinstr_replacement+0x7c1>	7bd: R_X86_64_PLT32	.text.tsx_dev_mode_disable+0xf8
07c1      7c1:	e9 00 00 00 00       	jmp    7c6 <.altinstr_replacement+0x7c6>	7c2: R_X86_64_PLT32	.text.tsx_clear_cpuid+0x128
07c6      7c6:	f7 f1                	div    %ecx
07c8      7c8:	e9 00 00 00 00       	jmp    7cd <.altinstr_replacement+0x7cd>	7c9: R_X86_64_PLT32	.text.prepare_set+0x158
07cd      7cd:	e9 00 00 00 00       	jmp    7d2 <.altinstr_replacement+0x7d2>	7ce: R_X86_64_PLT32	.text.prepare_set+0x16b
07d2      7d2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07d7      7d7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07dc      7dc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07e1      7e1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07e6      7e6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07eb      7eb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07f0      7f0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07f5      7f5:	0f ae e8             	lfence
07f8      7f8:	0f 31                	rdtsc
07fa      7fa:	0f 01 f9             	rdtscp
07fd      7fd:	0f ae e8             	lfence
0800      800:	0f 31                	rdtsc
0802      802:	0f 01 f9             	rdtscp
0805      805:	0f ae e8             	lfence
0808      808:	0f 31                	rdtsc
080a      80a:	0f 01 f9             	rdtscp
080d      80d:	e9 00 00 00 00       	jmp    812 <.altinstr_replacement+0x812>	80e: R_X86_64_PLT32	.init.text+0x174e3
0812      812:	e9 00 00 00 00       	jmp    817 <.altinstr_replacement+0x817>	813: R_X86_64_PLT32	.init.text+0x174f1
0817      817:	e9 00 00 00 00       	jmp    81c <.altinstr_replacement+0x81c>	818: R_X86_64_PLT32	.init.text+0x17634
081c      81c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0821      821:	0f 01 c1             	vmcall
0824      824:	0f 01 d9             	vmmcall
0827      827:	0f 01 c1             	vmcall
082a      82a:	0f 01 d9             	vmmcall
082d      82d:	0f 01 c1             	vmcall
0830      830:	0f 01 d9             	vmmcall
0833      833:	0f 01 c1             	vmcall
0836      836:	0f 01 d9             	vmmcall
0839      839:	0f 01 c1             	vmcall
083c      83c:	0f 01 d9             	vmmcall
083f      83f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0844      844:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0849      849:	f3 48 0f b8 c7       	popcnt %rdi,%rax
084e      84e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0853      853:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0858      858:	f3 48 0f b8 c7       	popcnt %rdi,%rax
085d      85d:	e9 00 00 00 00       	jmp    862 <.altinstr_replacement+0x862>	85e: R_X86_64_PLT32	.init.text+0x19788
0862      862:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0867      867:	0f ae e8             	lfence
086a      86a:	0f 31                	rdtsc
086c      86c:	0f 01 f9             	rdtscp
086f      86f:	c6 07 00             	movb   $0x0,(%rdi)
0872      872:	0f ae e8             	lfence
0875      875:	0f 31                	rdtsc
0877      877:	0f 01 f9             	rdtscp
087a      87a:	c6 07 00             	movb   $0x0,(%rdi)
087d      87d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0882      882:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0887      887:	f3 48 0f b8 c7       	popcnt %rdi,%rax
088c      88c:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0893      893:	44 87 34 25 10 d3 5f ff 	xchg   %r14d,0xffffffffff5fd310
089b      89b:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
08a2      8a2:	44 87 34 25 10 d3 5f ff 	xchg   %r14d,0xffffffffff5fd310
08aa      8aa:	87 1c 25 00 d3 5f ff 	xchg   %ebx,0xffffffffff5fd300
08b1      8b1:	44 87 2c 25 10 d3 5f ff 	xchg   %r13d,0xffffffffff5fd310
08b9      8b9:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
08c0      8c0:	44 87 24 25 10 d3 5f ff 	xchg   %r12d,0xffffffffff5fd310
08c8      8c8:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
08cf      8cf:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
08d6      8d6:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
08dd      8dd:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
08e4      8e4:	87 b0 00 d0 5f ff    	xchg   %esi,-0xa03000(%rax)
08ea      8ea:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08ef      8ef:	0f ae e8             	lfence
08f2      8f2:	0f 31                	rdtsc
08f4      8f4:	0f 01 f9             	rdtscp
08f7      8f7:	e9 00 00 00 00       	jmp    8fc <.altinstr_replacement+0x8fc>	8f8: R_X86_64_PLT32	.text.arch_crash_save_vmcoreinfo+0xcd
08fc      8fc:	e8 00 00 00 00       	call   901 <.altinstr_replacement+0x901>	8fd: R_X86_64_PLT32	clear_page_rep-0x4
0901      901:	e8 00 00 00 00       	call   906 <.altinstr_replacement+0x906>	902: R_X86_64_PLT32	clear_page_erms-0x4
0906      906:	e9 00 00 00 00       	jmp    90b <.altinstr_replacement+0x90b>	907: R_X86_64_PLT32	.text.machine_kexec_prepare+0x20d
090b      90b:	e9 00 00 00 00       	jmp    910 <.altinstr_replacement+0x910>	90c: R_X86_64_PLT32	.text.machine_kexec_prepare+0x23d
0910      910:	e9 00 00 00 00       	jmp    915 <.altinstr_replacement+0x915>	911: R_X86_64_PLT32	.text.machine_kexec_prepare+0x2a7
0915      915:	e8 00 00 00 00       	call   91a <.altinstr_replacement+0x91a>	916: R_X86_64_PLT32	clear_page_rep-0x4
091a      91a:	e8 00 00 00 00       	call   91f <.altinstr_replacement+0x91f>	91b: R_X86_64_PLT32	clear_page_erms-0x4
091f      91f:	e9 00 00 00 00       	jmp    924 <.altinstr_replacement+0x924>	920: R_X86_64_PLT32	.init.text+0x1eef8
0924      924:	c6 07 00             	movb   $0x0,(%rdi)
0927      927:	f3 48 0f b8 c7       	popcnt %rdi,%rax
092c      92c:	0f ae e8             	lfence
092f      92f:	0f 31                	rdtsc
0931      931:	0f 01 f9             	rdtscp
0934      934:	e8 00 00 00 00       	call   939 <.altinstr_replacement+0x939>	935: R_X86_64_PLT32	clear_page_rep-0x4
0939      939:	e8 00 00 00 00       	call   93e <.altinstr_replacement+0x93e>	93a: R_X86_64_PLT32	clear_page_erms-0x4
093e      93e:	e8 00 00 00 00       	call   943 <.altinstr_replacement+0x943>	93f: R_X86_64_PLT32	clear_page_rep-0x4
0943      943:	e8 00 00 00 00       	call   948 <.altinstr_replacement+0x948>	944: R_X86_64_PLT32	clear_page_erms-0x4
0948      948:	e9 00 00 00 00       	jmp    94d <.altinstr_replacement+0x94d>	949: R_X86_64_PLT32	.text.kernel_ident_mapping_init+0x1bc
094d      94d:	e9 00 00 00 00       	jmp    952 <.altinstr_replacement+0x952>	94e: R_X86_64_PLT32	.text.kernel_ident_mapping_init+0x1db
0952      952:	e9 00 00 00 00       	jmp    957 <.altinstr_replacement+0x957>	953: R_X86_64_PLT32	.text.kernel_ident_mapping_init+0x1ca
0957      957:	e9 00 00 00 00       	jmp    95c <.altinstr_replacement+0x95c>	958: R_X86_64_PLT32	.text.ident_p4d_init+0x17e
095c      95c:	e9 00 00 00 00       	jmp    961 <.altinstr_replacement+0x961>	95d: R_X86_64_PLT32	.text.set_pte_vaddr_p4d+0x12b
0961      961:	e9 00 00 00 00       	jmp    966 <.altinstr_replacement+0x966>	962: R_X86_64_PLT32	.text.set_pte_vaddr+0xea
0966      966:	e9 00 00 00 00       	jmp    96b <.altinstr_replacement+0x96b>	967: R_X86_64_PLT32	.text.set_pte_vaddr+0xfe
096b      96b:	e9 00 00 00 00       	jmp    970 <.altinstr_replacement+0x970>	96c: R_X86_64_PLT32	.init.text+0x20a74
0970      970:	e9 00 00 00 00       	jmp    975 <.altinstr_replacement+0x975>	971: R_X86_64_PLT32	.init.text+0x20a9c
0975      975:	e9 00 00 00 00       	jmp    97a <.altinstr_replacement+0x97a>	976: R_X86_64_PLT32	.init.text+0x20ab0
097a      97a:	e9 00 00 00 00       	jmp    97f <.altinstr_replacement+0x97f>	97b: R_X86_64_PLT32	.init.text+0x20a88
097f      97f:	e9 00 00 00 00       	jmp    984 <.altinstr_replacement+0x984>	980: R_X86_64_PLT32	.init.text+0x20aca
0984      984:	e9 00 00 00 00       	jmp    989 <.altinstr_replacement+0x989>	985: R_X86_64_PLT32	.init.text+0x20ae1
0989      989:	e9 00 00 00 00       	jmp    98e <.altinstr_replacement+0x98e>	98a: R_X86_64_PLT32	.init.text+0x20eb4
098e      98e:	e9 00 00 00 00       	jmp    993 <.altinstr_replacement+0x993>	98f: R_X86_64_PLT32	.init.text+0x20ec8
0993      993:	e9 00 00 00 00       	jmp    998 <.altinstr_replacement+0x998>	994: R_X86_64_PLT32	.init.text+0x20edc
0998      998:	e9 00 00 00 00       	jmp    99d <.altinstr_replacement+0x99d>	999: R_X86_64_PLT32	.meminit.text+0x6c7
099d      99d:	e9 00 00 00 00       	jmp    9a2 <.altinstr_replacement+0x9a2>	99e: R_X86_64_PLT32	.meminit.text+0x74a
09a2      9a2:	e9 00 00 00 00       	jmp    9a7 <.altinstr_replacement+0x9a7>	9a3: R_X86_64_PLT32	.meminit.text+0x768
09a7      9a7:	e9 00 00 00 00       	jmp    9ac <.altinstr_replacement+0x9ac>	9a8: R_X86_64_PLT32	.meminit.text+0x754
09ac      9ac:	e9 00 00 00 00       	jmp    9b1 <.altinstr_replacement+0x9b1>	9ad: R_X86_64_PLT32	.meminit.text+0x830
09b1      9b1:	e9 00 00 00 00       	jmp    9b6 <.altinstr_replacement+0x9b6>	9b2: R_X86_64_PLT32	.meminit.text+0x844
09b6      9b6:	e9 00 00 00 00       	jmp    9bb <.altinstr_replacement+0x9bb>	9b7: R_X86_64_PLT32	.meminit.text+0x84e
09bb      9bb:	e9 00 00 00 00       	jmp    9c0 <.altinstr_replacement+0x9c0>	9bc: R_X86_64_PLT32	.init.text+0x21295
09c0      9c0:	e9 00 00 00 00       	jmp    9c5 <.altinstr_replacement+0x9c5>	9c1: R_X86_64_PLT32	.init.text+0x212b3
09c5      9c5:	e9 00 00 00 00       	jmp    9ca <.altinstr_replacement+0x9ca>	9c6: R_X86_64_PLT32	.init.text+0x212c7
09ca      9ca:	e9 00 00 00 00       	jmp    9cf <.altinstr_replacement+0x9cf>	9cb: R_X86_64_PLT32	.init.text+0x212db
09cf      9cf:	e9 00 00 00 00       	jmp    9d4 <.altinstr_replacement+0x9d4>	9d0: R_X86_64_PLT32	.text.kern_addr_valid+0x281
09d4      9d4:	e9 00 00 00 00       	jmp    9d9 <.altinstr_replacement+0x9d9>	9d5: R_X86_64_PLT32	.text.kern_addr_valid+0x2b8
09d9      9d9:	e9 00 00 00 00       	jmp    9de <.altinstr_replacement+0x9de>	9da: R_X86_64_PLT32	.text.kern_addr_valid+0x2cc
09de      9de:	e9 00 00 00 00       	jmp    9e3 <.altinstr_replacement+0x9e3>	9df: R_X86_64_PLT32	.text.kern_addr_valid+0x2e0
09e3      9e3:	e9 00 00 00 00       	jmp    9e8 <.altinstr_replacement+0x9e8>	9e4: R_X86_64_PLT32	.text.kern_addr_valid+0x2fd
09e8      9e8:	e9 00 00 00 00       	jmp    9ed <.altinstr_replacement+0x9ed>	9e9: R_X86_64_PLT32	.text.pfn_valid+0xc0
09ed      9ed:	e9 00 00 00 00       	jmp    9f2 <.altinstr_replacement+0x9f2>	9ee: R_X86_64_PLT32	.text.pfn_valid+0xfd
09f2      9f2:	e9 00 00 00 00       	jmp    9f7 <.altinstr_replacement+0x9f7>	9f3: R_X86_64_PLT32	.text.sync_global_pgds+0x2e1
09f7      9f7:	e9 00 00 00 00       	jmp    9fc <.altinstr_replacement+0x9fc>	9f8: R_X86_64_PLT32	.text.sync_global_pgds+0x243
09fc      9fc:	e9 00 00 00 00       	jmp    a01 <.altinstr_replacement+0xa01>	9fd: R_X86_64_PLT32	.text.sync_global_pgds+0x163
0a01      a01:	e9 00 00 00 00       	jmp    a06 <.altinstr_replacement+0xa06>	a02: R_X86_64_PLT32	.text.sync_global_pgds+0x183
0a06      a06:	e9 00 00 00 00       	jmp    a0b <.altinstr_replacement+0xa0b>	a07: R_X86_64_PLT32	.text.sync_global_pgds+0x1bc
0a0b      a0b:	e9 00 00 00 00       	jmp    a10 <.altinstr_replacement+0xa10>	a0c: R_X86_64_PLT32	.text.sync_global_pgds+0x4e0
0a10      a10:	e9 00 00 00 00       	jmp    a15 <.altinstr_replacement+0xa15>	a11: R_X86_64_PLT32	.text.sync_global_pgds+0x4f4
0a15      a15:	e9 00 00 00 00       	jmp    a1a <.altinstr_replacement+0xa1a>	a16: R_X86_64_PLT32	.text.sync_global_pgds+0x49e
0a1a      a1a:	e9 00 00 00 00       	jmp    a1f <.altinstr_replacement+0xa1f>	a1b: R_X86_64_PLT32	.text.sync_global_pgds+0x4af
0a1f      a1f:	e9 00 00 00 00       	jmp    a24 <.altinstr_replacement+0xa24>	a20: R_X86_64_PLT32	.meminit.text+0x1257
0a24      a24:	e9 00 00 00 00       	jmp    a29 <.altinstr_replacement+0xa29>	a25: R_X86_64_PLT32	.meminit.text+0x11df
0a29      a29:	e9 00 00 00 00       	jmp    a2e <.altinstr_replacement+0xa2e>	a2a: R_X86_64_PLT32	.meminit.text+0x11f3
0a2e      a2e:	e9 00 00 00 00       	jmp    a33 <.altinstr_replacement+0xa33>	a2f: R_X86_64_PLT32	.meminit.text+0x1204
0a33      a33:	e9 00 00 00 00       	jmp    a38 <.altinstr_replacement+0xa38>	a34: R_X86_64_PLT32	.meminit.text+0x1212
0a38      a38:	e9 00 00 00 00       	jmp    a3d <.altinstr_replacement+0xa3d>	a39: R_X86_64_PLT32	.text.spurious_kernel_fault+0x265
0a3d      a3d:	e9 00 00 00 00       	jmp    a42 <.altinstr_replacement+0xa42>	a3e: R_X86_64_PLT32	.text.spurious_kernel_fault+0x279
0a42      a42:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a4c      a4c:	e9 00 00 00 00       	jmp    a51 <.altinstr_replacement+0xa51>	a4d: R_X86_64_PLT32	.text.do_user_addr_fault+0x775
0a51      a51:	e9 00 00 00 00       	jmp    a56 <.altinstr_replacement+0xa56>	a52: R_X86_64_PLT32	.text.do_user_addr_fault+0x789
0a56      a56:	0f 0d 88 b0 00 00 00 	prefetchw 0xb0(%rax)
0a5d      a5d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a67      a67:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a71      a71:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0a7b      a7b:	e9 00 00 00 00       	jmp    a80 <.altinstr_replacement+0xa80>	a7c: R_X86_64_PLT32	.text.dump_pagetable+0xc1
0a80      a80:	e9 00 00 00 00       	jmp    a85 <.altinstr_replacement+0xa85>	a81: R_X86_64_PLT32	.text.dump_pagetable+0x2ba
0a85      a85:	e9 00 00 00 00       	jmp    a8a <.altinstr_replacement+0xa8a>	a86: R_X86_64_PLT32	.text.bad_area_access_error+0x19a
0a8a      a8a:	e9 00 00 00 00       	jmp    a8f <.altinstr_replacement+0xa8f>	a8b: R_X86_64_PLT32	.text.bad_area_access_error+0x1ae
0a8f      a8f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a99      a99:	e9 00 00 00 00       	jmp    a9e <.altinstr_replacement+0xa9e>	a9a: R_X86_64_PLT32	.init.text+0x215ef
0a9e      a9e:	e9 00 00 00 00       	jmp    aa3 <.altinstr_replacement+0xaa3>	a9f: R_X86_64_PLT32	.text.__ioremap_collect_map_flags+0x196
0aa3      aa3:	e9 00 00 00 00       	jmp    aa8 <.altinstr_replacement+0xaa8>	aa4: R_X86_64_PLT32	.text.__ioremap_collect_map_flags+0x1db
0aa8      aa8:	e9 00 00 00 00       	jmp    aad <.altinstr_replacement+0xaad>	aa9: R_X86_64_PLT32	.text.fixup_exception+0x756
0aad      aad:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ab7      ab7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ac1      ac1:	e9 00 00 00 00       	jmp    ac6 <.altinstr_replacement+0xac6>	ac2: R_X86_64_PLT32	.text.pfn_modify_allowed+0x111
0ac6      ac6:	e9 00 00 00 00       	jmp    acb <.altinstr_replacement+0xacb>	ac7: R_X86_64_PLT32	.text.pfn_modify_allowed+0x17b
0acb      acb:	e9 00 00 00 00       	jmp    ad0 <.altinstr_replacement+0xad0>	acc: R_X86_64_PLT32	.text.__virt_addr_valid+0x139
0ad0      ad0:	e9 00 00 00 00       	jmp    ad5 <.altinstr_replacement+0xad5>	ad1: R_X86_64_PLT32	.text.__virt_addr_valid+0x16c
0ad5      ad5:	0f 30                	wrmsr
0ad7      ad7:	e9 00 00 00 00       	jmp    adc <.altinstr_replacement+0xadc>	ad8: R_X86_64_PLT32	.text.switch_mm_irqs_off+0x2c3
0adc      adc:	e9 00 00 00 00       	jmp    ae1 <.altinstr_replacement+0xae1>	add: R_X86_64_PLT32	.text.switch_mm_irqs_off+0x594
0ae1      ae1:	e9 00 00 00 00       	jmp    ae6 <.altinstr_replacement+0xae6>	ae2: R_X86_64_PLT32	.text.switch_mm_irqs_off+0x586
0ae6      ae6:	0f 30                	wrmsr
0ae8      ae8:	e9 00 00 00 00       	jmp    aed <.altinstr_replacement+0xaed>	ae9: R_X86_64_PLT32	.text.initialize_tlbstate_and_flush+0x15f
0aed      aed:	e9 00 00 00 00       	jmp    af2 <.altinstr_replacement+0xaf2>	aee: R_X86_64_PLT32	.text.do_kernel_range_flush+0x3d
0af2      af2:	e9 00 00 00 00       	jmp    af7 <.altinstr_replacement+0xaf7>	af3: R_X86_64_PLT32	.text.__get_current_cr3_fast+0x60
0af7      af7:	e9 00 00 00 00       	jmp    afc <.altinstr_replacement+0xafc>	af8: R_X86_64_PLT32	.text.flush_tlb_one_kernel+0x23
0afc      afc:	e9 00 00 00 00       	jmp    b01 <.altinstr_replacement+0xb01>	afd: R_X86_64_PLT32	.text.native_flush_tlb_one_user+0x3d
0b01      b01:	e9 00 00 00 00       	jmp    b06 <.altinstr_replacement+0xb06>	b02: R_X86_64_PLT32	.text.native_flush_tlb_global+0x41
0b06      b06:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b10      b10:	66 41 0f ae 3c 24    	clflushopt (%r12)
0b16      b16:	66 41 0f ae 3c 24    	clflushopt (%r12)
0b1c      b1c:	66 41 0f ae 3c 24    	clflushopt (%r12)
0b22      b22:	66 41 0f ae 3c 24    	clflushopt (%r12)
0b28      b28:	e9 00 00 00 00       	jmp    b2d <.altinstr_replacement+0xb2d>	b29: R_X86_64_PLT32	.text.lookup_address_in_pgd+0x19a
0b2d      b2d:	e9 00 00 00 00       	jmp    b32 <.altinstr_replacement+0xb32>	b2e: R_X86_64_PLT32	.text.lookup_address_in_pgd+0x1ae
0b32      b32:	e9 00 00 00 00       	jmp    b37 <.altinstr_replacement+0xb37>	b33: R_X86_64_PLT32	.text.lookup_pmd_address+0x130
0b37      b37:	e9 00 00 00 00       	jmp    b3c <.altinstr_replacement+0xb3c>	b38: R_X86_64_PLT32	.text.lookup_pmd_address+0x144
0b3c      b3c:	e9 00 00 00 00       	jmp    b41 <.altinstr_replacement+0xb41>	b3d: R_X86_64_PLT32	.text.change_page_attr_set_clr.llvm.3753181076133384859+0x4ad
0b41      b41:	66 41 0f ae 7d 00    	clflushopt 0x0(%r13)
0b47      b47:	66 41 0f ae 7d 00    	clflushopt 0x0(%r13)
0b4d      b4d:	e9 00 00 00 00       	jmp    b52 <.altinstr_replacement+0xb52>	b4e: R_X86_64_PLT32	.text.__cpa_process_fault+0x211
0b52      b52:	e9 00 00 00 00       	jmp    b57 <.altinstr_replacement+0xb57>	b53: R_X86_64_PLT32	.text.__cpa_process_fault+0x21f
0b57      b57:	e9 00 00 00 00       	jmp    b5c <.altinstr_replacement+0xb5c>	b58: R_X86_64_PLT32	.text.__cpa_process_fault+0x805
0b5c      b5c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b66      b66:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b70      b70:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b75      b75:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b7a      b7a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b7f      b7f:	e9 00 00 00 00       	jmp    b84 <.altinstr_replacement+0xb84>	b80: R_X86_64_PLT32	.text.__execute_only_pkey+0x118
0b84      b84:	e9 00 00 00 00       	jmp    b89 <.altinstr_replacement+0xb89>	b85: R_X86_64_PLT32	.text.__execute_only_pkey+0x124
0b89      b89:	e9 00 00 00 00       	jmp    b8e <.altinstr_replacement+0xb8e>	b8a: R_X86_64_PLT32	.text.__arch_override_mprotect_pkey+0x1a9
0b8e      b8e:	e9 00 00 00 00       	jmp    b93 <.altinstr_replacement+0xb93>	b8f: R_X86_64_PLT32	.text.__arch_override_mprotect_pkey+0x1ba
0b93      b93:	e9 00 00 00 00       	jmp    b98 <.altinstr_replacement+0xb98>	b94: R_X86_64_PLT32	.text.__arch_override_mprotect_pkey+0x1d0
0b98      b98:	e9 00 00 00 00       	jmp    b9d <.altinstr_replacement+0xb9d>	b99: R_X86_64_PLT32	.init.text+0x24928
0b9d      b9d:	e9 00 00 00 00       	jmp    ba2 <.altinstr_replacement+0xba2>	b9e: R_X86_64_PLT32	.text.arch_prepare_bpf_trampoline+0xc9b
0ba2      ba2:	e9 00 00 00 00       	jmp    ba7 <.altinstr_replacement+0xba7>	ba3: R_X86_64_PLT32	.text.emit_bpf_dispatcher+0x2c1
0ba7      ba7:	e9 00 00 00 00       	jmp    bac <.altinstr_replacement+0xbac>	ba8: R_X86_64_PLT32	.text.emit_bpf_dispatcher+0x32e
0bac      bac:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bb6      bb6:	e9 00 00 00 00       	jmp    bbb <.altinstr_replacement+0xbbb>	bb7: R_X86_64_PLT32	.text.bpf_int_jit_compile+0x3997
0bbb      bbb:	e9 00 00 00 00       	jmp    bc0 <.altinstr_replacement+0xbc0>	bbc: R_X86_64_PLT32	.text.bpf_int_jit_compile+0x39b5
0bc0      bc0:	e9 00 00 00 00       	jmp    bc5 <.altinstr_replacement+0xbc5>	bc1: R_X86_64_PLT32	.text.bpf_int_jit_compile+0x3a19
0bc5      bc5:	e9 00 00 00 00       	jmp    bca <.altinstr_replacement+0xbca>	bc6: R_X86_64_PLT32	.text.mm_init+0x331
0bca      bca:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bd4      bd4:	e9 00 00 00 00       	jmp    bd9 <.altinstr_replacement+0xbd9>	bd5: R_X86_64_PLT32	.text.copy_mm+0x8ab
0bd9      bd9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0be3      be3:	0f 01 cb             	stac
0be6      be6:	0f ae e8             	lfence
0be9      be9:	0f 01 ca             	clac
0bec      bec:	0f 01 ca             	clac
0bef      bef:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bf9      bf9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c03      c03:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c0d      c0d:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0c17      c17:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c1c      c1c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c21      c21:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c26      c26:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c2b      c2b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c30      c30:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c35      c35:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c3a      c3a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c3f      c3f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c44      c44:	e9 00 00 00 00       	jmp    c49 <.altinstr_replacement+0xc49>	c45: R_X86_64_PLT32	.text.finish_task_switch+0x25f
0c49      c49:	e9 00 00 00 00       	jmp    c4e <.altinstr_replacement+0xc4e>	c4a: R_X86_64_PLT32	.text.finish_task_switch+0x26c
0c4e      c4e:	48 31 c0             	xor    %rax,%rax
0c51      c51:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c5b      c5b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c60      c60:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c65      c65:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c6a      c6a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c6f      c6f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c74      c74:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c79      c79:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c7e      c7e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c83      c83:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c88      c88:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c8d      c8d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c92      c92:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c97      c97:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c9c      c9c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ca1      ca1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ca6      ca6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cab      cab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cb0      cb0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cb5      cb5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cba      cba:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cbf      cbf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cc4      cc4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cc9      cc9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cce      cce:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cd3      cd3:	e9 00 00 00 00       	jmp    cd8 <.altinstr_replacement+0xcd8>	cd4: R_X86_64_PLT32	.text.ipi_sync_core+0x18
0cd8      cd8:	e9 00 00 00 00       	jmp    cdd <.altinstr_replacement+0xcdd>	cd9: R_X86_64_PLT32	.text.ipi_sync_core+0x22
0cdd      cdd:	48 31 c0             	xor    %rax,%rax
0ce0      ce0:	48 31 c0             	xor    %rax,%rax
0ce3      ce3:	48 31 c0             	xor    %rax,%rax
0ce6      ce6:	48 31 c0             	xor    %rax,%rax
0ce9      ce9:	c6 07 00             	movb   $0x0,(%rdi)
0cec      cec:	48 31 c0             	xor    %rax,%rax
0cef      cef:	0f 0d 0e             	prefetchw (%rsi)
0cf2      cf2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cf7      cf7:	0f 0d 08             	prefetchw (%rax)
0cfa      cfa:	48 31 c0             	xor    %rax,%rax
0cfd      cfd:	c6 07 00             	movb   $0x0,(%rdi)
0d00      d00:	c6 07 00             	movb   $0x0,(%rdi)
0d03      d03:	c6 07 00             	movb   $0x0,(%rdi)
0d06      d06:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d0b      d0b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d15      d15:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d1f      d1f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d24      d24:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d29      d29:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d2e      d2e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d33      d33:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d38      d38:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d3d      d3d:	49 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r8
0d47      d47:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d4c      d4c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d51      d51:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d56      d56:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d5b      d5b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d65      d65:	0f 01 cb             	stac
0d68      d68:	0f ae e8             	lfence
0d6b      d6b:	0f 01 ca             	clac
0d6e      d6e:	0f 01 ca             	clac
0d71      d71:	0f 01 ca             	clac
0d74      d74:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d7e      d7e:	0f 01 cb             	stac
0d81      d81:	0f ae e8             	lfence
0d84      d84:	0f 01 ca             	clac
0d87      d87:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d91      d91:	0f 01 cb             	stac
0d94      d94:	0f ae e8             	lfence
0d97      d97:	0f 01 ca             	clac
0d9a      d9a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d9f      d9f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0da9      da9:	0f 01 cb             	stac
0dac      dac:	0f ae e8             	lfence
0daf      daf:	0f 01 ca             	clac
0db2      db2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0dbc      dbc:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0dc6      dc6:	0f 01 cb             	stac
0dc9      dc9:	0f ae e8             	lfence
0dcc      dcc:	0f 01 ca             	clac
0dcf      dcf:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0dd9      dd9:	0f 01 cb             	stac
0ddc      ddc:	0f ae e8             	lfence
0ddf      ddf:	0f 01 ca             	clac
0de2      de2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0dec      dec:	0f 01 cb             	stac
0def      def:	0f ae e8             	lfence
0df2      df2:	0f 01 ca             	clac
0df5      df5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dfa      dfa:	e9 00 00 00 00       	jmp    dff <.altinstr_replacement+0xdff>	dfb: R_X86_64_PLT32	.init.text+0x2f543
0dff      dff:	e9 00 00 00 00       	jmp    e04 <.altinstr_replacement+0xe04>	e00: R_X86_64_PLT32	.init.text+0x2f557
0e04      e04:	e9 00 00 00 00       	jmp    e09 <.altinstr_replacement+0xe09>	e05: R_X86_64_PLT32	.text.sanity_check_segment_list+0xe5
0e09      e09:	e9 00 00 00 00       	jmp    e0e <.altinstr_replacement+0xe0e>	e0a: R_X86_64_PLT32	.text.kimage_alloc_control_pages+0x1a5
0e0e      e0e:	e9 00 00 00 00       	jmp    e13 <.altinstr_replacement+0xe13>	e0f: R_X86_64_PLT32	.text.kimage_alloc_control_pages+0x3dd
0e13      e13:	e8 00 00 00 00       	call   e18 <.altinstr_replacement+0xe18>	e14: R_X86_64_PLT32	clear_page_rep-0x4
0e18      e18:	e8 00 00 00 00       	call   e1d <.altinstr_replacement+0xe1d>	e19: R_X86_64_PLT32	clear_page_erms-0x4
0e1d      e1d:	e8 00 00 00 00       	call   e22 <.altinstr_replacement+0xe22>	e1e: R_X86_64_PLT32	clear_page_rep-0x4
0e22      e22:	e8 00 00 00 00       	call   e27 <.altinstr_replacement+0xe27>	e23: R_X86_64_PLT32	clear_page_erms-0x4
0e27      e27:	e9 00 00 00 00       	jmp    e2c <.altinstr_replacement+0xe2c>	e28: R_X86_64_PLT32	.text.kimage_alloc_page+0x1bd
0e2c      e2c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e31      e31:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e36      e36:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e3b      e3b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e40      e40:	c6 07 00             	movb   $0x0,(%rdi)
0e43      e43:	c6 07 00             	movb   $0x0,(%rdi)
0e46      e46:	c6 07 00             	movb   $0x0,(%rdi)
0e49      e49:	c6 07 00             	movb   $0x0,(%rdi)
0e4c      e4c:	c6 07 00             	movb   $0x0,(%rdi)
0e4f      e4f:	c6 07 00             	movb   $0x0,(%rdi)
0e52      e52:	c6 07 00             	movb   $0x0,(%rdi)
0e55      e55:	c6 07 00             	movb   $0x0,(%rdi)
0e58      e58:	c6 07 00             	movb   $0x0,(%rdi)
0e5b      e5b:	c6 07 00             	movb   $0x0,(%rdi)
0e5e      e5e:	c6 07 00             	movb   $0x0,(%rdi)
0e61      e61:	c6 07 00             	movb   $0x0,(%rdi)
0e64      e64:	c6 07 00             	movb   $0x0,(%rdi)
0e67      e67:	c6 07 00             	movb   $0x0,(%rdi)
0e6a      e6a:	c6 07 00             	movb   $0x0,(%rdi)
0e6d      e6d:	c6 07 00             	movb   $0x0,(%rdi)
0e70      e70:	c6 07 00             	movb   $0x0,(%rdi)
0e73      e73:	c6 07 00             	movb   $0x0,(%rdi)
0e76      e76:	e8 00 00 00 00       	call   e7b <.altinstr_replacement+0xe7b>	e77: R_X86_64_PLT32	copy_user_generic_string-0x4
0e7b      e7b:	e8 00 00 00 00       	call   e80 <.altinstr_replacement+0xe80>	e7c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e80      e80:	e8 00 00 00 00       	call   e85 <.altinstr_replacement+0xe85>	e81: R_X86_64_PLT32	copy_user_generic_string-0x4
0e85      e85:	e8 00 00 00 00       	call   e8a <.altinstr_replacement+0xe8a>	e86: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e8a      e8a:	c6 07 00             	movb   $0x0,(%rdi)
0e8d      e8d:	c6 07 00             	movb   $0x0,(%rdi)
0e90      e90:	c6 07 00             	movb   $0x0,(%rdi)
0e93      e93:	c6 07 00             	movb   $0x0,(%rdi)
0e96      e96:	c6 07 00             	movb   $0x0,(%rdi)
0e99      e99:	c6 07 00             	movb   $0x0,(%rdi)
0e9c      e9c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ea6      ea6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0eb0      eb0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0eba      eba:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ec4      ec4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ece      ece:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ed8      ed8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ee2      ee2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0eec      eec:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ef6      ef6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f00      f00:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f0a      f0a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f14      f14:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f1e      f1e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f28      f28:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f32      f32:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f3c      f3c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f46      f46:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f50      f50:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f5a      f5a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f64      f64:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f6e      f6e:	e9 00 00 00 00       	jmp    f73 <.altinstr_replacement+0xf73>	f6f: R_X86_64_PLT32	.text.bpf_map_area_alloc+0xe3
0f73      f73:	e9 00 00 00 00       	jmp    f78 <.altinstr_replacement+0xf78>	f74: R_X86_64_PLT32	.text.bpf_map_area_mmapable_alloc+0xb5
0f78      f78:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f7d      f7d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f82      f82:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f87      f87:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f8c      f8c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f91      f91:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f96      f96:	c6 07 00             	movb   $0x0,(%rdi)
0f99      f99:	c6 07 00             	movb   $0x0,(%rdi)
0f9c      f9c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0fa6      fa6:	c6 07 00             	movb   $0x0,(%rdi)
0fa9      fa9:	c6 07 00             	movb   $0x0,(%rdi)
0fac      fac:	c6 07 00             	movb   $0x0,(%rdi)
0faf      faf:	c6 07 00             	movb   $0x0,(%rdi)
0fb2      fb2:	c6 07 00             	movb   $0x0,(%rdi)
0fb5      fb5:	c6 07 00             	movb   $0x0,(%rdi)
0fb8      fb8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fbd      fbd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fc2      fc2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fc7      fc7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fcc      fcc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fd1      fd1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fd6      fd6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fdb      fdb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fe0      fe0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fe5      fe5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fea      fea:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fef      fef:	42 0f 0d 0c 31       	prefetchw (%rcx,%r14,1)
0ff4      ff4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ffe      ffe:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1003     1003:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1008     1008:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1012     1012:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
101c     101c:	e9 00 00 00 00       	jmp    1021 <.altinstr_replacement+0x1021>	101d: R_X86_64_PLT32	.text.perf_prepare_sample+0xa34
1021     1021:	e9 00 00 00 00       	jmp    1026 <.altinstr_replacement+0x1026>	1022: R_X86_64_PLT32	.text.perf_get_page_size+0x262
1026     1026:	e9 00 00 00 00       	jmp    102b <.altinstr_replacement+0x102b>	1027: R_X86_64_PLT32	.text.perf_get_page_size+0x276
102b     102b:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
1035     1035:	f3 48 0f b8 c7       	popcnt %rdi,%rax
103a     103a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
103f     103f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1044     1044:	e9 00 00 00 00       	jmp    1049 <.altinstr_replacement+0x1049>	1045: R_X86_64_PLT32	.text.memremap+0x1bb
1049     1049:	e9 00 00 00 00       	jmp    104e <.altinstr_replacement+0x104e>	104a: R_X86_64_PLT32	.text.memremap+0x2e6
104e     104e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1058     1058:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1062     1062:	0f 01 cb             	stac
1065     1065:	0f ae e8             	lfence
1068     1068:	0f 01 ca             	clac
106b     106b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1075     1075:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
107f     107f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1089     1089:	0f 01 ca             	clac
108c     108c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1096     1096:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
10a0     10a0:	e8 00 00 00 00       	call   10a5 <.altinstr_replacement+0x10a5>	10a1: R_X86_64_PLT32	copy_user_generic_string-0x4
10a5     10a5:	e8 00 00 00 00       	call   10aa <.altinstr_replacement+0x10aa>	10a6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
10aa     10aa:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
10b4     10b4:	e8 00 00 00 00       	call   10b9 <.altinstr_replacement+0x10b9>	10b5: R_X86_64_PLT32	copy_user_generic_string-0x4
10b9     10b9:	e8 00 00 00 00       	call   10be <.altinstr_replacement+0x10be>	10ba: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
10be     10be:	41 0f 0d 4f f8       	prefetchw -0x8(%r15)
10c3     10c3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
10cd     10cd:	e8 00 00 00 00       	call   10d2 <.altinstr_replacement+0x10d2>	10ce: R_X86_64_PLT32	clear_page_rep-0x4
10d2     10d2:	e8 00 00 00 00       	call   10d7 <.altinstr_replacement+0x10d7>	10d3: R_X86_64_PLT32	clear_page_erms-0x4
10d7     10d7:	e8 00 00 00 00       	call   10dc <.altinstr_replacement+0x10dc>	10d8: R_X86_64_PLT32	clear_page_rep-0x4
10dc     10dc:	e8 00 00 00 00       	call   10e1 <.altinstr_replacement+0x10e1>	10dd: R_X86_64_PLT32	clear_page_erms-0x4
10e1     10e1:	e8 00 00 00 00       	call   10e6 <.altinstr_replacement+0x10e6>	10e2: R_X86_64_PLT32	clear_page_rep-0x4
10e6     10e6:	e8 00 00 00 00       	call   10eb <.altinstr_replacement+0x10eb>	10e7: R_X86_64_PLT32	clear_page_erms-0x4
10eb     10eb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10f0     10f0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10f5     10f5:	e9 00 00 00 00       	jmp    10fa <.altinstr_replacement+0x10fa>	10f6: R_X86_64_PLT32	.text.pagetypeinfo_showblockcount_print+0xb2
10fa     10fa:	e9 00 00 00 00       	jmp    10ff <.altinstr_replacement+0x10ff>	10fb: R_X86_64_PLT32	.text.pagetypeinfo_showblockcount_print+0xcd
10ff     10ff:	e9 00 00 00 00       	jmp    1104 <.altinstr_replacement+0x1104>	1100: R_X86_64_PLT32	.init.text+0x37191
1104     1104:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1109     1109:	f3 48 0f b8 c7       	popcnt %rdi,%rax
110e     110e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1113     1113:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1118     1118:	f3 48 0f b8 c7       	popcnt %rdi,%rax
111d     111d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1122     1122:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1127     1127:	f3 48 0f b8 c7       	popcnt %rdi,%rax
112c     112c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1131     1131:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1136     1136:	e9 00 00 00 00       	jmp    113b <.altinstr_replacement+0x113b>	1137: R_X86_64_PLT32	.init.text+0x38703
113b     113b:	e9 00 00 00 00       	jmp    1140 <.altinstr_replacement+0x1140>	113c: R_X86_64_PLT32	.init.text+0x3872b
1140     1140:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1145     1145:	f3 48 0f b8 c7       	popcnt %rdi,%rax
114a     114a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
114f     114f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1154     1154:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1159     1159:	e9 00 00 00 00       	jmp    115e <.altinstr_replacement+0x115e>	115a: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x384
115e     115e:	e9 00 00 00 00       	jmp    1163 <.altinstr_replacement+0x1163>	115f: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x3c3
1163     1163:	e9 00 00 00 00       	jmp    1168 <.altinstr_replacement+0x1168>	1164: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x3e7
1168     1168:	e9 00 00 00 00       	jmp    116d <.altinstr_replacement+0x116d>	1169: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x63d
116d     116d:	e9 00 00 00 00       	jmp    1172 <.altinstr_replacement+0x1172>	116e: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x616
1172     1172:	e9 00 00 00 00       	jmp    1177 <.altinstr_replacement+0x1177>	1173: R_X86_64_PLT32	.text.__reset_isolation_pfn+0x664
1177     1177:	e9 00 00 00 00       	jmp    117c <.altinstr_replacement+0x117c>	1178: R_X86_64_PLT32	.text.compaction_alloc+0x878
117c     117c:	e9 00 00 00 00       	jmp    1181 <.altinstr_replacement+0x1181>	117d: R_X86_64_PLT32	.text.compaction_alloc+0xc5f
1181     1181:	e9 00 00 00 00       	jmp    1186 <.altinstr_replacement+0x1186>	1182: R_X86_64_PLT32	.text.follow_page_mask+0x699
1186     1186:	e9 00 00 00 00       	jmp    118b <.altinstr_replacement+0x118b>	1187: R_X86_64_PLT32	.text.follow_page_mask+0x6ad
118b     118b:	e9 00 00 00 00       	jmp    1190 <.altinstr_replacement+0x1190>	118c: R_X86_64_PLT32	.text.follow_page_mask+0x6c1
1190     1190:	e9 00 00 00 00       	jmp    1195 <.altinstr_replacement+0x1195>	1191: R_X86_64_PLT32	.text.fixup_user_fault+0x20b
1195     1195:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
119f     119f:	e9 00 00 00 00       	jmp    11a4 <.altinstr_replacement+0x11a4>	11a0: R_X86_64_PLT32	.text.__get_user_pages+0x7bc
11a4     11a4:	e9 00 00 00 00       	jmp    11a9 <.altinstr_replacement+0x11a9>	11a5: R_X86_64_PLT32	.text.__get_user_pages+0x7d0
11a9     11a9:	e9 00 00 00 00       	jmp    11ae <.altinstr_replacement+0x11ae>	11aa: R_X86_64_PLT32	.text.check_vma_flags+0x189
11ae     11ae:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
11b8     11b8:	e9 00 00 00 00       	jmp    11bd <.altinstr_replacement+0x11bd>	11b9: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0x1151
11bd     11bd:	e9 00 00 00 00       	jmp    11c2 <.altinstr_replacement+0x11c2>	11be: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0xc66
11c2     11c2:	e9 00 00 00 00       	jmp    11c7 <.altinstr_replacement+0x11c7>	11c3: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0xc7a
11c7     11c7:	e9 00 00 00 00       	jmp    11cc <.altinstr_replacement+0x11cc>	11c8: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0x737
11cc     11cc:	e9 00 00 00 00       	jmp    11d1 <.altinstr_replacement+0x11d1>	11cd: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0x971
11d1     11d1:	e9 00 00 00 00       	jmp    11d6 <.altinstr_replacement+0x11d6>	11d2: R_X86_64_PLT32	.text.internal_get_user_pages_fast+0xb88
11d6     11d6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
11db     11db:	e9 00 00 00 00       	jmp    11e0 <.altinstr_replacement+0x11e0>	11dc: R_X86_64_PLT32	.text.free_pgd_range+0x7f6
11e0     11e0:	e9 00 00 00 00       	jmp    11e5 <.altinstr_replacement+0x11e5>	11e1: R_X86_64_PLT32	.text.free_pgd_range+0x80a
11e5     11e5:	e9 00 00 00 00       	jmp    11ea <.altinstr_replacement+0x11ea>	11e6: R_X86_64_PLT32	.text.free_pgd_range+0x81e
11ea     11ea:	e9 00 00 00 00       	jmp    11ef <.altinstr_replacement+0x11ef>	11eb: R_X86_64_PLT32	.text.free_pgd_range+0x68d
11ef     11ef:	e9 00 00 00 00       	jmp    11f4 <.altinstr_replacement+0x11f4>	11f0: R_X86_64_PLT32	.text.free_pgd_range+0x836
11f4     11f4:	e9 00 00 00 00       	jmp    11f9 <.altinstr_replacement+0x11f9>	11f5: R_X86_64_PLT32	.text.free_pgd_range+0x851
11f9     11f9:	e9 00 00 00 00       	jmp    11fe <.altinstr_replacement+0x11fe>	11fa: R_X86_64_PLT32	.text.free_pgd_range+0x865
11fe     11fe:	e9 00 00 00 00       	jmp    1203 <.altinstr_replacement+0x1203>	11ff: R_X86_64_PLT32	.text.print_bad_pte+0x2f4
1203     1203:	e9 00 00 00 00       	jmp    1208 <.altinstr_replacement+0x1208>	1204: R_X86_64_PLT32	.text.copy_page_range+0x1310
1208     1208:	e9 00 00 00 00       	jmp    120d <.altinstr_replacement+0x120d>	1209: R_X86_64_PLT32	.text.copy_page_range+0x1324
120d     120d:	e9 00 00 00 00       	jmp    1212 <.altinstr_replacement+0x1212>	120e: R_X86_64_PLT32	.text.copy_page_range+0x135b
1212     1212:	e9 00 00 00 00       	jmp    1217 <.altinstr_replacement+0x1217>	1213: R_X86_64_PLT32	.text.copy_page_range+0x136f
1217     1217:	e9 00 00 00 00       	jmp    121c <.altinstr_replacement+0x121c>	1218: R_X86_64_PLT32	.text.copy_page_range+0x138e
121c     121c:	e9 00 00 00 00       	jmp    1221 <.altinstr_replacement+0x1221>	121d: R_X86_64_PLT32	.text.unmap_page_range+0xc44
1221     1221:	e9 00 00 00 00       	jmp    1226 <.altinstr_replacement+0x1226>	1222: R_X86_64_PLT32	.text.unmap_page_range+0xc58
1226     1226:	e9 00 00 00 00       	jmp    122b <.altinstr_replacement+0x122b>	1227: R_X86_64_PLT32	.text.unmap_page_range+0xc6c
122b     122b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1235     1235:	e9 00 00 00 00       	jmp    123a <.altinstr_replacement+0x123a>	1236: R_X86_64_PLT32	.text.walk_to_pmd+0x188
123a     123a:	e9 00 00 00 00       	jmp    123f <.altinstr_replacement+0x123f>	123b: R_X86_64_PLT32	.text.walk_to_pmd+0x19c
123f     123f:	e9 00 00 00 00       	jmp    1244 <.altinstr_replacement+0x1244>	1240: R_X86_64_PLT32	.text.vmf_insert_pfn_prot+0x181
1244     1244:	e9 00 00 00 00       	jmp    1249 <.altinstr_replacement+0x1249>	1245: R_X86_64_PLT32	.text.vmf_insert_pfn_prot+0x228
1249     1249:	e9 00 00 00 00       	jmp    124e <.altinstr_replacement+0x124e>	124a: R_X86_64_PLT32	.text.remap_pfn_range_notrack+0x556
124e     124e:	e9 00 00 00 00       	jmp    1253 <.altinstr_replacement+0x1253>	124f: R_X86_64_PLT32	.text.remap_pfn_range_notrack+0x56a
1253     1253:	e9 00 00 00 00       	jmp    1258 <.altinstr_replacement+0x1258>	1254: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0x1dc
1258     1258:	e9 00 00 00 00       	jmp    125d <.altinstr_replacement+0x125d>	1259: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0xa2a
125d     125d:	e9 00 00 00 00       	jmp    1262 <.altinstr_replacement+0x1262>	125e: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0xa3e
1262     1262:	e9 00 00 00 00       	jmp    1267 <.altinstr_replacement+0x1267>	1263: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0xa81
1267     1267:	e9 00 00 00 00       	jmp    126c <.altinstr_replacement+0x126c>	1268: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0xa95
126c     126c:	e9 00 00 00 00       	jmp    1271 <.altinstr_replacement+0x1271>	126d: R_X86_64_PLT32	.text.__apply_to_page_range.llvm.7861265891031653195+0xab2
1271     1271:	e9 00 00 00 00       	jmp    1276 <.altinstr_replacement+0x1276>	1272: R_X86_64_PLT32	.text.handle_mm_fault+0x18c9
1276     1276:	e9 00 00 00 00       	jmp    127b <.altinstr_replacement+0x127b>	1277: R_X86_64_PLT32	.text.handle_mm_fault+0x18dd
127b     127b:	e9 00 00 00 00       	jmp    1280 <.altinstr_replacement+0x1280>	127c: R_X86_64_PLT32	.text.handle_mm_fault+0x1a54
1280     1280:	e9 00 00 00 00       	jmp    1285 <.altinstr_replacement+0x1285>	1281: R_X86_64_PLT32	.text.__p4d_alloc+0xbd
1285     1285:	e9 00 00 00 00       	jmp    128a <.altinstr_replacement+0x128a>	1286: R_X86_64_PLT32	.text.__p4d_alloc+0x118
128a     128a:	e9 00 00 00 00       	jmp    128f <.altinstr_replacement+0x128f>	128b: R_X86_64_PLT32	.text.__p4d_alloc+0x129
128f     128f:	e9 00 00 00 00       	jmp    1294 <.altinstr_replacement+0x1294>	1290: R_X86_64_PLT32	.text.__pud_alloc+0xf1
1294     1294:	e9 00 00 00 00       	jmp    1299 <.altinstr_replacement+0x1299>	1295: R_X86_64_PLT32	.text.follow_invalidate_pte+0x486
1299     1299:	e9 00 00 00 00       	jmp    129e <.altinstr_replacement+0x129e>	129a: R_X86_64_PLT32	.text.follow_invalidate_pte+0x49a
129e     129e:	e9 00 00 00 00       	jmp    12a3 <.altinstr_replacement+0x12a3>	129f: R_X86_64_PLT32	.text.follow_invalidate_pte+0x4ae
12a3     12a3:	e8 00 00 00 00       	call   12a8 <.altinstr_replacement+0x12a8>	12a4: R_X86_64_PLT32	clear_page_rep-0x4
12a8     12a8:	e8 00 00 00 00       	call   12ad <.altinstr_replacement+0x12ad>	12a9: R_X86_64_PLT32	clear_page_erms-0x4
12ad     12ad:	e8 00 00 00 00       	call   12b2 <.altinstr_replacement+0x12b2>	12ae: R_X86_64_PLT32	clear_page_rep-0x4
12b2     12b2:	e8 00 00 00 00       	call   12b7 <.altinstr_replacement+0x12b7>	12b3: R_X86_64_PLT32	clear_page_erms-0x4
12b7     12b7:	e8 00 00 00 00       	call   12bc <.altinstr_replacement+0x12bc>	12b8: R_X86_64_PLT32	clear_page_rep-0x4
12bc     12bc:	e8 00 00 00 00       	call   12c1 <.altinstr_replacement+0x12c1>	12bd: R_X86_64_PLT32	clear_page_erms-0x4
12c1     12c1:	e8 00 00 00 00       	call   12c6 <.altinstr_replacement+0x12c6>	12c2: R_X86_64_PLT32	clear_page_rep-0x4
12c6     12c6:	e8 00 00 00 00       	call   12cb <.altinstr_replacement+0x12cb>	12c7: R_X86_64_PLT32	clear_page_erms-0x4
12cb     12cb:	e8 00 00 00 00       	call   12d0 <.altinstr_replacement+0x12d0>	12cc: R_X86_64_PLT32	clear_page_rep-0x4
12d0     12d0:	e8 00 00 00 00       	call   12d5 <.altinstr_replacement+0x12d5>	12d1: R_X86_64_PLT32	clear_page_erms-0x4
12d5     12d5:	e9 00 00 00 00       	jmp    12da <.altinstr_replacement+0x12da>	12d6: R_X86_64_PLT32	.text.clear_gigantic_page+0x1f1
12da     12da:	e9 00 00 00 00       	jmp    12df <.altinstr_replacement+0x12df>	12db: R_X86_64_PLT32	.text.clear_gigantic_page+0x21b
12df     12df:	e9 00 00 00 00       	jmp    12e4 <.altinstr_replacement+0x12e4>	12e0: R_X86_64_PLT32	.text.copy_user_gigantic_page+0x1f9
12e4     12e4:	e9 00 00 00 00       	jmp    12e9 <.altinstr_replacement+0x12e9>	12e5: R_X86_64_PLT32	.text.copy_user_gigantic_page+0x385
12e9     12e9:	e9 00 00 00 00       	jmp    12ee <.altinstr_replacement+0x12ee>	12ea: R_X86_64_PLT32	.text.copy_user_gigantic_page+0x35b
12ee     12ee:	e9 00 00 00 00       	jmp    12f3 <.altinstr_replacement+0x12f3>	12ef: R_X86_64_PLT32	.text.copy_user_gigantic_page+0x3ac
12f3     12f3:	e9 00 00 00 00       	jmp    12f8 <.altinstr_replacement+0x12f8>	12f4: R_X86_64_PLT32	.text.copy_huge_page_from_user+0x2ed
12f8     12f8:	e9 00 00 00 00       	jmp    12fd <.altinstr_replacement+0x12fd>	12f9: R_X86_64_PLT32	.text.copy_huge_page_from_user+0x306
12fd     12fd:	e8 00 00 00 00       	call   1302 <.altinstr_replacement+0x1302>	12fe: R_X86_64_PLT32	copy_user_generic_string-0x4
1302     1302:	e8 00 00 00 00       	call   1307 <.altinstr_replacement+0x1307>	1303: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1307     1307:	e8 00 00 00 00       	call   130c <.altinstr_replacement+0x130c>	1308: R_X86_64_PLT32	copy_user_generic_string-0x4
130c     130c:	e8 00 00 00 00       	call   1311 <.altinstr_replacement+0x1311>	130d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1311     1311:	e8 00 00 00 00       	call   1316 <.altinstr_replacement+0x1316>	1312: R_X86_64_PLT32	clear_page_rep-0x4
1316     1316:	e8 00 00 00 00       	call   131b <.altinstr_replacement+0x131b>	1317: R_X86_64_PLT32	clear_page_erms-0x4
131b     131b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1325     1325:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
132f     132f:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
1339     1339:	e9 00 00 00 00       	jmp    133e <.altinstr_replacement+0x133e>	133a: R_X86_64_PLT32	.text.do_mmap+0x705
133e     133e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1348     1348:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1352     1352:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
135c     135c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1366     1366:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1370     1370:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
137a     137a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1384     1384:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
138e     138e:	e9 00 00 00 00       	jmp    1393 <.altinstr_replacement+0x1393>	138f: R_X86_64_PLT32	.text.change_protection+0xa71
1393     1393:	e9 00 00 00 00       	jmp    1398 <.altinstr_replacement+0x1398>	1394: R_X86_64_PLT32	.text.change_protection+0xa85
1398     1398:	e9 00 00 00 00       	jmp    139d <.altinstr_replacement+0x139d>	1399: R_X86_64_PLT32	.text.change_protection+0xa99
139d     139d:	e9 00 00 00 00       	jmp    13a2 <.altinstr_replacement+0x13a2>	139e: R_X86_64_PLT32	.text.__x64_sys_pkey_alloc+0x192
13a2     13a2:	e9 00 00 00 00       	jmp    13a7 <.altinstr_replacement+0x13a7>	13a3: R_X86_64_PLT32	.text.__x64_sys_pkey_alloc+0x1ab
13a7     13a7:	e9 00 00 00 00       	jmp    13ac <.altinstr_replacement+0x13ac>	13a8: R_X86_64_PLT32	.text.__x64_sys_pkey_free+0xf5
13ac     13ac:	e9 00 00 00 00       	jmp    13b1 <.altinstr_replacement+0x13b1>	13ad: R_X86_64_PLT32	.text.do_mprotect_pkey+0x458
13b1     13b1:	e9 00 00 00 00       	jmp    13b6 <.altinstr_replacement+0x13b6>	13b2: R_X86_64_PLT32	.text.do_mprotect_pkey+0x39d
13b6     13b6:	e9 00 00 00 00       	jmp    13bb <.altinstr_replacement+0x13bb>	13b7: R_X86_64_PLT32	.text.get_old_pud+0x16e
13bb     13bb:	e9 00 00 00 00       	jmp    13c0 <.altinstr_replacement+0x13c0>	13bc: R_X86_64_PLT32	.text.get_old_pud+0x182
13c0     13c0:	e9 00 00 00 00       	jmp    13c5 <.altinstr_replacement+0x13c5>	13c1: R_X86_64_PLT32	.text.get_old_pud+0x196
13c5     13c5:	e9 00 00 00 00       	jmp    13ca <.altinstr_replacement+0x13ca>	13c6: R_X86_64_PLT32	.text.alloc_new_pud+0x10c
13ca     13ca:	e9 00 00 00 00       	jmp    13cf <.altinstr_replacement+0x13cf>	13cb: R_X86_64_PLT32	.text.alloc_new_pud+0x120
13cf     13cf:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13d9     13d9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13e3     13e3:	e9 00 00 00 00       	jmp    13e8 <.altinstr_replacement+0x13e8>	13e4: R_X86_64_PLT32	.text.page_vma_mapped_walk+0x28c
13e8     13e8:	e9 00 00 00 00       	jmp    13ed <.altinstr_replacement+0x13ed>	13e9: R_X86_64_PLT32	.text.page_vma_mapped_walk+0x3d9
13ed     13ed:	e9 00 00 00 00       	jmp    13f2 <.altinstr_replacement+0x13f2>	13ee: R_X86_64_PLT32	.text.walk_pgd_range+0xa1c
13f2     13f2:	e9 00 00 00 00       	jmp    13f7 <.altinstr_replacement+0x13f7>	13f3: R_X86_64_PLT32	.text.walk_pgd_range+0xa30
13f7     13f7:	e9 00 00 00 00       	jmp    13fc <.altinstr_replacement+0x13fc>	13f8: R_X86_64_PLT32	.text.walk_pgd_range+0xa3a
13fc     13fc:	e9 00 00 00 00       	jmp    1401 <.altinstr_replacement+0x1401>	13fd: R_X86_64_PLT32	.text.pgd_clear_bad+0x65
1401     1401:	e9 00 00 00 00       	jmp    1406 <.altinstr_replacement+0x1406>	1402: R_X86_64_PLT32	.text.p4d_clear_bad+0x65
1406     1406:	e9 00 00 00 00       	jmp    140b <.altinstr_replacement+0x140b>	1407: R_X86_64_PLT32	.text.mm_find_pmd+0x4f
140b     140b:	e9 00 00 00 00       	jmp    1410 <.altinstr_replacement+0x1410>	140c: R_X86_64_PLT32	.text.mm_find_pmd+0x130
1410     1410:	e9 00 00 00 00       	jmp    1415 <.altinstr_replacement+0x1415>	1411: R_X86_64_PLT32	.text.is_vmalloc_addr+0x66
1415     1415:	e9 00 00 00 00       	jmp    141a <.altinstr_replacement+0x141a>	1416: R_X86_64_PLT32	.text.ioremap_page_range+0x6f0
141a     141a:	e9 00 00 00 00       	jmp    141f <.altinstr_replacement+0x141f>	141b: R_X86_64_PLT32	.text.ioremap_page_range+0x704
141f     141f:	e9 00 00 00 00       	jmp    1424 <.altinstr_replacement+0x1424>	1420: R_X86_64_PLT32	.text.vunmap_range_noflush+0x47d
1424     1424:	e9 00 00 00 00       	jmp    1429 <.altinstr_replacement+0x1429>	1425: R_X86_64_PLT32	.text.vunmap_range_noflush+0x4c3
1429     1429:	e9 00 00 00 00       	jmp    142e <.altinstr_replacement+0x142e>	142a: R_X86_64_PLT32	.text.vunmap_range_noflush+0x4d7
142e     142e:	e9 00 00 00 00       	jmp    1433 <.altinstr_replacement+0x1433>	142f: R_X86_64_PLT32	.text.vunmap_range_noflush+0x4eb
1433     1433:	e9 00 00 00 00       	jmp    1438 <.altinstr_replacement+0x1438>	1434: R_X86_64_PLT32	.text.vmap_pages_range_noflush+0x4ab
1438     1438:	e9 00 00 00 00       	jmp    143d <.altinstr_replacement+0x143d>	1439: R_X86_64_PLT32	.text.vmap_pages_range_noflush+0x4e7
143d     143d:	e9 00 00 00 00       	jmp    1442 <.altinstr_replacement+0x1442>	143e: R_X86_64_PLT32	.text.vmap_pages_range_noflush+0x4fb
1442     1442:	e9 00 00 00 00       	jmp    1447 <.altinstr_replacement+0x1447>	1443: R_X86_64_PLT32	.text.is_vmalloc_or_module_addr+0x88
1447     1447:	e9 00 00 00 00       	jmp    144c <.altinstr_replacement+0x144c>	1448: R_X86_64_PLT32	.text.vmalloc_to_page+0x2b7
144c     144c:	e9 00 00 00 00       	jmp    1451 <.altinstr_replacement+0x1451>	144d: R_X86_64_PLT32	.text.vmalloc_to_page+0x2cb
1451     1451:	e9 00 00 00 00       	jmp    1456 <.altinstr_replacement+0x1456>	1452: R_X86_64_PLT32	.text.vmalloc_to_page+0x2df
1456     1456:	e9 00 00 00 00       	jmp    145b <.altinstr_replacement+0x145b>	1457: R_X86_64_PLT32	.text.vm_unmap_ram+0x24c
145b     145b:	e9 00 00 00 00       	jmp    1460 <.altinstr_replacement+0x1460>	145c: R_X86_64_PLT32	.text.vm_map_ram+0xcbf
1460     1460:	e9 00 00 00 00       	jmp    1465 <.altinstr_replacement+0x1465>	1461: R_X86_64_PLT32	.text.vm_map_ram+0xcef
1465     1465:	e9 00 00 00 00       	jmp    146a <.altinstr_replacement+0x146a>	1466: R_X86_64_PLT32	.text.get_vm_area+0x8a
146a     146a:	e9 00 00 00 00       	jmp    146f <.altinstr_replacement+0x146f>	146b: R_X86_64_PLT32	.text.get_vm_area_caller+0x8f
146f     146f:	e9 00 00 00 00       	jmp    1474 <.altinstr_replacement+0x1474>	1470: R_X86_64_PLT32	.text.vmap+0x19e
1474     1474:	e9 00 00 00 00       	jmp    1479 <.altinstr_replacement+0x1479>	1475: R_X86_64_PLT32	.text.__vmalloc_node_range+0x4a6
1479     1479:	e9 00 00 00 00       	jmp    147e <.altinstr_replacement+0x147e>	147a: R_X86_64_PLT32	.text.__vmalloc_node+0xa6
147e     147e:	e9 00 00 00 00       	jmp    1483 <.altinstr_replacement+0x1483>	147f: R_X86_64_PLT32	.text.__vmalloc+0x93
1483     1483:	e9 00 00 00 00       	jmp    1488 <.altinstr_replacement+0x1488>	1484: R_X86_64_PLT32	.text.vmalloc+0x90
1488     1488:	e9 00 00 00 00       	jmp    148d <.altinstr_replacement+0x148d>	1489: R_X86_64_PLT32	.text.vmalloc_no_huge+0x93
148d     148d:	e9 00 00 00 00       	jmp    1492 <.altinstr_replacement+0x1492>	148e: R_X86_64_PLT32	.text.vzalloc+0x90
1492     1492:	e9 00 00 00 00       	jmp    1497 <.altinstr_replacement+0x1497>	1493: R_X86_64_PLT32	.text.vmalloc_user+0x90
1497     1497:	e9 00 00 00 00       	jmp    149c <.altinstr_replacement+0x149c>	1498: R_X86_64_PLT32	.text.vmalloc_node+0x95
149c     149c:	e9 00 00 00 00       	jmp    14a1 <.altinstr_replacement+0x14a1>	149d: R_X86_64_PLT32	.text.vzalloc_node+0x95
14a1     14a1:	e9 00 00 00 00       	jmp    14a6 <.altinstr_replacement+0x14a6>	14a2: R_X86_64_PLT32	.text.vmalloc_32+0x90
14a6     14a6:	e9 00 00 00 00       	jmp    14ab <.altinstr_replacement+0x14ab>	14a7: R_X86_64_PLT32	.text.vmalloc_32_user+0x90
14ab     14ab:	e9 00 00 00 00       	jmp    14b0 <.altinstr_replacement+0x14b0>	14ac: R_X86_64_PLT32	.text.pcpu_get_vm_areas+0x1997
14b0     14b0:	e9 00 00 00 00       	jmp    14b5 <.altinstr_replacement+0x14b5>	14b1: R_X86_64_PLT32	.text.pcpu_get_vm_areas+0x4f2
14b5     14b5:	e9 00 00 00 00       	jmp    14ba <.altinstr_replacement+0x14ba>	14b6: R_X86_64_PLT32	.text.pcpu_get_vm_areas+0x7f2
14ba     14ba:	e9 00 00 00 00       	jmp    14bf <.altinstr_replacement+0x14bf>	14bb: R_X86_64_PLT32	.text.pcpu_get_vm_areas+0x810
14bf     14bf:	e9 00 00 00 00       	jmp    14c4 <.altinstr_replacement+0x14c4>	14c0: R_X86_64_PLT32	.text.__purge_vmap_area_lazy+0x8e6
14c4     14c4:	e9 00 00 00 00       	jmp    14c9 <.altinstr_replacement+0x14c9>	14c5: R_X86_64_PLT32	.text.s_show+0x70e
14c9     14c9:	e9 00 00 00 00       	jmp    14ce <.altinstr_replacement+0x14ce>	14ca: R_X86_64_PLT32	.text.get_pfnblock_flags_mask+0x22
14ce     14ce:	e9 00 00 00 00       	jmp    14d3 <.altinstr_replacement+0x14d3>	14cf: R_X86_64_PLT32	.text.set_pfnblock_flags_mask+0x27
14d3     14d3:	e9 00 00 00 00       	jmp    14d8 <.altinstr_replacement+0x14d8>	14d4: R_X86_64_PLT32	.text.set_pageblock_migratetype+0x45
14d8     14d8:	e9 00 00 00 00       	jmp    14dd <.altinstr_replacement+0x14dd>	14d9: R_X86_64_PLT32	.meminit.text+0x1de0
14dd     14dd:	e9 00 00 00 00       	jmp    14e2 <.altinstr_replacement+0x14e2>	14de: R_X86_64_PLT32	.meminit.text+0x1dfd
14e2     14e2:	0f 0d 0f             	prefetchw (%rdi)
14e5     14e5:	0f 0d 09             	prefetchw (%rcx)
14e8     14e8:	e8 00 00 00 00       	call   14ed <.altinstr_replacement+0x14ed>	14e9: R_X86_64_PLT32	clear_page_rep-0x4
14ed     14ed:	e8 00 00 00 00       	call   14f2 <.altinstr_replacement+0x14f2>	14ee: R_X86_64_PLT32	clear_page_erms-0x4
14f2     14f2:	e9 00 00 00 00       	jmp    14f7 <.altinstr_replacement+0x14f7>	14f3: R_X86_64_PLT32	.text.__free_pages_ok+0x22f
14f7     14f7:	e9 00 00 00 00       	jmp    14fc <.altinstr_replacement+0x14fc>	14f8: R_X86_64_PLT32	.text.__free_pages_ok+0x3cc
14fc     14fc:	e9 00 00 00 00       	jmp    1501 <.altinstr_replacement+0x1501>	14fd: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0x31
1501     1501:	e9 00 00 00 00       	jmp    1506 <.altinstr_replacement+0x1506>	1502: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0x4c
1506     1506:	e9 00 00 00 00       	jmp    150b <.altinstr_replacement+0x150b>	1507: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0xe7
150b     150b:	e9 00 00 00 00       	jmp    1510 <.altinstr_replacement+0x1510>	150c: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0x104
1510     1510:	e9 00 00 00 00       	jmp    1515 <.altinstr_replacement+0x1515>	1511: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0x179
1515     1515:	e9 00 00 00 00       	jmp    151a <.altinstr_replacement+0x151a>	1516: R_X86_64_PLT32	.text.__pageblock_pfn_to_page+0x191
151a     151a:	e8 00 00 00 00       	call   151f <.altinstr_replacement+0x151f>	151b: R_X86_64_PLT32	clear_page_rep-0x4
151f     151f:	e8 00 00 00 00       	call   1524 <.altinstr_replacement+0x1524>	1520: R_X86_64_PLT32	clear_page_erms-0x4
1524     1524:	e8 00 00 00 00       	call   1529 <.altinstr_replacement+0x1529>	1525: R_X86_64_PLT32	clear_page_rep-0x4
1529     1529:	e8 00 00 00 00       	call   152e <.altinstr_replacement+0x152e>	152a: R_X86_64_PLT32	clear_page_erms-0x4
152e     152e:	e8 00 00 00 00       	call   1533 <.altinstr_replacement+0x1533>	152f: R_X86_64_PLT32	clear_page_rep-0x4
1533     1533:	e8 00 00 00 00       	call   1538 <.altinstr_replacement+0x1538>	1534: R_X86_64_PLT32	clear_page_erms-0x4
1538     1538:	e9 00 00 00 00       	jmp    153d <.altinstr_replacement+0x153d>	1539: R_X86_64_PLT32	.text.free_unref_page_prepare+0x36c
153d     153d:	e9 00 00 00 00       	jmp    1542 <.altinstr_replacement+0x1542>	153e: R_X86_64_PLT32	.text.free_one_page+0x4a
1542     1542:	e9 00 00 00 00       	jmp    1547 <.altinstr_replacement+0x1547>	1543: R_X86_64_PLT32	.text.__isolate_free_page+0x79
1547     1547:	e9 00 00 00 00       	jmp    154c <.altinstr_replacement+0x154c>	1548: R_X86_64_PLT32	.text.__isolate_free_page+0x223
154c     154c:	e9 00 00 00 00       	jmp    1551 <.altinstr_replacement+0x1551>	154d: R_X86_64_PLT32	.text.__isolate_free_page+0x2b9
1551     1551:	e9 00 00 00 00       	jmp    1556 <.altinstr_replacement+0x1556>	1552: R_X86_64_PLT32	.text.__rmqueue_pcplist+0x559
1556     1556:	e9 00 00 00 00       	jmp    155b <.altinstr_replacement+0x155b>	1557: R_X86_64_PLT32	.text.__rmqueue_pcplist+0x738
155b     155b:	e9 00 00 00 00       	jmp    1560 <.altinstr_replacement+0x1560>	155c: R_X86_64_PLT32	.text.__rmqueue_pcplist+0x90d
1560     1560:	e9 00 00 00 00       	jmp    1565 <.altinstr_replacement+0x1565>	1561: R_X86_64_PLT32	.text.get_page_from_freelist+0xab5
1565     1565:	e9 00 00 00 00       	jmp    156a <.altinstr_replacement+0x156a>	1566: R_X86_64_PLT32	.text.get_page_from_freelist+0xca7
156a     156a:	e9 00 00 00 00       	jmp    156f <.altinstr_replacement+0x156f>	156b: R_X86_64_PLT32	.text.get_page_from_freelist+0xe83
156f     156f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1574     1574:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1579     1579:	f3 48 0f b8 c7       	popcnt %rdi,%rax
157e     157e:	e9 00 00 00 00       	jmp    1583 <.altinstr_replacement+0x1583>	157f: R_X86_64_PLT32	.text.has_unmovable_pages+0x50
1583     1583:	e9 00 00 00 00       	jmp    1588 <.altinstr_replacement+0x1588>	1584: R_X86_64_PLT32	.text.alloc_contig_pages+0x19c
1588     1588:	e9 00 00 00 00       	jmp    158d <.altinstr_replacement+0x158d>	1589: R_X86_64_PLT32	.text.alloc_contig_pages+0x1b7
158d     158d:	e9 00 00 00 00       	jmp    1592 <.altinstr_replacement+0x1592>	158e: R_X86_64_PLT32	.text.reserve_highatomic_pageblock+0x88
1592     1592:	e9 00 00 00 00       	jmp    1597 <.altinstr_replacement+0x1597>	1593: R_X86_64_PLT32	.text.reserve_highatomic_pageblock+0x10f
1597     1597:	e9 00 00 00 00       	jmp    159c <.altinstr_replacement+0x159c>	1598: R_X86_64_PLT32	.text.unreserve_highatomic_pageblock+0xd6
159c     159c:	e9 00 00 00 00       	jmp    15a1 <.altinstr_replacement+0x15a1>	159d: R_X86_64_PLT32	.text.unreserve_highatomic_pageblock+0x182
15a1     15a1:	e9 00 00 00 00       	jmp    15a6 <.altinstr_replacement+0x15a6>	15a2: R_X86_64_PLT32	.init.text+0x3bd6a
15a6     15a6:	e9 00 00 00 00       	jmp    15ab <.altinstr_replacement+0x15ab>	15a7: R_X86_64_PLT32	.init.text+0x3bd85
15ab     15ab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15b0     15b0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15b5     15b5:	e9 00 00 00 00       	jmp    15ba <.altinstr_replacement+0x15ba>	15b6: R_X86_64_PLT32	.text.copy_hugetlb_page_range+0x18c
15ba     15ba:	e9 00 00 00 00       	jmp    15bf <.altinstr_replacement+0x15bf>	15bb: R_X86_64_PLT32	.text.copy_hugetlb_page_range+0x885
15bf     15bf:	e9 00 00 00 00       	jmp    15c4 <.altinstr_replacement+0x15c4>	15c0: R_X86_64_PLT32	.text.huge_pte_offset+0x55
15c4     15c4:	e9 00 00 00 00       	jmp    15c9 <.altinstr_replacement+0x15c9>	15c5: R_X86_64_PLT32	.text.huge_pte_offset+0x146
15c9     15c9:	e9 00 00 00 00       	jmp    15ce <.altinstr_replacement+0x15ce>	15ca: R_X86_64_PLT32	.text.huge_pte_alloc+0x28d
15ce     15ce:	e9 00 00 00 00       	jmp    15d3 <.altinstr_replacement+0x15d3>	15cf: R_X86_64_PLT32	.text.huge_pte_alloc+0x2a1
15d3     15d3:	e9 00 00 00 00       	jmp    15d8 <.altinstr_replacement+0x15d8>	15d4: R_X86_64_PLT32	.text.__unmap_hugepage_range+0x5f4
15d8     15d8:	e9 00 00 00 00       	jmp    15dd <.altinstr_replacement+0x15dd>	15d9: R_X86_64_PLT32	.text.__unmap_hugepage_range+0x608
15dd     15dd:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15e7     15e7:	e9 00 00 00 00       	jmp    15ec <.altinstr_replacement+0x15ec>	15e8: R_X86_64_PLT32	.text.huge_pmd_unshare+0x26b
15ec     15ec:	e9 00 00 00 00       	jmp    15f1 <.altinstr_replacement+0x15f1>	15ed: R_X86_64_PLT32	.text.hugetlb_fault+0x96
15f1     15f1:	e9 00 00 00 00       	jmp    15f6 <.altinstr_replacement+0x15f6>	15f2: R_X86_64_PLT32	.text.hugetlb_fault+0x103c
15f6     15f6:	e9 00 00 00 00       	jmp    15fb <.altinstr_replacement+0x15fb>	15f7: R_X86_64_PLT32	.text.hugetlb_cow+0x706
15fb     15fb:	e9 00 00 00 00       	jmp    1600 <.altinstr_replacement+0x1600>	15fc: R_X86_64_PLT32	.text.hugetlb_cow+0x71a
1600     1600:	e9 00 00 00 00       	jmp    1605 <.altinstr_replacement+0x1605>	1601: R_X86_64_PLT32	.text.hugetlb_cow+0xbe6
1605     1605:	e9 00 00 00 00       	jmp    160a <.altinstr_replacement+0x160a>	1606: R_X86_64_PLT32	.text.hugetlb_cow+0xbf0
160a     160a:	e9 00 00 00 00       	jmp    160f <.altinstr_replacement+0x160f>	160b: R_X86_64_PLT32	.text.follow_hugetlb_page+0x171
160f     160f:	e9 00 00 00 00       	jmp    1614 <.altinstr_replacement+0x1614>	1610: R_X86_64_PLT32	.text.follow_hugetlb_page+0x756
1614     1614:	e9 00 00 00 00       	jmp    1619 <.altinstr_replacement+0x1619>	1615: R_X86_64_PLT32	.text.hugetlb_change_protection+0x47a
1619     1619:	e9 00 00 00 00       	jmp    161e <.altinstr_replacement+0x161e>	161a: R_X86_64_PLT32	.text.hugetlb_change_protection+0x48e
161e     161e:	e9 00 00 00 00       	jmp    1623 <.altinstr_replacement+0x1623>	161f: R_X86_64_PLT32	.text.huge_pmd_share+0x276
1623     1623:	e9 00 00 00 00       	jmp    1628 <.altinstr_replacement+0x1628>	1624: R_X86_64_PLT32	.text.huge_pmd_share+0x28a
1628     1628:	e9 00 00 00 00       	jmp    162d <.altinstr_replacement+0x162d>	1629: R_X86_64_PLT32	.text.follow_huge_pmd_pte+0x243
162d     162d:	e9 00 00 00 00       	jmp    1632 <.altinstr_replacement+0x1632>	162e: R_X86_64_PLT32	.text.follow_huge_pmd_pte+0x257
1632     1632:	e9 00 00 00 00       	jmp    1637 <.altinstr_replacement+0x1637>	1633: R_X86_64_PLT32	.text.hugetlb_unshare_pmds+0x2a3
1637     1637:	e9 00 00 00 00       	jmp    163c <.altinstr_replacement+0x163c>	1638: R_X86_64_PLT32	.text.hugetlb_unshare_pmds+0x2ad
163c     163c:	e9 00 00 00 00       	jmp    1641 <.altinstr_replacement+0x1641>	163d: R_X86_64_PLT32	.text.__update_and_free_page+0x1e6
1641     1641:	e9 00 00 00 00       	jmp    1646 <.altinstr_replacement+0x1646>	1642: R_X86_64_PLT32	.text.__update_and_free_page+0x20f
1646     1646:	e9 00 00 00 00       	jmp    164b <.altinstr_replacement+0x164b>	1647: R_X86_64_PLT32	.text.__update_and_free_page+0x3d6
164b     164b:	e9 00 00 00 00       	jmp    1650 <.altinstr_replacement+0x1650>	164c: R_X86_64_PLT32	.text.__update_and_free_page+0x400
1650     1650:	e9 00 00 00 00       	jmp    1655 <.altinstr_replacement+0x1655>	1651: R_X86_64_PLT32	.text.pfn_valid+0x1f0
1655     1655:	e9 00 00 00 00       	jmp    165a <.altinstr_replacement+0x165a>	1656: R_X86_64_PLT32	.text.pfn_valid+0x22d
165a     165a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
165f     165f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1664     1664:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1669     1669:	f3 48 0f b8 c7       	popcnt %rdi,%rax
166e     166e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1673     1673:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1678     1678:	f3 48 0f b8 c7       	popcnt %rdi,%rax
167d     167d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1682     1682:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1687     1687:	f3 48 0f b8 c7       	popcnt %rdi,%rax
168c     168c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1696     1696:	f3 48 0f b8 c7       	popcnt %rdi,%rax
169b     169b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
16a0     16a0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
16a5     16a5:	e9 00 00 00 00       	jmp    16aa <.altinstr_replacement+0x16aa>	16a6: R_X86_64_PLT32	.meminit.text+0x4971
16aa     16aa:	e9 00 00 00 00       	jmp    16af <.altinstr_replacement+0x16af>	16ab: R_X86_64_PLT32	.init.text+0x3eb2b
16af     16af:	e9 00 00 00 00       	jmp    16b4 <.altinstr_replacement+0x16b4>	16b0: R_X86_64_PLT32	.init.text+0x3ec13
16b4     16b4:	e9 00 00 00 00       	jmp    16b9 <.altinstr_replacement+0x16b9>	16b5: R_X86_64_PLT32	.init.text+0x3ef37
16b9     16b9:	e9 00 00 00 00       	jmp    16be <.altinstr_replacement+0x16be>	16ba: R_X86_64_PLT32	.init.text+0x3ed14
16be     16be:	e9 00 00 00 00       	jmp    16c3 <.altinstr_replacement+0x16c3>	16bf: R_X86_64_PLT32	.init.text+0x3eef0
16c3     16c3:	e9 00 00 00 00       	jmp    16c8 <.altinstr_replacement+0x16c8>	16c4: R_X86_64_PLT32	.init.text+0x3ee8c
16c8     16c8:	e9 00 00 00 00       	jmp    16cd <.altinstr_replacement+0x16cd>	16c9: R_X86_64_PLT32	.init.text+0x3f139
16cd     16cd:	e9 00 00 00 00       	jmp    16d2 <.altinstr_replacement+0x16d2>	16ce: R_X86_64_PLT32	.init.text+0x3f224
16d2     16d2:	e9 00 00 00 00       	jmp    16d7 <.altinstr_replacement+0x16d7>	16d3: R_X86_64_PLT32	.init.text+0x3f38e
16d7     16d7:	e9 00 00 00 00       	jmp    16dc <.altinstr_replacement+0x16dc>	16d8: R_X86_64_PLT32	.init.text+0x3f343
16dc     16dc:	e9 00 00 00 00       	jmp    16e1 <.altinstr_replacement+0x16e1>	16dd: R_X86_64_PLT32	.init.text+0x3f599
16e1     16e1:	e9 00 00 00 00       	jmp    16e6 <.altinstr_replacement+0x16e6>	16e2: R_X86_64_PLT32	.init.text+0x3f53c
16e6     16e6:	e9 00 00 00 00       	jmp    16eb <.altinstr_replacement+0x16eb>	16e7: R_X86_64_PLT32	.init.text+0x3f73b
16eb     16eb:	e9 00 00 00 00       	jmp    16f0 <.altinstr_replacement+0x16f0>	16ec: R_X86_64_PLT32	.init.text+0x3f7da
16f0     16f0:	e9 00 00 00 00       	jmp    16f5 <.altinstr_replacement+0x16f5>	16f1: R_X86_64_PLT32	.text.vmemmap_remap_range+0x591
16f5     16f5:	e9 00 00 00 00       	jmp    16fa <.altinstr_replacement+0x16fa>	16f6: R_X86_64_PLT32	.meminit.text+0x51c7
16fa     16fa:	e9 00 00 00 00       	jmp    16ff <.altinstr_replacement+0x16ff>	16fb: R_X86_64_PLT32	.meminit.text+0x51d8
16ff     16ff:	e9 00 00 00 00       	jmp    1704 <.altinstr_replacement+0x1704>	1700: R_X86_64_PLT32	.meminit.text+0x52ba
1704     1704:	e9 00 00 00 00       	jmp    1709 <.altinstr_replacement+0x1709>	1705: R_X86_64_PLT32	.meminit.text+0x52cb
1709     1709:	f3 48 0f b8 c7       	popcnt %rdi,%rax
170e     170e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1713     1713:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1718     1718:	0f 0d 08             	prefetchw (%rax)
171b     171b:	0f 0d 08             	prefetchw (%rax)
171e     171e:	0f 0d 08             	prefetchw (%rax)
1721     1721:	0f 0d 08             	prefetchw (%rax)
1724     1724:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1729     1729:	f3 48 0f b8 c7       	popcnt %rdi,%rax
172e     172e:	e9 00 00 00 00       	jmp    1733 <.altinstr_replacement+0x1733>	172f: R_X86_64_PLT32	.text.init_page_owner+0x387
1733     1733:	e9 00 00 00 00       	jmp    1738 <.altinstr_replacement+0x1738>	1734: R_X86_64_PLT32	.text.init_page_owner+0x3d2
1738     1738:	e9 00 00 00 00       	jmp    173d <.altinstr_replacement+0x173d>	1739: R_X86_64_PLT32	.text.pagetypeinfo_showmixedcount_print+0x319
173d     173d:	e9 00 00 00 00       	jmp    1742 <.altinstr_replacement+0x1742>	173e: R_X86_64_PLT32	.text.pagetypeinfo_showmixedcount_print+0x362
1742     1742:	e9 00 00 00 00       	jmp    1747 <.altinstr_replacement+0x1747>	1743: R_X86_64_PLT32	.text.pfn_valid+0x320
1747     1747:	e9 00 00 00 00       	jmp    174c <.altinstr_replacement+0x174c>	1748: R_X86_64_PLT32	.text.pfn_valid+0x35d
174c     174c:	e9 00 00 00 00       	jmp    1751 <.altinstr_replacement+0x1751>	174d: R_X86_64_PLT32	.text.start_isolate_page_range+0x18f
1751     1751:	e9 00 00 00 00       	jmp    1756 <.altinstr_replacement+0x1756>	1752: R_X86_64_PLT32	.text.start_isolate_page_range+0x1d1
1756     1756:	e9 00 00 00 00       	jmp    175b <.altinstr_replacement+0x175b>	1757: R_X86_64_PLT32	.text.start_isolate_page_range+0x4b3
175b     175b:	e9 00 00 00 00       	jmp    1760 <.altinstr_replacement+0x1760>	175c: R_X86_64_PLT32	.text.start_isolate_page_range+0x4f5
1760     1760:	e9 00 00 00 00       	jmp    1765 <.altinstr_replacement+0x1765>	1761: R_X86_64_PLT32	.text.undo_isolate_page_range+0x159
1765     1765:	e9 00 00 00 00       	jmp    176a <.altinstr_replacement+0x176a>	1766: R_X86_64_PLT32	.text.undo_isolate_page_range+0x191
176a     176a:	e9 00 00 00 00       	jmp    176f <.altinstr_replacement+0x176f>	176b: R_X86_64_PLT32	.text.test_pages_isolated+0x186
176f     176f:	e9 00 00 00 00       	jmp    1774 <.altinstr_replacement+0x1774>	1770: R_X86_64_PLT32	.text.test_pages_isolated+0x1bf
1774     1774:	e9 00 00 00 00       	jmp    1779 <.altinstr_replacement+0x1779>	1775: R_X86_64_PLT32	.text.test_pages_isolated+0x360
1779     1779:	e9 00 00 00 00       	jmp    177e <.altinstr_replacement+0x177e>	177a: R_X86_64_PLT32	.text.test_pages_isolated+0x3b3
177e     177e:	e9 00 00 00 00       	jmp    1783 <.altinstr_replacement+0x1783>	177f: R_X86_64_PLT32	.init.text+0x42227
1783     1783:	e9 00 00 00 00       	jmp    1788 <.altinstr_replacement+0x1788>	1784: R_X86_64_PLT32	.init.text+0x42240
1788     1788:	e9 00 00 00 00       	jmp    178d <.altinstr_replacement+0x178d>	1789: R_X86_64_PLT32	.init.text+0x42034
178d     178d:	e9 00 00 00 00       	jmp    1792 <.altinstr_replacement+0x1792>	178e: R_X86_64_PLT32	.init.text+0x4204d
1792     1792:	e9 00 00 00 00       	jmp    1797 <.altinstr_replacement+0x1797>	1793: R_X86_64_PLT32	.text.lookup_page_ext+0xa2
1797     1797:	e9 00 00 00 00       	jmp    179c <.altinstr_replacement+0x179c>	1798: R_X86_64_PLT32	.init.text+0x4245c
179c     179c:	e9 00 00 00 00       	jmp    17a1 <.altinstr_replacement+0x17a1>	179d: R_X86_64_PLT32	.init.text+0x4247f
17a1     17a1:	e9 00 00 00 00       	jmp    17a6 <.altinstr_replacement+0x17a6>	17a2: R_X86_64_PLT32	.meminit.text+0x556b
17a6     17a6:	e8 00 00 00 00       	call   17ab <.altinstr_replacement+0x17ab>	17a7: R_X86_64_PLT32	clear_page_rep-0x4
17ab     17ab:	e8 00 00 00 00       	call   17b0 <.altinstr_replacement+0x17b0>	17ac: R_X86_64_PLT32	clear_page_erms-0x4
17b0     17b0:	e9 00 00 00 00       	jmp    17b5 <.altinstr_replacement+0x17b5>	17b1: R_X86_64_PLT32	.text.mcopy_atomic+0x66a
17b5     17b5:	e9 00 00 00 00       	jmp    17ba <.altinstr_replacement+0x17ba>	17b6: R_X86_64_PLT32	.text.mcopy_atomic+0x67e
17ba     17ba:	e9 00 00 00 00       	jmp    17bf <.altinstr_replacement+0x17bf>	17bb: R_X86_64_PLT32	.text.mfill_zeropage+0x644
17bf     17bf:	e9 00 00 00 00       	jmp    17c4 <.altinstr_replacement+0x17c4>	17c0: R_X86_64_PLT32	.text.mfill_zeropage+0x658
17c4     17c4:	e9 00 00 00 00       	jmp    17c9 <.altinstr_replacement+0x17c9>	17c5: R_X86_64_PLT32	.text.mcopy_continue+0x92d
17c9     17c9:	e9 00 00 00 00       	jmp    17ce <.altinstr_replacement+0x17ce>	17ca: R_X86_64_PLT32	.text.mcopy_continue+0x941
17ce     17ce:	e9 00 00 00 00       	jmp    17d3 <.altinstr_replacement+0x17d3>	17cf: R_X86_64_PLT32	.text.page_idle_get_page+0x1d2
17d3     17d3:	e9 00 00 00 00       	jmp    17d8 <.altinstr_replacement+0x17d8>	17d4: R_X86_64_PLT32	.text.page_idle_get_page+0x217
17d8     17d8:	e9 00 00 00 00       	jmp    17dd <.altinstr_replacement+0x17dd>	17d9: R_X86_64_PLT32	.text.damon_get_page+0x1bf
17dd     17dd:	e9 00 00 00 00       	jmp    17e2 <.altinstr_replacement+0x17e2>	17de: R_X86_64_PLT32	.text.damon_get_page+0x204
17e2     17e2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
17ec     17ec:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
17f6     17f6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1800     1800:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
180a     180a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1814     1814:	0f 01 cb             	stac
1817     1817:	0f ae e8             	lfence
181a     181a:	0f 01 ca             	clac
181d     181d:	0f 01 ca             	clac
1820     1820:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
182a     182a:	0f 01 cb             	stac
182d     182d:	0f ae e8             	lfence
1830     1830:	0f 01 ca             	clac
1833     1833:	0f 01 ca             	clac
1836     1836:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1840     1840:	0f 01 cb             	stac
1843     1843:	0f ae e8             	lfence
1846     1846:	0f 01 ca             	clac
1849     1849:	0f 01 ca             	clac
184c     184c:	e8 00 00 00 00       	call   1851 <.altinstr_replacement+0x1851>	184d: R_X86_64_PLT32	copy_user_generic_string-0x4
1851     1851:	e8 00 00 00 00       	call   1856 <.altinstr_replacement+0x1856>	1852: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1856     1856:	e8 00 00 00 00       	call   185b <.altinstr_replacement+0x185b>	1857: R_X86_64_PLT32	copy_user_generic_string-0x4
185b     185b:	e8 00 00 00 00       	call   1860 <.altinstr_replacement+0x1860>	185c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1860     1860:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
186a     186a:	0f 01 cb             	stac
186d     186d:	0f ae e8             	lfence
1870     1870:	0f 01 ca             	clac
1873     1873:	0f 01 ca             	clac
1876     1876:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1880     1880:	0f 01 cb             	stac
1883     1883:	0f ae e8             	lfence
1886     1886:	0f 01 ca             	clac
1889     1889:	0f 01 ca             	clac
188c     188c:	0f 0d 8b c0 09 00 00 	prefetchw 0x9c0(%rbx)
1893     1893:	f3 0f b8 c7          	popcnt %edi,%eax
1897     1897:	e8 00 00 00 00       	call   189c <.altinstr_replacement+0x189c>	1898: R_X86_64_PLT32	clear_page_rep-0x4
189c     189c:	e8 00 00 00 00       	call   18a1 <.altinstr_replacement+0x18a1>	189d: R_X86_64_PLT32	clear_page_erms-0x4
18a1     18a1:	0f 0d 08             	prefetchw (%rax)
18a4     18a4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
18ae     18ae:	e9 00 00 00 00       	jmp    18b3 <.altinstr_replacement+0x18b3>	18af: R_X86_64_PLT32	.text.handle_userfault+0x7c5
18b3     18b3:	e9 00 00 00 00       	jmp    18b8 <.altinstr_replacement+0x18b8>	18b4: R_X86_64_PLT32	.text.handle_userfault+0x7d9
18b8     18b8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18bd     18bd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18c2     18c2:	e9 00 00 00 00       	jmp    18c7 <.altinstr_replacement+0x18c7>	18c3: R_X86_64_PLT32	.text.show_smap+0x251
18c7     18c7:	e9 00 00 00 00       	jmp    18cc <.altinstr_replacement+0x18cc>	18c8: R_X86_64_PLT32	.text.meminfo_proc_show+0x94a
18cc     18cc:	e9 00 00 00 00       	jmp    18d1 <.altinstr_replacement+0x18d1>	18cd: R_X86_64_PLT32	.init.text+0x44d78
18d1     18d1:	e9 00 00 00 00       	jmp    18d6 <.altinstr_replacement+0x18d6>	18d2: R_X86_64_PLT32	.init.text+0x44f12
18d6     18d6:	e9 00 00 00 00       	jmp    18db <.altinstr_replacement+0x18db>	18d7: R_X86_64_PLT32	.text.kcore_update_ram+0x2fb
18db     18db:	e9 00 00 00 00       	jmp    18e0 <.altinstr_replacement+0x18e0>	18dc: R_X86_64_PLT32	.text.read_kcore+0xae
18e0     18e0:	e9 00 00 00 00       	jmp    18e5 <.altinstr_replacement+0x18e5>	18e1: R_X86_64_PLT32	.text.read_kcore+0x394
18e5     18e5:	e9 00 00 00 00       	jmp    18ea <.altinstr_replacement+0x18ea>	18e6: R_X86_64_PLT32	.text.read_kcore+0xe04
18ea     18ea:	e9 00 00 00 00       	jmp    18ef <.altinstr_replacement+0x18ef>	18eb: R_X86_64_PLT32	.text.read_kcore+0xc5a
18ef     18ef:	e9 00 00 00 00       	jmp    18f4 <.altinstr_replacement+0x18f4>	18f0: R_X86_64_PLT32	.text.read_kcore+0xcfe
18f4     18f4:	e9 00 00 00 00       	jmp    18f9 <.altinstr_replacement+0x18f9>	18f5: R_X86_64_PLT32	.text.kclist_add_private+0x35c
18f9     18f9:	e9 00 00 00 00       	jmp    18fe <.altinstr_replacement+0x18fe>	18fa: R_X86_64_PLT32	.text.kclist_add_private+0x3a4
18fe     18fe:	e9 00 00 00 00       	jmp    1903 <.altinstr_replacement+0x1903>	18ff: R_X86_64_PLT32	.text.kpagecount_read+0x243
1903     1903:	e9 00 00 00 00       	jmp    1908 <.altinstr_replacement+0x1908>	1904: R_X86_64_PLT32	.text.kpagecount_read+0x2ce
1908     1908:	e9 00 00 00 00       	jmp    190d <.altinstr_replacement+0x190d>	1909: R_X86_64_PLT32	.text.kpageflags_read+0x195
190d     190d:	e9 00 00 00 00       	jmp    1912 <.altinstr_replacement+0x1912>	190e: R_X86_64_PLT32	.text.kpageflags_read+0x223
1912     1912:	e9 00 00 00 00       	jmp    1917 <.altinstr_replacement+0x1917>	1913: R_X86_64_PLT32	.text.kpagecgroup_read+0x1a3
1917     1917:	e9 00 00 00 00       	jmp    191c <.altinstr_replacement+0x191c>	1918: R_X86_64_PLT32	.text.kpagecgroup_read+0x22e
191c     191c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1921     1921:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1926     1926:	41 0f 0d 0c 24       	prefetchw (%r12)
192b     192b:	f3 0f b8 c7          	popcnt %edi,%eax
192f     192f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1934     1934:	f3 0f b8 c7          	popcnt %edi,%eax
1938     1938:	f3 0f b8 c7          	popcnt %edi,%eax
193c     193c:	f3 0f b8 c7          	popcnt %edi,%eax
1940     1940:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1945     1945:	e8 00 00 00 00       	call   194a <.altinstr_replacement+0x194a>	1946: R_X86_64_PLT32	clear_page_rep-0x4
194a     194a:	e8 00 00 00 00       	call   194f <.altinstr_replacement+0x194f>	194b: R_X86_64_PLT32	clear_page_erms-0x4
194f     194f:	e8 00 00 00 00       	call   1954 <.altinstr_replacement+0x1954>	1950: R_X86_64_PLT32	clear_page_rep-0x4
1954     1954:	e8 00 00 00 00       	call   1959 <.altinstr_replacement+0x1959>	1955: R_X86_64_PLT32	clear_page_erms-0x4
1959     1959:	e8 00 00 00 00       	call   195e <.altinstr_replacement+0x195e>	195a: R_X86_64_PLT32	clear_page_rep-0x4
195e     195e:	e8 00 00 00 00       	call   1963 <.altinstr_replacement+0x1963>	195f: R_X86_64_PLT32	clear_page_erms-0x4
1963     1963:	e8 00 00 00 00       	call   1968 <.altinstr_replacement+0x1968>	1964: R_X86_64_PLT32	clear_page_rep-0x4
1968     1968:	e8 00 00 00 00       	call   196d <.altinstr_replacement+0x196d>	1969: R_X86_64_PLT32	clear_page_erms-0x4
196d     196d:	e9 00 00 00 00       	jmp    1972 <.altinstr_replacement+0x1972>	196e: R_X86_64_PLT32	.text.persistent_ram_free+0x10a
1972     1972:	e9 00 00 00 00       	jmp    1977 <.altinstr_replacement+0x1977>	1973: R_X86_64_PLT32	.text.persistent_ram_free+0x1e6
1977     1977:	e9 00 00 00 00       	jmp    197c <.altinstr_replacement+0x197c>	1978: R_X86_64_PLT32	.text.persistent_ram_new+0x36c
197c     197c:	e9 00 00 00 00       	jmp    1981 <.altinstr_replacement+0x1981>	197d: R_X86_64_PLT32	.text.persistent_ram_new+0xa06
1981     1981:	f3 0f b8 c7          	popcnt %edi,%eax
1985     1985:	f3 0f b8 c7          	popcnt %edi,%eax
1989     1989:	f3 0f b8 c7          	popcnt %edi,%eax
198d     198d:	f3 0f b8 c7          	popcnt %edi,%eax
1991     1991:	f3 0f b8 c7          	popcnt %edi,%eax
1995     1995:	f3 0f b8 c7          	popcnt %edi,%eax
1999     1999:	f3 0f b8 c7          	popcnt %edi,%eax
199d     199d:	f3 0f b8 c7          	popcnt %edi,%eax
19a1     19a1:	f3 0f b8 c7          	popcnt %edi,%eax
19a5     19a5:	f3 0f b8 c7          	popcnt %edi,%eax
19a9     19a9:	f3 0f b8 c7          	popcnt %edi,%eax
19ad     19ad:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19b7     19b7:	f3 0f b8 c7          	popcnt %edi,%eax
19bb     19bb:	e9 00 00 00 00       	jmp    19c0 <.altinstr_replacement+0x19c0>	19bc: R_X86_64_PLT32	.init.text+0x4ed60
19c0     19c0:	e9 00 00 00 00       	jmp    19c5 <.altinstr_replacement+0x19c5>	19c1: R_X86_64_PLT32	.init.text+0x4ed71
19c5     19c5:	f3 0f b8 c7          	popcnt %edi,%eax
19c9     19c9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19ce     19ce:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19d3     19d3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19d8     19d8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19dd     19dd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19e2     19e2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19e7     19e7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19ec     19ec:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19f1     19f1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19f6     19f6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19fb     19fb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a05     1a05:	e8 00 00 00 00       	call   1a0a <.altinstr_replacement+0x1a0a>	1a06: R_X86_64_PLT32	copy_user_generic_string-0x4
1a0a     1a0a:	e8 00 00 00 00       	call   1a0f <.altinstr_replacement+0x1a0f>	1a0b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a0f     1a0f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a19     1a19:	e8 00 00 00 00       	call   1a1e <.altinstr_replacement+0x1a1e>	1a1a: R_X86_64_PLT32	copy_user_generic_string-0x4
1a1e     1a1e:	e8 00 00 00 00       	call   1a23 <.altinstr_replacement+0x1a23>	1a1f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a23     1a23:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a2d     1a2d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a37     1a37:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a41     1a41:	e8 00 00 00 00       	call   1a46 <.altinstr_replacement+0x1a46>	1a42: R_X86_64_PLT32	copy_user_generic_string-0x4
1a46     1a46:	e8 00 00 00 00       	call   1a4b <.altinstr_replacement+0x1a4b>	1a47: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a4b     1a4b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a55     1a55:	e8 00 00 00 00       	call   1a5a <.altinstr_replacement+0x1a5a>	1a56: R_X86_64_PLT32	copy_user_generic_string-0x4
1a5a     1a5a:	e8 00 00 00 00       	call   1a5f <.altinstr_replacement+0x1a5f>	1a5b: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a5f     1a5f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a69     1a69:	e8 00 00 00 00       	call   1a6e <.altinstr_replacement+0x1a6e>	1a6a: R_X86_64_PLT32	copy_user_generic_string-0x4
1a6e     1a6e:	e8 00 00 00 00       	call   1a73 <.altinstr_replacement+0x1a73>	1a6f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a73     1a73:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a7d     1a7d:	e8 00 00 00 00       	call   1a82 <.altinstr_replacement+0x1a82>	1a7e: R_X86_64_PLT32	copy_user_generic_string-0x4
1a82     1a82:	e8 00 00 00 00       	call   1a87 <.altinstr_replacement+0x1a87>	1a83: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a87     1a87:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1a91     1a91:	e8 00 00 00 00       	call   1a96 <.altinstr_replacement+0x1a96>	1a92: R_X86_64_PLT32	copy_user_generic_string-0x4
1a96     1a96:	e8 00 00 00 00       	call   1a9b <.altinstr_replacement+0x1a9b>	1a97: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1a9b     1a9b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1aa5     1aa5:	e8 00 00 00 00       	call   1aaa <.altinstr_replacement+0x1aaa>	1aa6: R_X86_64_PLT32	copy_user_generic_string-0x4
1aaa     1aaa:	e8 00 00 00 00       	call   1aaf <.altinstr_replacement+0x1aaf>	1aab: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1aaf     1aaf:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1ab9     1ab9:	e8 00 00 00 00       	call   1abe <.altinstr_replacement+0x1abe>	1aba: R_X86_64_PLT32	copy_user_generic_string-0x4
1abe     1abe:	e8 00 00 00 00       	call   1ac3 <.altinstr_replacement+0x1ac3>	1abf: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1ac3     1ac3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1acd     1acd:	e8 00 00 00 00       	call   1ad2 <.altinstr_replacement+0x1ad2>	1ace: R_X86_64_PLT32	copy_user_generic_string-0x4
1ad2     1ad2:	e8 00 00 00 00       	call   1ad7 <.altinstr_replacement+0x1ad7>	1ad3: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1ad7     1ad7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1ae1     1ae1:	0f 01 cb             	stac
1ae4     1ae4:	0f ae e8             	lfence
1ae7     1ae7:	0f 01 ca             	clac
1aea     1aea:	0f 01 ca             	clac
1aed     1aed:	0f 01 ca             	clac
1af0     1af0:	0f 01 ca             	clac
1af3     1af3:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1afd     1afd:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b07     1b07:	f3 0f b8 c7          	popcnt %edi,%eax
1b0b     1b0b:	f3 0f b8 c7          	popcnt %edi,%eax
1b0f     1b0f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b19     1b19:	0f ae e8             	lfence
1b1c     1b1c:	e8 00 00 00 00       	call   1b21 <.altinstr_replacement+0x1b21>	1b1d: R_X86_64_PLT32	copy_user_generic_string-0x4
1b21     1b21:	e8 00 00 00 00       	call   1b26 <.altinstr_replacement+0x1b26>	1b22: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1b26     1b26:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b30     1b30:	e8 00 00 00 00       	call   1b35 <.altinstr_replacement+0x1b35>	1b31: R_X86_64_PLT32	copy_user_generic_string-0x4
1b35     1b35:	e8 00 00 00 00       	call   1b3a <.altinstr_replacement+0x1b3a>	1b36: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1b3a     1b3a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b44     1b44:	0f 01 cb             	stac
1b47     1b47:	0f ae e8             	lfence
1b4a     1b4a:	0f 01 ca             	clac
1b4d     1b4d:	0f 01 ca             	clac
1b50     1b50:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
1b5a     1b5a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b64     1b64:	0f 01 cb             	stac
1b67     1b67:	0f ae e8             	lfence
1b6a     1b6a:	0f 01 ca             	clac
1b6d     1b6d:	49 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r15
1b77     1b77:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1b81     1b81:	0f 01 cb             	stac
1b84     1b84:	0f ae e8             	lfence
1b87     1b87:	0f 01 ca             	clac
1b8a     1b8a:	9c                   	pushf
1b8b     1b8b:	8f 45 d0             	pop    -0x30(%rbp)
1b8e     1b8e:	0f 01 ca             	clac
1b91     1b91:	ff 75 c8             	push   -0x38(%rbp)
1b94     1b94:	9d                   	popf
1b95     1b95:	9c                   	pushf
1b96     1b96:	8f 44 24 20          	pop    0x20(%rsp)
1b9a     1b9a:	0f 01 ca             	clac
1b9d     1b9d:	ff 74 24 28          	push   0x28(%rsp)
1ba1     1ba1:	9d                   	popf
1ba2     1ba2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ba7     1ba7:	e9 00 00 00 00       	jmp    1bac <.altinstr_replacement+0x1bac>	1ba8: R_X86_64_PLT32	.text.copy_mc_to_kernel+0x48
1bac     1bac:	e9 00 00 00 00       	jmp    1bb1 <.altinstr_replacement+0x1bb1>	1bad: R_X86_64_PLT32	.text.copy_mc_to_user+0x4c
1bb1     1bb1:	0f 01 cb             	stac
1bb4     1bb4:	0f 01 ca             	clac
1bb7     1bb7:	e8 00 00 00 00       	call   1bbc <.altinstr_replacement+0x1bbc>	1bb8: R_X86_64_PLT32	copy_user_generic_string-0x4
1bbc     1bbc:	e8 00 00 00 00       	call   1bc1 <.altinstr_replacement+0x1bc1>	1bbd: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1bc1     1bc1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1bcb     1bcb:	0f 01 cb             	stac
1bce     1bce:	0f ae e8             	lfence
1bd1     1bd1:	0f 01 ca             	clac
1bd4     1bd4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1bde     1bde:	0f 01 cb             	stac
1be1     1be1:	0f ae e8             	lfence
1be4     1be4:	0f 01 ca             	clac
1be7     1be7:	0f ae e8             	lfence
1bea     1bea:	0f 31                	rdtsc
1bec     1bec:	0f 01 f9             	rdtscp
1bef     1bef:	0f ae e8             	lfence
1bf2     1bf2:	0f 31                	rdtsc
1bf4     1bf4:	0f 01 f9             	rdtscp
1bf7     1bf7:	0f ae e8             	lfence
1bfa     1bfa:	0f 31                	rdtsc
1bfc     1bfc:	0f 01 f9             	rdtscp
1bff     1bff:	0f ae e8             	lfence
1c02     1c02:	0f 31                	rdtsc
1c04     1c04:	0f 01 f9             	rdtscp
1c07     1c07:	0f ae e8             	lfence
1c0a     1c0a:	0f 31                	rdtsc
1c0c     1c0c:	0f 01 f9             	rdtscp
1c0f     1c0f:	0f ae e8             	lfence
1c12     1c12:	0f 31                	rdtsc
1c14     1c14:	0f 01 f9             	rdtscp
1c17     1c17:	e8 00 00 00 00       	call   1c1c <.altinstr_replacement+0x1c1c>	1c18: R_X86_64_PLT32	copy_user_generic_string-0x4
1c1c     1c1c:	e8 00 00 00 00       	call   1c21 <.altinstr_replacement+0x1c21>	1c1d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1c21     1c21:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1c2b     1c2b:	e8 00 00 00 00       	call   1c30 <.altinstr_replacement+0x1c30>	1c2c: R_X86_64_PLT32	copy_user_generic_string-0x4
1c30     1c30:	e8 00 00 00 00       	call   1c35 <.altinstr_replacement+0x1c35>	1c31: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1c35     1c35:	0f 01 cb             	stac
1c38     1c38:	0f 01 ca             	clac
1c3b     1c3b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1c45     1c45:	0f 01 cb             	stac
1c48     1c48:	0f 01 ca             	clac
1c4b     1c4b:	66 0f ae 38          	clflushopt (%rax)
1c4f     1c4f:	66 0f ae 30          	clwb   (%rax)
1c53     1c53:	66 0f ae 38          	clflushopt (%rax)
1c57     1c57:	66 0f ae 30          	clwb   (%rax)
1c5b     1c5b:	66 0f ae 38          	clflushopt (%rax)
1c5f     1c5f:	66 0f ae 30          	clwb   (%rax)
1c63     1c63:	66 0f ae 38          	clflushopt (%rax)
1c67     1c67:	66 0f ae 30          	clwb   (%rax)
1c6b     1c6b:	66 0f ae 38          	clflushopt (%rax)
1c6f     1c6f:	66 0f ae 30          	clwb   (%rax)
1c73     1c73:	66 0f ae 38          	clflushopt (%rax)
1c77     1c77:	66 0f ae 30          	clwb   (%rax)
1c7b     1c7b:	66 0f ae 38          	clflushopt (%rax)
1c7f     1c7f:	66 0f ae 30          	clwb   (%rax)
1c83     1c83:	66 0f ae 38          	clflushopt (%rax)
1c87     1c87:	66 0f ae 30          	clwb   (%rax)
1c8b     1c8b:	66 0f ae 38          	clflushopt (%rax)
1c8f     1c8f:	66 0f ae 30          	clwb   (%rax)
1c93     1c93:	66 0f ae 38          	clflushopt (%rax)
1c97     1c97:	66 0f ae 30          	clwb   (%rax)
1c9b     1c9b:	66 0f ae 38          	clflushopt (%rax)
1c9f     1c9f:	66 0f ae 30          	clwb   (%rax)
1ca3     1ca3:	66 0f ae 38          	clflushopt (%rax)
1ca7     1ca7:	66 0f ae 30          	clwb   (%rax)
1cab     1cab:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1cb0     1cb0:	f3 0f b8 c7          	popcnt %edi,%eax
1cb4     1cb4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1cb9     1cb9:	e9 00 00 00 00       	jmp    1cbe <.altinstr_replacement+0x1cbe>	1cba: R_X86_64_PLT32	.cpuidle.text+0x42e
1cbe     1cbe:	e9 00 00 00 00       	jmp    1cc3 <.altinstr_replacement+0x1cc3>	1cbf: R_X86_64_PLT32	.cpuidle.text+0x463
1cc3     1cc3:	e9 00 00 00 00       	jmp    1cc8 <.altinstr_replacement+0x1cc8>	1cc4: R_X86_64_PLT32	.cpuidle.text+0x54a
1cc8     1cc8:	e9 00 00 00 00       	jmp    1ccd <.altinstr_replacement+0x1ccd>	1cc9: R_X86_64_PLT32	.cpuidle.text+0x57f
1ccd     1ccd:	e9 00 00 00 00       	jmp    1cd2 <.altinstr_replacement+0x1cd2>	1cce: R_X86_64_PLT32	.init.text+0x5b12b
1cd2     1cd2:	e8 00 00 00 00       	call   1cd7 <.altinstr_replacement+0x1cd7>	1cd3: R_X86_64_PLT32	clear_page_rep-0x4
1cd7     1cd7:	e8 00 00 00 00       	call   1cdc <.altinstr_replacement+0x1cdc>	1cd8: R_X86_64_PLT32	clear_page_erms-0x4
1cdc     1cdc:	e8 00 00 00 00       	call   1ce1 <.altinstr_replacement+0x1ce1>	1cdd: R_X86_64_PLT32	clear_page_rep-0x4
1ce1     1ce1:	e8 00 00 00 00       	call   1ce6 <.altinstr_replacement+0x1ce6>	1ce2: R_X86_64_PLT32	clear_page_erms-0x4
1ce6     1ce6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ceb     1ceb:	e8 00 00 00 00       	call   1cf0 <.altinstr_replacement+0x1cf0>	1cec: R_X86_64_PLT32	clear_page_rep-0x4
1cf0     1cf0:	e8 00 00 00 00       	call   1cf5 <.altinstr_replacement+0x1cf5>	1cf1: R_X86_64_PLT32	clear_page_erms-0x4
1cf5     1cf5:	e8 00 00 00 00       	call   1cfa <.altinstr_replacement+0x1cfa>	1cf6: R_X86_64_PLT32	clear_page_rep-0x4
1cfa     1cfa:	e8 00 00 00 00       	call   1cff <.altinstr_replacement+0x1cff>	1cfb: R_X86_64_PLT32	clear_page_erms-0x4
1cff     1cff:	e9 00 00 00 00       	jmp    1d04 <.altinstr_replacement+0x1d04>	1d00: R_X86_64_PLT32	.text.get_random_bytes_arch+0xf4
1d04     1d04:	e9 00 00 00 00       	jmp    1d09 <.altinstr_replacement+0x1d09>	1d05: R_X86_64_PLT32	.init.text+0x6c759
1d09     1d09:	e9 00 00 00 00       	jmp    1d0e <.altinstr_replacement+0x1d0e>	1d0a: R_X86_64_PLT32	.init.text+0x6c7e4
1d0e     1d0e:	e9 00 00 00 00       	jmp    1d13 <.altinstr_replacement+0x1d13>	1d0f: R_X86_64_PLT32	.text.extract_entropy+0x624
1d13     1d13:	e9 00 00 00 00       	jmp    1d18 <.altinstr_replacement+0x1d18>	1d14: R_X86_64_PLT32	.text.extract_entropy+0x679
1d18     1d18:	e9 00 00 00 00       	jmp    1d1d <.altinstr_replacement+0x1d1d>	1d19: R_X86_64_PLT32	.text.extract_entropy+0x638
1d1d     1d1d:	e9 00 00 00 00       	jmp    1d22 <.altinstr_replacement+0x1d22>	1d1e: R_X86_64_PLT32	.text.extract_entropy+0x68d
1d22     1d22:	e9 00 00 00 00       	jmp    1d27 <.altinstr_replacement+0x1d27>	1d23: R_X86_64_PLT32	.text.extract_entropy+0x64c
1d27     1d27:	e9 00 00 00 00       	jmp    1d2c <.altinstr_replacement+0x1d2c>	1d28: R_X86_64_PLT32	.text.extract_entropy+0x6a1
1d2c     1d2c:	e9 00 00 00 00       	jmp    1d31 <.altinstr_replacement+0x1d31>	1d2d: R_X86_64_PLT32	.text.extract_entropy+0x660
1d31     1d31:	e9 00 00 00 00       	jmp    1d36 <.altinstr_replacement+0x1d36>	1d32: R_X86_64_PLT32	.text.extract_entropy+0x6b5
1d36     1d36:	f3 0f b8 c7          	popcnt %edi,%eax
1d3a     1d3a:	f3 0f b8 c7          	popcnt %edi,%eax
1d3e     1d3e:	f3 0f b8 c7          	popcnt %edi,%eax
1d42     1d42:	e9 00 00 00 00       	jmp    1d47 <.altinstr_replacement+0x1d47>	1d43: R_X86_64_PLT32	.text.drm_clflush_pages+0x13f
1d47     1d47:	66 41 0f ae 7c 05 00 	clflushopt 0x0(%r13,%rax,1)
1d4e     1d4e:	66 41 0f ae 7c 05 00 	clflushopt 0x0(%r13,%rax,1)
1d55     1d55:	e9 00 00 00 00       	jmp    1d5a <.altinstr_replacement+0x1d5a>	1d56: R_X86_64_PLT32	.text.drm_clflush_sg+0x14f
1d5a     1d5a:	66 41 0f ae 3c 06    	clflushopt (%r14,%rax,1)
1d60     1d60:	66 41 0f ae 3c 06    	clflushopt (%r14,%rax,1)
1d66     1d66:	e9 00 00 00 00       	jmp    1d6b <.altinstr_replacement+0x1d6b>	1d67: R_X86_64_PLT32	.text.drm_clflush_virt_range+0x94
1d6b     1d6b:	66 41 0f ae 3c 24    	clflushopt (%r12)
1d71     1d71:	66 41 0f ae 3c 24    	clflushopt (%r12)
1d77     1d77:	66 0f ae 7b ff       	clflushopt -0x1(%rbx)
1d7c     1d7c:	e9 00 00 00 00       	jmp    1d81 <.altinstr_replacement+0x1d81>	1d7d: R_X86_64_PLT32	.text.drm_memcpy_init_early+0xaf
1d81     1d81:	f3 0f b8 c7          	popcnt %edi,%eax
1d85     1d85:	f3 0f b8 c7          	popcnt %edi,%eax
1d89     1d89:	f3 0f b8 c7          	popcnt %edi,%eax
1d8d     1d8d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1d92     1d92:	f3 0f b8 c7          	popcnt %edi,%eax
1d96     1d96:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1da0     1da0:	f3 0f b8 c7          	popcnt %edi,%eax
1da4     1da4:	f3 0f b8 c7          	popcnt %edi,%eax
1da8     1da8:	f3 0f b8 c7          	popcnt %edi,%eax
1dac     1dac:	f3 0f b8 c7          	popcnt %edi,%eax
1db0     1db0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1db5     1db5:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1dbf     1dbf:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1dc9     1dc9:	e9 00 00 00 00       	jmp    1dce <.altinstr_replacement+0x1dce>	1dca: R_X86_64_PLT32	.text.vfio_iommu_type1_detach_group+0x8c6
1dce     1dce:	e9 00 00 00 00       	jmp    1dd3 <.altinstr_replacement+0x1dd3>	1dcf: R_X86_64_PLT32	.text.vfio_iommu_type1_detach_group+0x90f
1dd3     1dd3:	e9 00 00 00 00       	jmp    1dd8 <.altinstr_replacement+0x1dd8>	1dd4: R_X86_64_PLT32	.text.vfio_iommu_type1_pin_pages+0x557
1dd8     1dd8:	e9 00 00 00 00       	jmp    1ddd <.altinstr_replacement+0x1ddd>	1dd9: R_X86_64_PLT32	.text.vfio_iommu_type1_pin_pages+0x6c0
1ddd     1ddd:	e9 00 00 00 00       	jmp    1de2 <.altinstr_replacement+0x1de2>	1dde: R_X86_64_PLT32	.text.put_pfn+0x12d
1de2     1de2:	e9 00 00 00 00       	jmp    1de7 <.altinstr_replacement+0x1de7>	1de3: R_X86_64_PLT32	.text.put_pfn+0x174
1de7     1de7:	e9 00 00 00 00       	jmp    1dec <.altinstr_replacement+0x1dec>	1de8: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x1c6
1dec     1dec:	e9 00 00 00 00       	jmp    1df1 <.altinstr_replacement+0x1df1>	1ded: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x8c4
1df1     1df1:	e9 00 00 00 00       	jmp    1df6 <.altinstr_replacement+0x1df6>	1df2: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x38c
1df6     1df6:	e9 00 00 00 00       	jmp    1dfb <.altinstr_replacement+0x1dfb>	1df7: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x69e
1dfb     1dfb:	e9 00 00 00 00       	jmp    1e00 <.altinstr_replacement+0x1e00>	1dfc: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x5b0
1e00     1e00:	e9 00 00 00 00       	jmp    1e05 <.altinstr_replacement+0x1e05>	1e01: R_X86_64_PLT32	.text.vfio_pin_pages_remote+0x645
1e05     1e05:	e9 00 00 00 00       	jmp    1e0a <.altinstr_replacement+0x1e0a>	1e06: R_X86_64_PLT32	.text.vaddr_get_pfns+0x607
1e0a     1e0a:	e9 00 00 00 00       	jmp    1e0f <.altinstr_replacement+0x1e0f>	1e0b: R_X86_64_PLT32	.text.vaddr_get_pfns+0x637
1e0f     1e0f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e14     1e14:	f3 0f b8 c7          	popcnt %edi,%eax
1e18     1e18:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e1d     1e1d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e22     1e22:	f3 0f b8 c7          	popcnt %edi,%eax
1e26     1e26:	f3 0f b8 c7          	popcnt %edi,%eax
1e2a     1e2a:	f3 0f b8 c7          	popcnt %edi,%eax
1e2e     1e2e:	f3 0f b8 c7          	popcnt %edi,%eax
1e32     1e32:	f3 0f b8 c7          	popcnt %edi,%eax
1e36     1e36:	f3 0f b8 c7          	popcnt %edi,%eax
1e3a     1e3a:	f3 0f b8 c7          	popcnt %edi,%eax
1e3e     1e3e:	e9 00 00 00 00       	jmp    1e43 <.altinstr_replacement+0x1e43>	1e3f: R_X86_64_PLT32	.text.intel_thermal_interrupt+0x3a5
1e43     1e43:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e48     1e48:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e4d     1e4d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e52     1e52:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e57     1e57:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e5c     1e5c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e61     1e61:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1e66     1e66:	f3 0f b8 c7          	popcnt %edi,%eax
1e6a     1e6a:	f3 0f b8 c7          	popcnt %edi,%eax
1e6e     1e6e:	f3 0f b8 c7          	popcnt %edi,%eax
1e72     1e72:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1e7c     1e7c:	41 0f 0d 0e          	prefetchw (%r14)
1e80     1e80:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1e84     1e84:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1e8e     1e8e:	0f 01 cb             	stac
1e91     1e91:	0f ae e8             	lfence
1e94     1e94:	0f 01 ca             	clac
1e97     1e97:	0f 01 ca             	clac
1e9a     1e9a:	0f 01 ca             	clac
1e9d     1e9d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ea2     1ea2:	f3 0f b8 c7          	popcnt %edi,%eax
1ea6     1ea6:	f3 0f b8 c7          	popcnt %edi,%eax
1eaa     1eaa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1eaf     1eaf:	0f 0d 08             	prefetchw (%rax)
1eb2     1eb2:	f3 0f b8 c7          	popcnt %edi,%eax
1eb6     1eb6:	f3 0f b8 c7          	popcnt %edi,%eax
1eba     1eba:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ebf     1ebf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ec4     1ec4:	0f 0d 08             	prefetchw (%rax)
1ec7     1ec7:	f3 0f b8 c7          	popcnt %edi,%eax
1ecb     1ecb:	f3 0f b8 c7          	popcnt %edi,%eax
1ecf     1ecf:	f3 0f b8 c7          	popcnt %edi,%eax
1ed3     1ed3:	f3 0f b8 c7          	popcnt %edi,%eax
1ed7     1ed7:	f3 0f b8 c7          	popcnt %edi,%eax
1edb     1edb:	f3 0f b8 c7          	popcnt %edi,%eax
1edf     1edf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ee4     1ee4:	f3 0f b8 c7          	popcnt %edi,%eax
1ee8     1ee8:	f3 0f b8 c7          	popcnt %edi,%eax
1eec     1eec:	f3 0f b8 c7          	popcnt %edi,%eax
1ef0     1ef0:	f3 0f b8 c7          	popcnt %edi,%eax
1ef4     1ef4:	f3 0f b8 c7          	popcnt %edi,%eax
1ef8     1ef8:	f3 0f b8 c7          	popcnt %edi,%eax
1efc     1efc:	f3 0f b8 c7          	popcnt %edi,%eax
1f00     1f00:	f3 0f b8 c7          	popcnt %edi,%eax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
