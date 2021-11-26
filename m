Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFCD68
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 01:35:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="259490191"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="259490191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 17:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="475760400"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2021 17:35:00 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqQ8h-0007EQ-H6; Fri, 26 Nov 2021 01:34:59 +0000
Date: Fri, 26 Nov 2021 09:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [linux-next:master 2984/3632] drivers/iommu/intel/iommu.c:1344:7:
 warning: variable 'level_pfn' is used uninitialized whenever 'if' condition
 is true
Message-ID: <202111260939.DmjPLz34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: edad96db58d2f0b666ddd0a3e0f179e586f5f66a [2984/3632] iommu/vt-d: Fix unmap_pages support
config: x86_64-buildonly-randconfig-r004-20211126 (https://download.01.org/0day-ci/archive/20211126/202111260939.DmjPLz34-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0332d105b9ad7f1f0ffca7e78b71de8b3a48f158)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=edad96db58d2f0b666ddd0a3e0f179e586f5f66a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout edad96db58d2f0b666ddd0a3e0f179e586f5f66a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:1344:7: warning: variable 'level_pfn' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (!dma_pte_present(pte))
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1369:9: note: uninitialized use occurs here
                   pfn = level_pfn + level_size(level);
                         ^~~~~~~~~
   drivers/iommu/intel/iommu.c:1344:3: note: remove the 'if' if its condition is always false
                   if (!dma_pte_present(pte))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:1342:26: note: initialize the variable 'level_pfn' to silence this warning
                   unsigned long level_pfn;
                                          ^
                                           = 0
   drivers/iommu/intel/iommu.c:136:29: warning: unused function 'dma_to_mm_pfn' [-Wunused-function]
   static inline unsigned long dma_to_mm_pfn(unsigned long dma_pfn)
                               ^
   2 warnings generated.


vim +1344 drivers/iommu/intel/iommu.c

ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1329  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1330  static struct page *dma_pte_clear_level(struct dmar_domain *domain, int level,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1331  					struct dma_pte *pte, unsigned long pfn,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1332  					unsigned long start_pfn,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1333  					unsigned long last_pfn,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1334  					struct page *freelist)
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1335  {
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1336  	struct dma_pte *first_pte = NULL, *last_pte = NULL;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1337  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1338  	pfn = max(start_pfn, pfn);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1339  	pte = &pte[pfn_level_offset(pfn, level)];
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1340  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1341  	do {
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1342  		unsigned long level_pfn;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1343  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05 @1344  		if (!dma_pte_present(pte))
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1345  			goto next;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1346  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1347  		level_pfn = pfn & level_mask(level);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1348  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1349  		/* If range covers entire pagetable, free it */
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1350  		if (start_pfn <= level_pfn &&
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1351  		    last_pfn >= level_pfn + level_size(level) - 1) {
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1352  			/* These suborbinate page tables are going away entirely. Don't
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1353  			   bother to clear them; we're just going to *free* them. */
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1354  			if (level > 1 && !dma_pte_superpage(pte))
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1355  				freelist = dma_pte_list_pagetables(domain, level - 1, pte, freelist);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1356  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1357  			dma_clear_pte(pte);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1358  			if (!first_pte)
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1359  				first_pte = pte;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1360  			last_pte = pte;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1361  		} else if (level > 1) {
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1362  			/* Recurse down into a level that isn't *entirely* obsolete */
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1363  			freelist = dma_pte_clear_level(domain, level - 1,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1364  						       phys_to_virt(dma_pte_addr(pte)),
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1365  						       level_pfn, start_pfn, last_pfn,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1366  						       freelist);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1367  		}
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1368  next:
edad96db58d2f0b drivers/iommu/intel/iommu.c Alex Williamson 2021-11-22  1369  		pfn = level_pfn + level_size(level);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1370  	} while (!first_pte_in_page(++pte) && pfn <= last_pfn);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1371  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1372  	if (first_pte)
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1373  		domain_flush_cache(domain, first_pte,
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1374  				   (void *)++last_pte - (void *)first_pte);
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1375  
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1376  	return freelist;
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1377  }
ea8ea460c9ace60 drivers/iommu/intel-iommu.c David Woodhouse 2014-03-05  1378  

:::::: The code at line 1344 was first introduced by commit
:::::: ea8ea460c9ace60bbb5ac6e5521d637d5c15293d iommu/vt-d: Clean up and fix page table clear/free behaviour

:::::: TO: David Woodhouse <David.Woodhouse@intel.com>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
