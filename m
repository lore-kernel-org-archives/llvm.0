Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0313AC8;
	Tue, 19 Dec 2023 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUajptrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702977309; x=1734513309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOL8ZKwz7GNwsHPezvVM3RDSK1o1GJ3RvxobIk/DNQY=;
  b=jUajptrhp9wJfOxQCGgUnv15ej5mbLhdXIEfcv1aNxOQKElCQc39f4Hn
   jZnpr11owucFqXS0qbCOJm/MqVvkvxF0yHNb8p3ElG49stOZxNjxNeoTA
   IlA6zLJzJDcr9791E8IGxlpSgMPO306BdNjcG2S3NYhO7g7LUFIJmwEaf
   Nj+TkNOlSSBl/zAvZcV3K+e6McXKuKCLQ9oO516yZ/Lf6vyNkre0JQB3Z
   u1CLFY2hJPe00SUNplnIbXwPZ1Ebpcc/bEi8wunDIy7ERHeyvNXgvw96N
   Nn+XEuozDh8sfs0eiF3k/BoeakUzO6pYZN4XAVpS5PP1R2EIUdjYx9aqq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2455228"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="2455228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 01:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="841818307"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="841818307"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Dec 2023 01:15:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFWBt-00056L-2R;
	Tue, 19 Dec 2023 09:15:05 +0000
Date: Tue, 19 Dec 2023 17:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:mq-deadline 4/4] block/mq-deadline.c:118:17: warning:
 unused variable 'prio_to_ioprio_class'
Message-ID: <202312191725.KvbgnSwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux mq-deadline
head:   f6b0783d68d20926e1e54a081cfd5d85a05e4cfd
commit: f6b0783d68d20926e1e54a081cfd5d85a05e4cfd [4/4] block/mq-deadline: Prevent zoned write reordering due to I/O prioritization
config: i386-buildonly-randconfig-003-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191725.KvbgnSwt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191725.KvbgnSwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191725.KvbgnSwt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/mq-deadline.c:118:17: warning: unused variable 'prio_to_ioprio_class' [-Wunused-const-variable]
   static const u8 prio_to_ioprio_class[] = {
                   ^
   1 warning generated.


vim +/prio_to_ioprio_class +118 block/mq-deadline.c

   117	
 > 118	static const u8 prio_to_ioprio_class[] = {
   119		[DD_RT_PRIO]	= IOPRIO_CLASS_RT,
   120		[DD_BE_PRIO]	= IOPRIO_CLASS_BE,
   121		[DD_IDLE_PRIO]	= IOPRIO_CLASS_IDLE,
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
