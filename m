Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96298A5B
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 16:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651856278; x=1683392278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C4xl3D7B9gT1f6Bq0vyZdhuycmcUGIGXjPtyEFigCCE=;
  b=L1kcqi+jtBfevhyRMCJN7Iuun4LdN/yYOL01VgANN6ikWwdnJVXRxPil
   aZmZwqSfX7OKcokCMPfCQmrE+5TUraMmPdNmduZHiqnnfpNV7iB0IEWVe
   n7SCCafggitfQQHwwSoXRMqizozn0GvL3AJXxHKc2Xq2rfCiO9bAExypi
   qtPxw7+d2AtTSEDTzzHifSQpyLnmb/aeaZt3Iph9kdqu4KmLVgbbvgq6x
   FZ9KjKjoRAZNjHzXpcej3v1nEAGj5pC1Eh/C44k1+yYr06zckwx1R2rqc
   QtdzphzcY5vFcS0TqthYUS322YFNiksLXDHBsbB89pOW5WgZmhvwwnn6M
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268136050"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="268136050"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 09:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="633013528"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2022 09:54:46 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn1E6-000Dfy-7m;
	Fri, 06 May 2022 16:54:46 +0000
Date: Sat, 7 May 2022 00:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Chen <liangchen.linux@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, hch@infradead.org,
	jmoyer@redhat.com, jack@suse.cz, lczerner@redhat.com,
	Liang Chen <liangchen.linux@gmail.com>
Subject: Re: [PATCH] fs: Fix page cache inconsistency when mixing buffered
 and AIO DIO for bdev
Message-ID: <202205070030.wgFHZ8hk-lkp@intel.com>
References: <20220506135709.46872-1-lchen@localhost.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506135709.46872-1-lchen@localhost.localdomain>

Hi Liang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on v5.18-rc5 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Chen/fs-Fix-page-cache-inconsistency-when-mixing-buffered-and-AIO-DIO-for-bdev/20220506-215958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: riscv-randconfig-r024-20220506 (https://download.01.org/0day-ci/archive/20220507/202205070030.wgFHZ8hk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2b2bda510e6c93a57581021c675b023d2f43e81e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liang-Chen/fs-Fix-page-cache-inconsistency-when-mixing-buffered-and-AIO-DIO-for-bdev/20220506-215958
        git checkout 2b2bda510e6c93a57581021c675b023d2f43e81e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/fops.c:423:5: warning: no previous prototype for function 'blkdev_sb_init_dio_done_wq' [-Wmissing-prototypes]
   int blkdev_sb_init_dio_done_wq(struct super_block *sb)
       ^
   block/fops.c:423:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int blkdev_sb_init_dio_done_wq(struct super_block *sb)
   ^
   static 
   1 warning generated.


vim +/blkdev_sb_init_dio_done_wq +423 block/fops.c

   422	
 > 423	int blkdev_sb_init_dio_done_wq(struct super_block *sb)
   424	{
   425		struct workqueue_struct *old;
   426		struct workqueue_struct *wq = alloc_workqueue("dio/%s",
   427							     WQ_MEM_RECLAIM, 0,
   428							     sb->s_id);
   429		if (!wq)
   430		       return -ENOMEM;
   431		/*
   432		 * This has to be atomic as more DIOs can race to create the workqueue
   433		 */
   434		old = cmpxchg(&sb->s_dio_done_wq, NULL, wq);
   435		/* Someone created workqueue before us? Free ours... */
   436		if (old)
   437			destroy_workqueue(wq);
   438	       return 0;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
