Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481777C
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 19:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653419292; x=1684955292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=McrA50umS7uFNif0OKWyvZB3Gg9wX6U3OTSnaLvoS2o=;
  b=DLh6++HQLO4bH2PEb83CowW9IPaPK47mgCytTW1ObJmk/lINBJR9tb9T
   wc4cnLUVksJkh0qcZvayxcJ8as6Wj6zOed4TdkTYTL5biSHiskKbc4BpU
   H2k+dH7s9nPleRT7nq4ENTToDw0litFX+kcr8HXzfqsFrTF82He02Kegy
   ob+6twRut7cCyf2GEgy4AUX2kYpFiKKS2NrfrN7bCnSifKDzOTGyiIrRK
   Mpd1S6NPfIoQ2eF+1LeS3Whc05S6hSDEC+PBTZFQxlLcvFp5mljsHFLbq
   +kJNs5xVLtDUhSXBKJEBPF6UfQKPBMzKrjplwnTQYyhe90i1U8IsaqgNi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="272449738"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="272449738"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 12:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="630022328"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2022 12:08:07 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntZt1-0002Mu-5D;
	Tue, 24 May 2022 19:08:07 +0000
Date: Wed, 25 May 2022 03:07:57 +0800
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
Message-ID: <202205250258.tP8p4wdJ-lkp@intel.com>
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
[also build test ERROR on device-mapper-dm/for-next linus/master hch-configfs/for-next v5.18 next-20220524]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/block-make-blkdev_nr_zones-and-blk_queue_zone_no-generic-for-npo2-zsze/20220524-011616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220525/202205250258.tP8p4wdJ-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __umoddi3
   >>> referenced by zoned.c:89 (drivers/block/null_blk/zoned.c:89)
   >>>               block/null_blk/zoned.o:(null_init_zoned_dev) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
