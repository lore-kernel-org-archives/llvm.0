Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D17A3563F8;
	Fri, 20 Mar 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990417; cv=none; b=io3xuS7DQQ3uxfwZXs+8rwkU9Ao+mI1bTjOivGo+u3PnCtcSAxpf/nnTbIX5osolnlVOZ1bUVkbkpq/bLIxW+xZyFGloZt993GF+OJ2Z+Cu90LlOXQQDNDsyjoMl0ER4UAyjq4mRc9fecKQZNji+GFVJ9dKNIKIwEpzNVxUx1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990417; c=relaxed/simple;
	bh=uBEvHkVjcBklcgC52UtPKhltjj0pTxjl1G1kzeuwrtg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=niPuAqm1kOQzmaVUjroO1CaDKfId6vIelYqwvMVG1+ae62lwzysv0qmqRg4nO5a7vhNdp2iDhPlxOML6BBiudg0dyS4oKzvjr7mo+39y3ZxM3w7rtG7pc5zzcrvLTLIqbt2JGkYmXGnzeevgLNcoQ8mauKQDVhaXYJo29wBmL7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEuHgrOS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEuHgrOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773990417; x=1805526417;
  h=date:from:to:cc:subject:message-id;
  bh=uBEvHkVjcBklcgC52UtPKhltjj0pTxjl1G1kzeuwrtg=;
  b=EEuHgrOS7/3xY2gqhes4yonOc9qQmwuea+1ReRWmXUnzmh68qM+cZF+S
   /S6U/NutF9fZyMNVu7ip7Y1DJpJgVGnm9cgv964tKE4OVDfvFAp8RFN3V
   UXeh0FXXpgbctllaG4IzNaR9NcAJU3FioG3GrnqZfm6ztyKgNHNlzHm1L
   /HT7A/I1zsMIeqKdtTvjtGmiQNe7LcvXYyNg3+vOwV4jKmfvIGb2RoWcV
   Cvrc8++Bm5dKM58Kj5L4nzba21EaVcuvDbcB5pHLsOVvDEIS3akeWN7BV
   f+dC8zzu3mpL4tzk4s6G4GPUpXfvwLL0RnI7wIlwFj0QkBvuqSzfs6X69
   A==;
X-CSE-ConnectionGUID: IjG+sHacSv6R0PrbhEsZtg==
X-CSE-MsgGUID: DRtsdp2eRkecqKGg9xcNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75104800"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75104800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:06:54 -0700
X-CSE-ConnectionGUID: gwfVsj/eQvmAOv9UNwnc3A==
X-CSE-MsgGUID: waSkPAmhQCGdMVtm/7mbPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246235034"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 00:06:52 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3TwX-0000000025p-20Yh;
	Fri, 20 Mar 2026 07:06:49 +0000
Date: Fri, 20 Mar 2026 15:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:socfpga_firmware_for_v7.1 2/2]
 drivers/firmware/stratix10-svc.c:271:33: error: array has incomplete element
 type 'struct stratix10_svc_chan'
Message-ID: <202603201536.KvAI7CLq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_firmware_for_v7.1
head:   6146df4b6330e6ec1a1273f77f817bc917548f69
commit: 6146df4b6330e6ec1a1273f77f817bc917548f69 [2/2] firmware: stratix10-svc: kmalloc_array + kzalloc to flex
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201536.KvAI7CLq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201536.KvAI7CLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201536.KvAI7CLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/stratix10-svc.c:271:33: error: array has incomplete element type 'struct stratix10_svc_chan'
     271 |         struct stratix10_svc_chan chans[] __counted_by(num_chans);
         |                                        ^
   include/linux/firmware/intel/stratix10-svc-client.h:78:8: note: forward declaration of 'struct stratix10_svc_chan'
      78 | struct stratix10_svc_chan;
         |        ^
   1 error generated.


vim +271 drivers/firmware/stratix10-svc.c

   242	
   243	/**
   244	 * struct stratix10_svc_controller - service controller
   245	 * @dev: device
   246	 * @num_chans: number of channels in 'chans' array
   247	 * @num_active_client: number of active service client
   248	 * @node: list management
   249	 * @genpool: memory pool pointing to the memory region
   250	 * @complete_status: state for completion
   251	 * @invoke_fn: function to issue secure monitor call or hypervisor call
   252	 * @svc: manages the list of client svc drivers
   253	 * @sdm_lock: only allows a single command single response to SDM
   254	 * @actrl: async control structure
   255	 * @chans: array of service channels
   256	 *
   257	 * This struct is used to create communication channels for service clients, to
   258	 * handle secure monitor or hypervisor call.
   259	 */
   260	struct stratix10_svc_controller {
   261		struct device *dev;
   262		int num_chans;
   263		int num_active_client;
   264		struct list_head node;
   265		struct gen_pool *genpool;
   266		struct completion complete_status;
   267		svc_invoke_fn *invoke_fn;
   268		struct stratix10_svc *svc;
   269		struct mutex sdm_lock;
   270		struct stratix10_async_ctrl actrl;
 > 271		struct stratix10_svc_chan chans[] __counted_by(num_chans);
   272	};
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
