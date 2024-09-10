Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C347E282EA;
	Tue, 10 Sep 2024 03:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725937647; cv=none; b=qOtQIL37LiuxG7jlvK5xDSeRpdpXDVrnRoscafeSvTW6lq3+WNL/ShWy/bRfHUz4Hg/ugswRWFh4F+2h0dxHdzawf1PZ1iuUCUm3vGHU6wej6PTrYIz3Hb/Pgw76tLWf+1nJN24ISHYvKhjlmxXEYYsk+8UuHyTb6WjyYmkpqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725937647; c=relaxed/simple;
	bh=q8A/oaTKxO2g75EdYP84UySv3JNfHQYktwjxs6CJGjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MtfdbIt7EjaDY+R5MMx6dumT9LRZpppsJNanc44LieWTlDaXAesNSwVMyL90Mt/G5smXe/MxdN0pQjsSsUDqpyiqILJP7KtH587pzWASQsjm25gV4HH/6oyt7BJ5LDURBd4tsRuMQdELHy9JAg9e13wNF2RZB1B/voFWRkD5ZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1IeAlNn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1IeAlNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725937646; x=1757473646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8A/oaTKxO2g75EdYP84UySv3JNfHQYktwjxs6CJGjc=;
  b=G1IeAlNnaRUncxfp+VeCnvMgtiO2Wpx96oYOKUNxq8TjWnCg1wymK4k0
   IP6q3J/lAlxS8G284QYMhjtRKPp8u3SrUahvCfGYSaCMkG/nlT3bOuZWo
   cMdTfQumxuoMfxhM9gqjiKTbHFjFAMO5NOW2sGOQA2z+bvvAybShl7GHo
   FkociCkRoJuzaJ3vATOvbWYNV8kRWNJr9rOJRVZCPqzfj+1/bfryUBK1G
   T3HlIeK5AwZYdYb83YjWZS/tomm0Q78TzQP5bLkRGPVeIFgatz9edvxDJ
   gWCmUvFriNiGaVzFBFCzYbw+2LCUzuGaoYHZFL/WPqweZU4wirct4V3Ja
   g==;
X-CSE-ConnectionGUID: 06d0NVYeSfi+9tVQ9v2Dqw==
X-CSE-MsgGUID: IdYgCDVuRIyQFXSTIy4P6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24480244"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24480244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 20:07:23 -0700
X-CSE-ConnectionGUID: QxQdgMReTK+HXvy1PYOOCQ==
X-CSE-MsgGUID: KYIpkXqpR8Kgu7jIXlsI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66680077"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Sep 2024 20:07:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snrDq-000FZc-1o;
	Tue, 10 Sep 2024 03:07:18 +0000
Date: Tue, 10 Sep 2024 11:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10352/10516] kernel/resource.c:1874:43: error:
 use of undeclared identifier 'MAX_PHYSMEM_BITS'
Message-ID: <202409101018.h037Tq0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: arm-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101018.h037Tq0a-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101018.h037Tq0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101018.h037Tq0a-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/resource.c:21:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2202:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/resource.c:1874:43: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'
    1874 |                 end = min_t(resource_size_t, base->end, PHYSMEM_END);
         |                                                         ^
   include/linux/mm.h:101:32: note: expanded from macro 'PHYSMEM_END'
     101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                   ^
   kernel/resource.c:1891:51: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'
    1891 |                addr <= min_t(resource_size_t, base->end, PHYSMEM_END);
         |                                                          ^
   include/linux/mm.h:101:32: note: expanded from macro 'PHYSMEM_END'
     101 | # define PHYSMEM_END    ((1ULL << MAX_PHYSMEM_BITS) - 1)
         |                                   ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/MAX_PHYSMEM_BITS +1874 kernel/resource.c

14b80582c43e4f Dan Williams    2022-05-20  1867  
14b80582c43e4f Dan Williams    2022-05-20  1868  static resource_size_t gfr_start(struct resource *base, resource_size_t size,
14b80582c43e4f Dan Williams    2022-05-20  1869  				 resource_size_t align, unsigned long flags)
14b80582c43e4f Dan Williams    2022-05-20  1870  {
14b80582c43e4f Dan Williams    2022-05-20  1871  	if (flags & GFR_DESCENDING) {
14b80582c43e4f Dan Williams    2022-05-20  1872  		resource_size_t end;
14b80582c43e4f Dan Williams    2022-05-20  1873  
ea72ce5da22806 Thomas Gleixner 2024-08-14 @1874  		end = min_t(resource_size_t, base->end, PHYSMEM_END);
14b80582c43e4f Dan Williams    2022-05-20  1875  		return end - size + 1;
14b80582c43e4f Dan Williams    2022-05-20  1876  	}
14b80582c43e4f Dan Williams    2022-05-20  1877  
9d844a11c912c3 Huang Ying      2024-09-06  1878  	return ALIGN(max(base->start, align), align);
14b80582c43e4f Dan Williams    2022-05-20  1879  }
14b80582c43e4f Dan Williams    2022-05-20  1880  

:::::: The code at line 1874 was first introduced by commit
:::::: ea72ce5da22806d5713f3ffb39a6d5ae73841f93 x86/kaslr: Expose and use the end of the physical memory address space

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
