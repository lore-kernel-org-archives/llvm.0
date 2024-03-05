Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44A12CD8B;
	Tue,  5 Mar 2024 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709679367; cv=none; b=FmBEh25O9VPVjqjRMjjeMEVM8fGhRD/JJgRlwsGJ0QGqzVOqHl/NFBWpOXVRzBR09+V/gHWXa0kdAOQ3tlb8eGzNkKhEub57d78hAKuqz3imaY/0I2s8sQjFXMQ/QD9PpZrlDYfz/Yai2PiEw+/rx9s7w29lSrvcZSj79mUD3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709679367; c=relaxed/simple;
	bh=3Ctn9kD2QS+q2E/Aa6YBNxfwaREc7XLGAVQqkAR6KSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cqbz0b8Q6QAF9Lqvpv+w+46jk6Or7ZNjFEUHsavQBOQr4rm0Dlaxs+60OLQpvV1xcTOn2YFNr5RhuIw3uTgRMBQg4A8k2pic0x1l7egZIXX71kjnCHhs0xC8YY2XtZ4/8Kj2AQyHV5ChJ0m/ls0SDH9taYnKVkldeZPChD0f3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8DwdDi+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8DwdDi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709679365; x=1741215365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ctn9kD2QS+q2E/Aa6YBNxfwaREc7XLGAVQqkAR6KSk=;
  b=E8DwdDi+Ohu4gdssMwg/2keJ+M2wPrxbT0B1wZIF1Ic1U9prijeANyoU
   lGoYZpVGinDg/Q4oeCQAcsePpqrOC+S6HGhnpeGPhQSzesLTD8eap6Xy/
   RQwDZ+W/To19jcdTMrZstTXtwWmPbHO2nLOO7C4KwGwMCmqnNEuOlP+lo
   Kt6B/SGQ5mJLtdYh2Y97e6YWaLFO1O4RBd9QeorbuqmEnneAV4JXpmKY9
   24KoPHAOvocGbJqhvQ5HlJPMBJ4LTaAcrdV0Y8lu46HGTro21dfuVp7/q
   qwBhOHt5k18YJu3XV1UeGtYOTHMFXqV7GJD7ZhDqS7BoQmjR9bPewlXGy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4420834"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4420834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 14:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14239179"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 14:56:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhdhY-0003j3-1P;
	Tue, 05 Mar 2024 22:56:00 +0000
Date: Wed, 6 Mar 2024 06:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>, Jens Axboe <axboe@kernel.dk>
Subject: [brauner-vfs:vfs.fixes 3/3] fs/coredump.c:948:58: warning: left
 operand of comma operator has no effect
Message-ID: <202403060645.TvSQBOwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   4630f2caafcd87230ec0503bf3e809fd5367a407
commit: dc12d343473e426a5a0f48bf5d472b5f19b08276 [3/3] coredump: get machine check errors early rather than during iov_iter
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240306/202403060645.TvSQBOwL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060645.TvSQBOwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060645.TvSQBOwL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/coredump.c:6:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/coredump.c:948:58: warning: left operand of comma operator has no effect [-Wunused-value]
     948 |                         int stop = !dump_emit_page(cprm, dump_page_copy(page, dump_page));
         |                                                                               ^~~~~~~~~
   fs/coredump.c:923:36: note: expanded from macro 'dump_page_copy'
     923 | #define dump_page_copy(src, dst) ((dst), (src))
         |                                    ^~~
   2 warnings generated.


vim +948 fs/coredump.c

   926	
   927	int dump_user_range(struct coredump_params *cprm, unsigned long start,
   928			    unsigned long len)
   929	{
   930		unsigned long addr;
   931		struct page *dump_page = dump_page_alloc();
   932	
   933		if (!dump_page)
   934			return 0;
   935	
   936		for (addr = start; addr < start + len; addr += PAGE_SIZE) {
   937			struct page *page;
   938	
   939			/*
   940			 * To avoid having to allocate page tables for virtual address
   941			 * ranges that have never been used yet, and also to make it
   942			 * easy to generate sparse core files, use a helper that returns
   943			 * NULL when encountering an empty page table entry that would
   944			 * otherwise have been filled with the zero page.
   945			 */
   946			page = get_dump_page(addr);
   947			if (page) {
 > 948				int stop = !dump_emit_page(cprm, dump_page_copy(page, dump_page));
   949				put_page(page);
   950				if (stop) {
   951					dump_page_free(dump_page);
   952					return 0;
   953				}
   954			} else {
   955				dump_skip(cprm, PAGE_SIZE);
   956			}
   957		}
   958		dump_page_free(dump_page);
   959		return 1;
   960	}
   961	#endif
   962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
