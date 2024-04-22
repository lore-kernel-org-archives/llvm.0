Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096BA205E33;
	Mon, 22 Apr 2024 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713750951; cv=none; b=X07Nypmq7NyGKWjx4YbCkBbGvOqeBN8SJR3LXIfJpacgCOUcIkEjvBP9okUHGPSeHs91Gx+S3o9R3hJVS/sa/MktMC2gmhd+++96RBQqVWVyE6ker0sKmNOfD6rOaPSwWdHkP9LZYerr4u6I3OP0h0DakBrHVs+UTvZ1IO1Kavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713750951; c=relaxed/simple;
	bh=VeNFt9O0uMJcY/rxX+5TorMe90VOKnCdJRIldR1COOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rtTCvD30WQjdZRUyAt9wBUMXhzgXetSliTUzm27ZCRrxwnSpQ0rDey8RFyyQw+8BCnTs/FtI0nFTPjW04FS8cQIzXsmi1rd72ZfNs6oC1+lXzxKz3VEJq1Fkme9suGhJ2ba91EGAt+J/uYEbnRVrTqareLmdTdSKYkJpNDznjfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrh2xgbu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrh2xgbu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713750949; x=1745286949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VeNFt9O0uMJcY/rxX+5TorMe90VOKnCdJRIldR1COOg=;
  b=mrh2xgbujZvxC2OBsM4sxgH5SwWf+ZjE0iVi07T+bG4hHMuFgJiCol3N
   JWq9OSnWrLyittmPw4Wch99oNMwAYGZfjr7joSOudDmMhDXXMQTGf26xj
   HKFib6DZh5w19+aABHyd+LBgMGq9dqAx2RMFEBKxP650NiTbjLP86Vvo/
   lWZLcO7XA1GqZWM9KysssNF3y5EfylZ3P+ou+9N0YK1neX56vCCar0J7A
   xQP3rJgOfR7sVblSqd7XxTRYdVTUbsZpE6SXcUZUboj6mOCE3MtwCTGh2
   EyrlTkKhnzvUZybgMqs483UenVU1AIaaTJHfX4iAd1249+UAOSU+RNbn1
   A==;
X-CSE-ConnectionGUID: KyqvsmbQQOW1ZWHAMPFd8w==
X-CSE-MsgGUID: 6H4z+A+tS5GVsltuM0yYsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9444687"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9444687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 18:55:48 -0700
X-CSE-ConnectionGUID: Y3Hu21QCR2O/ND+18BqACQ==
X-CSE-MsgGUID: gpo+7ibGTouXFFbWqqgfNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="24473624"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2024 18:55:47 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryiuG-000CFu-1j;
	Mon, 22 Apr 2024 01:55:44 +0000
Date: Mon, 22 Apr 2024 09:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 6/6] kernel/sched/isolation.c:246:2:
 error: call to undeclared function 'lru_add_and_bh_lrus_drain'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404220942.gY520hDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   4bf6e6afb803e5862efb2cc8f2585d10e2f597f2
commit: 4bf6e6afb803e5862efb2cc8f2585d10e2f597f2 [6/6] mm: Drain LRUs upon resume to userspace
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240422/202404220942.gY520hDu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220942.gY520hDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220942.gY520hDu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:104:
>> kernel/sched/isolation.c:246:2: error: call to undeclared function 'lru_add_and_bh_lrus_drain'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     246 |         lru_add_and_bh_lrus_drain();
         |         ^
   1 error generated.


vim +/lru_add_and_bh_lrus_drain +246 kernel/sched/isolation.c

   242	
   243	#if defined(CONFIG_NO_HZ_FULL) && defined(CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK)
   244	static void isolated_task_work(struct callback_head *head)
   245	{
 > 246		lru_add_and_bh_lrus_drain();
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
