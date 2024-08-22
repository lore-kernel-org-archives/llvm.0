Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47AB1CFEB7;
	Thu, 22 Aug 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724346633; cv=none; b=cFRiSLlHhVQsi94UUxXdF9Q/rbnNps1xGgGKq/Mv+kNpdo5h48sxNxHpZJyRbZmgbG47KAn0ZFk+K0WiW0x9X6NOUe/yDcH7ECjrR+iXDQWBptPNsuTVTl0QpLi19WX6VisVspk9mVNHoxec9BrubQS0HYS8TlJiFvyRT0TGlQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724346633; c=relaxed/simple;
	bh=T8UXz3J1cofpAphqa4w1TuQrJGWcdcB8h4TCT07esdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIx3+iNIKX0PByvyIbkQ9iDEvAb5TaYv93jpU2R3l+1E5D3g6heVQNgkrfwksx5yqqYOhh4gPHC9RKbtKIa0zfhYhfi9SrB0vksipg+frUcUyU8ZSIR55wQib1MIAu0owdAlGT28WJIq3Wg6n0l4qg/Oc8L9LujC6Ib0aRp9xxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDp1F7x5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDp1F7x5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724346630; x=1755882630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T8UXz3J1cofpAphqa4w1TuQrJGWcdcB8h4TCT07esdA=;
  b=eDp1F7x5OYFQ/RrFYGfh98QKG0uSxZn66RSWFNVdMWo9HZJSVkodnLIB
   mNw1WZiUTVnX1OgFTskwVvtcawDw5ZOop7Pgyvliea+km1nl5uW/AbLEy
   vA+129nhK8dc34VpEJYD4WwRxVpFWJhv7d+TBzgobAOOgMwGjK/vlqwya
   Ov5GA58+8Xnvc0qmHVvJo0tqsjTEbwRHRl+9U1EfoEcwMoiXa1aMpJbvj
   1nqHho7An8WyHjvCclBZyB9dJhNlgcRSGsdTkl32oTSDctWCc1WA18KJy
   r/NFid7sqlCxPeyOr1OHvEYWB2EpumUMDCAMNB9yIeGXLS/kpsqE677Dw
   A==;
X-CSE-ConnectionGUID: uP6h79HaReCpKG18zNoa6g==
X-CSE-MsgGUID: 4tqWH2ZVSa6Y0byb9afVXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26577403"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26577403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:10:28 -0700
X-CSE-ConnectionGUID: MWOGycygQO2IxXpE0FptqA==
X-CSE-MsgGUID: whV7YRvsSduuMft1DnRltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="92256040"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 10:10:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBKF-000D1M-1F;
	Thu, 22 Aug 2024 17:10:19 +0000
Date: Fri, 23 Aug 2024 01:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de,
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de,
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com,
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, pasha.tatashin@soleen.com,
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org,
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com,
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com
Subject: Re: [PATCH 1/5] alloc_tag: load module tags into separate continuous
 memory
Message-ID: <202408230020.U02tOvjb-lkp@intel.com>
References: <20240819151512.2363698-2-surenb@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819151512.2363698-2-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on 651c8c1d735983040bec4f71d0e2e690f3c0fc2d]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-load-module-tags-into-separate-continuous-memory/20240819-231747
base:   651c8c1d735983040bec4f71d0e2e690f3c0fc2d
patch link:    https://lore.kernel.org/r/20240819151512.2363698-2-surenb%40google.com
patch subject: [PATCH 1/5] alloc_tag: load module tags into separate continuous memory
config: s390-randconfig-001-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230020.U02tOvjb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230020.U02tOvjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230020.U02tOvjb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/alloc_tag.c:3:
   In file included from include/linux/execmem.h:6:
   In file included from include/linux/moduleloader.h:6:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2199:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> lib/alloc_tag.c:16:22: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct module' [-Wtentative-definition-incomplete-type]
      16 | static struct module unloaded_mod;
         |                      ^
   include/linux/printk.h:358:8: note: forward declaration of 'struct module'
     358 | struct module;
         |        ^
   lib/alloc_tag.c:18:22: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct module' [-Wtentative-definition-incomplete-type]
      18 | static struct module prepend_mod;
         |                      ^
   include/linux/printk.h:358:8: note: forward declaration of 'struct module'
     358 | struct module;
         |        ^
>> lib/alloc_tag.c:16:22: error: tentative definition has type 'struct module' that is never completed
      16 | static struct module unloaded_mod;
         |                      ^
   include/linux/printk.h:358:8: note: forward declaration of 'struct module'
     358 | struct module;
         |        ^
   lib/alloc_tag.c:18:22: error: tentative definition has type 'struct module' that is never completed
      18 | static struct module prepend_mod;
         |                      ^
   include/linux/printk.h:358:8: note: forward declaration of 'struct module'
     358 | struct module;
         |        ^
   6 warnings and 2 errors generated.


vim +16 lib/alloc_tag.c

    11	
    12	static struct codetag_type *alloc_tag_cttype;
    13	static struct alloc_tag_module_section module_tags;
    14	static struct maple_tree mod_area_mt = MTREE_INIT(mod_area_mt, MT_FLAGS_ALLOC_RANGE);
    15	/* A dummy object used to indicate an unloaded module */
  > 16	static struct module unloaded_mod;
    17	/* A dummy object used to indicate a module prepended area */
    18	static struct module prepend_mod;
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
