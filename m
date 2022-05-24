Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2B628
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 02:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653360064; x=1684896064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTs7Zyfz3kf22iAirsP5H5EozMNgDf/N+TMetMeGLo0=;
  b=WvYuNyzJC1P1Wr2jUZ8fM6JR/AE1aBLxKwzElwrZLgKZlcReE94Jk4qQ
   vXA6Mnu6AGkYQcR/myk5lnMaG3VZcF0VHJxDOv458TE9g6m0MSNn8tcmZ
   2sB+5M2WJBr5Se/dtqwqVIDNfqco8b+pSk5Icik5P+Lw2AywZ/COJrN6N
   vFqxf8rZxeQgAIIvjGbZsZtKJzULJXKLKw1augB3P+DBftlPWc8Y0U5It
   3JhcqrLQkwXCigmT/yoBBRnYHsbykunOmdB3DH3S8Ug9YT1aa+hcjAR/u
   GC6NSsUMyuO/rCkrfuMUtntx8yPVb3Mj3IAP1xdMBvyLN/dbPy0JLnAoy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336467710"
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="336467710"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 19:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,247,1647327600"; 
   d="scan'208";a="629681386"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 May 2022 19:40:59 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntKTi-0001eu-Jk;
	Tue, 24 May 2022 02:40:58 +0000
Date: Tue, 24 May 2022 10:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>, axboe@kernel.dk, hch@lst.de,
	snitzer@redhat.com, damien.lemoal@opensource.wdc.com, hare@suse.de,
	Johannes.Thumshirn@wdc.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org, dm-devel@redhat.com,
	dsterba@suse.com, jiangbo.365@bytedance.com,
	linux-kernel@vger.kernel.org, gost.dev@samsung.com,
	linux-block@vger.kernel.org, jaegeuk@kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 5/7] null_blk: allow non power of 2 zoned devices
Message-ID: <202205241034.izkLMTcH-lkp@intel.com>
References: <20220523161601.58078-6-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523161601.58078-6-p.raghav@samsung.com>

Hi Pankaj,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on device-mapper-dm/for-next linus/master hch-configfs/for-next v5.18 next-20220523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/block-make-blkdev_nr_zones-and-blk_queue_zone_no-generic-for-npo2-zsze/20220524-011616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-randconfig-r045-20220523 (https://download.01.org/0day-ci/archive/20220524/202205241034.izkLMTcH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3d3c81da0adbd40eb0d2125327b7e227582b2a37
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pankaj-Raghav/block-make-blkdev_nr_zones-and-blk_queue_zone_no-generic-for-npo2-zsze/20220524-011616
        git checkout 3d3c81da0adbd40eb0d2125327b7e227582b2a37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__hexagon_umoddi3" [drivers/block/null_blk/null_blk.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
