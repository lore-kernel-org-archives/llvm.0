Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C732CA0
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643315419; x=1674851419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4v8+yD7oUMe/eV0x6a7gxq3YlDMZF2fW4U1hfPP3bA=;
  b=R618BjMBOU4kAQ2DQZML2Un2DTpwcDJ0FCYfNtVsPgE/vMJVGK0OTJSP
   PZuDIf6jOqSewCr9PYd9eQqDRQ6lsvRnGQO43GeNT+cNgTGFYqswGFjn/
   PDONztCHWAMm9244EBiIysRHON2P9n+xykDlKw8dcQ4rSqlJCmsrYvioq
   PgmvM+gz8AoA7CAM6ECW5jqkyed1o0PrIZ4DggfHNyYuTagt3Q3x1VB0R
   b2wWPJNZFM5De3zry9HhCJGRigVSVhngJqKv/7rV2Z8SXWzAnHATBxo20
   HCxbFgkohHo+kQNp2I4Bei6qPqbZSLMs+7y89ukxrOSHedmDBQou2t+FW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="234334706"
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="234334706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 12:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,321,1635231600"; 
   d="scan'208";a="521382016"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Jan 2022 12:30:16 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDBPM-000N10-1d; Thu, 27 Jan 2022 20:30:16 +0000
Date: Fri, 28 Jan 2022 04:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [davidhildenbrand:single_zone 4/4] drivers/base/memory.c:648:14:
 warning: no previous prototype for function
 'early_node_zone_for_memory_block'
Message-ID: <202201280413.3HR9emiQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://github.com/davidhildenbrand/linux single_zone
head:   176a3d535903312944f7489127f520c5494bc810
commit: 176a3d535903312944f7489127f520c5494bc810 [4/4] tmp
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220128/202201280413.3HR9emiQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dccb9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/davidhildenbrand/linux/commit/176a3d535903312944f7489127f520c5494bc810
        git remote add davidhildenbrand git://github.com/davidhildenbrand/linux
        git fetch --no-tags davidhildenbrand single_zone
        git checkout 176a3d535903312944f7489127f520c5494bc810
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/base/memory.c:648:14: warning: no previous prototype for function 'early_node_zone_for_memory_block' [-Wmissing-prototypes]
   struct zone *early_node_zone_for_memory_block(int nid, struct memory_block *mem)
                ^
   drivers/base/memory.c:648:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct zone *early_node_zone_for_memory_block(int nid, struct memory_block *mem)
   ^
   static 
   1 warning generated.


vim +/early_node_zone_for_memory_block +648 drivers/base/memory.c

   647	
 > 648	struct zone *early_node_zone_for_memory_block(int nid, struct memory_block *mem)
   649	{
   650		const unsigned long start_pfn = section_nr_to_pfn(mem->start_section_nr);
   651		const unsigned long nr_pages = PAGES_PER_SECTION * sections_per_block;
   652	
   653		struct zone *zone, *matching_zone = NULL;
   654		pg_data_t *pgdat = NODE_DATA(nid);
   655		int i;
   656	
   657		/*
   658		 * This logic only works for early memory, when the applicable zones
   659		 * already span the memory block. We don't expect overlapping zones on
   660		 * a single node for early memory. So if we're told that some pfns
   661		 * of a node fall into this memory block, we can assume that all node
   662		 * zones that intersect with the memory block are actually applicable.
   663		 * No need to look at the memmap.
   664		 *
   665		 * Memory hot(un)plug updates the zone manually after memory
   666		 * onlinig/offlining succeed.
   667		 */
   668		for (i = 0; i < MAX_NR_ZONES; i++) {
   669			zone = pgdat->node_zones + i;
   670			if (!populated_zone(zone))
   671				continue;
   672			if (!zone_intersects(zone, start_pfn, nr_pages))
   673				continue;
   674			if (!matching_zone) {
   675				matching_zone = zone;
   676				continue;
   677			}
   678			/* Spans multiple zones ... */
   679			matching_zone = NULL;
   680			break;
   681		}
   682		return matching_zone;
   683	}
   684	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
