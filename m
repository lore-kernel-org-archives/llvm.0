Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095793;
	b=SBW9GkZ7MxlmHHd7N+YPYq7lIQ/+fRNKjQKeHdF6bu+jNw3KcRiCH7fwOv9/gKHvDP7o
	 MIH7q4C0O66R7yvsiItxpNnja2L+Mv55MgsSLdClD9dyPCX+f2bBaKa94nFWkmb1mF/jI
	 xWgS3Q4HZd7jiTTo62Mt/mU67yVJwjaDprRd1WNUQAb93Upfbl4ajWxGWd8b3CO6VeKV9
	 p0SMpm8+Yce+1ZHR5VEX6G6YwgxGN7igrXq1V69OJ9LwYF82KM8FE9ED2weLXwA0gxoKj
	 YJgZi+dR2y04Oc1NSRcg4dfG7y7oneyYsvph598SM5wahnPfKnJJ+h2EWhYNH7GExTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095793;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=h8ENibmIFki4VGKF3LZNT00zbW3vGGJjBzXkJFPQYIM=;
	b=Nr7PeMVLjGZUYH6tTzNResogLnqerKNBCEMb6GR1FBHufg3xD2j5VpDsmBcEdQM7a71e
	 LV3KdbctV55GzmjnaJsEdfKHwBGSkYjAaNLnjfdbfLjYLeb0AlDbm1D69XbpG1pDvnA1g
	 JeKVedLHTSjlPKxUmocsnsCvHbN2UlYxg1SLL2KO137G47dw40W/6CM32T2A2Y88Mu8X6
	 Q9tOd/wfXrkS/MvXXkIUgC3+txnAQtNAIPRYtUrUxfumpW1lLqdESlBC4PMcjbF0rV+ON
	 jl7Q9CnkpEfqVuIc5IBamcCIpLeSvHFV82PBKd0iLJp773YM1X7on5SUsXtkT10OMgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2tho6SN;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F65606A31B;
	Tue, 27 Oct 2026 10:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F65606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2tho6SN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095794; x=1824631794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TPETQnYxAC5OM2l73sWPjeuHD6cHSvfGUmQvfnhKiBM=;
  b=C2tho6SNKSiTStD1F8UBPdofFndb+Giw/RZKqJ/ysUrKolwmtwaYbPex
   s5AHouO8nq+ibR7zvB+i4QuSKgmd8KfPb2py92cUTqB+g/iguGtq/z+q2
   PnQG8hKmhiUd+CXQfq/wE4b+bY/txyi6ya68jAr4nqGsrnFxMCWcm1U6Y
   zreOTnpNp16sl69ou6jV26yNRpPndiFcydSM3lREfzlw9qOhLIyD6DObF
   BGxErPPAaZqMY692wQIb/vv38u0if+o7nWYcPahgortD5ZkqQi/mlVzBK
   l4ZhSPT9C9r63ya1ECWiOVUsS5j09NOWN17eZFYtuuj6dIsIQuWcJza8S
   Q==;
X-CSE-ConnectionGUID: tsMxuaoxR8yG1s1j4JD1HQ==
X-CSE-MsgGUID: cARcdtQAQi6AWKd/UaDrgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1681719"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1681719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:09:53 -0700
X-CSE-ConnectionGUID: NVNl+TBZTOawIM0zJbkXOQ==
X-CSE-MsgGUID: OvyN5Zy4RWyzHsCHPAWS8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4898247"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2026 03:09:50 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLe7n-00000000X6K-1nkB;
	Tue, 27 Oct 2026 10:09:47 +0000
Date: Tue, 27 Oct 2026 18:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 4/4] s390/maccess: Remove spinlock from
 __s390_kernel_write()
Message-ID: <202610271725.YBK6zlkf-lkp@intel.com>
References: <20261026120329.1792436-5-hca@linux.ibm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120329.1792436-5-hca@linux.ibm.com>

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on trace/for-next bpf-next/master bpf/master linus/master v7.3 next-20261026]
[cannot apply to bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/s390-jump_label-Serialize-text-patching-with-text_mutex/20261026-130326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20261026120329.1792436-5-hca%40linux.ibm.com
patch subject: [PATCH 4/4] s390/maccess: Remove spinlock from __s390_kernel_write()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610271725.YBK6zlkf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271725.YBK6zlkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271725.YBK6zlkf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/maccess.c:9:
>> include/linux/text-patching.h:10:9: error: call to undeclared library function 'memcpy' with type 'void *(void *, const void *, __size_t)' (aka 'void *(void *, const void *, unsigned long)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      10 |         return memcpy(dst, src, len);
         |                ^
   include/linux/text-patching.h:10:9: note: include the header <string.h> or explicitly provide a declaration for 'memcpy'
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:7:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/mm/maccess.c:15:
   In file included from include/linux/cpu.h:17:


vim +10 include/linux/text-patching.h

0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23   6) 
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23   7) #ifndef text_poke_copy
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23   8) static inline void *text_poke_copy(void *dst, const void *src, size_t len)
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23   9) {
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23 @10) 	return memcpy(dst, src, len);
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23  11) }
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23  12) #define text_poke_copy text_poke_copy
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23  13) #endif
0c3beacf681ec8 Mike Rapoport (Microsoft  2024-10-23  14) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
