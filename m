Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AC221579;
	Mon,  7 Apr 2025 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047251; cv=none; b=f5C3O8X32TYAvEk1Gjy1Y7fne5Hk4v6OLn2IPDCNXhc0r/ZWbyg2SObB/bqT6P+xL66jIDSfn0FdXBHxcIgav8eGGrBkOlz7A4MilyBFcJVK+V072JOB0kIgCxCxa5n9ik2Q2jVqXLPlHbbeUxC6UxI+F47QL/JYIfI01VhfsNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047251; c=relaxed/simple;
	bh=wwJBiJeKkSPe6kcf4zOW6RqX05gQTd0yHo0lgGGty/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTkBMhaHSxhHu5pNHxvCQ3yOPAYQxLqd/QZEaIbXkhVI9lSfjCOWmsG1B/hfdjLq6fNMpQ9uUJUyKr5jbpbV1xal436zOr/+p0hamB7MrwYGYI+EvANR0hy9sBsNbFrYmjmNZZSgVzPdgS6haqerdS/fs44zuyPeko8+Sm56lO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfjajgKq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfjajgKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744047249; x=1775583249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwJBiJeKkSPe6kcf4zOW6RqX05gQTd0yHo0lgGGty/s=;
  b=nfjajgKqM17jsxSZtF+RYPmzEeY6LQK5x9Caq+v4Fzt12sv8kNj80aZj
   Jfds6m0rW5Y8uq0uwVih/ii7qtomyPcFzh3fsytja+hE+NJ5DXrba15Jc
   HooKZo/l9vgpNAb/tAjEyFi2fpBtoT7Y1vKIoFKQ8OhD94gd76O0mg8b0
   LvpXcjZMTSf6BD0JJ//ngdZ7tik6732kOpe8Ni/lw2pO+GkC4yco4xEy8
   UTBUxQMEtt3Wt0xbalDszyCWuj4rLOAFN0cu8sohQKv1JRilQpALUSWCM
   BcM992P3rRD2lkquaytiRBX5ixvwwy1+5C+Iwpqo5wlgU1zQjyEZswC94
   w==;
X-CSE-ConnectionGUID: bTJeKQA2TYqmao/rsvn4RA==
X-CSE-MsgGUID: sRjLjE53Ti2IGQ/viHOWpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48158728"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="48158728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:34:08 -0700
X-CSE-ConnectionGUID: H031O1ksQHmNW5uZ5M7Kcw==
X-CSE-MsgGUID: ftI/Cg1sSWy8xCyT3BwvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="133223000"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Apr 2025 10:34:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1qMF-0003el-2z;
	Mon, 07 Apr 2025 17:34:03 +0000
Date: Tue, 8 Apr 2025 01:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.15 3/4] drivers/nvme/host/core.c:4302:5: warning:
 'CONFIG_NVME_MULTIPATH' is not defined, evaluates to 0
Message-ID: <202504080139.KuphZ8ZZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.15
head:   9e270930d683ff0207fed7f303988a7ad63ddfcb
commit: a98aa32696a1a19814a2f97853400b28622c6a8f [3/4] nvme: re-read ANA log page after ns scan completes
config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080139.KuphZ8ZZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/core.c:4302:5: warning: 'CONFIG_NVME_MULTIPATH' is not defined, evaluates to 0 [-Wundef]
    4302 | #if CONFIG_NVME_MULTIPATH
         |     ^
   1 warning generated.


vim +/CONFIG_NVME_MULTIPATH +4302 drivers/nvme/host/core.c

  4254	
  4255	static void nvme_scan_work(struct work_struct *work)
  4256	{
  4257		struct nvme_ctrl *ctrl =
  4258			container_of(work, struct nvme_ctrl, scan_work);
  4259		int ret;
  4260	
  4261		/* No tagset on a live ctrl means IO queues could not created */
  4262		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE || !ctrl->tagset)
  4263			return;
  4264	
  4265		/*
  4266		 * Identify controller limits can change at controller reset due to
  4267		 * new firmware download, even though it is not common we cannot ignore
  4268		 * such scenario. Controller's non-mdts limits are reported in the unit
  4269		 * of logical blocks that is dependent on the format of attached
  4270		 * namespace. Hence re-read the limits at the time of ns allocation.
  4271		 */
  4272		ret = nvme_init_non_mdts_limits(ctrl);
  4273		if (ret < 0) {
  4274			dev_warn(ctrl->device,
  4275				"reading non-mdts-limits failed: %d\n", ret);
  4276			return;
  4277		}
  4278	
  4279		if (test_and_clear_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events)) {
  4280			dev_info(ctrl->device, "rescanning namespaces.\n");
  4281			nvme_clear_changed_ns_log(ctrl);
  4282		}
  4283	
  4284		mutex_lock(&ctrl->scan_lock);
  4285		if (!nvme_id_cns_ok(ctrl, NVME_ID_CNS_NS_ACTIVE_LIST)) {
  4286			nvme_scan_ns_sequential(ctrl);
  4287		} else {
  4288			/*
  4289			 * Fall back to sequential scan if DNR is set to handle broken
  4290			 * devices which should support Identify NS List (as per the VS
  4291			 * they report) but don't actually support it.
  4292			 */
  4293			ret = nvme_scan_ns_list(ctrl);
  4294			if (ret > 0 && ret & NVME_STATUS_DNR)
  4295				nvme_scan_ns_sequential(ctrl);
  4296		}
  4297		mutex_unlock(&ctrl->scan_lock);
  4298	
  4299		/* Requeue if we have missed AENs */
  4300		if (test_bit(NVME_AER_NOTICE_NS_CHANGED, &ctrl->events))
  4301			nvme_queue_scan(ctrl);
> 4302	#if CONFIG_NVME_MULTIPATH
  4303		else
  4304			/* Re-read the ANA log page to not miss updates */
  4305			queue_work(nvme_wq, &ctrl->ana_work);
  4306	#endif
  4307	}
  4308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
