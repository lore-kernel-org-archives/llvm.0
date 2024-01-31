Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A53E462;
	Wed, 31 Jan 2024 05:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706680594; cv=none; b=DY4r8qezOoZWi5lAOvBMhQzAR4edVb9NS/18DugdqR5OZqKFPAABOQ97y1lZrYbDZeq81/EenLSLxzFgF5dMNJyFE+Gil9e6LRjOuaOp5RIKPADGTe0fiiIRWKUD+5C5zCpIHdG2XIemAfo+X7/b+XgfjvSxpRaYr4uYNMnCGCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706680594; c=relaxed/simple;
	bh=qzK+W5ued4GkYlUR2+PbevEDWRqqnMQcy/ynxvyls4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h7BdHKVlOvR6gKiNb66Yqc/rT7vkQIR8FhwDWDohkYUpgmMEJb6RGtH1CX0XUd9aal/ZNB0FOcb8HAHZRF0s1FcfM0c93mvnAWjyBi/sH0nV/hXR4Sjj5U0q+blDAD1qj4xqc0RdRwC23KB621MkkzFngXQdQl8vN25QC9haw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7kBdRHL; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7kBdRHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706680592; x=1738216592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qzK+W5ued4GkYlUR2+PbevEDWRqqnMQcy/ynxvyls4g=;
  b=c7kBdRHL9nKu9NV/mIqMi+my9xmoMzI9l/fYWFulqfBJg+evVg4QBE93
   pifbnYfuPiqZ5kplTWEhVrTFA9SW6v0wFywyAwnkHRrGwr6fKSDqXakop
   +oo1mYUd3xvqJuU7Lx1wGAO6gBcZRg33HG3TRf1kitTeMo8i7rUG5Vx9S
   DkWrmEhNrbEryTMDdPM0msXBeI928b5FO82DKiCV5g7FSc2GmC8loqPCe
   OTd89VLDA5Gdm8BczqjEcl4OOaLQBVXSrQEOyCsPjbg5iJ5YHqTRwRO2O
   hxEcqXZZ6qM41hMiJTmqZdS99Y+veUHCMkpaEpqNx/8xBqHW1F4X2ksYu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407216651"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="407216651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 21:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858704575"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="858704575"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2024 21:56:29 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV3ZF-0001BI-19;
	Wed, 31 Jan 2024 05:55:50 +0000
Date: Wed, 31 Jan 2024 13:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:schedtest 12/12] kernel/sched/fair.c:9748:34: error: call
 to undeclared function 'cpu_core_flags'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202401311339.WH2KXCdH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git schedtest
head:   b92ab0e6c7d969d7c8b42f8a5ff7e1e73f63599b
commit: b92ab0e6c7d969d7c8b42f8a5ff7e1e73f63599b [12/12] sched/fair: change sched asym checking condition
config: x86_64-buildonly-randconfig-001-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311339.WH2KXCdH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311339.WH2KXCdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311339.WH2KXCdH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:9748:34: error: call to undeclared function 'cpu_core_flags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    9748 |                 (is_core_idle(cpu) && test_bit(cpu_core_flags(), (void*)&sd->flags));
         |                                                ^
   1 error generated.


vim +/cpu_core_flags +9748 kernel/sched/fair.c

  9730	
  9731	/**
  9732	 * sched_use_asym_prio - Check whether asym_packing priority must be used
  9733	 * @sd:		The scheduling domain of the load balancing
  9734	 * @cpu:	A CPU
  9735	 *
  9736	 * Always use CPU priority when balancing load between SMT siblings. When
  9737	 * balancing load between cores, it is not sufficient that @cpu is idle. Only
  9738	 * use CPU priority if the whole core is idle.
  9739	 *
  9740	 * Returns: True if the priority of @cpu must be followed. False otherwise.
  9741	 */
  9742	static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  9743	{
  9744		if (!(sd->flags & SD_ASYM_PACKING))
  9745			return false;
  9746	
  9747		return (sd->flags & SD_SHARE_CPUCAPACITY) ||
> 9748			(is_core_idle(cpu) && test_bit(cpu_core_flags(), (void*)&sd->flags));
  9749	}
  9750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
