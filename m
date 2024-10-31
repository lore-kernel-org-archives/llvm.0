Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8691BD027;
	Thu, 31 Oct 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394463; cv=none; b=OrA1K4PwA91K+zeD2PfoNByMZUfFZzL2YmDvt+JyWSbbRjqdcb0rBvRXCHoUab2C0q7OPQiwY38hXQtL0uYCxztXKIeCVDEhkD5jqXTsyLFdJhsgUhLI2XZlv84IO8NOk6Jxpd7NVIOF+ToU52sjIpJ/S2+1b3yR6i4EkjpGppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394463; c=relaxed/simple;
	bh=DcnC6JXPAglQBQtZrEuqYjdyVGl/zg7nJfmo23aGIkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ih28tYndd5Hwyrd5aN+tl52npdPMI7Jq4OnpCliwg8ZNoPZedUYCUe1tU8izC+/QO9nuB3iPgEdEwlel2zWpkHSipA0Jvk3tqEY8W+WKi9JxocJGjskJem1xMxro9eqtB+pHX8kAEBOhL5ltXcvPjgmWtInw9bhtvT1716uGWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc6/xL9D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc6/xL9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730394461; x=1761930461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DcnC6JXPAglQBQtZrEuqYjdyVGl/zg7nJfmo23aGIkU=;
  b=Xc6/xL9DWU96VtQlJdzVKBtdXnnN3BNL9lZbnIIXCGxMojkST0m2Svv5
   uDXRAo2AN5pDU8AJW+HWlGc76QJ8TiqT2CFRGL/MIOcmNGcx9OwqBpX0B
   qz5KN9+2agawLcK2Ay08MnC/lUFU+LnxQWTrvEFW5c94CAZ7Nfx8O5XUd
   4IVhAMlJncO1NQ4aiiUSimjZFFGYOyQy/Fitix6zZndlSOZS0ggWQFyeo
   xvPaFomLfIOjFBsuJbvRb2/xVuz/HBqdRD9TlCzwVSLdqRBDL4m1v5PwQ
   F9j9pVNCuC36xwScidqJhmHTX1hoQ5EliOKh1EPfr0T35bsjEzFT/Jef+
   Q==;
X-CSE-ConnectionGUID: mqq41Tt6SoGgXYvYP55PVw==
X-CSE-MsgGUID: XcbfUuO5Ro+nORapzkf5AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17787463"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="17787463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 10:07:41 -0700
X-CSE-ConnectionGUID: O910B8opT4mDU8pNGyhgYA==
X-CSE-MsgGUID: 9dBSr+KpSw6zkR9J4QOYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="106014402"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2024 10:07:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Ye1-000gYE-19;
	Thu, 31 Oct 2024 17:07:37 +0000
Date: Fri, 1 Nov 2024 01:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/cleanup 20/22] kernel/sched/rt.c:2643:20: error:
 use of undeclared identifier 'switched_from_rt'; did you mean
 'switched_to_rt'?
Message-ID: <202411010109.9mDLbdzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/cleanup
head:   4e3feca600aeb6b6cee07822faf7d1a8aa0564b2
commit: 879c968b9feafb703c9b352fae0091b1c5b71bcc [20/22] sched: Fold sched_class::switch{ing,ed}_{to,from}() into the change pattern
config: arm-randconfig-001-20241031 (https://download.01.org/0day-ci/archive/20241101/202411010109.9mDLbdzx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010109.9mDLbdzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010109.9mDLbdzx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:2643:20: error: use of undeclared identifier 'switched_from_rt'; did you mean 'switched_to_rt'?
    2643 |         .switched_from          = switched_from_rt,
         |                                   ^~~~~~~~~~~~~~~~
         |                                   switched_to_rt
   kernel/sched/rt.c:2454:13: note: 'switched_to_rt' declared here
    2454 | static void switched_to_rt(struct rq *rq, struct task_struct *p)
         |             ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +2643 kernel/sched/rt.c

  2638	
  2639		.task_tick		= task_tick_rt,
  2640	
  2641		.get_rr_interval	= get_rr_interval_rt,
  2642	
> 2643		.switched_from		= switched_from_rt,
  2644		.switched_to		= switched_to_rt,
  2645		.prio_changed		= prio_changed_rt,
  2646	
  2647		.update_curr		= update_curr_rt,
  2648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
