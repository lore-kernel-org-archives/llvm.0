Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D31DFF7;
	Thu,  3 Apr 2025 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743646878; cv=none; b=rQXcq+ELV0sZ7kA5/1yRyXWkLMqyg2I2yWqx47Lxlb9lsgxtbFIAHcfktDeh5WqZzRd6RFgcXWWsKg3qZSQkY5nCS/Rp7ja7Fs3K4TjHwClR653JJuePoMIWkJk0+SLTTW/9fUcThZOcCEqssTKSWUfxyeuWTl180QhnW8WbGt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743646878; c=relaxed/simple;
	bh=J0dY84H27DGo/Qr7C9owkD8kmZ7i90opDr8P3/WIZKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nhk4cg6+T+Wf3tO84XCfhaWxF4OVrgQsqlpR14wkijM3otflLFP5yfxxbwQNMxSAvVYiI0S+S97mI9k3L2HJNTWY8L7PnJrWN8zAXleYe7fKCIvfMEdmAUyB/bTg4TVLnMtusClJoQ/LLPAEFdZrzVuxPvCmDp3LB2xh2KRUlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiAaSwKv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiAaSwKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743646877; x=1775182877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0dY84H27DGo/Qr7C9owkD8kmZ7i90opDr8P3/WIZKc=;
  b=JiAaSwKvah+tKHNbwxi4LEUdTfwbw5Tu5sGNEaYtPn1eL7P7Z4jLnLV7
   0Kxvx1HAAGlxh0Pq7wTj//RCdIu3u9son7/9dlkK1ADC8jerVivor9gTP
   2998QUKfli6T1GZP4kqn2tg1ha9VAeUmfQPvNW6iPrbHa2XGZPPhdOtwR
   sVqsjAD39mqxuMlcUh30xgpqeVwrApY2/4y/B3v0gP3EsapUTRrapb2nD
   HiuHW1Ryphp8AWFbftb+3oLkRHq6CX+7McBn1lPRwy3jOVZHweSVEKUQn
   RQHsyEw1/59nowyHWKgHI0SjGHX0NOFiD8JyJBqQKSJUSqrFohM7oNNav
   A==;
X-CSE-ConnectionGUID: ZZwc3qQ+RcC/tqFquj14cQ==
X-CSE-MsgGUID: 1+hYHzEKR92rFMmKm2EXlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44922576"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="44922576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:21:15 -0700
X-CSE-ConnectionGUID: 9Z6MztH7S0CucY8hwwpGEw==
X-CSE-MsgGUID: b3eM2CM+Qq27Yx+zWKHzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="126778259"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Apr 2025 19:21:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0ACd-000BAX-1M;
	Thu, 03 Apr 2025 02:21:11 +0000
Date: Thu, 3 Apr 2025 10:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 5/18]
 drivers/nvme/host/core.c:4301:30: error: no member named 'ana_work' in
 'struct nvme_ctrl'; did you mean 'ka_work'?
Message-ID: <202504031020.hIzhsxCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git ns-migration
head:   1cd2ac8db713fdf42bc7bb10329d795f7aee4f1f
commit: 1da4a7cfb2913cf002749d15648b4026ebbe7eee [5/18] nvme: re-read ANA log page after ns scan completes
config: i386-buildonly-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031020.hIzhsxCt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031020.hIzhsxCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031020.hIzhsxCt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:4301:30: error: no member named 'ana_work' in 'struct nvme_ctrl'; did you mean 'ka_work'?
    4301 |                 queue_work(nvme_wq, &ctrl->ana_work);
         |                                            ^~~~~~~~
         |                                            ka_work
   drivers/nvme/host/nvme.h:356:22: note: 'ka_work' declared here
     356 |         struct delayed_work ka_work;
         |                             ^
   1 error generated.


vim +4301 drivers/nvme/host/core.c

  4251	
  4252	static void nvme_scan_work(struct work_struct *work)
  4253	{
  4254		struct nvme_ctrl *ctrl =
  4255			container_of(work, struct nvme_ctrl, scan_work);
  4256		int ret;
  4257	
  4258		/* No tagset on a live ctrl means IO queues could not created */
  4259		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE || !ctrl->tagset)
  4260			return;
  4261	
  4262		/*
  4263		 * Identify controller limits can change at controller reset due to
  4264		 * new firmware download, even though it is not common we cannot ignore
  4265		 * such scenario. Controller's non-mdts limits are reported in the unit
  4266		 * of logical blocks that is dependent on the format of attached
  4267		 * namespace. Hence re-read the limits at the time of ns allocation.
  4268		 */
  4269		ret = nvme_init_non_mdts_limits(ctrl);
  4270		if (ret < 0) {
  4271			dev_warn(ctrl->device,
  4272				"reading non-mdts-limits failed: %d\n", ret);
  4273			return;
  4274		}
  4275	
  4276		if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events)) {
  4277			dev_info(ctrl->device, "rescanning namespaces.\n");
  4278			nvme_clear_changed_ns_log(ctrl);
  4279		}
  4280	
  4281		mutex_lock(&ctrl->scan_lock);
  4282		if (!nvme_id_cns_ok(ctrl, NVME_ID_CNS_NS_ACTIVE_LIST)) {
  4283			nvme_scan_ns_sequential(ctrl);
  4284		} else {
  4285			/*
  4286			 * Fall back to sequential scan if DNR is set to handle broken
  4287			 * devices which should support Identify NS List (as per the VS
  4288			 * they report) but don't actually support it.
  4289			 */
  4290			ret = nvme_scan_ns_list(ctrl);
  4291			if (ret > 0 && ret & NVME_STATUS_DNR)
  4292				nvme_scan_ns_sequential(ctrl);
  4293		}
  4294		mutex_unlock(&ctrl->scan_lock);
  4295	
  4296		/* Requeue if we have missed AENs */
  4297		if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
  4298			nvme_queue_scan(ctrl);
  4299		else
  4300			/* Re-read the ANA log page to not miss updates */
> 4301			queue_work(nvme_wq, &ctrl->ana_work);
  4302	}
  4303	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
