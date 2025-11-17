Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AC1EF38E;
	Mon, 17 Nov 2025 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366552; cv=none; b=kbVT1VdJ16XcRvx4K6sIoFrpCKaSfqNBgwn3dBKn1ENtqC2MZtw1sosjyp532haeHSsPpySMDcjXl2c8bmLrtCVVUC0UblLkysAX1sMRNuWAHSF6gQhrKHMTuUCD41BKqZLovNVe3HmxbCFfIocJgsOsu4yCCvKZLkFp+CrlSFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366552; c=relaxed/simple;
	bh=gPuHKDtp3UF3TCByRPW4KcUQhNnntHDca6imhl7OHAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bV7PQXLtZWAEApR5RQ2V6Vuh4dOzGyKCAOdkms135zIJyXoIkWhA5V2G5xpccMePqFvsiKWX0cWdcbeJ01seuWEz9bVUNgDKXK7LxkDYXXVW05axZtFNG3BtwNZe4/pDBGo+Lqcqf8vAfxwNVQwW+oAeBhZQObF/WV9taaFK9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsY8QV7Y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsY8QV7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763366551; x=1794902551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPuHKDtp3UF3TCByRPW4KcUQhNnntHDca6imhl7OHAM=;
  b=PsY8QV7YWO1zqjsaY1M+UemEsA1edXNcNAuv2fy7BUK3v/5ePm7RGdx7
   WE6MgyVB2mpMJpeNvCD8BRUK+LUYCvtEvaaXyBxtNMicwEExYsyVsOr/E
   eKlPGI5VVyCvYFn9UxZn8ntS5F1zzaaz3Hexvvrwqxcy72NiRvpKa8Y3/
   Fh8LrnRNc5snpcNyJJqIl5TC/psHkh23ibwibJDxwQVpE5KDWfy3SV/7t
   RjTFqNtYa6rugtAVd7xvzNoTh8FNe8DM+7UdINjvUKzJ2QV+rIyF0Qlm/
   nS6nOQ29c3i8GPZnr+Zzg+Qx090OsTSreTvGnevEvEAmdFk8iCkT2/LYq
   w==;
X-CSE-ConnectionGUID: BNv6zVY5RwimRjYBEAhzDw==
X-CSE-MsgGUID: GMUQ2QMSQF2DOEfakXYj2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65294433"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65294433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:02:31 -0800
X-CSE-ConnectionGUID: hfQa5AALRjSxCDd4OjtpKw==
X-CSE-MsgGUID: 3EWV0LRhRsKGFodZT9AyCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="191170587"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2025 00:02:27 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKuBt-0000I3-1N;
	Mon, 17 Nov 2025 08:02:25 +0000
Date: Mon, 17 Nov 2025 16:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: cx19970 <cx19970@qq.com>, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	cx19970 <cx19970@qq.com>
Subject: Re: [PATCH] BUG: sysrq: Reset the watchdog during the polling of
 sysrq-t processing tasks
Message-ID: <202511171548.yY6PHme5-lkp@intel.com>
References: <tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07@qq.com>

Hi cx19970,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cx19970/BUG-sysrq-Reset-the-watchdog-during-the-polling-of-sysrq-t-processing-tasks/20251117-130012
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/tencent_B7DDA306E3B6A8CDF3195E4C083C9BD37E07%40qq.com
patch subject: [PATCH] BUG: sysrq: Reset the watchdog during the polling of sysrq-t processing tasks
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251117/202511171548.yY6PHme5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171548.yY6PHme5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171548.yY6PHme5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:13940:3: error: call to undeclared function 'touch_nmi_watchdog'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    13940 |                 touch_nmi_watchdog();
          |                 ^
>> kernel/sched/fair.c:13941:3: error: call to undeclared function 'touch_all_softlockup_watchdogs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    13941 |                 touch_all_softlockup_watchdogs();
          |                 ^
   2 errors generated.
--
   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:2941:3: error: call to undeclared function 'touch_nmi_watchdog'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2941 |                 touch_nmi_watchdog();
         |                 ^
>> kernel/sched/rt.c:2942:3: error: call to undeclared function 'touch_all_softlockup_watchdogs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2942 |                 touch_all_softlockup_watchdogs();
         |                 ^
   2 errors generated.


vim +/touch_nmi_watchdog +13940 kernel/sched/fair.c

 13933	
 13934	void print_cfs_stats(struct seq_file *m, int cpu)
 13935	{
 13936		struct cfs_rq *cfs_rq, *pos;
 13937	
 13938		rcu_read_lock();
 13939		for_each_leaf_cfs_rq_safe(cpu_rq(cpu), cfs_rq, pos) {
 13940			touch_nmi_watchdog();
 13941			touch_all_softlockup_watchdogs();
 13942			print_cfs_rq(m, cpu, cfs_rq);
 13943		}
 13944		rcu_read_unlock();
 13945	}
 13946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
