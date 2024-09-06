Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1453225760;
	Fri,  6 Sep 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725626959; cv=none; b=BfSoYX+i1fa4Ufqwrl+c9GXQm3//xygASgWfIO8ChLITwufRfrc66lqkWCBKvnPwNJBCRDaodLGpljLDMnxCQOj0qP4Eeg7zXC35CueckYKMjpZO9qQAvkIxdVG0WTfxZ8ME0x0T/a/mCOzxNbpON6FCbbk1xxmEdldqYz0/hME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725626959; c=relaxed/simple;
	bh=ZlsARWX/BEYFhlfQUcLbzycTLhjqrkGv312ZXs12Hek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JH4UWQqPHJTz0QLJVBWX+6mMnY1kjMZkXgmI8TGmayq0XIWIBR1YFS19tVIxnSdqj6F6GjDqrX/mzyXKZkzjTaGAIkeinqVjbg88A2o2rRuEhaTMiK07KDmTgpnQBvf0VD6QB4QMurxwSJL64NzNKH3bhgwG6DzbKx+WwZ2OjSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Slu7PAOA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Slu7PAOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725626957; x=1757162957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZlsARWX/BEYFhlfQUcLbzycTLhjqrkGv312ZXs12Hek=;
  b=Slu7PAOAPjnPEyO9umUDI1KM9fwCmfZvvw+8ERSr2nFGG8781LudE0FY
   R0/nmXDDwmRQWdKqjsP6pNcwemB8xEgViF25TTGnNyu2nwa0MmdPMeUFO
   0UBYc0So5K7JbScaBS/jGpBvD0H2ib5l0ORcN4z/qybo9da1iq1YHtijO
   h2gsVBg01p1w7Yr1dCyX3AnGjMpE1rk9P8h4VEmYSPU1ARXCFcKEumXKP
   upJto5p7Sdung0//2YeTbWv0Gx11sjOiz8/c5v/6mfeUftmbXG7DQKtXu
   OdWTlGCpRoq5IQ/gpJKmws9fGBvyblIhKIUwwHd8G/uJEN0Fy+3QIsQpa
   Q==;
X-CSE-ConnectionGUID: aV9UT5esSQ2j4nYWDmShTQ==
X-CSE-MsgGUID: mYVS4D9sQH2IGANJQQFZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23940570"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="23940570"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:49:16 -0700
X-CSE-ConnectionGUID: kR62BsuvQ+yrAZYLm0GTuA==
X-CSE-MsgGUID: s+qJx/1vS3CwSpDt3/Zwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="66181683"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2024 05:49:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smYOn-000BFH-1E;
	Fri, 06 Sep 2024 12:49:13 +0000
Date: Fri, 6 Sep 2024 20:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] drm/sched: Fix teardown leaks with refcounting
Message-ID: <202409062019.O0EwYMd5-lkp@intel.com>
References: <20240903094531.29893-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903094531.29893-2-pstanner@redhat.com>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/drm-sched-Fix-teardown-leaks-with-refcounting/20240903-174759
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240903094531.29893-2-pstanner%40redhat.com
patch subject: [RFC PATCH] drm/sched: Fix teardown leaks with refcounting
config: i386-buildonly-randconfig-001-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062019.O0EwYMd5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409062019.O0EwYMd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062019.O0EwYMd5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/scheduler/sched_main.c:407: warning: Function parameter or struct member 'result' not described in 'drm_sched_job_done'
>> drivers/gpu/drm/scheduler/sched_main.c:1336: warning: Function parameter or struct member 'jobs_remaining' not described in '__drm_sched_fini'
>> drivers/gpu/drm/scheduler/sched_main.c:1336: warning: expecting prototype for drm_sched_fini(). Prototype was for __drm_sched_fini() instead


vim +1336 drivers/gpu/drm/scheduler/sched_main.c

f49565982194d6 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1327  
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1328  /**
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1329   * drm_sched_fini - Destroy a gpu scheduler
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1330   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1331   * @sched: scheduler instance
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1332   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1333   * Tears down and cleans up the scheduler.
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1334   */
8f9b35110d847d drivers/gpu/drm/scheduler/sched_main.c        Philipp Stanner   2024-09-03  1335  static void __drm_sched_fini(struct kref *jobs_remaining)
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22 @1336  {
8f9b35110d847d drivers/gpu/drm/scheduler/sched_main.c        Philipp Stanner   2024-09-03  1337  	struct drm_gpu_scheduler *sched;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1338  	struct drm_sched_entity *s_entity;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1339  	int i;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1340  
8f9b35110d847d drivers/gpu/drm/scheduler/sched_main.c        Philipp Stanner   2024-09-03  1341  	sched = container_of(jobs_remaining, struct drm_gpu_scheduler, jobs_remaining);
8f9b35110d847d drivers/gpu/drm/scheduler/sched_main.c        Philipp Stanner   2024-09-03  1342  
a6149f03936993 drivers/gpu/drm/scheduler/sched_main.c        Matthew Brost     2023-10-30  1343  	drm_sched_wqueue_stop(sched);
faf6e1a87e0742 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2018-10-18  1344  
38f922a563aac3 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-11-22  1345  	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  1346  		struct drm_sched_rq *rq = sched->sched_rq[i];
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1347  
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1348  		spin_lock(&rq->lock);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1349  		list_for_each_entry(s_entity, &rq->entities, list)
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1350  			/*
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1351  			 * Prevents reinsertion and marks job_queue as idle,
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1352  			 * it will removed from rq in drm_sched_entity_fini
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1353  			 * eventually
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1354  			 */
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1355  			s_entity->stopped = true;
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1356  		spin_unlock(&rq->lock);
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  1357  		kfree(sched->sched_rq[i]);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1358  	}
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1359  
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1360  	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1361  	wake_up_all(&sched->job_scheduled);
c61cdbdbffc169 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-05-12  1362  
e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-01-18  1363  	/* Confirm no work left behind accessing device structures */
e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-01-18  1364  	cancel_delayed_work_sync(&sched->work_tdr);
e582951baabba3 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2021-01-18  1365  
a6149f03936993 drivers/gpu/drm/scheduler/sched_main.c        Matthew Brost     2023-10-30  1366  	if (sched->own_submit_wq)
a6149f03936993 drivers/gpu/drm/scheduler/sched_main.c        Matthew Brost     2023-10-30  1367  		destroy_workqueue(sched->submit_wq);
faf6e1a87e0742 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2018-10-18  1368  	sched->ready = false;
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  1369  	kfree(sched->sched_rq);
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  1370  	sched->sched_rq = NULL;
a72ce6f84109c1 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Jammy Zhou        2015-05-22  1371  }
8f9b35110d847d drivers/gpu/drm/scheduler/sched_main.c        Philipp Stanner   2024-09-03  1372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
