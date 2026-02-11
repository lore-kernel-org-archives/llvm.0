Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7F2E62C6;
	Wed, 11 Feb 2026 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770790039; cv=none; b=W8BPormOyaDCJf+Fob2zUbcLQibMdtAcCta+GsZsWCcugHW4CW/JWDm+EH7P5OujkN5i1wDLK3RtmIH9/iyTKbVoHP4EJB1FrwDtIAQQbHXObcZmWty6L5Od36SFZI+jGUuF1fQNJM1BUWy+B5E70Wgcj2/D2UiWNG1jcBYxDsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770790039; c=relaxed/simple;
	bh=Cs050jptrDx8rrdGIqrrBikWdz/1//qqoennFLH9hoU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TaotefaFI4qq75CmHMmPx2kT2zMVTeunL/aNV8yHyI9sLtYUJTLuqcMgXBmPGh0yXRRSTIjT6v9jL8/shr8qbWEA41be4K5Cnlp4hiR+/1qOvFnv/ugoJ9/blXcZBjHkWndren4M2hLHC8k8G4eTfoPP4WnVIa6u1lVmuDQ2GJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqYhM1hi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqYhM1hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770790038; x=1802326038;
  h=date:from:to:cc:subject:message-id;
  bh=Cs050jptrDx8rrdGIqrrBikWdz/1//qqoennFLH9hoU=;
  b=PqYhM1hiX942OArer2X0LpuqxYJ8Txrb2pRtkXhmtcMNF1xOVHXsmKmz
   RmfgELlAX9A26f9wsDA5qxcGNnoA+E3wc2iQwM7mf8DqpkEKRs/5S/sRV
   YCqtx6OjesxBD6J/s0VzF3Ztcw/0siBaLl6gEdfPt25AMZUYZvwX2hPLz
   0ExvIfHTK1h84QFvHA/FkLo5HyLAYqAtj9hP/AWYjNs7U+dRCBWo88Mrm
   tTVr/TohxtKrjVEAw34Z76BLp1QPAYaftDD3kv/UI5nYdHqi5WrSG+Bll
   7s58OFsvGqaBVNWvlJ0me6S7kqiYVbjUqDynA6UcApYaFc0L7few4fSBY
   g==;
X-CSE-ConnectionGUID: 6witcB9yT7+stLOKX23+eA==
X-CSE-MsgGUID: RfUE8eaaTwqPrBJmgmijmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71916403"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71916403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 22:07:17 -0800
X-CSE-ConnectionGUID: vLWYfCfjQsa6QwqQxm3N7A==
X-CSE-MsgGUID: skiArpE3Tnm1G++6ZXec/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216678487"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 22:07:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq3NZ-00000000pjK-1J9I;
	Wed, 11 Feb 2026 06:07:13 +0000
Date: Wed, 11 Feb 2026 14:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 22/23] kernel/sched/core.c:1001:3:
 error: call to undeclared function '__hrtimer_rearm_deferred'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202602111428.DJdzKOD0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   4977e2e73efc645e38259d70c86d3b8e80dd3ea5
commit: cdc7a4d6066dc34fdbb2cf8801a5287f31d60657 [22/23] sched: Optimize hrtimer handling
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260211/202602111428.DJdzKOD0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111428.DJdzKOD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111428.DJdzKOD0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:1001:3: error: call to undeclared function '__hrtimer_rearm_deferred'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1001 |                 __hrtimer_rearm_deferred();
         |                 ^
   kernel/sched/core.c:1001:3: note: did you mean 'hrtimer_rearm_deferred'?
   include/linux/hrtimer.h:192:20: note: 'hrtimer_rearm_deferred' declared here
     192 | static inline void hrtimer_rearm_deferred(void) { }
         |                    ^
   kernel/sched/core.c:7822:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    7822 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7797:1: note: array 'preempt_modes' declared here
    7797 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +/__hrtimer_rearm_deferred +1001 kernel/sched/core.c

   997	
   998	static inline void hrtick_schedule_exit(struct rq *rq)
   999	{
  1000		if (rq->hrtimer_rearm)
> 1001			__hrtimer_rearm_deferred();
  1002	}
  1003	#endif /* !CONFIG_SCHED_HRTICK */
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
