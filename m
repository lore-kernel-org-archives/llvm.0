Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512E224CC;
	Wed, 11 Sep 2024 20:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726085436; cv=none; b=Ruq7F88zS/I0uGR/gYC/k49G6qCm+1Lj9SMXIj9DueeATNT9NGRMRWeXnKeZ31PFoIg2Lz7tZsEVruAeHkRx+FleT5H3nwII/wTZsg+unQz6ysM2IiwGEMgXxOPjLRs35fupDVRcV/pHjE85OPH0W7qjs+uZEvon8YGiYzjzYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726085436; c=relaxed/simple;
	bh=XgEqG7B4cwOPI/1EVgBBDwUEXWlel6aIf9tAKNjgVAU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3UFYlo3idy34JRgw9eDLRszY4946b017nZEVYg2CWH0JpByV86arBVRSTLpOULQEoyximElpN2NRpSAX9RWvy//cyX44WGY7oF6mOJiar24cl5t9oFhiW33CUKC3fTmJ5WZsu0reEHO9jjdDTpvUPJt7CGLL1UMKHwq63ASfLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsrDRvsr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsrDRvsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726085434; x=1757621434;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XgEqG7B4cwOPI/1EVgBBDwUEXWlel6aIf9tAKNjgVAU=;
  b=IsrDRvsr0d5AWQ8IQtbqr/YrGkhvj+Yx1jqaMqCyYPRLzGT2huMvEv9I
   P5Cb4rFRovGmuhZrq5Ov1UudqVlFVMEUBvpjkD0dCjkEa1SE2wlW3YlHY
   1UE3dnITFEOrk0ce5iyEj4vnQ4CvECzCRIRZwmaq4Nggv4V9LVxKm4sBL
   AqY0h0E7UDAYpOri9um6Q+Kihz4eaXsEJ3/XImGlKJhkuW/z2eZoL+OiP
   WnBlqwA9Mqp070QmmnvgnVEUrztDfnMGuEDuIO71y+DM1amu76ZB0IG1P
   wO/iyojA0hFSXGkHy/JsmZohS6tTzSOp4Tfq607OAbbE2Ua9URxt8MPq+
   g==;
X-CSE-ConnectionGUID: 6YssE+kBS6GWAkydHFeLoA==
X-CSE-MsgGUID: bc2GY5czQpqln9pYQIXucw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27828327"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="27828327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:10:26 -0700
X-CSE-ConnectionGUID: AqucgVEzQjKX0UUvX3h0RQ==
X-CSE-MsgGUID: UqHUSA5MQAmzsmw/FGsJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71859070"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2024 13:10:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soTfI-00045m-0u;
	Wed, 11 Sep 2024 20:10:12 +0000
Date: Thu, 12 Sep 2024 04:09:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/gpu/drm/sti/sti_awg_utils.o: warning: objtool:
 awg_generate_instr+0xac: unreachable instruction
Message-ID: <202409120406.3Khlzere-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77f587896757708780a7e8792efe62939f25a5ab
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a drm/sti: Allow build with COMPILE_TEST=y
date:   4 months ago
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240912/202409120406.3Khlzere-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120406.3Khlzere-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120406.3Khlzere-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/sti/sti_awg_utils.o: warning: objtool: awg_generate_instr+0xac: unreachable instruction


