Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17DCA6F;
	Wed, 18 Jun 2025 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750206637; cv=none; b=jCZZv1UU3TG+AqoMn6sfSG0xoFspJU7d1B/VoadCC0fH6enJb0OMVX2BMig1TXlnxBtQrD/Gx9wb2eJfF2GFiHbRy3hM1QMbWyBc9mxjlidUrzfD/5KZzFJNHM4apnDt048Ju46kriKBFcXqhbqc01TH6sXnLYdu58LsG3KVqmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750206637; c=relaxed/simple;
	bh=CxumDiABUzrnXC11v0GiG+38lkWawLs8vLhulVzojiw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVsjQ2T8bkfYaRSPEY7ZvO+HtUU8LgT7p+vNK8+i6BJaZqtUnVteoLGqi4aGMUBe8mEgIW8bpcXLwA1ltWcmyEbN9JrvR9v8NWdIianCjC3cnTPeNDGigG3s0QXkYabkpQStZAvPuxv54pKE5KUcFrus7nT2bzKSNHlrGmY2SUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G00OAWL+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G00OAWL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750206636; x=1781742636;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CxumDiABUzrnXC11v0GiG+38lkWawLs8vLhulVzojiw=;
  b=G00OAWL+e0fUi4D2HhlUf3GDtoIkLaWna2PACTVtK73i7VoiS60EqgPO
   Dohb+g9+2GkmcJuyWTyxIn9VMNCGDhKuawM9g6QRVmafVNWYadm2QfnNN
   4GtQ0hgsz3hqW343n2TnDdAU8+0k5RjtIQMFDXHniibKq7J2TRqb4Ygdy
   VfmuyT7kFcw9Hsxwt+dhx4J4Tam/bBXflO1LVynswBh8i/r3tLNbpZUab
   BxbCIfnTxZkFpRYPwJde8sr2AhwZwZ0WUPh1FIHseO3zkqBgL+9tC+gGA
   H+TWccwIma+QOlPwU6mHxWnY8RYZ/+R3YTAnhUmpNAPEUX1ttfeF1G+CW
   Q==;
X-CSE-ConnectionGUID: gNuBtHHiTI6ciSqpg658xA==
X-CSE-MsgGUID: i//Jw7VPSGKf19WOMTeFrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52270902"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52270902"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:30:36 -0700
X-CSE-ConnectionGUID: en+T2zfpSJm2bbmLCrTX/Q==
X-CSE-MsgGUID: shAAM/WARi6pKALpFuBRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="149571676"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 17:30:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRghE-000JFC-0o;
	Wed, 18 Jun 2025 00:30:32 +0000
