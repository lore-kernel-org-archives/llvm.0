Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AEF400E1E;
	Mon, 15 Jun 2026 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542673; cv=none; b=Qp/nHftXWXVA+2FCx1wmGiwFDNdpDxT07Jt/p3Iy0BWqPVvzEQVajI8Z70P9s1xAcXxBBVgB9k2dux4yg9Q8GAQhJlkXEbdsT0NmBZ7zHulF3VOD7a16UtHkuIrPy0S2WTuJHiuAtSiIThZAjD9JDRcdvofIedAkOu7clXnviV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542673; c=relaxed/simple;
	bh=GPhIJrfZK2fNXF5EAis/aXaB179UKbHiBsDw64/Uh0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZSF46zhAE754tdFtXKGsPzo2Lp7spIOrRNkSberUJQ8gOuLTepfymINBOpsKST+Q3J8MwO4H2os+GFTa0YAjlAeMCvU5e0qdzRZ7RAXlHX9t/345/8xRg9ELkw/jtYo+OJ/P1GKfw7Nj8iheLmIcUtc385G9YvpsyUMwH+BlAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mziaRa90; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mziaRa90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781542672; x=1813078672;
  h=date:from:to:cc:subject:message-id;
  bh=GPhIJrfZK2fNXF5EAis/aXaB179UKbHiBsDw64/Uh0g=;
  b=mziaRa90UFzJNIakxE8Imk11XK2ZN26RuniBKi3mbKb2NaYsBsK/YSUc
   uQ3IpuVzbAqJvgzJRKqk7r3tiwVqltoBwEzOLdFio0VXsRPLlVj2SwX+5
   uI9s97msi6EPJ5SS/+NPFWpY4W5VbfUnDifgkjj+76+zsv3llIXVqRIN2
   AQycr1AUeD9e4BxkyE7eC5t6M+Zt44gGKDop1QItzVnCfjQs9vYFoDxJR
   KG//MGyjVutp8/ipTYv2qhncLas8YTFnWVzphCWMDwNOOOnnZWSHM3n5x
   o4vvQvS2+zIcGD4OzVgLob5GTsMHtphSTJZMEHsslJ+mfJBGTkW5zgEge
   Q==;
X-CSE-ConnectionGUID: p7YfqbvPQdWnNeyOE9mrzg==
X-CSE-MsgGUID: K2E3ME/CRNGPIAFZ3kW69g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="85923072"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="85923072"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 09:57:52 -0700
X-CSE-ConnectionGUID: XIdqMYR7RTG3KuZoqTjJrg==
X-CSE-MsgGUID: dOrcfggARsGQ8krntQD/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="252634298"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jun 2026 09:57:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZAd8-00000000S9O-14VP;
	Mon, 15 Jun 2026 16:57:46 +0000
Date: Tue, 16 Jun 2026 00:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [axboe:for-7.2/block 48/73] include/linux/blkdev.h:1750:15:
 error: use of undeclared identifier 'bdev'
Message-ID: <202606160003.4zv1ceMM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   c7c76f9232bd34835d821f14abdc5fafc17bc938
commit: 3033c86fa1a8bb31d0a13738fe8c5f9e5bbaf98a [48/73] block/bdev: Annotate the blk_holder_ops callback functions
config: x86_64-randconfig-075-20260615 (https://download.01.org/0day-ci/archive/20260616/202606160003.4zv1ceMM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160003.4zv1ceMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160003.4zv1ceMM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:43:
>> include/linux/blkdev.h:1750:15: error: use of undeclared identifier 'bdev'
    1750 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1756:15: error: use of undeclared identifier 'bdev'
    1756 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1762:15: error: use of undeclared identifier 'bdev'
    1762 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   include/linux/blkdev.h:1768:15: error: use of undeclared identifier 'bdev'
    1768 |                 __releases(&bdev->bd_holder_lock);
         |                             ^~~~
   kernel/sched/core.c:8054:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    8054 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8029:1: note: array 'preempt_modes' declared here
    8029 | const char *preempt_modes[] = {
         | ^
   1 warning and 4 errors generated.


vim +/bdev +1750 include/linux/blkdev.h

  1747	
  1748	struct blk_holder_ops {
  1749		void (*mark_dead)(struct block_device *bdev, bool surprise)
> 1750			__releases(&bdev->bd_holder_lock);
  1751	
  1752		/*
  1753		 * Sync the file system mounted on the block device.
  1754		 */
  1755		void (*sync)(struct block_device *bdev)
  1756			__releases(&bdev->bd_holder_lock);
  1757	
  1758		/*
  1759		 * Freeze the file system mounted on the block device.
  1760		 */
  1761		int (*freeze)(struct block_device *bdev)
  1762			__releases(&bdev->bd_holder_lock);
  1763	
  1764		/*
  1765		 * Thaw the file system mounted on the block device.
  1766		 */
  1767		int (*thaw)(struct block_device *bdev)
  1768			__releases(&bdev->bd_holder_lock);
  1769	};
  1770	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
