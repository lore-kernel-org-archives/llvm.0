Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9856FD0;
	Thu, 11 Apr 2024 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712799844; cv=none; b=mL6YCxdXl+iXoMiWxPlItGEw1afgZ2kjd4D/yLIv7nzyPm0ku7712dDu5/lcuSa71VX1ObaSif178UR64gcqypOt2rYXA2vJiFrFc6/VqYUG/aBkyRvE/LVs/9fVYQB5RAfFY5PufzEa2Jhbx6KHyeb67aSDrP9jzbX0ScXpoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712799844; c=relaxed/simple;
	bh=YGDK9EDGc2WnGgr6WiFP5eoLjOA/OfjzXJEKajod5uo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hyWYkcopvovNE/2UztqX+VKAWzNz1oszzsRQgNiGULnMZA0ezorcE/jyxubtc5UX1Ej01OGjqau2MdceGEhjWOgil/v+Jv/+gBPE6EibfBW3Uip65eju0oX+JIpBG2vBH02eqWsB+7ZM3Vz+X/RlsA3YLA74Q7lxesApcQgsr4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVFaDdv6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVFaDdv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712799842; x=1744335842;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YGDK9EDGc2WnGgr6WiFP5eoLjOA/OfjzXJEKajod5uo=;
  b=bVFaDdv68PUOqmY7r+PFeZyTTmq8HBP7eTPfOOvgkos+YSy/qaMsjoJp
   B7ImCTWuMlJ6IUKhVWkGMC1fjo6xSoLLC0SgP0O9eCUDGE3v9FiRjhHx+
   m2pxvQJnocS3nvYlldzxLij7DEJYithkOtKsJoFdguk8hPsBTR8dLMEDD
   X93xvyHpmkVhE1JjJC9naxQNohHgNr6LOha2mFBpzKmN99sbqqT8NkL9d
   OuCOK3JEsAgyFEx9nDkIolewz2N4dUPywlVKZBlStgh1NGuAnYH7tx+uR
   t2S84bwfwbfaRhIKbbiVLDXhBZ7eiupWXbqTUUdvsRaCasqiAZiQenDg0
   w==;
X-CSE-ConnectionGUID: aLqCO7+UThij7bvvbbGQPQ==
X-CSE-MsgGUID: 6FcXpACSTg214bx7uAM88Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25705680"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25705680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 18:44:01 -0700
X-CSE-ConnectionGUID: o6OMziw2TBm2hkK5ZT8NWA==
X-CSE-MsgGUID: J2qVdZPwSLmY56dlycnvyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="21248536"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 18:44:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rujTq-00086U-0U;
	Thu, 11 Apr 2024 01:43:58 +0000
Date: Thu, 11 Apr 2024 09:43:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH v6 07/11] x86/tsc: Remove art to tsc
 conversion functions which are obsolete
Message-ID: <202404110930.vSR8Czqg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240410114828.25581-8-lakshmi.sowjanya.d@intel.com>
References: <20240410114828.25581-8-lakshmi.sowjanya.d@intel.com>
TO: lakshmi.sowjanya.d@intel.com
TO: tglx@linutronix.de
TO: jstultz@google.com
TO: giometti@enneenne.com
TO: corbet@lwn.net
TO: linux-kernel@vger.kernel.org
CC: christopher.s.hall@intel.com
CC: subramanian.mohan@intel.com
CC: lakshmi.sowjanya.d@intel.com
CC: linux-doc@vger.kernel.org
CC: netdev@vger.kernel.org
CC: pandith.n@intel.com
CC: x86@kernel.org
CC: eddie.dong@intel.com
CC: linux-sound@vger.kernel.org
CC: alexandre.torgue@foss.st.com
CC: peter.hilber@opensynergy.com
CC: joabreu@synopsys.com
CC: intel-wired-lan@lists.osuosl.org
CC: mcoquelin.stm32@gmail.com
CC: thejesh.reddy.t.r@intel.com
CC: perex@perex.cz
CC: anthony.l.nguyen@intel.com
CC: andriy.shevchenko@linux.intel.com
CC: davem@davemloft.net

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on tnguy-next-queue/dev-queue tnguy-net-queue/dev-queue linus/master v6.9-rc3 next-20240410]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lakshmi-sowjanya-d-intel-com/x86-tsc-Add-base-clock-properties-in-clocksource-structure/20240410-195144
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20240410114828.25581-8-lakshmi.sowjanya.d%40intel.com
patch subject: [Intel-wired-lan] [PATCH v6 07/11] x86/tsc: Remove art to tsc conversion functions which are obsolete
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240411/202404110930.vSR8Czqg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110930.vSR8Czqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110930.vSR8Czqg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !ENDBR: .text+0x68f69


objdump-func vmlinux.o set_ftrace_ops_ro:
0000 0000000000067580 <set_ftrace_ops_ro>:
0000    67580:	f3 0f 1e fa          	endbr64
0004    67584:	41 57                	push   %r15
0006    67586:	41 56                	push   %r14
0008    67588:	41 54                	push   %r12
000a    6758a:	53                   	push   %rbx
000b    6758b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 67592 <set_ftrace_ops_ro+0x12>	6758e: R_X86_64_PC32	ftrace_ops_list-0x4
0012    67592:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	67595: R_X86_64_32S	ftrace_list_end
0019    67599:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6759c: R_X86_64_32S	ftrace_regs_caller
0020    675a0:	48 f7 d8             	neg    %rax
0023    675a3:	4c 8d 3c 05 00 00 00 00 	lea    0x0(,%rax,1),%r15	675a7: R_X86_64_32S	ftrace_regs_caller_end+0x100c
002b    675ab:	49 c1 ef 0c          	shr    $0xc,%r15
002f    675af:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	675b2: R_X86_64_32S	ftrace_caller
0036    675b6:	48 f7 d8             	neg    %rax
0039    675b9:	4c 8d 24 05 00 00 00 00 	lea    0x0(,%rax,1),%r12	675bd: R_X86_64_32S	ftrace_caller_end+0x100c
0041    675c1:	49 c1 ec 0c          	shr    $0xc,%r12
0045    675c5:	48 8b 43 10          	mov    0x10(%rbx),%rax
0049    675c9:	0f ba e0 0b          	bt     $0xb,%eax
004d    675cd:	73 15                	jae    675e4 <set_ftrace_ops_ro+0x64>
004f    675cf:	a8 04                	test   $0x4,%al
0051    675d1:	48 8b bb 90 00 00 00 	mov    0x90(%rbx),%rdi
0058    675d8:	44 89 fe             	mov    %r15d,%esi
005b    675db:	41 0f 44 f4          	cmove  %r12d,%esi
005f    675df:	e8 00 00 00 00       	call   675e4 <set_ftrace_ops_ro+0x64>	675e0: R_X86_64_PLT32	set_memory_ro-0x4
0064    675e4:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
0068    675e8:	48 85 db             	test   %rbx,%rbx
006b    675eb:	74 05                	je     675f2 <set_ftrace_ops_ro+0x72>
006d    675ed:	4c 39 f3             	cmp    %r14,%rbx
0070    675f0:	75 d3                	jne    675c5 <set_ftrace_ops_ro+0x45>
0072    675f2:	5b                   	pop    %rbx
0073    675f3:	41 5c                	pop    %r12
0075    675f5:	41 5e                	pop    %r14
0077    675f7:	41 5f                	pop    %r15
0079    675f9:	2e e9 00 00 00 00    	cs jmp 675ff <set_ftrace_ops_ro+0x7f>	675fb: R_X86_64_PLT32	__x86_return_thunk-0x4
007f    675ff:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