Date: Wed, 18 Jun 2025 08:30:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <202506180813.XldQ0K9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
References: <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
TO: Michal Gorlas <michal.gorlas@9elements.com>
TO: "Tzung-Bi Shih" <tzungbi@kernel.org>
TO: Brian Norris <briannorris@chromium.org>
TO: Julius Werner <jwerner@chromium.org>
CC: linux-kernel@vger.kernel.org
CC: chrome-platform@lists.linux.dev
CC: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
CC: Michal Gorlas <michal.gorlas@9elements.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Gorlas/firmware-coreboot-support-for-parsing-SMM-related-informations-from-coreboot-tables/20250616-220336
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250616-coreboot-payload-mm-v2-2-5d679b682e13%409elements.com
patch subject: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI handler
config: i386-randconfig-012-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180813.XldQ0K9E-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180813.XldQ0K9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180813.XldQ0K9E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/google/mm_loader.c:38:15: error: inline assembly requires more registers than available
      38 |         asm volatile("movq      %[cmd], %%rax\n\t"
         |                      ^
>> drivers/firmware/google/mm_loader.c:38:15: error: register %rax is only available in 64-bit mode
   <inline asm>:1:13: note: instantiated into assembly here
       1 |         movq    %eax, %rax
         |                       ^~~~
   drivers/firmware/google/mm_loader.c:38:36: error: register %rax is only available in 64-bit mode
      38 |         asm volatile("movq      %[cmd], %%rax\n\t"
         |                                                ^
   <inline asm>:2:7: note: instantiated into assembly here
       2 |         movq    %rax, %rcx
         |                 ^~~~~
>> drivers/firmware/google/mm_loader.c:39:28: error: register %rbx is only available in 64-bit mode
      39 |                      "movq      %%rax, %%rcx\n\t"
         |                                               ^
   <inline asm>:3:13: note: instantiated into assembly here
       3 |         movq    %eax, %rbx
         |                       ^~~~
>> drivers/firmware/google/mm_loader.c:40:29: error: register %r8 is only available in 64-bit mode
      40 |                      "movq      %[arg], %%rbx\n\t"
         |                                                ^
   <inline asm>:4:13: note: instantiated into assembly here
       4 |         movq    %ecx, %r8
         |                       ^~~
>> drivers/firmware/google/mm_loader.c:44:26: error: register %rcx is only available in 64-bit mode
      44 |                      "outb      %%al, %%dx\n\t"
         |                                             ^
   <inline asm>:8:7: note: instantiated into assembly here
       8 |         cmpq    %rcx, %rax
         |                 ^~~~~
   drivers/firmware/google/mm_loader.c:46:30: error: register %rcx is only available in 64-bit mode
      46 |                      "jne       .return_changed\n\t"
         |                                                  ^
   <inline asm>:10:8: note: instantiated into assembly here
      10 |         pushq   %rcx
         |                 ^~~~
   drivers/firmware/google/mm_loader.c:47:22: error: register %rcx is only available in 64-bit mode
      47 |                      "pushq     %%rcx\n\t"
         |                                        ^
   <inline asm>:11:15: note: instantiated into assembly here
      11 |         movq    $10000, %rcx
         |                         ^~~~
   drivers/firmware/google/mm_loader.c:49:18: error: register %rcx is only available in 64-bit mode
      49 |                      "rep       nop\n\t"
         |                                      ^
   <inline asm>:13:7: note: instantiated into assembly here
      13 |         popq    %rcx
         |                 ^~~~
   drivers/firmware/google/mm_loader.c:50:21: error: register %r8 is only available in 64-bit mode
      50 |                      "popq      %%rcx\n\t"
         |                                        ^
   <inline asm>:14:11: note: instantiated into assembly here
      14 |         cmpq    $0, %r8
         |                     ^~~
   drivers/firmware/google/mm_loader.c:52:33: error: register %r8 is only available in 64-bit mode
      52 |                      "je        .return_not_changed\n\t"
         |                                                      ^
   <inline asm>:16:7: note: instantiated into assembly here
      16 |         decq    %r8
         |                 ^~~
   drivers/firmware/google/mm_loader.c:55:27: error: register %rax is only available in 64-bit mode
      55 |                      ".return_changed:\n\t"
         |                                         ^
   <inline asm>:19:7: note: instantiated into assembly here
      19 |         movq    %rax, %eax
         |                 ^~~~~
   drivers/firmware/google/mm_loader.c:58:31: error: register %rcx is only available in 64-bit mode
      58 |                      ".return_not_changed:\n\t"
         |                                             ^
   <inline asm>:22:7: note: instantiated into assembly here
      22 |         movq    %rcx, %eax
         |                 ^~~~~
   13 errors generated.


vim +38 drivers/firmware/google/mm_loader.c

    27	
    28	/*
    29	 * This is x86_64 specific, assuming that we want this to also work on i386,
    30	 * we either need to have "trigger_smi32" bounded by preprocessor guards(?)
    31	 * or mm_loader32 and then mm_loader$(BITS) in Makefile(?).
    32	 */
    33	static int trigger_smi(u64 cmd, u64 arg, u64 retry)
    34	{
    35		u64 status;
    36		u16 apmc_port = 0xb2;
    37	
  > 38		asm volatile("movq	%[cmd], %%rax\n\t"
  > 39			     "movq	%%rax, %%rcx\n\t"
  > 40			     "movq	%[arg], %%rbx\n\t"
    41			     "movq	%[retry], %%r8\n\t"
    42			     ".trigger:\n\t"
    43			     "mov	%[apmc_port], %%dx\n\t"
  > 44			     "outb	%%al, %%dx\n\t"
    45			     "cmpq	%%rcx, %%rax\n\t"
    46			     "jne	.return_changed\n\t"
    47			     "pushq	%%rcx\n\t"
    48			     "movq	$10000, %%rcx\n\t"
    49			     "rep	nop\n\t"
    50			     "popq	%%rcx\n\t"
    51			     "cmpq	$0, %%r8\n\t"
    52			     "je	.return_not_changed\n\t"
    53			     "decq	%%r8\n\t"
    54			     "jmp	.trigger\n\t"
    55			     ".return_changed:\n\t"
    56			     "movq	%%rax, %[status]\n\t"
    57			     "jmp	.end\n\t"
    58			     ".return_not_changed:\n\t"
    59			     "movq	%%rcx, %[status]\n\t"
    60			     ".end:\n\t"
    61			     : [status] "=r"(status)
    62			     : [cmd] "r"(cmd), [arg] "r"(arg), [retry] "r"(retry),
    63			       [apmc_port] "r"(apmc_port)
    64			     : "%rax", "%rbx", "%rdx", "%rcx", "%r8");
    65	
    66		if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
    67			status = PAYLOAD_MM_RET_FAILURE;
    68		else
    69			status = PAYLOAD_MM_RET_SUCCESS;
    70	
    71		return status;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
