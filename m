Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3781370;
	Wed, 31 Jan 2024 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706665011; cv=none; b=DhU9hNwvL9vA92z7PzuTTxhzeYDbE4YJD626FzKYiOp0f52dkVx11xAHLL3gvTKZuawg5sDX2Scod9em90sm3pIML9vYMe3RXk8ZTZi1cE1HiMmgUoN0RFezV6N7nnskwTE8sDRipzEsN+TmvpLc/MIxgMea44Uu9VWwFTLwihg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706665011; c=relaxed/simple;
	bh=TAxKqxXYae2dI0XAUDKhvka2jxb0WiieiuKIcAMh1R8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mSnB23H8eKeA9wCltMzOkBL6hDQevyJLOHPH2mp3JnuqG4Mppp5ocafuKsBIFpbZMIXHR/bM7b25RAmXfqwjfmYu0ytF4kZYj5tFXUJR4vLp9X3fdG5oeAad0BGV/4EnuKCMote5SeBnoSxf9R/zfyaXOWHN9b8i/D3TJgD2f0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm/qVTXB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm/qVTXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706665009; x=1738201009;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TAxKqxXYae2dI0XAUDKhvka2jxb0WiieiuKIcAMh1R8=;
  b=Vm/qVTXB2am9V1z4Ry9smUIZEGnKcYDNmJ2FEtTSsL+dK3NKwqH94Weg
   Z9xKT7Abcs2aTvjT36NtI7oe3u33lNNPYlVecArJ4+VcyTc36N1tputgx
   lJLT3hR+FMqQ7m6JF82OYeVyackUwj/EslN1s913cwk8D7F3aRXg7Qjv8
   zIje6WbQhjDfcj8dQrB54JKAURmQNF0/AnuD/r7pEVL0wN7Nf0ea/+hhP
   YOtOkYnJdelICLFqj3XZf3MIFN0d8Ys1/ug3vZg2dVtA4JySlMZLe6znZ
   P0AvrOGzrIH+AVGEpd5DVka+0CEWYAFW7SnoN5X4ea9HUay/TbiFOb37a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10831247"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10831247"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 17:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788389168"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788389168"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2024 17:36:47 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUzWu-00011K-1W;
	Wed, 31 Jan 2024 01:36:44 +0000
Date: Wed, 31 Jan 2024 09:36:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [bp:tip-x86-fred 1/10] vmlinux.o: warning: objtool:
 fred_extint+0x25: call to array_index_mask_nospec() leaves .noinstr.text
 section
Message-ID: <202401310917.d6H79uDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: "H. Peter Anvin (Intel)" <hpa@zytor.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Xin Li <xin3.li@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git tip-x86-fred
head:   b564b0111a3f03d1a92ba87c4b0f054ad1845963
commit: 6d6751743d0f75cb381ac7df32edb52212ad5a8d [1/10] x86/fred: FRED entry/exit and dispatch code
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401310917.d6H79uDq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310917.d6H79uDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310917.d6H79uDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0x7738: stack state mismatch: cfa1=4+376 cfa2=4+368
>> vmlinux.o: warning: objtool: fred_extint+0x25: call to array_index_mask_nospec() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fred_intx+0x30: call to ia32_enabled() leaves .noinstr.text section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x46: relocation to !ENDBR: .text+0x3b0538
   vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata


