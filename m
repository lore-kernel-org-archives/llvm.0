Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220377A
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 06:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647499225; x=1679035225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7hl2LrJPwgi1RBOzhXRymcPhWFGbQY2+v5xbTf7Wwg=;
  b=AsdOVMtHZLYJgP3Ko7JF++DUBZD4F/ETv4cN6qiuZoAJOJptzJoASSyX
   vv/GFwGLUd/e4caGfl/dnX94lf5/PnQRQSOxgqjuROqdWMb/sql3CTx4D
   x8Hpg6HGlbAdZqDoVeY7eAy11Uta1R9iLWj6Ej9zZe2DbQNAdVqsPcM99
   k8JZohCkg3o+CtgHPZLUt9YFgL05kc4FKiKQ7s9WeOplAbTlmEogVEfyJ
   bzdk1d1iZOaorWNB6a+Do6oC3PX0ki2oR84K0fgnIP6NXT2h1M9OIJh00
   VgqWI+SdMc0oKwOqSk1YvX1ZIFi1p0N/Fez7s5DfrVUKebyr1o/cIsUPk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237402605"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="237402605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 23:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="516648606"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Mar 2022 23:40:20 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUjo3-000DOc-MQ; Thu, 17 Mar 2022 06:40:19 +0000
Date: Thu, 17 Mar 2022 14:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 221/2335] drivers/xen/grant-table.c:411:22: error:
 implicit declaration of function 'xen_gfn_to_pfn'
Message-ID: <202203171426.IezxkFRk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: dbfd8a446611c67366513c5798b018f9d1b6123b [221/2335] headers/prep: Rename API: gfn_to_pfn() => xen_gfn_to_pfn()
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220317/202203171426.IezxkFRk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=dbfd8a446611c67366513c5798b018f9d1b6123b
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout dbfd8a446611c67366513c5798b018f9d1b6123b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/xen/grant-table.c:411:22: error: implicit declaration of function 'xen_gfn_to_pfn' [-Werror,-Wimplicit-function-declaration]
                   page = pfn_to_page(xen_gfn_to_pfn(gfn));
                                      ^
   include/asm-generic/memory_model.h:53:21: note: expanded from macro 'pfn_to_page'
   #define pfn_to_page __pfn_to_page
                       ^
   drivers/xen/grant-table.c:411:22: note: did you mean 'gfn_to_pfn'?
   include/asm-generic/memory_model.h:53:21: note: expanded from macro 'pfn_to_page'
   #define pfn_to_page __pfn_to_page
                       ^
   arch/x86/include/asm/xen/page.h:251:29: note: 'gfn_to_pfn' declared here
   static inline unsigned long gfn_to_pfn(unsigned long gfn)
                               ^
   1 error generated.


vim +/xen_gfn_to_pfn +411 drivers/xen/grant-table.c

   399	
   400	static void gnttab_add_deferred(grant_ref_t ref, bool readonly,
   401					struct page *page)
   402	{
   403		struct deferred_entry *entry;
   404		gfp_t gfp = (in_atomic() || irqs_disabled()) ? GFP_ATOMIC : GFP_KERNEL;
   405		const char *what = KERN_WARNING "leaking";
   406	
   407		entry = kmalloc(sizeof(*entry), gfp);
   408		if (!page) {
   409			unsigned long gfn = gnttab_interface->read_frame(ref);
   410	
 > 411			page = pfn_to_page(xen_gfn_to_pfn(gfn));
   412			get_page(page);
   413		}
   414	
   415		if (entry) {
   416			unsigned long flags;
   417	
   418			entry->ref = ref;
   419			entry->ro = readonly;
   420			entry->page = page;
   421			entry->warn_delay = 60;
   422			spin_lock_irqsave(&gnttab_list_lock, flags);
   423			list_add_tail(&entry->list, &deferred_list);
   424			if (!timer_pending(&deferred_timer)) {
   425				deferred_timer.expires = jiffies + HZ;
   426				add_timer(&deferred_timer);
   427			}
   428			spin_unlock_irqrestore(&gnttab_list_lock, flags);
   429			what = KERN_DEBUG "deferring";
   430		}
   431		printk("%s g.e. %#x (pfn %#lx)\n",
   432		       what, ref, page ? page_to_pfn(page) : -1);
   433	}
   434	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
