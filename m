Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2EE11197;
	Sat,  3 Feb 2024 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706940356; cv=none; b=HaGdwPjp9eO7VZZXG8vCzfoL33wDujLlTlNe64Lukt1FlAvyFm6Iv4bUB7TbVCiMalJN6TyhTT0dTfAjgVsnLc+yZ1SA9S2e7goTtd7kVh4f0UjQ9e4rWh3/OUmfcrlGWRK9hM5Mpq7LGXm1od/dCJaJkdrfPAGQamxOHTUwFhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706940356; c=relaxed/simple;
	bh=YDL7yOWZbGjik/I8szOuQPN0WMjv8QnkMxyufkwqeMk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=th77M3f9ijby+Z5UTtut3Dk2YnyGzXbdMpOhUxWlX1MshB3bdihRJ6SLj6Im7w/KEHjJP/uDa51FdBldJtn9nR0nhJ8FUG+1iggQ2vOGzGyqdY/QVLYs+BESKPapzhwEyBoQuho+evzUhX0x0wXmYxgjBEK/WEq2M1Idfqqtt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0CI6kfI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0CI6kfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706940355; x=1738476355;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YDL7yOWZbGjik/I8szOuQPN0WMjv8QnkMxyufkwqeMk=;
  b=K0CI6kfIG9fm4p7c0Ef/Gxa4YTCIzlxNecRMTbP+0O7USylcRF01h7Ga
   wdkR3JduNm32RnQ6iUtImW3pyYgx42uSXZzE+Je1MFwmhKPk1vbH4h/Ca
   Cq/gEL5t6K9UDC43gCb5uGG16l7eM+IXLAg34zpdH2MSmACgTATbyocst
   1CM9KbiadXkZW5yfzxka6l/230CRMOXLZIi9/vKckvqSje7UQCzZheJa2
   +XU1OC9ZwRPNpYwTXTEIsi23YK2OE66TA1jg1BRNdrSuwXAICx1bCj/G7
   ynacToj400RSqUFX751hWgK3r2OvP3BZnrDA1YIZiq3vzyOYJ56SRV4uD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4103524"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4103524"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 22:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4869602"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2024 22:05:54 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW99x-0004gt-0l;
	Sat, 03 Feb 2024 06:05:50 +0000
Date: Sat, 3 Feb 2024 14:04:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v4 15/21] vmlinux.o: warning: objtool:
 sme_encrypt_execute+0x4c: call to {dynamic}() leaves .noinstr.text section
Message-ID: <202402031425.J9aePiK0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v4
head:   a2c57e6c70798f62230ccdc90e6a5fd6799489ea
commit: 92e20e4db8ff97fc7d34865d4e1422d63a11beeb [15/21] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402031425.J9aePiK0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031425.J9aePiK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031425.J9aePiK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sme_encrypt_execute+0x4c: call to {dynamic}() leaves .noinstr.text section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x46: relocation to !ENDBR: .text+0x164d78


objdump-func vmlinux.o sme_encrypt_execute:
0000 0000000000002380 <sme_encrypt_execute>:
0000     2380:	f3 0f 1e fa          	endbr64
0004     2384:	55                   	push   %rbp
0005     2385:	48 89 e5             	mov    %rsp,%rbp
0008     2388:	48 89 c8             	mov    %rcx,%rax
000b     238b:	48 8d a0 00 10 00 00 	lea    0x1000(%rax),%rsp
0012     2392:	48 05 00 10 00 00    	add    $0x1000,%rax
0018     2398:	41 54                	push   %r12
001a     239a:	49 89 fa             	mov    %rdi,%r10
001d     239d:	49 89 f3             	mov    %rsi,%r11
0020     23a0:	49 89 d4             	mov    %rdx,%r12
0023     23a3:	48 89 c7             	mov    %rax,%rdi
0026     23a6:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 23ad <sme_encrypt_execute+0x2d>	23a9: R_X86_64_PC32	__enc_copy-0x4
002d     23ad:	48 c7 c1 87 00 00 00 	mov    $0x87,%rcx
0034     23b4:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
0036     23b6:	4c 89 d7             	mov    %r10,%rdi
0039     23b9:	4c 89 de             	mov    %r11,%rsi
003c     23bc:	4c 89 c2             	mov    %r8,%rdx
003f     23bf:	4c 89 e1             	mov    %r12,%rcx
0042     23c2:	49 89 c0             	mov    %rax,%r8
0045     23c5:	49 81 c0 00 10 00 00 	add    $0x1000,%r8
004c     23cc:	ff d0                	call   *%rax
004e     23ce:	41 5c                	pop    %r12
0050     23d0:	48 89 ec             	mov    %rbp,%rsp
0053     23d3:	5d                   	pop    %rbp
0054     23d4:	c3                   	ret
0055     23d5:	cc                   	int3
0056     23d6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0060     23e0:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
006a     23ea:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
0074     23f4:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
007e     23fe:	66 90                	xchg   %ax,%ax
0080     2400:	90                   	nop
0081     2401:	90                   	nop
0082     2402:	90                   	nop
0083     2403:	90                   	nop
0084     2404:	90                   	nop
0085     2405:	90                   	nop
0086     2406:	90                   	nop
0087     2407:	90                   	nop
0088     2408:	90                   	nop
0089     2409:	90                   	nop
008a     240a:	90                   	nop
008b     240b:	90                   	nop
008c     240c:	90                   	nop
008d     240d:	90                   	nop
008e     240e:	90                   	nop
008f     240f:	90                   	nop
0090     2410:	90                   	nop
0091     2411:	90                   	nop
0092     2412:	90                   	nop
0093     2413:	90                   	nop
0094     2414:	90                   	nop
0095     2415:	90                   	nop
0096     2416:	90                   	nop
0097     2417:	90                   	nop
0098     2418:	90                   	nop
0099     2419:	90                   	nop
009a     241a:	90                   	nop
009b     241b:	90                   	nop
009c     241c:	90                   	nop
009d     241d:	90                   	nop
009e     241e:	90                   	nop
009f     241f:	90                   	nop
00a0     2420:	90                   	nop
00a1     2421:	90                   	nop
00a2     2422:	90                   	nop
00a3     2423:	90                   	nop
00a4     2424:	90                   	nop
00a5     2425:	90                   	nop
00a6     2426:	90                   	nop
00a7     2427:	90                   	nop
00a8     2428:	90                   	nop
00a9     2429:	90                   	nop
00aa     242a:	90                   	nop
00ab     242b:	90                   	nop
00ac     242c:	90                   	nop
00ad     242d:	90                   	nop
00ae     242e:	90                   	nop
00af     242f:	90                   	nop
00b0     2430:	90                   	nop
00b1     2431:	90                   	nop
00b2     2432:	90                   	nop
00b3     2433:	90                   	nop
00b4     2434:	90                   	nop
00b5     2435:	90                   	nop
00b6     2436:	90                   	nop
00b7     2437:	90                   	nop
00b8     2438:	90                   	nop
00b9     2439:	90                   	nop
00ba     243a:	90                   	nop
00bb     243b:	90                   	nop
00bc     243c:	90                   	nop
00bd     243d:	90                   	nop
00be     243e:	90                   	nop
00bf     243f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
