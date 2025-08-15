Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF762F659D;
	Fri, 15 Aug 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252556; cv=none; b=RoJyCxic5yoa/owyFffiDsqucTX4RAHcqj9dJsUzkoyOtJvk2wreLzm/SpHmkr9SP1VgI/J9t3RbA/VggWEd86PyTyzEV1SJLxJs9OG8qJus2yRaZqLerMjA4972WQsvCZLeIxFQEjg96TzBVC+O5XcymcsVrVM9Xzi1oOTxoes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252556; c=relaxed/simple;
	bh=QYlDdduaMgfBrCrW40Ku6gKEFl3fJeLsf6RKdZGMQ2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I92/BOE6v1jeeuGaVNhR687/I8vjLHr94dKN9WG57p3pcFGeuDjWIYMsM09MEG9+fiGm40DSxvCVx8NGKUxvhC8kne7BXHbHzqN0XD4UgjtU3pK5rIRgGPCKN5SPn+hofHNtK0d+Muj+3tOHoON6b29XDsS8ZHfNUhwc8CLNlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FltKowcW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FltKowcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755252555; x=1786788555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QYlDdduaMgfBrCrW40Ku6gKEFl3fJeLsf6RKdZGMQ2c=;
  b=FltKowcWNvqZKO7h3n77P9joD80N+3SqWkAYaZVQjdzkVelB0MZRcK/P
   5LpWq8WVRjmI+FTsJTFY/cQL9xadU1FJFTSYkJ7sioExozViL9/aH9OUp
   Vwx28b8euLjUP7WyyV8JfAhYoxTnRClKeetRa6bE1DtBZL+qgiu+bZoSF
   fRqNNdCZznhSB6BsfX7H5LytPITEj2Lbs7wK0QG+mi+NMGfxrRp0p/IZ3
   C0+UcUshsWEOn6xWXkGYgPEi/ZLLqU5O0aKOyGKPLZMKbIDfJR78j/3Fi
   iU6a2dJGz6DK79p1HqoNLl8zPDCEZb0lGvmbM6POTJAMIAyZgKNaeZn8n
   g==;
X-CSE-ConnectionGUID: mO3tMmCrTN6LVMhw2W2SXg==
X-CSE-MsgGUID: Eb5Kv+cVQGKJBXmTP8bC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61208895"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61208895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:09:15 -0700
X-CSE-ConnectionGUID: mpBGE/ipS1KK+d2B+6q4EA==
X-CSE-MsgGUID: SZhZaxpVTAmT5ClKqnYCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171115255"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 03:09:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umrN1-000BqS-2d;
	Fri, 15 Aug 2025 10:09:11 +0000
Date: Fri, 15 Aug 2025 18:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 4/7] x86: ibs: In-kernel IBS driver for memory
 access profiling
Message-ID: <202508151720.OkJ7smVC-lkp@intel.com>
References: <20250814134826.154003-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814134826.154003-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc1]
[cannot apply to akpm-mm/mm-everything tip/x86/core tip/x86/mm next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250814-215419
base:   linus/master
patch link:    https://lore.kernel.org/r/20250814134826.154003-5-bharata%40amd.com
patch subject: [RFC PATCH v1 4/7] x86: ibs: In-kernel IBS driver for memory access profiling
config: i386-buildonly-randconfig-003-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151720.OkJ7smVC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151720.OkJ7smVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151720.OkJ7smVC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/ibs.c:198:19: warning: shift count >= width of type [-Wshift-count-overflow]
     198 |         if (laddr & (1UL << 63)) {
         |                          ^  ~~
>> arch/x86/mm/ibs.c:252:7: error: call to undeclared function 'setup_APIC_eilvt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         if (!setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_NMI, 0))
         |              ^
   arch/x86/mm/ibs.c:252:7: note: did you mean 'setup_APIC_ibs'?
   arch/x86/mm/ibs.c:244:13: note: 'setup_APIC_ibs' declared here
     244 | static void setup_APIC_ibs(void)
         |             ^
     245 | {
     246 |         int offset;
     247 | 
     248 |         offset = get_ibs_lvt_offset();
     249 |         if (offset < 0)
     250 |                 goto failed;
     251 | 
     252 |         if (!setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_NMI, 0))
         |              ~~~~~~~~~~~~~~~~
         |              setup_APIC_ibs
   arch/x86/mm/ibs.c:265:3: error: call to undeclared function 'setup_APIC_eilvt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     265 |                 setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_FIX, 1);
         |                 ^
   1 warning and 2 errors generated.


vim +/setup_APIC_eilvt +252 arch/x86/mm/ibs.c

   243	
   244	static void setup_APIC_ibs(void)
   245	{
   246		int offset;
   247	
   248		offset = get_ibs_lvt_offset();
   249		if (offset < 0)
   250			goto failed;
   251	
 > 252		if (!setup_APIC_eilvt(offset, 0, APIC_EILVT_MSG_NMI, 0))
   253			return;
   254	failed:
   255		pr_warn("IBS APIC setup failed on cpu #%d\n",
   256			smp_processor_id());
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
