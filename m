Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC712263A;
	Sun, 29 Sep 2024 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727633878; cv=none; b=sn9Su2OBxBx5yxnxlOhXyAcbRkOgvRKa1+o5fkBuaqwH6JWKhqvv3wVCH6NSPF0eu64Qzxq5iVtt6uldXHfoBWPGBzUTQzpB5nYkv6zUdh5qTAoIckAgz4LOfMZsS2X2vst60wmvjyw+VrZtIuvVQOU+pW93Srz4k2qKaCLkj8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727633878; c=relaxed/simple;
	bh=YrUtqYMAsV5VmM/8LxC4dPNex1L7QZp3ecGUAsVJAaI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZffMBQERjHSKY0LsCXoinplv8JCZQLEPuwFdpQ0dhLbTLd+i5vVN3Hy0Xa1oyo6irCgbFnu4nuU+0tJxFzNyUMPpAz0KZ/DZ+EZy1P/ttuu7dGCbOakrD4ifxTKTyqz/S5YEWmgK/GWPhLMXy4zyI8n7vF0k/oZDSSB81/VUBiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHJDAwo4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHJDAwo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727633876; x=1759169876;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YrUtqYMAsV5VmM/8LxC4dPNex1L7QZp3ecGUAsVJAaI=;
  b=OHJDAwo4c2t44K/foTHTOQnJnP+5Fs8OJ6L1PiaMtRPuo5a8QQtwzKFK
   77cKrSSJdmVyqXsiMLJpSMsRwGmHBxMaFFZJJFgynXOjhJ/HGWS+LavfB
   iGbHyPFDN8n5Qy7XNgFnBHll65TXLXROsD4A8//NEDCev/14pT0P05/4+
   2Qm/+3LL2jAmlYKfJxYQJl5GRw7BJPdfMEeXhTDXsNXoOWK8n5K80D2LD
   kXB03NrgPS2znUbgelkmLOTr5cvW6UoGdqEdw+9doj9G15kjZLs4FWV0y
   QRVYHKVXUFKF1zVdCv+kBbCnvXYomPXcGxozEj5d7GTeyjBbOw5gsCLwA
   A==;
X-CSE-ConnectionGUID: D+OrCkQSQYi5eXIsmHzRYw==
X-CSE-MsgGUID: GaHpHRhzR+CtahQs4P6Jog==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38077293"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="38077293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:17:47 -0700
X-CSE-ConnectionGUID: x1ff++d/QeObYDzGL1x2YA==
X-CSE-MsgGUID: 7p4e/cTRRs6CeW1M7n+xiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103867365"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 11:17:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suyUJ-000OZ9-09;
	Sun, 29 Sep 2024 18:17:43 +0000
Date: Mon, 30 Sep 2024 02:17:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-v2 23/26] block/blk-core.o: warning: objtool:
 errno_to_blk_status+0x16: can't find switch jump table
Message-ID: <202409300226.u5kOSLIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   2b9142b6c6241b0debfe0d21c911c3aaf0c05670
commit: 73ab629624e08a8d1fad61e724e408d71c5c107f [23/26] x86: Use PIE codegen for the core kernel
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240930/202409300226.u5kOSLIm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300226.u5kOSLIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300226.u5kOSLIm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-core.o: warning: objtool: errno_to_blk_status+0x16: can't find switch jump table
--
>> block/blk-merge.o: warning: objtool: bio_split_to_limits+0x2f: can't find switch jump table
--
>> block/blk-mq.o: warning: objtool: blk_mq_submit_bio+0xf1: can't find switch jump table
--
>> block/ioctl.o: warning: objtool: blkdev_ioctl+0x80: can't find switch jump table
--
>> arch/x86/entry/syscall_64.o: warning: objtool: x64_sys_call+0x1c: can't find switch jump table
--
>> arch/x86/events/core.o: warning: objtool: init_hw_perf_events+0x35: can't find switch jump table
--
>> arch/x86/events/msr.o: warning: objtool: test_intel+0x34: can't find switch jump table
--
>> fs/open.o: warning: objtool: vfs_fallocate+0x4a: can't find switch jump table
--
>> fs/read_write.o: warning: objtool: generic_file_llseek+0x28: can't find switch jump table
--
>> fs/namei.o: warning: objtool: may_open+0x35: can't find switch jump table
--
>> fs/fcntl.o: warning: objtool: __x64_sys_fcntl+0x83: can't find switch jump table
..


objdump-func vmlinux.o errno_to_blk_status:
0000 000000000016d460 <errno_to_blk_status>:
0000   16d460:	83 c7 79             	add    $0x79,%edi
0003   16d463:	83 ff 79             	cmp    $0x79,%edi
0006   16d466:	77 10                	ja     16d478 <errno_to_blk_status+0x18>
0008   16d468:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 16d46f <errno_to_blk_status+0xf>	16d46b: R_X86_64_PC32	.rodata+0x7d28
000f   16d46f:	48 63 0c b8          	movslq (%rax,%rdi,4),%rcx
0013   16d473:	48 01 c1             	add    %rax,%rcx
0016   16d476:	ff e1                	jmp    *%rcx
0018   16d478:	b0 0a                	mov    $0xa,%al
001a   16d47a:	c3                   	ret
001b   16d47b:	31 c0                	xor    %eax,%eax
001d   16d47d:	c3                   	ret
001e   16d47e:	b0 10                	mov    $0x10,%al
0020   16d480:	c3                   	ret
0021   16d481:	b0 06                	mov    $0x6,%al
0023   16d483:	c3                   	ret
0024   16d484:	b0 08                	mov    $0x8,%al
0026   16d486:	c3                   	ret
0027   16d487:	b0 13                	mov    $0x13,%al
0029   16d489:	c3                   	ret
002a   16d48a:	b0 02                	mov    $0x2,%al
002c   16d48c:	c3                   	ret
002d   16d48d:	b0 0b                	mov    $0xb,%al
002f   16d48f:	c3                   	ret
0030   16d490:	b0 03                	mov    $0x3,%al
0032   16d492:	c3                   	ret
0033   16d493:	b0 05                	mov    $0x5,%al
0035   16d495:	c3                   	ret
0036   16d496:	b0 01                	mov    $0x1,%al
0038   16d498:	c3                   	ret
0039   16d499:	b0 0e                	mov    $0xe,%al
003b   16d49b:	c3                   	ret
003c   16d49c:	b0 0f                	mov    $0xf,%al
003e   16d49e:	c3                   	ret
003f   16d49f:	b0 04                	mov    $0x4,%al
0041   16d4a1:	c3                   	ret
0042   16d4a2:	b0 0d                	mov    $0xd,%al
0044   16d4a4:	c3                   	ret
0045   16d4a5:	b0 09                	mov    $0x9,%al
0047   16d4a7:	c3                   	ret
0048   16d4a8:	b0 07                	mov    $0x7,%al
004a   16d4aa:	c3                   	ret
004b   16d4ab:	b0 11                	mov    $0x11,%al
004d   16d4ad:	c3                   	ret
004e   16d4ae:	b0 0c                	mov    $0xc,%al
0050   16d4b0:	c3                   	ret
0051   16d4b1:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
