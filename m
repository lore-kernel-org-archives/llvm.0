Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9E34CD5;
	Thu, 30 Nov 2023 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVb2CurU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701364866; x=1732900866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diAJeCdnQjw+e9G0JIeQcng2Y3C0RLXwWF1DQEokzo4=;
  b=UVb2CurUyOHx94SWCj0qTeSJg3kl6TYfmdYI3vRWl0LiW32FaU3jBU9S
   GdTLQOrLsjuhmDbIYtYoRHZYqAwtAmK23cI6Og7raw5LVeLZBTVsJvDF1
   wuRGFHlnGnuaNUAqrk5D3S1XZ07eWiwc580tVUIWgXMNe+TxbW1ihUGhY
   3I9k1OiA/Rbci70DVPnOMLghqa4rVxGZwyQLgfJlL9bDh0HGCL9AHPyTB
   P8Bi7Y3xUxV7k49M339HqyBKGEmESLeJXISsW2GyXj/EptinosCesHA6V
   c+YhyxVh2qSZMrsFTrQnrx+fewyWWGfnlcnuGwqQS1T2LEvx+LTMYBvYL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="372744654"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="372744654"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 09:21:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101008868"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1101008868"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2023 09:21:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8kij-0002RU-38;
	Thu, 30 Nov 2023 17:21:01 +0000
Date: Fri, 1 Dec 2023 01:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/2]
 drivers/firmware/arm_scmi/ffa.c:337:6: warning: no previous prototype for
 function 'ffa_shm_free_kernel_buf'
Message-ID: <202312010122.73mxP5BP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   58f815a694fe99b6067c8e74a23f7ef193a7f76e
commit: 4e6e5543e62399d3e18c26257137593114fb63cc [1/2] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231201/202312010122.73mxP5BP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231201/202312010122.73mxP5BP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010122.73mxP5BP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/ffa.c:337:6: warning: no previous prototype for function 'ffa_shm_free_kernel_buf' [-Wmissing-prototypes]
     337 | void ffa_shm_free_kernel_buf(struct tee_shm *shm)
         |      ^
   drivers/firmware/arm_scmi/ffa.c:337:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     337 | void ffa_shm_free_kernel_buf(struct tee_shm *shm)
         | ^
         | static 
   1 warning generated.


vim +/ffa_shm_free_kernel_buf +337 drivers/firmware/arm_scmi/ffa.c

   336	
 > 337	void ffa_shm_free_kernel_buf(struct tee_shm *shm)
   338	{
   339		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
   340		const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
   341		int ret;
   342	
   343		/* Nothing to free */
   344		if (shm == NULL)
   345			return;
   346	
   347		// reclaim shared memory
   348		ret = mem_ops->memory_reclaim(shm->sec_world_id, 0);
   349		if (ret)
   350			pr_err("mem_reclaim: 0x%llx %d", shm->sec_world_id, ret);
   351	
   352		free_pages((unsigned long)shm->kaddr, get_order(shm->size));
   353		kfree(shm);
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
