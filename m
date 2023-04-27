Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7EEA937;
	Thu, 27 Apr 2023 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682638472; x=1714174472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HfaJGlC5hdrPMRieH9VHs/WnxvqBtMKVL9tv9gFEALc=;
  b=XPVyz1JNjT29e2gBYj4XNcMGK6EGWdULFMObEXKJUlj3Js/E6HQABm5k
   fewXxLntFfN0Uw96t+qFxfYLkCDxOKDX+F0QonheHVPZvgznMr0fMJpt/
   Z7pFjTVostAW363MDeA6IGQ7NEe235XdMdph3VPDhP6WS+S/SpeGvNW0J
   BLtw/huOSfYXbwuUztslpig5lX0/dfdr3s7Y0PAq3VBLvuME0IxC7lLaz
   jRfGTeShQyigFKDYkOEPPHYany8OeoTTdAiWfVi2TuSD0iApRgDSQLUYr
   6uVgbUQG1pNBaHNmRtjyctHloVz8j7wV4DrKqRfXTt4e9mtXJuy2DuQoN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327218792"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="327218792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 16:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="1024341746"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="1024341746"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2023 16:34:30 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psB89-0000CT-1U;
	Thu, 27 Apr 2023 23:34:29 +0000
Date: Fri, 28 Apr 2023 07:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next/mm V2 1/2] page_pool: Remove workqueue in
 new shutdown scheme
Message-ID: <202304280755.Xm6AzMzG-lkp@intel.com>
References: <168262351129.2036355.1136491155595493268.stgit@firesoul>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168262351129.2036355.1136491155595493268.stgit@firesoul>

Hi Jesper,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on horms-ipvs/master linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/page_pool-Remove-workqueue-in-new-shutdown-scheme/20230428-032759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/168262351129.2036355.1136491155595493268.stgit%40firesoul
patch subject: [PATCH RFC net-next/mm V2 1/2] page_pool: Remove workqueue in new shutdown scheme
config: mips-buildonly-randconfig-r002-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280755.Xm6AzMzG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/d6fe37a8a681d3f95c9ac342d182e6fbeba61b72
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jesper-Dangaard-Brouer/page_pool-Remove-workqueue-in-new-shutdown-scheme/20230428-032759
        git checkout d6fe37a8a681d3f95c9ac342d182e6fbeba61b72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280755.Xm6AzMzG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/page_pool.c:448:14: warning: no previous prototype for function 'pp_read_hold_cnt' [-Wmissing-prototypes]
   noinline u32 pp_read_hold_cnt(struct page_pool *pool)
                ^
   net/core/page_pool.c:448:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline u32 pp_read_hold_cnt(struct page_pool *pool)
            ^
            static 
   1 warning generated.


vim +/pp_read_hold_cnt +448 net/core/page_pool.c

   446	
   447	/* Avoid inlining code to avoid speculative fetching cacheline */
 > 448	noinline u32 pp_read_hold_cnt(struct page_pool *pool)
   449	{
   450		return READ_ONCE(pool->pages_state_hold_cnt);
   451	}
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