objdump-func vmlinux.o fred_extint:
0000 0000000000001340 <fred_extint>:
0000     1340:	55                   	push   %rbp
0001     1341:	41 57                	push   %r15
0003     1343:	41 56                	push   %r14
0005     1345:	41 54                	push   %r12
0007     1347:	53                   	push   %rbx
0008     1348:	48 89 fb             	mov    %rdi,%rbx
000b     134b:	4c 8b bf a0 00 00 00 	mov    0xa0(%rdi),%r15
0012     1352:	49 c1 ef 20          	shr    $0x20,%r15
0016     1356:	45 0f b6 e7          	movzbl %r15b,%r12d
001a     135a:	45 8d b4 24 14 ff ff ff 	lea    -0xec(%r12),%r14d
0022     1362:	4c 89 f7             	mov    %r14,%rdi
0025     1365:	e8 00 00 00 00       	call   136a <fred_extint+0x2a>	1366: R_X86_64_PLT32	.text+0x91fc
002a     136a:	41 83 fc 1f          	cmp    $0x1f,%r12d
002e     136e:	76 5d                	jbe    13cd <fred_extint+0x8d>
0030     1370:	41 81 fc ec 00 00 00 	cmp    $0xec,%r12d
0037     1377:	72 5a                	jb     13d3 <fred_extint+0x93>
0039     1379:	41 21 c6             	and    %eax,%r14d
003c     137c:	48 89 df             	mov    %rbx,%rdi
003f     137f:	e8 00 00 00 00       	call   1384 <fred_extint+0x44>	1380: R_X86_64_PLT32	irqentry_enter-0x4
0044     1384:	89 c5                	mov    %eax,%ebp
0046     1386:	90                   	nop
0047     1387:	44 89 f0             	mov    %r14d,%eax
004a     138a:	4c 8b 1c c5 00 00 00 00 	mov    0x0(,%rax,8),%r11	138e: R_X86_64_32S	.data..ro_after_init+0x60c0
0052     1392:	48 89 df             	mov    %rbx,%rdi
0055     1395:	41 ba de 95 a8 0c    	mov    $0xca895de,%r10d
005b     139b:	45 03 53 c1          	add    -0x3f(%r11),%r10d
005f     139f:	74 02                	je     13a3 <fred_extint+0x63>
0061     13a1:	0f 0b                	ud2
0063     13a3:	2e e8 00 00 00 00    	cs call 13a9 <fred_extint+0x69>	13a5: R_X86_64_PLT32	__x86_indirect_thunk_r11-0x4
0069     13a9:	90                   	nop
006a     13aa:	40 0f b6 f5          	movzbl %bpl,%esi
006e     13ae:	48 89 df             	mov    %rbx,%rdi
0071     13b1:	e8 00 00 00 00       	call   13b6 <fred_extint+0x76>	13b2: R_X86_64_PLT32	irqentry_exit-0x4
0076     13b6:	5b                   	pop    %rbx
0077     13b7:	41 5c                	pop    %r12
0079     13b9:	41 5e                	pop    %r14
007b     13bb:	41 5f                	pop    %r15
007d     13bd:	5d                   	pop    %rbp
007e     13be:	31 c0                	xor    %eax,%eax
0080     13c0:	31 ff                	xor    %edi,%edi
0082     13c2:	31 f6                	xor    %esi,%esi
0084     13c4:	45 31 db             	xor    %r11d,%r11d
0087     13c7:	2e e9 00 00 00 00    	cs jmp 13cd <fred_extint+0x8d>	13c9: R_X86_64_PLT32	__x86_return_thunk-0x4
008d     13cd:	90                   	nop
008e     13ce:	0f 0b                	ud2
0090     13d0:	90                   	nop
0091     13d1:	eb e3                	jmp    13b6 <fred_extint+0x76>
0093     13d3:	41 0f b6 f7          	movzbl %r15b,%esi
0097     13d7:	48 89 df             	mov    %rbx,%rdi
009a     13da:	e8 00 00 00 00       	call   13df <fred_extint+0x9f>	13db: R_X86_64_PLT32	common_interrupt-0x4
009f     13df:	eb d5                	jmp    13b6 <fred_extint+0x76>
00a1     13e1:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00b0     13f0:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00bf     13ff:	90                   	nop
00c0     1400:	90                   	nop
00c1     1401:	90                   	nop
00c2     1402:	90                   	nop
00c3     1403:	90                   	nop
00c4     1404:	90                   	nop
00c5     1405:	90                   	nop
00c6     1406:	90                   	nop
00c7     1407:	90                   	nop
00c8     1408:	90                   	nop
00c9     1409:	90                   	nop
00ca     140a:	90                   	nop
00cb     140b:	90                   	nop
00cc     140c:	90                   	nop
00cd     140d:	90                   	nop
00ce     140e:	90                   	nop
00cf     140f:	90                   	nop
00d0     1410:	90                   	nop
00d1     1411:	90                   	nop
00d2     1412:	90                   	nop
00d3     1413:	90                   	nop
00d4     1414:	90                   	nop
00d5     1415:	90                   	nop
00d6     1416:	90                   	nop
00d7     1417:	90                   	nop
00d8     1418:	90                   	nop
00d9     1419:	90                   	nop
00da     141a:	90                   	nop
00db     141b:	90                   	nop
00dc     141c:	90                   	nop
00dd     141d:	90                   	nop
00de     141e:	90                   	nop
00df     141f:	90                   	nop
00e0     1420:	90                   	nop
00e1     1421:	90                   	nop
00e2     1422:	90                   	nop
00e3     1423:	90                   	nop
00e4     1424:	90                   	nop
00e5     1425:	90                   	nop
00e6     1426:	90                   	nop
00e7     1427:	90                   	nop
00e8     1428:	90                   	nop
00e9     1429:	90                   	nop
00ea     142a:	90                   	nop
00eb     142b:	90                   	nop
00ec     142c:	90                   	nop
00ed     142d:	90                   	nop
00ee     142e:	90                   	nop
00ef     142f:	90                   	nop
00f0     1430:	90                   	nop
00f1     1431:	90                   	nop
00f2     1432:	90                   	nop
00f3     1433:	90                   	nop
00f4     1434:	90                   	nop
00f5     1435:	90                   	nop
00f6     1436:	90                   	nop
00f7     1437:	90                   	nop
00f8     1438:	90                   	nop
00f9     1439:	90                   	nop
00fa     143a:	90                   	nop
00fb     143b:	90                   	nop
00fc     143c:	90                   	nop
00fd     143d:	90                   	nop
00fe     143e:	90                   	nop
00ff     143f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
