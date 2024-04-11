Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04162BCE8;
	Thu, 11 Apr 2024 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712869774; cv=none; b=WpE1UH0U6dG/YkJMNvoKrdgZd9tilKynEySrMvLJNMpAQ0WVuArSHU3ALCxlr6Xc4raEi91TU1WTSivATz8jaWteHHEkTJnxYLcB1I5wayX572dVNkTMO+N/DUUohCI7JlWT9voBQSpjmaygp6JVqRFi1eF5Zbyk5ZwY4KapYX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712869774; c=relaxed/simple;
	bh=LF4XpfoNUs4rgrgDg8WjET4ZLBJiGswBegAapshKlSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBjaUV9qccuVhqtjuaXVO04fWBpCmQRFIwu79n8ps6/h2dGyy1xx6szEVNTvRuSwdiuCdiD7NVojWbq5d0QAfHzZRVTqnuXf6yWR21+y9xuCchFjPns4BjmoOEhTgfkSrI8NNH56WmLJvH/YscSja1vMUF09MujP6utROg0EWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtDT3j8s; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtDT3j8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712869773; x=1744405773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LF4XpfoNUs4rgrgDg8WjET4ZLBJiGswBegAapshKlSA=;
  b=QtDT3j8s81YAw/6lwgPpKWmQ6pQJH2LyDFVyNveNF/4UiO4G/ucbF8v5
   eJsxGKoQSdPaYFsHqQmB99q/O3zBsn8uPa12MNtEOYE5JAdCIeaioXT3e
   xdsYQVj9UF5vWzc1wYnq53HzN00JVOC/5qauF4V4VGcCNROa1my/1AeyH
   GQ3aeg37tRwBw4a4hm7pvH/HXr6Q+ZcVAAyxUIbjy6TnPL0Iae2PSHJ3K
   UQfGGsDMRrHoDQlEI0vdOqKXHQGT0QiX2IWnmByE9OXiEiqgRDB4j8AF6
   00KtU2F35Cq9xlytq688LzOkFvp4Ic9wHh0OdhexzM1IETj2tqq+adVNP
   w==;
X-CSE-ConnectionGUID: C5V/sZvlSe6qKLMRAmDfCQ==
X-CSE-MsgGUID: GhThpbHgQw2tPDd2iGq7Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30791676"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="30791676"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 14:09:32 -0700
X-CSE-ConnectionGUID: 9GszBZEdQweoOsAaOPrXAA==
X-CSE-MsgGUID: By4KEyw4SXmebUA1g2eEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="20992366"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2024 14:09:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv1fk-0008z3-0N;
	Thu, 11 Apr 2024 21:09:28 +0000
Date: Fri, 12 Apr 2024 05:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 08/10] fs/dax: Properly refcount fs dax pages
Message-ID: <202404120417.9jDId3hj-lkp@intel.com>
References: <5cc5a152d2a03e2702be259c81af2bfe424303cd.1712796818.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc5a152d2a03e2702be259c81af2bfe424303cd.1712796818.git-series.apopple@nvidia.com>

Hi Alistair,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240411-085933
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/5cc5a152d2a03e2702be259c81af2bfe424303cd.1712796818.git-series.apopple%40nvidia.com
patch subject: [RFC 08/10] fs/dax: Properly refcount fs dax pages
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240412/202404120417.9jDId3hj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120417.9jDId3hj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120417.9jDId3hj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/dax.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2140:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/dax.c:707:5: warning: no previous prototype for function '__dax_invalidate_entry' [-Wmissing-prototypes]
     707 | int __dax_invalidate_entry(struct address_space *mapping,
         |     ^
   fs/dax.c:707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     707 | int __dax_invalidate_entry(struct address_space *mapping,
         | ^
         | static 
   6 warnings generated.


vim +/__dax_invalidate_entry +707 fs/dax.c

   706	
 > 707	int __dax_invalidate_entry(struct address_space *mapping,
   708					  pgoff_t index, bool trunc)
   709	{
   710		XA_STATE(xas, &mapping->i_pages, index);
   711		int ret = 0;
   712		void *entry;
   713	
   714		xas_lock_irq(&xas);
   715		entry = get_unlocked_entry(&xas, 0);
   716		if (!entry || WARN_ON_ONCE(!xa_is_value(entry)))
   717			goto out;
   718		if (!trunc &&
   719		    (xas_get_mark(&xas, PAGECACHE_TAG_DIRTY) ||
   720		     xas_get_mark(&xas, PAGECACHE_TAG_TOWRITE)))
   721			goto out;
   722		xas_store(&xas, NULL);
   723		mapping->nrpages -= 1UL << dax_entry_order(entry);
   724		ret = 1;
   725	out:
   726		put_unlocked_entry(&xas, entry, WAKE_ALL);
   727		xas_unlock_irq(&xas);
   728		return ret;
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
