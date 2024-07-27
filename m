Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD3433CC4;
	Sat, 27 Jul 2024 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722120166; cv=none; b=GgKApOgNoZWBzRbTIE0I5wPpC4pw+FX5PIRFR/UhkGukxJ0pzniWPVvksmNZZUM2eoQSYLwwsZWfuGn/mW9em2i42U9s3Q4KpMdjQZbMNsvfo/X+y6Jh59Ox9XpiROoHtTca/RPH3Ero+15VEUC/J5RmY24EiE+xH7fO5/bi20U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722120166; c=relaxed/simple;
	bh=GdxmyMIAxKMP55HfPPnag0plAqS7qQ7WU4+v5Kbrwi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=di1zRIgQmGcZdegDM21aBCTRxpIsetukrBkD4nF+YdlWpkfXRM0CBTiNDOAkxF0VamaUmxkn30jzILyG9kdOyddOnSsDXhrBqpZ+1gVrLzCB+TxwyGG6DsZTlpRBk5o9622iLotn+SS8U8XGRjZAznIAot7enAD9gdDnovku5C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0vViMhA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0vViMhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722120164; x=1753656164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GdxmyMIAxKMP55HfPPnag0plAqS7qQ7WU4+v5Kbrwi0=;
  b=N0vViMhAbQ+8M6UEKaY42id3SgvEkxeqRGnPh6OgrIRxO0HlwKNwfyvp
   up7A8t1NXqrWkc03XcaCdfFLxBTS1VStJh5kPBnGQpV/K3ECeLoFgW4/R
   kLXEcakq2G0yJcDScQyKtXmpCUCz80A4KPw5mgjp+B8C+1BpWCBWAkoSw
   t5tIDK/vRKkbRVC1voZ8Gk+my7owgr5Fu0rZMdTDi0J+O7Nx9hd3pdqJz
   pAeh6rna5gS139DDzOhEffG8uZUKDKhgmAoeOTA6DVkkyPVWrMIMrI6FM
   6EJxxQlU+bzqmEU6wJ+ld1dOG3PozxQkvjMogxlw4aGFlCmptLPATrFI7
   A==;
X-CSE-ConnectionGUID: QMllj0YwR7O4w9O4BjDe1w==
X-CSE-MsgGUID: A9zDyOrmQ5qP3/7FYHSgrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="23643721"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="23643721"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 15:42:44 -0700
X-CSE-ConnectionGUID: mFa36XvdQfux0ji7trF0QA==
X-CSE-MsgGUID: RhSyCYlPSZKJA+RtvsT+UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53582539"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2024 15:42:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXq7b-000qJ6-2q;
	Sat, 27 Jul 2024 22:42:39 +0000
Date: Sun, 28 Jul 2024 06:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/scx 39/42] kernel/sched/sched.h:2371:45: error:
 too many arguments to function call, expected 2, have 3
Message-ID: <202407280602.enrMgVrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/scx
head:   df64e1ce653e6748aff3f6d7dea17a02c7905075
commit: 4dc9ef89e52432135c71303203f5b9868f2dde6c [39/42] sched: Combine the last put_prev_task() and the first set_next_task()
config: x86_64-randconfig-001-20240725 (https://download.01.org/0day-ci/archive/20240728/202407280602.enrMgVrF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280602.enrMgVrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280602.enrMgVrF-lkp@intel.com/

Note: the peterz-queue/sched/scx HEAD df64e1ce653e6748aff3f6d7dea17a02c7905075 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:88:
>> kernel/sched/sched.h:2371:45: error: too many arguments to function call, expected 2, have 3
    2371 |         prev->sched_class->put_prev_task(rq, prev, false);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~           ^~~~~
   1 error generated.


vim +2371 kernel/sched/sched.h

  2367	
  2368	static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
  2369	{
  2370		WARN_ON_ONCE(rq->curr != prev);
> 2371		prev->sched_class->put_prev_task(rq, prev, false);
  2372	}
  2373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
