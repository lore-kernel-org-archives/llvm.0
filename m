Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9016414;
	Mon, 22 May 2023 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684778407; x=1716314407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1BMuWArlbkhI4n6XEsctkN+45WrQ1AMrDanQszjkaM=;
  b=Xb73RvQOgGHDmKzPheSkKKxoYcWJLArzHuOsDkZE0ZjcA5PN12/oNRzj
   ZOqbZ8ZdBXI8Dwgya3F4vytw7c0EkmhTwFrClt9tRiEQ4zdAGMa3z4Oe+
   ZYdVqasjtVLpl7NsiDJqKKizp9sQpGrzAGWa7Ha4oaIvIWT7duSET9/Bn
   WbPAdaM3+WWdb19aslLaVaqWUgCUx+yzj6D0rwJQKnKQ6XwMeA32uTcSq
   GaL0F44PyHGHKuVD8d4TTqrDVlUq1Yfkr0My/mxgmLScKQldn/kq8l/Fy
   fcQJPzQk22BkiPc31AYFlQ1T35Oaf+p+8HlpPRNY9z2Q8C0wVhCXBAW+H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="381234018"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="381234018"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 10:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="734372727"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="734372727"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 May 2023 10:59:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q19p2-000D2Z-1M;
	Mon, 22 May 2023 17:59:52 +0000
Date: Tue, 23 May 2023 01:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>,
	Nitesh Shetty <nj.shetty@samsung.com>, Jens Axboe <axboe@kernel.dk>
Subject: [linux-stable-rc:queue/4.14 22/46] drivers/block/null_blk.c:1785:3:
 error: void function 'null_validate_conf' should not return a value
Message-ID: <202305230134.IWLqX1Hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.14
head:   840fe5c557003b7b70dd1c5e6bd6b057f8f671a2
commit: 1472d580894fe831ff4a2274ba77a3abe65aaf37 [22/46] null_blk: Always check queue mode setting from configfs
config: mips-randconfig-r036-20230522 (https://download.01.org/0day-ci/archive/20230523/202305230134.IWLqX1Hz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=1472d580894fe831ff4a2274ba77a3abe65aaf37
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.14
        git checkout 1472d580894fe831ff4a2274ba77a3abe65aaf37
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305230134.IWLqX1Hz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/null_blk.c:1785:3: error: void function 'null_validate_conf' should not return a value [-Wreturn-type]
                   return -EINVAL;
                   ^      ~~~~~~~
   1 error generated.


vim +/null_validate_conf +1785 drivers/block/null_blk.c

  1780	
  1781	static void null_validate_conf(struct nullb_device *dev)
  1782	{
  1783		if (dev->queue_mode == NULL_Q_RQ) {
  1784			pr_err("legacy IO path is no longer available\n");
> 1785			return -EINVAL;
  1786		}
  1787	
  1788		dev->blocksize = round_down(dev->blocksize, 512);
  1789		dev->blocksize = clamp_t(unsigned int, dev->blocksize, 512, 4096);
  1790		if (dev->use_lightnvm && dev->blocksize != 4096)
  1791			dev->blocksize = 4096;
  1792	
  1793		if (dev->use_lightnvm && dev->queue_mode != NULL_Q_MQ)
  1794			dev->queue_mode = NULL_Q_MQ;
  1795	
  1796		if (dev->queue_mode == NULL_Q_MQ && dev->use_per_node_hctx) {
  1797			if (dev->submit_queues != nr_online_nodes)
  1798				dev->submit_queues = nr_online_nodes;
  1799		} else if (dev->submit_queues > nr_cpu_ids)
  1800			dev->submit_queues = nr_cpu_ids;
  1801		else if (dev->submit_queues == 0)
  1802			dev->submit_queues = 1;
  1803	
  1804		dev->queue_mode = min_t(unsigned int, dev->queue_mode, NULL_Q_MQ);
  1805		dev->irqmode = min_t(unsigned int, dev->irqmode, NULL_IRQ_TIMER);
  1806	
  1807		/* Do memory allocation, so set blocking */
  1808		if (dev->memory_backed)
  1809			dev->blocking = true;
  1810		else /* cache is meaningless */
  1811			dev->cache_size = 0;
  1812		dev->cache_size = min_t(unsigned long, ULONG_MAX / 1024 / 1024,
  1813							dev->cache_size);
  1814		dev->mbps = min_t(unsigned int, 1024 * 40, dev->mbps);
  1815		/* can not stop a queue */
  1816		if (dev->queue_mode == NULL_Q_BIO)
  1817			dev->mbps = 0;
  1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
