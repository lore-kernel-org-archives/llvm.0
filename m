Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA703BF666;
	Thu, 18 Jun 2026 07:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781766684; cv=none; b=c0X5a7lM5HqrVuJmfFHbjldO3SsPoceeSJHPpxiXzFnIkCk3GgS5hDJTwXyb7Ok468GkIRVslp2Wm522M65x2qJfS6niYqk77ZE4+rSiaA7Z3OW1GpmDT+ovfqyVVQUsBFL4gZUXdcHRmSG2K0uFpwamzkhQZgfrSC3TUToWJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781766684; c=relaxed/simple;
	bh=hcbwqT6Ifmi1RjtPjrJrL1uRHTeCMFdZ/s/zVcGXoBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAoHxw3++OVfCVO83MQfvDkthOQJPoi7KihXP1wfkGOCw599U5nycZhJumJPO1tM+NV9rcMZhkv+9NTYVZyopl31NdHcco5/GpxU7lW7SlgZAa42QdFhfyc4v4lMvWlbQB2MrT8IelgKafeSajZ7UWof6jLUWsbmbEUzf6Sd9vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqMdys6g; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqMdys6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781766682; x=1813302682;
  h=date:from:to:cc:subject:message-id;
  bh=hcbwqT6Ifmi1RjtPjrJrL1uRHTeCMFdZ/s/zVcGXoBM=;
  b=AqMdys6g2Ah0KLL7EhHzzAA+/fNR80XmmW4RM/yIXU1gS7pzOlvf76Dg
   dz0SBdwgJS6S2MaLVLSyu8tFnIy8nalYsP3011MEwpX1WnR/GG71Aclu1
   RXCWHS1Go46cCQ+N+7vmfRej+OfRrPwmg90z/d58BvAX8oRGDGY0C4L4S
   Jb3NrosKL5x8NDdqOPWaVxwLXPGSldvmFRMhOg3iinPbmT5cybFFQpqNo
   SBLajE4LOp1NvYJ235eKCvFJ9eW58ELVl3jecNp9PbtwtgPE5xaKmbZjc
   HsFAeKY94ba6C0+73PO40+iSrcmvXRvAbgIgj1au7O/hNtFu7qW4j855e
   Q==;
X-CSE-ConnectionGUID: gCL/Lnk8SxWuAdAaX6t5rw==
X-CSE-MsgGUID: expFSABeT1qdsgP5y+KN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81577475"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="81577475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 00:11:21 -0700
X-CSE-ConnectionGUID: qzBcAQ27RI6FW5ECvPG2oQ==
X-CSE-MsgGUID: FqthQmRsQfq/dO0Kqq15Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248356604"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 18 Jun 2026 00:11:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa6uD-000000005UT-1xiS;
	Thu, 18 Jun 2026 07:11:17 +0000
Date: Thu, 18 Jun 2026 09:10:53 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/sched/core.c:11335:2: warning: releasing raw_spinlock
 'rq_lockp(rq)' that was not held
Message-ID: <202606180950.swwWuXxx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
commit: bec9f392fa50016e604cfacae7445d9c36729f49 sched/core: Push current task from non preferred CPU
date:   12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260618/202606180950.swwWuXxx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606180950.swwWuXxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180950.swwWuXxx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:11335:2: warning: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Wthread-safety-analysis]
    11335 |         rq_unlock(rq, &rf);
          |         ^
>> kernel/sched/core.c:11340:1: warning: raw_spinlock 'rq_lockp(__this_rq())' is not held on every path through here [-Wthread-safety-analysis]
    11340 | }
          | ^
   kernel/sched/core.c:11325:2: note: raw_spinlock acquired here
    11325 |         rq_lock(rq, &rf);
          |         ^
   2 warnings generated.


vim +11335 kernel/sched/core.c

 11312	
 11313	static int sched_non_preferred_cpu_push_stop(void *arg)
 11314	{
 11315		struct task_struct *p = arg;
 11316		struct rq *rq = this_rq();
 11317		struct rq_flags rf;
 11318		int cpu;
 11319	
 11320		/* sanity check */
 11321		if (cpu_preferred(rq->cpu))
 11322			return 0;
 11323	
 11324		raw_spin_lock_irq(&p->pi_lock);
 11325		rq_lock(rq, &rf);
 11326		rq->push_task_work_done = 0;
 11327	
 11328		update_rq_clock(rq);
 11329	
 11330		if (task_rq(p) == rq && task_on_rq_queued(p)) {
 11331			cpu = select_fallback_rq(rq->cpu, p);
 11332			rq = __migrate_task(rq, &rf, p, cpu);
 11333		}
 11334	
 11335		rq_unlock(rq, &rf);
 11336		raw_spin_unlock_irq(&p->pi_lock);
 11337		put_task_struct(p);
 11338	
 11339		return 0;
 11340	}
 11341	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
