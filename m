Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6E72F3B;
	Sat,  1 Feb 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738420403; cv=none; b=NIL9PB5K8kHBVp9NIFEoVvVUNRVlSFBdC69TG54vq1ds77TjRh2LQCE72T/WJ4T5aiswAfBUw2Sfoln1a0dW1FngD9Mw3iSX9nAhDLp7NnL0XOVwBGj5cDw8m6xgTI2Hxj/E3k/XUc6gNVIc/wNlxU4a5eZzi3nda7CKlNKKmoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738420403; c=relaxed/simple;
	bh=HNCBAS0xMKGrLbS8+R9RoQSg1RBk7Pgo27rkHbWLM5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnOheNIsG/5Z8gn6uYkH+qRof+IQWQ5WQ8b06FF3HlAHEI/dw/0P/aWW/f67E6MXXpUYabeJLuR8rCxtR4di2j0oOsmDeXPKzaaqc8fRuBejKXJydq3QoOgojco7ILBPHFhZlDheafs1uwyTiZvOqmBDgCN5VPq2VXLlpZlpSvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhT1Tm39; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhT1Tm39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738420401; x=1769956401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNCBAS0xMKGrLbS8+R9RoQSg1RBk7Pgo27rkHbWLM5I=;
  b=AhT1Tm39DqA272BuSXOqLGK5qq09CRlwISLICrHWk0Wg0qTitNAcs4kJ
   ppZeTZFxKf13M2ehTqrSCxdeGjh/pzGPxzFlE7y4ygvk01CRhMhlgRsNO
   ojxrNMQX1wM3CpjvWGHyt3Ij9xjj6bGmQh6nD1g+OBAYxPnMQsQ5h5Cje
   5U/xGo3lRHHDOb3Q7J0X/c72IlM119rqK6aJB1qY7uK0tXStYiW9+w7s3
   KNAv3c053cI3LNkmyfXfd6RqRykJGCudunhXEJKz+TsY7+5rYcITx9yMT
   7f+xdin4Yv4E9hwm0wXLrNf+iczL2EMT1E5EhHWupDsPXWgyUKZpDVxal
   A==;
X-CSE-ConnectionGUID: LjGlqlS6QlS15mR+30zydA==
X-CSE-MsgGUID: H4TrJPK+TOW1fo07UfKihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="39130901"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="39130901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 06:33:20 -0800
X-CSE-ConnectionGUID: LzQ0QCjmRmWVJ7QmYi5C4g==
X-CSE-MsgGUID: qkuaI1ihTa6sUTPXwUVBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="110014748"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Feb 2025 06:33:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teEYf-000oFz-0G;
	Sat, 01 Feb 2025 14:33:17 +0000
Date: Sat, 1 Feb 2025 22:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [peterz-queue:sched/urgent 2/2] kernel/sched/cputime.c:25:12: error:
 static declaration of 'sched_clock_irqtime' follows non-static declaration
Message-ID: <202502012207.b8iyB4Fh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   efd5bd3144b76ff6eab5443d16df9797d9d7f4cd
commit: efd5bd3144b76ff6eab5443d16df9797d9d7f4cd [2/2] sched: Don't define sched_clock_irqtime as static key
config: arm-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250201/202502012207.b8iyB4Fh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502012207.b8iyB4Fh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502012207.b8iyB4Fh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:59:
>> kernel/sched/cputime.c:25:12: error: static declaration of 'sched_clock_irqtime' follows non-static declaration
      25 | static int sched_clock_irqtime;
         |            ^
   kernel/sched/sched.h:3262:12: note: previous declaration is here
    3262 | extern int sched_clock_irqtime;
         |            ^
   1 error generated.


vim +/sched_clock_irqtime +25 kernel/sched/cputime.c

    24	
  > 25	static int sched_clock_irqtime;
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
