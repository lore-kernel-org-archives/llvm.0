Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228B20E6
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 02:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649297197; x=1680833197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQrnEJaSMkZbyuRDxzwznPl1VKPOiEnuTwnVLSNQtLg=;
  b=ekDTrpJJdHsPSLBX9yYjl3m4IMHJd5Zb0jEdOUlm68qsPpHri54sXgVB
   37i8mxLif8O44ma6s0mQfEQxEr3phBPKmCx4vtMRvnP6Mm5Rs7ocuWJsf
   dqa6Ko2hmGNwVuetWZIdkqMQ/OnxRG1B8oMFTdAo4GEjOaScaXLB9FyL7
   zbUGdUpjpO41H3LHCWKTW+Fcx4YWcTuSAQ0WjsoVIbm6W4zY0D19h3ebG
   qFSOzoC+/FCD494vH967/1dzE6L+KtF3CjG7nTD99gc93KJnQtviv6k5l
   x6yMhpOL+k+fLv6P3sowZZvSJVUY5H09iFMwxZ9rNpgOlzXzyaeyv0P+p
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241799406"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="241799406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 19:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; 
   d="scan'208";a="658861171"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Apr 2022 19:06:33 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncHXc-0004yZ-MW;
	Thu, 07 Apr 2022 02:06:32 +0000
Date: Thu, 7 Apr 2022 10:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen/balloon: fix page onlining when populating new zone
Message-ID: <202204070950.mzGBYW2q-lkp@intel.com>
References: <20220406133229.15979-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406133229.15979-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Juergen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on linus/master linux/master v5.18-rc1 next-20220406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/xen-balloon-fix-page-onlining-when-populating-new-zone/20220407-000935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
config: arm64-randconfig-r036-20220406 (https://download.01.org/0day-ci/archive/20220407/202204070950.mzGBYW2q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/b3deb59d5386ade4fb227038f202a9bdb8ade4ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Juergen-Gross/xen-balloon-fix-page-onlining-when-populating-new-zone/20220407-000935
        git checkout b3deb59d5386ade4fb227038f202a9bdb8ade4ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/ drivers/xen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/xen/balloon.c:518:10: error: implicit declaration of function 'alloc_page_for_balloon' [-Werror,-Wimplicit-function-declaration]
                   page = alloc_page_for_balloon(gfp);
                          ^
>> drivers/xen/balloon.c:518:8: warning: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
                   page = alloc_page_for_balloon(gfp);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/balloon.c:545:3: error: implicit declaration of function 'add_page_to_balloon' [-Werror,-Wimplicit-function-declaration]
                   add_page_to_balloon(page);
                   ^
   1 warning and 2 errors generated.


vim +518 drivers/xen/balloon.c

   505	
   506	static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
   507	{
   508		enum bp_state state = BP_DONE;
   509		unsigned long i;
   510		struct page *page, *tmp;
   511		int ret;
   512		LIST_HEAD(pages);
   513	
   514		if (nr_pages > ARRAY_SIZE(frame_list))
   515			nr_pages = ARRAY_SIZE(frame_list);
   516	
   517		for (i = 0; i < nr_pages; i++) {
 > 518			page = alloc_page_for_balloon(gfp);
   519			if (page == NULL) {
   520				nr_pages = i;
   521				state = BP_EAGAIN;
   522				break;
   523			}
   524			list_add(&page->lru, &pages);
   525		}
   526	
   527		/*
   528		 * Ensure that ballooned highmem pages don't have kmaps.
   529		 *
   530		 * Do this before changing the p2m as kmap_flush_unused()
   531		 * reads PTEs to obtain pages (and hence needs the original
   532		 * p2m entry).
   533		 */
   534		kmap_flush_unused();
   535	
   536		/*
   537		 * Setup the frame, update direct mapping, invalidate P2M,
   538		 * and add to balloon.
   539		 */
   540		i = 0;
   541		list_for_each_entry_safe(page, tmp, &pages, lru) {
   542			frame_list[i++] = xen_page_to_gfn(page);
   543	
   544			list_del(&page->lru);
   545			add_page_to_balloon(page);
   546		}
   547	
   548		flush_tlb_all();
   549	
   550		ret = xenmem_reservation_decrease(nr_pages, frame_list);
   551		BUG_ON(ret != nr_pages);
   552	
   553		balloon_stats.current_pages -= nr_pages;
   554	
   555		return state;
   556	}
   557	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
