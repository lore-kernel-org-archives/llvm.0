Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E02115;
	Fri, 14 Apr 2023 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681483596; x=1713019596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xvRFyU7Q5GbLoC/wl79wT+pTU2smeSgowIVO+Wxyg54=;
  b=bdrXqKWAw3KvIm9172cf8yEOIaho6asxGMvzoUzA9+5+W5OvoRo4ptLN
   w1ld7H02uYuYzRxNyjXRt1qyigotNOWYoyl7u9nI55w4hIC3Rmg+lHvDd
   wUKD016/Nw6xuK4CsEMqG6XSlCL9PX8uwM0isTWmb2Zq/Ip8In1z83Rsh
   MD+xb29AOx5qjPasUSaWhKur8fP1mA+2WWFLiaItMtxvm3vmtMavozlJe
   NOj7LmZI2jDNVHDYfvNY2ia0bqOyp5VStXFNMnypNS+7Mzw+xETe3lSTS
   mf7iefaoS6eXbSe9y9QTeW5bgUXKamS7PdhHJ/IEJHbsuHrzyhZmkavt+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372345935"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="372345935"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 07:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019614440"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="1019614440"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2023 07:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnKh8-000Zd6-0N;
	Fri, 14 Apr 2023 14:46:34 +0000
Date: Fri, 14 Apr 2023 22:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] buffer: add alloc_folio_buffers() helper
Message-ID: <202304142218.zs2r13hQ-lkp@intel.com>
References: <20230414110821.21548-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414110821.21548-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on vfs-idmapping/for-next]
[also build test WARNING on linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/buffer-add-alloc_folio_buffers-helper/20230414-200852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230414110821.21548-3-p.raghav%40samsung.com
patch subject: [RFC 2/4] buffer: add alloc_folio_buffers() helper
config: powerpc-kilauea_defconfig (https://download.01.org/0day-ci/archive/20230414/202304142218.zs2r13hQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a5c44e7a616f7a972e4570437b81778c20c15137
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pankaj-Raghav/buffer-add-alloc_folio_buffers-helper/20230414-200852
        git checkout a5c44e7a616f7a972e4570437b81778c20c15137
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142218.zs2r13hQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/buffer.c:913:21: warning: no previous prototype for function 'alloc_folio_buffers' [-Wmissing-prototypes]
   struct buffer_head *alloc_folio_buffers(struct folio *folio, unsigned long size,
                       ^
   fs/buffer.c:913:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct buffer_head *alloc_folio_buffers(struct folio *folio, unsigned long size,
   ^
   static 
   1 warning generated.


vim +/alloc_folio_buffers +913 fs/buffer.c

   903	
   904	/*
   905	 * Create the appropriate buffers when given a folio for data area and
   906	 * the size of each buffer.. Use the bh->b_this_page linked list to
   907	 * follow the buffers created.  Return NULL if unable to create more
   908	 * buffers.
   909	 *
   910	 * The retry flag is used to differentiate async IO (paging, swapping)
   911	 * which may not fail from ordinary buffer allocations.
   912	 */
 > 913	struct buffer_head *alloc_folio_buffers(struct folio *folio, unsigned long size,
   914						bool retry)
   915	{
   916		struct buffer_head *bh, *head;
   917		gfp_t gfp = GFP_NOFS | __GFP_ACCOUNT;
   918		long offset;
   919		struct mem_cgroup *memcg, *old_memcg;
   920	
   921		if (retry)
   922			gfp |= __GFP_NOFAIL;
   923	
   924		/* The folio lock pins the memcg */
   925		memcg = folio_memcg(folio);
   926		old_memcg = set_active_memcg(memcg);
   927	
   928		head = NULL;
   929		offset = folio_size(folio);
   930		while ((offset -= size) >= 0) {
   931			bh = alloc_buffer_head(gfp);
   932			if (!bh)
   933				goto no_grow;
   934	
   935			bh->b_this_page = head;
   936			bh->b_blocknr = -1;
   937			head = bh;
   938	
   939			bh->b_size = size;
   940	
   941			/* Link the buffer to its folio */
   942			set_bh_folio(bh, folio, offset);
   943		}
   944	out:
   945		set_active_memcg(old_memcg);
   946		return head;
   947	/*
   948	 * In case anything failed, we just free everything we got.
   949	 */
   950	no_grow:
   951		if (head) {
   952			do {
   953				bh = head;
   954				head = head->b_this_page;
   955				free_buffer_head(bh);
   956			} while (head);
   957		}
   958	
   959		goto out;
   960	}
   961	EXPORT_SYMBOL_GPL(alloc_folio_buffers);
   962	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
