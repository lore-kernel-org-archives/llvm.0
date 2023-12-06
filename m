Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B903BB3E;
	Wed,  6 Dec 2023 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NryZGrfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701871206; x=1733407206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/2YBOUC3xYwnwozhB9iMS3tfHNIKdngleYIbf9eFB/w=;
  b=NryZGrfD1M55MiucglMtyaZJX45fCvxKaZgbqi3NANH0SYx9tHwqEfg3
   p3PVlafaggZabXIpjIaVaJ14rOLvTZvnGJztMlVzSdJ8GiVEqPSnH6TSc
   z2uTPvYzJHissgWsxNMmftBiW0oKcqWf+x8yQ8OTOAQZ4PO18N6krUEEL
   GTffPwNkd/aygy5VLK3AWRu6UR7lb3+JJvzDw6yh2y3xdP1dTc1+6XQF2
   Stw/WUvVC5K3J6Ex5ts1SB35aNqlZgrWbFXjsjv4pQD/lgS/Xgh0jVHwv
   +BjOEN8fzamGpvqxFmShAmz+kI+VUHr2kH/MI+Jc/AshWP4F3PM4Ao7DC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374242532"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="374242532"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 06:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="841850768"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="841850768"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 06 Dec 2023 06:00:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAsRV-000At4-0d;
	Wed, 06 Dec 2023 14:00:01 +0000
Date: Wed, 6 Dec 2023 21:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -next RFC] block: support to account io_ticks precisely
Message-ID: <202312062106.irqU9bgB-lkp@intel.com>
References: <20231205093743.1823351-1-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205093743.1823351-1-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231205]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-support-to-account-io_ticks-precisely/20231205-174024
base:   next-20231205
patch link:    https://lore.kernel.org/r/20231205093743.1823351-1-yukuai1%40huaweicloud.com
patch subject: [PATCH -next RFC] block: support to account io_ticks precisely
config: i386-buildonly-randconfig-002-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062106.irqU9bgB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062106.irqU9bgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062106.irqU9bgB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-sysfs.c:489:11: warning: unused variable 'err' [-Wunused-variable]
           int ret, err;
                    ^
   1 warning generated.


vim +/err +489 block/blk-sysfs.c

   484	
   485	static ssize_t
   486	queue_iostats_store(struct request_queue *q, const char *page, size_t count)
   487	{
   488		unsigned long nr;
 > 489		int ret, err;
   490	
   491		ret = queue_var_store(&nr, page, count);
   492		if (ret < 0)
   493			return ret;
   494	
   495		if (nr > 2)
   496			return -EINVAL;
   497	
   498		if (nr == 0) {
   499			blk_queue_flag_clear(QUEUE_FLAG_IO_STAT, q);
   500			blk_queue_flag_clear(QUEUE_FLAG_PRECISE_IO_STAT, q);
   501		} else if (nr == 1) {
   502			blk_queue_flag_set(QUEUE_FLAG_IO_STAT, q);
   503			blk_queue_flag_clear(QUEUE_FLAG_PRECISE_IO_STAT, q);
   504		} else {
   505			blk_queue_flag_set(QUEUE_FLAG_IO_STAT, q);
   506			blk_queue_flag_set(QUEUE_FLAG_PRECISE_IO_STAT, q);
   507		}
   508	
   509		return count;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
