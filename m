Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FFF7A
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655035089; x=1686571089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zc2fQ1DQs6hOo+7bC7Stci3yT/NodzkSleYAFJQhRFo=;
  b=bwp64qvB5YA9sKd72zkQMkPnxpRHyBiBW3dnYgjcZL4Pdy2PuCOw7UdB
   bGtMrxUx24UpSmzZ5Cood01chv7kJolgdq+x2CcG/QqNLeMobB8jfx3Eq
   6YDybK/3rXYXQYLB1sOZFadcKMY5rD+7tuhavkB1hxGu+dTvDUVORNrLK
   cPYsoaHJJIvIeB+pjgWgUPF8gfzVN0hZT4k1P0oTS7j5Li3RPcIuhoK9q
   UGJ9qu3N882GhbGC+9rPoo9JDhmMMCkwdXC70WOJWsfvOcmV4Yd/EEO9h
   /3SA2kGyYL7eLrkhs8yjAasFLNbrzafwpCmtKwG62oUep2XeQBfPrwOAr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="303428137"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="303428137"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 04:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="672764530"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2022 04:58:06 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0MEI-000Jto-6e;
	Sun, 12 Jun 2022 11:58:06 +0000
Date: Sun, 12 Jun 2022 19:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Huanpeng Xin <xinhuanpeng9@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, xinhuanpeng <xinhuanpeng@xiaomi.com>
Subject: Re: [PATCH] mm: add a new emergency page migratetype.
Message-ID: <202206121954.0XdxzVrV-lkp@intel.com>
References: <20220606032709.11800-1-xinhuanpeng9@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606032709.11800-1-xinhuanpeng9@gmail.com>

Hi Huanpeng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Huanpeng-Xin/mm-add-a-new-emergency-page-migratetype/20220606-113050
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r026-20220612 (https://download.01.org/0day-ci/archive/20220612/202206121954.0XdxzVrV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c3dbdae8f54c1335f2cb92b379a6eab1253500c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Huanpeng-Xin/mm-add-a-new-emergency-page-migratetype/20220606-113050
        git checkout c3dbdae8f54c1335f2cb92b379a6eab1253500c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/page_alloc.c:2940:12: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                                   nid, zone->nr_reserved_emergency);
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:528:37: note: expanded from macro 'pr_warn'
           printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                      ~~~     ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   mm/page_alloc.c:2948:10: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                   nid, zone->nr_reserved_emergency);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:548:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:475:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:447:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> mm/page_alloc.c:4215:10: error: no member named 'high_zoneidx' in 'struct alloc_context'; did you mean 'highest_zoneidx'?
           if (ac->high_zoneidx >= ZONE_NORMAL) {
                   ^~~~~~~~~~~~
                   highest_zoneidx
   mm/internal.h:226:17: note: 'highest_zoneidx' declared here
           enum zone_type highest_zoneidx;
                          ^
>> mm/page_alloc.c:4238:33: error: too few arguments to function call, expected 3, have 2
                           zone_statistics(z->zone, zone);
                           ~~~~~~~~~~~~~~~              ^
   mm/page_alloc.c:3697:20: note: 'zone_statistics' declared here
   static inline void zone_statistics(struct zone *preferred_zone, struct zone *z,
                      ^
   2 warnings and 2 errors generated.


vim +4215 mm/page_alloc.c

  4204	
  4205	#ifdef CONFIG_EMERGENCY_MEMORY
  4206	/*
  4207	 * get_emergency_page_from_freelist allocates pages in reserved memory
  4208	 * in the migration type MIGRATE_EMERGENCY.
  4209	 */
  4210	static struct page *get_emergency_page_from_freelist(gfp_t gfp_mask, unsigned int order,
  4211				int alloc_flags, const struct alloc_context *ac, int migratetype)
  4212	{
  4213		struct page *page = NULL;
  4214	
> 4215		if (ac->high_zoneidx >= ZONE_NORMAL) {
  4216			struct zoneref *z = ac->preferred_zoneref;
  4217			struct pglist_data *pgdat = NODE_DATA(zonelist_node_idx(z));
  4218			struct zone *zone = &pgdat->node_zones[ZONE_NORMAL];
  4219			unsigned long flags;
  4220	
  4221			if (cpusets_enabled() &&
  4222				(alloc_flags & ALLOC_CPUSET) &&
  4223				!__cpuset_zone_allowed(zone, gfp_mask))
  4224				return NULL;
  4225	
  4226			spin_lock_irqsave(&zone->lock, flags);
  4227			do {
  4228				page = __rmqueue_smallest(zone, order, migratetype);
  4229			} while (page && check_new_pages(page, order));
  4230	
  4231			spin_unlock(&zone->lock);
  4232	
  4233			if (page) {
  4234				__mod_zone_freepage_state(zone, -(1 << order),
  4235							  get_pcppage_migratetype(page));
  4236	
  4237				__count_zid_vm_events(PGALLOC, page_zonenum(page), 1 << order);
> 4238				zone_statistics(z->zone, zone);
  4239				prep_new_page(page, order, gfp_mask, alloc_flags);
  4240			}
  4241			local_irq_restore(flags);
  4242		}
  4243	
  4244		return page;
  4245	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
