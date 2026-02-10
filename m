Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862033D4F4;
	Tue, 10 Feb 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718719; cv=none; b=LfV+USvShJIout1gkJRTyIhigr7Q+7Ib1WViGT4l9oD+SodSL2bSMLSwChhjhVh7KPT7+8RR/oCFwtM0w0PUyYuoEKZ7UTD6ptFDzW1/gtOay2EMEc54IlqZfLRsd+M61RSFtpIbDRFHckth8QPRD86jNcv3D6Bb1JYOA1Rx7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718719; c=relaxed/simple;
	bh=VByuqXrEQmBsKkYivqT/TtUcuoLQ4j1KAE0Ku65oy+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvV8NBWYdvSyU5xioKJdVWXY/KcW+m7wCzwS0c7gYDJazWD7WEc6Sio7R+4Kn9eN9TGzOXFe8oYAIHBXtQb/AxnBZg9bZOccfWH39OyRtR1AefSK3tX1balDkH89+UIYjKmVkS6L2f7KtvdeBc9MCQWrQXcmsSAkpuf0rH2Pyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hAgrsoGx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hAgrsoGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770718718; x=1802254718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VByuqXrEQmBsKkYivqT/TtUcuoLQ4j1KAE0Ku65oy+A=;
  b=hAgrsoGxzUBmuh5rgvjjfELbJaQGpFTEPlJbFVEeJP9QjQ0YJi+eite+
   UrqG9X6AtQwecxRJLlnPKlYCEblou1WzXj2eRT6XxliNCkSsUrdkgUl4H
   30tCyGrmVy8svLZkDhMEC6Yp7P4fOydIrGR/BVK5XdYS//W9qMugXooae
   /iQFx9vwP9SeGhgppck3zOGqRaibTcVFccHn3qTk+jLgpypOjb46oe+Z/
   xlOxpisQOzsPf53e2gKwZviOiYMdn+o92CoB4vXlh3kDRvvZi5GNkEwQG
   x6qY+geXCThaGDktsSWyX2qesh9c4mBVJSDmcRyyBGEKWKqkp+qiyLTGR
   w==;
X-CSE-ConnectionGUID: 9uKkCVYUQVuM9GjLtFdxpQ==
X-CSE-MsgGUID: uzGZkBIAQ1GyTZNcuSKnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="70858098"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="70858098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 02:18:37 -0800
X-CSE-ConnectionGUID: e0YGTRz4QjCzgy/V6e91UQ==
X-CSE-MsgGUID: +Uf5Gb+vSuGknNHyAMwl/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211916395"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 02:18:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpkpF-00000000ouI-1IYi;
	Tue, 10 Feb 2026 10:18:33 +0000
Date: Tue, 10 Feb 2026 18:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs
 page table format
Message-ID: <202602101827.8rqDJVFA-lkp@intel.com>
References: <20260209112542.194140-1-liviu.dudau@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209112542.194140-1-liviu.dudau@arm.com>

Hi Liviu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liviu-Dudau/iommu-io-pgtable-Add-support-for-Arm-Mali-v10-GPUs-page-table-format/20260209-193039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20260209112542.194140-1-liviu.dudau%40arm.com
patch subject: [RFC PATCH] iommu/io-pgtable: Add support for Arm Mali v10+ GPUs page table format
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101827.8rqDJVFA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101827.8rqDJVFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101827.8rqDJVFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/io-pgtable-arm.c:870:38: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     870 |         if (data->iop.fmt != ARM_64_LPAE_S1 ||
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
     871 |             data->iop.fmt != ARM_MALI_CSF)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +870 drivers/iommu/io-pgtable-arm.c

   847	
   848	static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
   849						 unsigned long iova, size_t size,
   850						 unsigned long flags,
   851						 struct iommu_dirty_bitmap *dirty)
   852	{
   853		struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
   854		struct io_pgtable_cfg *cfg = &data->iop.cfg;
   855		struct io_pgtable_walk_data walk_data = {
   856			.iop = &data->iop,
   857			.data = dirty,
   858			.visit = visit_dirty,
   859			.flags = flags,
   860			.addr = iova,
   861			.end = iova + size,
   862		};
   863		arm_lpae_iopte *ptep = data->pgd;
   864		int lvl = data->start_level;
   865	
   866		if (WARN_ON(!size))
   867			return -EINVAL;
   868		if (WARN_ON((iova + size - 1) & ~(BIT(cfg->ias) - 1)))
   869			return -EINVAL;
 > 870		if (data->iop.fmt != ARM_64_LPAE_S1 ||
   871		    data->iop.fmt != ARM_MALI_CSF)
   872			return -EINVAL;
   873	
   874		return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
