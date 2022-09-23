Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A615AD
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663908768; x=1695444768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkK4LgAPuTiz2ulFOO0KZI/5av2zSYi5/kTy4XL0vJc=;
  b=BS4OZiv+Rn7EVWe8RTANPjjVLrjSbIcSZzu9HNu585qQl6XMR7MQIwhT
   ZLHEdP4mF2mRygWZjEcbmwV6u2Pqo0alYPYVzTm4/AgGg76Agv4wzso07
   T4AqfckzmiSYn5hm/AaFtObHudIvVfpSNFiA5Ku3Nl1WZiRBa5xcPSuBi
   I6RuWClk0dWebUOgHQPI/YFLWxpw2x0gifFwsccZCOnw1FNhn7sAPV3ZQ
   G4r3GOyjnMPrX+lGp3hEmTGHXOnnECgQqU0W3kvZ8ASIXkVWUaiw8JyrP
   CYkyugZEFcRNQicr9jauYUad7RE7DsjLa58C76x0GYHUeGav/KXnfehqS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301389878"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="301389878"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 21:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="762485535"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2022 21:52:33 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obafw-0005Jk-2o;
	Fri, 23 Sep 2022 04:52:32 +0000
Date: Fri, 23 Sep 2022 12:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Naoya Horiguchi <naoya.horiguchi@nec.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 480/484]
 drivers/base/memory.c:186:29: error: no member named 'nr_hwpoison' in
 'struct memory_block'
Message-ID: <202209231253.y7FHIu3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   1dee68cfead9a3a85e244a274b4e85620abd5331
commit: 69b496f03bb46c7ce743aff0d976c078d753d6d6 [480/484] mm/hwpoison: introduce per-memory_block hwpoison counter
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220923/202209231253.y7FHIu3q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/69b496f03bb46c7ce743aff0d976c078d753d6d6
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
        git checkout 69b496f03bb46c7ce743aff0d976c078d753d6d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/base/memory.c:186:29: error: no member named 'nr_hwpoison' in 'struct memory_block'
           if (atomic_long_read(&mem->nr_hwpoison))
                                 ~~~  ^
   drivers/base/memory.c:870:49: error: no member named 'nr_hwpoison' in 'struct memory_block'
                   clear_hwpoisoned_pages(atomic_long_read(&mem->nr_hwpoison));
                                                            ~~~  ^
   2 errors generated.


vim +186 drivers/base/memory.c

   177	
   178	static int memory_block_online(struct memory_block *mem)
   179	{
   180		unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
   181		unsigned long nr_pages = PAGES_PER_SECTION * sections_per_block;
   182		unsigned long nr_vmemmap_pages = mem->nr_vmemmap_pages;
   183		struct zone *zone;
   184		int ret;
   185	
 > 186		if (atomic_long_read(&mem->nr_hwpoison))
   187			return -EHWPOISON;
   188	
   189		zone = zone_for_pfn_range(mem->online_type, mem->nid, mem->group,
   190					  start_pfn, nr_pages);
   191	
   192		/*
   193		 * Although vmemmap pages have a different lifecycle than the pages
   194		 * they describe (they remain until the memory is unplugged), doing
   195		 * their initialization and accounting at memory onlining/offlining
   196		 * stage helps to keep accounting easier to follow - e.g vmemmaps
   197		 * belong to the same zone as the memory they backed.
   198		 */
   199		if (nr_vmemmap_pages) {
   200			ret = mhp_init_memmap_on_memory(start_pfn, nr_vmemmap_pages, zone);
   201			if (ret)
   202				return ret;
   203		}
   204	
   205		ret = online_pages(start_pfn + nr_vmemmap_pages,
   206				   nr_pages - nr_vmemmap_pages, zone, mem->group);
   207		if (ret) {
   208			if (nr_vmemmap_pages)
   209				mhp_deinit_memmap_on_memory(start_pfn, nr_vmemmap_pages);
   210			return ret;
   211		}
   212	
   213		/*
   214		 * Account once onlining succeeded. If the zone was unpopulated, it is
   215		 * now already properly populated.
   216		 */
   217		if (nr_vmemmap_pages)
   218			adjust_present_page_count(pfn_to_page(start_pfn), mem->group,
   219						  nr_vmemmap_pages);
   220	
   221		mem->zone = zone;
   222		return ret;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
