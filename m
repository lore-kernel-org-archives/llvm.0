Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF62EDD52;
	Mon, 10 Nov 2025 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762806879; cv=none; b=QlplJeCNFvnYd5/da2HYSKlU4SGIkyH3ucOZbMHrNhFRFKUopZms5YkTpfLaeBoCsmk6Vk1JVcAHDt/rcFg7cOKSOlANRIH5tLXxOZDtwmqIZ60Hjdu6t2e4/Z5sDS8kKnWagUKcnrUKZFdpkDaaZxL+nivUglokp7iLLa7JnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762806879; c=relaxed/simple;
	bh=hZOvKyj6XBdvi5A6WGdxy5AfVmNCi1exI6P9i2I1ox8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6q7DGYpWhjyhkZpC03y28E6UWeovJgJmENujGQUUuk71N7ozFOXRadAbrRllAnatNaWCyIfCQP6vTG9Q/ittXypQWtQVQEJHMRQfPEKGlS9wtY588gKl8tyOFo13ILpjwkzONs/zyTQ9lH2zJu8bv8b5ks0oewsYolHe/2qaec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erp3QnG3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erp3QnG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762806877; x=1794342877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZOvKyj6XBdvi5A6WGdxy5AfVmNCi1exI6P9i2I1ox8=;
  b=erp3QnG3jp0VbgrIFnaI3kdGh8yrR/E6O7NUn8k9S66/8ZxxjRpiQmk8
   zCBRjpZuB1sAMWuLp5tzM4DbIWpJjC4pb12Tfn++5BZ8tf4dIE0gOqX9a
   3yh1ZHwem7CIMzWD1YI1mO2yyX51C4beakXjPuxGa04ud7sAW8teOXa8Y
   K1lZrF56kIqVehQJsCkQ+Rz5wGhlHZyS9JHyrAF1ICnXRnYHrm088FhPq
   5DYdSl+HGFAN4MweG8NsVGo3J5UD/YR4vjvRvr6DB5Vpi1y+vxVupyJ7n
   UsT6udHMiPsqua1fi/6RlnoWGdjPhhTWVdWMemGwqEYoEd5mJfnhe32QC
   A==;
X-CSE-ConnectionGUID: OvkrB6SaQCimKc/yNL2AoQ==
X-CSE-MsgGUID: kJJnPYtOT6Or6l/c8EOOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64904241"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="64904241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 12:34:36 -0800
X-CSE-ConnectionGUID: Ko2JSn9SRzSRRI32RsqMDQ==
X-CSE-MsgGUID: QnGl+YzEQaa5mZIitFi7uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="219423406"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 12:34:36 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIYau-0000yH-2t;
	Mon, 10 Nov 2025 20:34:32 +0000
Date: Tue, 11 Nov 2025 04:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 16/29]
 drivers/media/platform/dreamchip/rppx1/rpp_stats.c:16:8: error: use of
 undeclared identifier 'ENODEV'
Message-ID: <202511110405.VNyKrJUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: 97361c66c826ea94c2924afa0b31d41886d844b9 [16/29] media: rppx1: Add support for AWB measurement parameters and statistics
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251111/202511110405.VNyKrJUp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110405.VNyKrJUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110405.VNyKrJUp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/dreamchip/rppx1/rpp_stats.c:16:8: error: use of undeclared identifier 'ENODEV'
      16 |                 if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))
         |                      ^
   drivers/media/platform/dreamchip/rppx1/rpp_module.h:149:16: note: expanded from macro 'rpp_module_call'
     149 |                         __result = -ENODEV;                             \
         |                                     ^
   1 error generated.


vim +/ENODEV +16 drivers/media/platform/dreamchip/rppx1/rpp_stats.c

     8	
     9	void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
    10	{
    11		struct rkisp1_stat_buffer *stats = buf;
    12	
    13		stats->meas_type = 0;
    14	
    15		if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS)
  > 16			if (!rpp_module_call(&rpp->post.wbmeas, stats_rkisp1, &stats->params))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
