Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA5B13B5A6;
	Thu, 11 Apr 2024 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712809570; cv=none; b=qzNRXmHzGnJ7jfuV738DkD7T69VS7z3p9NxolDLxIxW/6kCmA0LLAC3Hi2TApvGyb0M52cpsUS6vGWEWwfTcbfJZzponfsEq7laSsnMs0gbMF+zgKB5/Vqdaumj3Q7lwLkdBpxJGly0UK3eUoyRbByU9RfVfvIQCjKCYhVU8+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712809570; c=relaxed/simple;
	bh=1TseMfNL3Av924ErNrA2ZA+DXVbPmpBf/pOqyGb3OlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F33CL2hd7Qdf8YHmU3X+261pfX+gpjSAasL3ZRJsWSwMuqTlfaeOn8/XT+bvt9Q7be8WwWcg1+ikxhYTGqSvgmZv/vCm3F5koff2wypcG13XbALZ0g5WLYM8m+PJPybtyQkl/BPp089gAu30OpJC958cNOh0Ksz6927Z0gRQbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbg3Ce1b; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbg3Ce1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712809568; x=1744345568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1TseMfNL3Av924ErNrA2ZA+DXVbPmpBf/pOqyGb3OlI=;
  b=Gbg3Ce1b18LGXdqvZWJkrJ1MdCsb/zmDDFZjza/yV/6/JqPevThharv4
   t3O3LhEQMSdeIuvxQXhsQWUwJH1PBpO/wpFAEF5DjRqtz1xJ9avcK1FZy
   fKWiGE+k8v+3k4ToaoBDzO10r18ka4U1oDK2H0JDKTZgeeE8vMkvpBn2S
   KjGdW3f/SBUfrg4xonMO3aOLVi6QGKC6bL4gl7dip4iD/mMYgbliOhFuI
   Iih3iTKRKFBvzwfB2VY9AqDY+8VahkN4DHWlGWBy4n2kNBCFnM6UwGaF3
   Bz0YiaP1RUjrvlj6y0pglHFe7BJHOuczD4kotbIJRlUmhIviKf8SupFpX
   Q==;
X-CSE-ConnectionGUID: iyHTsdEuT5mzcOB3DmxJ6A==
X-CSE-MsgGUID: 12kz6Cr9RyyxQZAbeb1wMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8310783"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8310783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:26:07 -0700
X-CSE-ConnectionGUID: 3WEaZcZ8TWermu8VkjYwtw==
X-CSE-MsgGUID: nQ1E6CO/RuqfKcWv6WEwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25546962"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Apr 2024 21:26:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rum0h-0008DQ-1Z;
	Thu, 11 Apr 2024 04:26:03 +0000
Date: Thu, 11 Apr 2024 12:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanhua Han <hanchuanhua@oppo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Barry Song <v-songbaohua@oppo.com>
Subject: [akpm-mm:mm-unstable 360/372] include/linux/swap.h:565:6: warning:
 no previous prototype for function 'swap_free_nr'
Message-ID: <202404111223.DDjEQDHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   de14d5f2a9ff2df737a01575ee95bc5a35f5853d
commit: ca23b4d4cae5d32a9d22fb3c39550dcf43df83f9 [360/372] mm: swap: introduce swap_free_nr() for batched swap_free()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404111223.DDjEQDHj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111223.DDjEQDHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111223.DDjEQDHj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
>> include/linux/swap.h:565:6: warning: no previous prototype for function 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^
   include/linux/swap.h:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         | ^
         | static 
   1 warning generated.
--
   In file included from arch/x86/kernel/reboot.c:33:
   In file included from arch/x86/include/asm/efi.h:7:
   In file included from arch/x86/include/asm/tlb.h:8:
   In file included from include/asm-generic/tlb.h:15:
>> include/linux/swap.h:565:6: warning: no previous prototype for function 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^
   include/linux/swap.h:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         | ^
         | static 
   arch/x86/kernel/reboot.c:972:20: warning: unused function 'nmi_shootdown_cpus_on_restart' [-Wunused-function]
     972 | static inline void nmi_shootdown_cpus_on_restart(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
>> include/linux/swap.h:565:6: warning: no previous prototype for function 'swap_free_nr' [-Wmissing-prototypes]
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         |      ^
   include/linux/swap.h:565:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     565 | void swap_free_nr(swp_entry_t entry, int nr_pages)
         | ^
         | static 
   1 warning generated.


vim +/swap_free_nr +565 include/linux/swap.h

   564	
 > 565	void swap_free_nr(swp_entry_t entry, int nr_pages)
   566	{
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