objdump-func vmlinux.o awg_generate_instr:
0000 0000000002df0330 <awg_generate_instr>:
0000  2df0330:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	2df0331: R_X86_64_NONE	__fentry__-0x4
0005  2df0335:	55                   	push   %rbp
0006  2df0336:	48 89 e5             	mov    %rsp,%rbp
0009  2df0339:	41 57                	push   %r15
000b  2df033b:	41 56                	push   %r14
000d  2df033d:	41 55                	push   %r13
000f  2df033f:	41 54                	push   %r12
0011  2df0341:	53                   	push   %rbx
0012  2df0342:	48 8d 64 24 d8       	lea    -0x28(%rsp),%rsp
0017  2df0347:	48 89 cb             	mov    %rcx,%rbx
001a  2df034a:	49 89 d5             	mov    %rdx,%r13
001d  2df034d:	49 89 f6             	mov    %rsi,%r14
0020  2df0350:	41 89 fc             	mov    %edi,%r12d
0023  2df0353:	e8 00 00 00 00       	call   2df0358 <awg_generate_instr+0x28>	2df0354: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0028  2df0358:	4d 85 f6             	test   %r14,%r14
002b  2df035b:	0f 8e 7e 01 00 00    	jle    2df04df <awg_generate_instr+0x1af>
0031  2df0361:	4c 8d 7b 08          	lea    0x8(%rbx),%r15
0035  2df0365:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
003f  2df036f:	41 83 e5 01          	and    $0x1,%r13d
0043  2df0373:	4c 89 f8             	mov    %r15,%rax
0046  2df0376:	48 c1 e8 03          	shr    $0x3,%rax
004a  2df037a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
004e  2df037e:	8a 04 08             	mov    (%rax,%rcx,1),%al
0051  2df0381:	84 c0                	test   %al,%al
0053  2df0383:	0f 85 8d 01 00 00    	jne    2df0516 <awg_generate_instr+0x1e6>
0059  2df0389:	41 c1 e5 09          	shl    $0x9,%r13d
005d  2df038d:	48 89 5d b0          	mov    %rbx,-0x50(%rbp)
0061  2df0391:	48 c1 eb 03          	shr    $0x3,%rbx
0065  2df0395:	4c 89 7d b8          	mov    %r15,-0x48(%rbp)
0069  2df0399:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
006d  2df039d:	45 8a 2f             	mov    (%r15),%r13b
0070  2df03a0:	48 89 5d c8          	mov    %rbx,-0x38(%rbp)
0074  2df03a4:	41 80 fd 40          	cmp    $0x40,%r13b
0078  2df03a8:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0082  2df03b2:	0f 83 2e 01 00 00    	jae    2df04e6 <awg_generate_instr+0x1b6>
0088  2df03b8:	67 41 8d 04 24       	lea    (%r12d),%eax
008d  2df03bd:	ff 24 c5 00 00 00 00 	jmp    *0x0(,%rax,8)	2df03c0: R_X86_64_32S	.rodata+0x12625e0
0094  2df03c4:	cc                   	int3
0095  2df03c5:	e8 00 00 00 00       	call   2df03ca <awg_generate_instr+0x9a>	2df03c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
009a  2df03ca:	eb 37                	jmp    2df0403 <awg_generate_instr+0xd3>
009c  2df03cc:	e8 00 00 00 00       	call   2df03d1 <awg_generate_instr+0xa1>	2df03cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00a1  2df03d1:	31 db                	xor    %ebx,%ebx
00a3  2df03d3:	eb 4f                	jmp    2df0424 <awg_generate_instr+0xf4>
00a5  2df03d5:	e8 00 00 00 00       	call   2df03da <awg_generate_instr+0xaa>	2df03d6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00aa  2df03da:	eb 27                	jmp    2df0403 <awg_generate_instr+0xd3>
00ac  2df03dc:	e8 00 00 00 00       	call   2df03e1 <awg_generate_instr+0xb1>	2df03dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b1  2df03e1:	eb 20                	jmp    2df0403 <awg_generate_instr+0xd3>
00b3  2df03e3:	49 ff ce             	dec    %r14
00b6  2df03e6:	0f 84 b6 00 00 00    	je     2df04a2 <awg_generate_instr+0x172>
00bc  2df03ec:	e8 00 00 00 00       	call   2df03f1 <awg_generate_instr+0xc1>	2df03ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c1  2df03f1:	44 89 f3             	mov    %r14d,%ebx
00c4  2df03f4:	31 c0                	xor    %eax,%eax
00c6  2df03f6:	41 bc 03 00 00 00    	mov    $0x3,%r12d
00cc  2df03fc:	eb 1c                	jmp    2df041a <awg_generate_instr+0xea>
00ce  2df03fe:	e8 00 00 00 00       	call   2df0403 <awg_generate_instr+0xd3>	2df03ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00d3  2df0403:	41 0f b6 de          	movzbl %r14b,%ebx
00d7  2df0407:	eb 1b                	jmp    2df0424 <awg_generate_instr+0xf4>
00d9  2df0409:	e8 00 00 00 00       	call   2df040e <awg_generate_instr+0xde>	2df040a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00de  2df040e:	eb 05                	jmp    2df0415 <awg_generate_instr+0xe5>
00e0  2df0410:	e8 00 00 00 00       	call   2df0415 <awg_generate_instr+0xe5>	2df0411: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e5  2df0415:	44 89 f3             	mov    %r14d,%ebx
00e8  2df0418:	31 c0                	xor    %eax,%eax
00ea  2df041a:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
00f0  2df0420:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
00f4  2df0424:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
00f8  2df0428:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00fd  2df042d:	4c 8b 7d b0          	mov    -0x50(%rbp),%r15
0101  2df0431:	74 08                	je     2df043b <awg_generate_instr+0x10b>
0103  2df0433:	4c 89 ff             	mov    %r15,%rdi
0106  2df0436:	e8 00 00 00 00       	call   2df043b <awg_generate_instr+0x10b>	2df0437: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
010b  2df043b:	45 0f b6 ed          	movzbl %r13b,%r13d
010f  2df043f:	41 c1 e5 02          	shl    $0x2,%r13d
0113  2df0443:	4d 03 2f             	add    (%r15),%r13
0116  2df0446:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0120  2df0450:	4c 89 e8             	mov    %r13,%rax
0123  2df0453:	48 c1 e8 03          	shr    $0x3,%rax
0127  2df0457:	42 8a 04 38          	mov    (%rax,%r15,1),%al
012b  2df045b:	84 c0                	test   %al,%al
012d  2df045d:	75 55                	jne    2df04b4 <awg_generate_instr+0x184>
012f  2df045f:	44 89 e0             	mov    %r12d,%eax
0132  2df0462:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
0136  2df0466:	c1 e0 0a             	shl    $0xa,%eax
0139  2df0469:	01 d9                	add    %ebx,%ecx
013b  2df046b:	09 c1                	or     %eax,%ecx
013d  2df046d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
0141  2df0471:	81 e1 ff 3f 00 00    	and    $0x3fff,%ecx
0147  2df0477:	41 89 4d 00          	mov    %ecx,0x0(%r13)
014b  2df047b:	42 8a 04 38          	mov    (%rax,%r15,1),%al
014f  2df047f:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
0153  2df0483:	84 c0                	test   %al,%al
0155  2df0485:	75 44                	jne    2df04cb <awg_generate_instr+0x19b>
0157  2df0487:	45 8a 2f             	mov    (%r15),%r13b
015a  2df048a:	49 29 de             	sub    %rbx,%r14
015d  2df048d:	41 fe c5             	inc    %r13b
0160  2df0490:	4d 85 f6             	test   %r14,%r14
0163  2df0493:	45 88 2f             	mov    %r13b,(%r15)
0166  2df0496:	7e 66                	jle    2df04fe <awg_generate_instr+0x1ce>
0168  2df0498:	e8 00 00 00 00       	call   2df049d <awg_generate_instr+0x16d>	2df0499: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
016d  2df049d:	e9 02 ff ff ff       	jmp    2df03a4 <awg_generate_instr+0x74>
0172  2df04a2:	e8 00 00 00 00       	call   2df04a7 <awg_generate_instr+0x177>	2df04a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0177  2df04a7:	31 db                	xor    %ebx,%ebx
0179  2df04a9:	45 31 e4             	xor    %r12d,%r12d
017c  2df04ac:	45 31 f6             	xor    %r14d,%r14d
017f  2df04af:	e9 70 ff ff ff       	jmp    2df0424 <awg_generate_instr+0xf4>
0184  2df04b4:	44 89 e9             	mov    %r13d,%ecx
0187  2df04b7:	80 e1 07             	and    $0x7,%cl
018a  2df04ba:	80 c1 03             	add    $0x3,%cl
018d  2df04bd:	38 c1                	cmp    %al,%cl
018f  2df04bf:	7c 9e                	jl     2df045f <awg_generate_instr+0x12f>
0191  2df04c1:	4c 89 ef             	mov    %r13,%rdi
0194  2df04c4:	e8 00 00 00 00       	call   2df04c9 <awg_generate_instr+0x199>	2df04c5: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0199  2df04c9:	eb 94                	jmp    2df045f <awg_generate_instr+0x12f>
019b  2df04cb:	44 89 f9             	mov    %r15d,%ecx
019e  2df04ce:	80 e1 07             	and    $0x7,%cl
01a1  2df04d1:	38 c1                	cmp    %al,%cl
01a3  2df04d3:	7c b2                	jl     2df0487 <awg_generate_instr+0x157>
01a5  2df04d5:	4c 89 ff             	mov    %r15,%rdi
01a8  2df04d8:	e8 00 00 00 00       	call   2df04dd <awg_generate_instr+0x1ad>	2df04d9: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01ad  2df04dd:	eb a8                	jmp    2df0487 <awg_generate_instr+0x157>
01af  2df04df:	e8 00 00 00 00       	call   2df04e4 <awg_generate_instr+0x1b4>	2df04e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b4  2df04e4:	eb 1d                	jmp    2df0503 <awg_generate_instr+0x1d3>
01b6  2df04e6:	e8 00 00 00 00       	call   2df04eb <awg_generate_instr+0x1bb>	2df04e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bb  2df04eb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	2df04ee: R_X86_64_32S	.rodata+0x1262640
01c2  2df04f2:	e8 00 00 00 00       	call   2df04f7 <awg_generate_instr+0x1c7>	2df04f3: R_X86_64_PLT32	__drm_err-0x4
01c7  2df04f7:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
01cc  2df04fc:	eb 07                	jmp    2df0505 <awg_generate_instr+0x1d5>
01ce  2df04fe:	e8 00 00 00 00       	call   2df0503 <awg_generate_instr+0x1d3>	2df04ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d3  2df0503:	31 c0                	xor    %eax,%eax
01d5  2df0505:	48 8d 64 24 28       	lea    0x28(%rsp),%rsp
01da  2df050a:	5b                   	pop    %rbx
01db  2df050b:	41 5c                	pop    %r12
01dd  2df050d:	41 5d                	pop    %r13
01df  2df050f:	41 5e                	pop    %r14
01e1  2df0511:	41 5f                	pop    %r15
01e3  2df0513:	5d                   	pop    %rbp
01e4  2df0514:	c3                   	ret
01e5  2df0515:	cc                   	int3
01e6  2df0516:	44 89 f9             	mov    %r15d,%ecx
01e9  2df0519:	80 e1 07             	and    $0x7,%cl
01ec  2df051c:	38 c1                	cmp    %al,%cl
01ee  2df051e:	0f 8c 65 fe ff ff    	jl     2df0389 <awg_generate_instr+0x59>
01f4  2df0524:	4c 89 ff             	mov    %r15,%rdi
01f7  2df0527:	e8 00 00 00 00       	call   2df052c <awg_generate_instr+0x1fc>	2df0528: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
01fc  2df052c:	e9 58 fe ff ff       	jmp    2df0389 <awg_generate_instr+0x59>
0201  2df0531:	cc                   	int3
0202  2df0532:	cc                   	int3
0203  2df0533:	cc                   	int3
0204  2df0534:	cc                   	int3
0205  2df0535:	cc                   	int3
0206  2df0536:	cc                   	int3
0207  2df0537:	cc                   	int3
0208  2df0538:	cc                   	int3
0209  2df0539:	cc                   	int3
020a  2df053a:	cc                   	int3
020b  2df053b:	cc                   	int3
020c  2df053c:	cc                   	int3
020d  2df053d:	cc                   	int3
020e  2df053e:	cc                   	int3
020f  2df053f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
