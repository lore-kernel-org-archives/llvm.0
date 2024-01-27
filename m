Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84E2576D;
	Sat, 27 Jan 2024 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706365206; cv=none; b=Vv3jd0eidQLVRFqlAP4aUH0RbkZL13598vWrFBd0FNxrZPuRYJKdtCfz545Sn5bas0dqkPYSBvaV782lGQ5dJCh5n8MfEQ/kdlaFOTWUQQu1AazDR26XgLchJepXPbb4n4gnjKYDkUmQCSNSW3iW3XIsmFTw4ZkJcMA2qliG4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706365206; c=relaxed/simple;
	bh=/Uw3gz3X0ldWVWdDZOiL2YXnDE7bm16AZyr+WOtkBz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awMHI9N2pf4bzDy6WiqactO7XSXZLqnFG9SZOsbF0wxejzuDxgPHJRU05QCk/aiunKwn7YJIJWc6ovzhPX/1zYguUTgn3Jfrireh9+I/JD8WL83/zJYtZso4axvQcSPIVtcXrH+gBLVO7fV5YtzHjtdcaQQZ18/T0E9fXXG1Aic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epuXmfEi; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epuXmfEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706365204; x=1737901204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Uw3gz3X0ldWVWdDZOiL2YXnDE7bm16AZyr+WOtkBz4=;
  b=epuXmfEivZRf2e/74J2u5UfEQZ3+bcQpNsdsMgQGUUU9ZvYpYc0erqGn
   4+/5Tg/7As0kSscAJSlAWrGc3nxXgPNbVGJ5wqpk5df6+S7wmb8N5qnwQ
   QgqENhinZxt7EpCjfXgZPzSawNQW+a1EKZW2UcKrabCdRG0ELFTJtgXJB
   L/mSwgK3jfrTqiIsuT/ccssOQ+DMEJuxhimTDiNylXpLXfODxrN7Hdoc5
   k/4YWk5oDRrqfwi2MGdS2uxM0XpgrCrHoyywFRe2qPSlxYWchOPNI/Mos
   Jgpx9I/TnepjSzh463OdhRHXJjUqoH5SO0+pAjRKQFjcWf7jBivSvTKyc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399842566"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="399842566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 06:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2983733"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2024 06:20:03 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTjXM-0002P0-2j;
	Sat, 27 Jan 2024 14:20:00 +0000
Date: Sat, 27 Jan 2024 22:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tj-wq:wq-atomic-draft 9/20] error[E0425]: cannot find value
 `WORK_CPU_UNBOUND` in crate `bindings`
Message-ID: <202401272236.hXsUy4sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git wq-atomic-draft
head:   8224d2602ef454ca164f4added765dc4dddd5e16
commit: e563d0a7cdc1890ff36bb177b5c8c2854d881e4d [9/20] workqueue: Break up enum definitions and give names to the types
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240127/202401272236.hXsUy4sm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272236.hXsUy4sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272236.hXsUy4sm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `WORK_CPU_UNBOUND` in crate `bindings`
   --> rust/kernel/workqueue.rs:202:51
   |
   202 |                 bindings::queue_work_on(bindings::WORK_CPU_UNBOUND as _, queue_ptr, work_ptr)
   |                                                   ^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
