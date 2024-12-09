Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9720FA99;
	Mon,  9 Dec 2024 05:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733723460; cv=none; b=mszJs5DPLkGV4yKqjADkyi0YUb93KJmf546S8Ox90+IOu6fDIWDgVhVfukcePtjUIu6UlJn+OzNdOHvUlQdH6AErJ1PudA6KWUGbrE4LOPHxwDcgbaPTKfp6QCJUH0AKOUK+WmS+Q0P1lqhjYsp5u/sO+yAQjZyRyXkhWI2HOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733723460; c=relaxed/simple;
	bh=3bH83qn7I2EaQcJW+jlGfspn/KSUVZt+At8nB/YEfRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXwOFuf5duzZfwaX4CKJuauh9jSYvrd9mJEY0W8yKrZbk7W6pp4JJRvftnuxnvDmCojs1Mj+GvRaDZ9F7ubK6IdN0c6VsfDwainSLX1L2GZarEcrgoWrck0XBOW/bVYkya/mU5ynRATQS39lB/Cx/0HdX1qjX1SufRstOMIuc4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auEMp1c/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auEMp1c/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733723458; x=1765259458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bH83qn7I2EaQcJW+jlGfspn/KSUVZt+At8nB/YEfRs=;
  b=auEMp1c/JjoN9FzNJMu9mbOW7qhbP96BOKGON9dhrUkhlGYRNxPNH6Z1
   G5nw1nUHOgNRkcFAmyRHVj22vY2/iVROqvyXj6dGIVAYlEBhXWyAhm7cN
   sH26oe2CXFCg6zvD9+ciQsbppIujNtF6zKlq0P0i2w0GOHoxWSTn15NfF
   PHo+8y28uu2tSELFChJ6oYy/aqYU+a1vF8qFZQXNuiqNFSigvHv4cR8Cp
   u4/+Iuyly/w5OGNi0zpK1QVyCN4vpLe4cfXhomV4IbuWtV8/mK+U8aaIM
   uIxecbapnZmq+y7vbvuL97DG+HRG1kxJwBIAHB8NAZ6lmvh70VtuVn5+1
   Q==;
X-CSE-ConnectionGUID: yxM4qlR0SPq8bpgGtyWfAQ==
X-CSE-MsgGUID: Pdvmn3riS/2ylEsVKngwmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44687840"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44687840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:50:57 -0800
X-CSE-ConnectionGUID: mapl7kcMTcG0vIQ7EUfVBg==
X-CSE-MsgGUID: x7/RxJCPRCyJ2og5uWt9/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125814833"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:50:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKWfW-0003zh-0I;
	Mon, 09 Dec 2024 05:50:54 +0000
Date: Mon, 9 Dec 2024 13:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>, Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-fixes 5/11] drivers/hv/vmbus_drv.c:2510:45: error:
 call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202412091658.m9g4L9gw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
head:   b8ea8cd0fbd358feee3e9172c5ef8afd671e0d11
commit: eced6df67f6b76889e80ded109a73ca5fac1e5cd [5/11] drivers: hv: Convert open-coded timeouts to secs_to_jiffies()
config: i386-buildonly-randconfig-004-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091658.m9g4L9gw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/vmbus_drv.c:21:
   In file included from include/linux/hyperv.h:17:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hv/vmbus_drv.c:21:
   include/linux/hyperv.h:646:2: warning: 'counted_by' should not be applied to an array with element of unknown size because 'struct gpa_range' is a struct type with a flexible array member. This will be an error in a future compiler version [-Wbounds-safety-counted-by-elt-type-unknown-size]
     646 |         struct gpa_range range[] __counted_by(rangecount);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hv/vmbus_drv.c:2510:45: error: call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2510 |                 &vmbus_connection.ready_for_resume_event, secs_to_jiffies(10)) == 0)
         |                                                           ^
   2 warnings and 1 error generated.


vim +/secs_to_jiffies +2510 drivers/hv/vmbus_drv.c

  2472	
  2473	static int vmbus_bus_resume(struct device *dev)
  2474	{
  2475		struct vmbus_channel_msginfo *msginfo;
  2476		size_t msgsize;
  2477		int ret;
  2478	
  2479		vmbus_connection.ignore_any_offer_msg = false;
  2480	
  2481		/*
  2482		 * We only use the 'vmbus_proto_version', which was in use before
  2483		 * hibernation, to re-negotiate with the host.
  2484		 */
  2485		if (!vmbus_proto_version) {
  2486			pr_err("Invalid proto version = 0x%x\n", vmbus_proto_version);
  2487			return -EINVAL;
  2488		}
  2489	
  2490		msgsize = sizeof(*msginfo) +
  2491			  sizeof(struct vmbus_channel_initiate_contact);
  2492	
  2493		msginfo = kzalloc(msgsize, GFP_KERNEL);
  2494	
  2495		if (msginfo == NULL)
  2496			return -ENOMEM;
  2497	
  2498		ret = vmbus_negotiate_version(msginfo, vmbus_proto_version);
  2499	
  2500		kfree(msginfo);
  2501	
  2502		if (ret != 0)
  2503			return ret;
  2504	
  2505		WARN_ON(atomic_read(&vmbus_connection.nr_chan_fixup_on_resume) == 0);
  2506	
  2507		vmbus_request_offers();
  2508	
  2509		if (wait_for_completion_timeout(
> 2510			&vmbus_connection.ready_for_resume_event, secs_to_jiffies(10)) == 0)
  2511			pr_err("Some vmbus device is missing after suspending?\n");
  2512	
  2513		/* Reset the event for the next suspend. */
  2514		reinit_completion(&vmbus_connection.ready_for_suspend_event);
  2515	
  2516		return 0;
  2517	}
  2518	#else
  2519	#define vmbus_bus_suspend NULL
  2520	#define vmbus_bus_resume NULL
  2521	#endif /* CONFIG_PM_SLEEP */
  2522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
