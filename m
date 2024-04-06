Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD9432C84;
	Sat,  6 Apr 2024 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712385024; cv=none; b=c2T+HkMJQKlrB+z7er3zEIE5612qf1xrwWq6pFn/JGr05uAbbWyiFErrsdu5nmX9MkRipiJmmzYcGVTt9Bo/hhgPEb7wnnA+Ndv98EPWZPA5PdOx7FvZLcYqOK4oxvmaiQ1CUX1QIK7ZTq+ueYS8t+XC9caUfxaxvVNMblpxZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712385024; c=relaxed/simple;
	bh=s1F6tr7KYXapCHGSUZqLh2nhWAlNb7ib2ZTUzs11/xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7ubJrMBOSJBmwOLw8VO2nWmFsuJssIssYZ28h7z3wkZi9fozAAGyu25R0zu/vZGUWvPlmTLO7WbSw8+1b44qcxy6ZWPlw1sytelOlAucw11vGsYv4Vzi4qqrkgSHeoJpnAOL/66KzczARp2o+ReshJbgBBqlZ4wt0IIzDcw9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LK1rbWyc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LK1rbWyc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712385023; x=1743921023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1F6tr7KYXapCHGSUZqLh2nhWAlNb7ib2ZTUzs11/xo=;
  b=LK1rbWycABY7i1CuWzBdteTsFRdewjJkeXNonAebh+NMHu4ggkg+F0kc
   b/GwqqlvzjZ/IxqsplfcTcEcIE4VadOPLjxuAiM6SqK4aeDUAGNBymZSa
   ABCxiMbn8Rl3XbrY74JKxRI25NuxT5PKKz41YoN+320OKBlZaLeLLXevW
   Gz16X9wC6VyuA1/lRRPIDST+UCzUu2biZYzIqIevckKqEcAqQUFAPrXDo
   EiHAkP0NjKpO1tocJojkRoWr84t/e8yZ1OiqAUhoW4uuNXWIOFBlyxLWh
   N74G7nN4uwpemdxa9tbyFs5wFWWNVscZeYSlvtZGf5YLrltUN3cWA43L5
   g==;
X-CSE-ConnectionGUID: PCZeBzg6SZaa5znEGY+KYQ==
X-CSE-MsgGUID: M39LFTjqR+WctyqG0dv0iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="33125769"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="33125769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 23:30:22 -0700
X-CSE-ConnectionGUID: 97MnnugLQZyrfGW/Pw7ETw==
X-CSE-MsgGUID: XNJxc5PcTR+t5+6Stpkzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="19301208"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 23:30:21 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rszZC-0003CW-2B;
	Sat, 06 Apr 2024 06:30:18 +0000
Date: Sat, 6 Apr 2024 14:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 53/100]
 drivers/gpu/drm/i915/i915_gpu_error.c:2454:9: error: use of undeclared
 identifier 'cnt'
Message-ID: <202404061425.KLsAowWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: 0c7ac54b4d39c4221439759d885ba73c56a55312 [53/100] drivers/gpu: convert to ->read_iter and ->write_iter
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240406/202404061425.KLsAowWj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061425.KLsAowWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061425.KLsAowWj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gpu_error.c:2454:9: error: use of undeclared identifier 'cnt'
    2454 |         return cnt;
         |                ^
   1 error generated.


vim +/cnt +2454 drivers/gpu/drm/i915/i915_gpu_error.c

4fca51984371d9 Jani Nikula 2023-10-31  2443  
0c7ac54b4d39c4 Jens Axboe  2024-04-05  2444  static ssize_t i915_error_state_write(struct kiocb *iocb, struct iov_iter *from)
4fca51984371d9 Jani Nikula 2023-10-31  2445  {
0c7ac54b4d39c4 Jens Axboe  2024-04-05  2446  	struct i915_gpu_coredump *error = iocb->ki_filp->private_data;
4fca51984371d9 Jani Nikula 2023-10-31  2447  
4fca51984371d9 Jani Nikula 2023-10-31  2448  	if (!error)
4fca51984371d9 Jani Nikula 2023-10-31  2449  		return 0;
4fca51984371d9 Jani Nikula 2023-10-31  2450  
4fca51984371d9 Jani Nikula 2023-10-31  2451  	drm_dbg(&error->i915->drm, "Resetting error state\n");
4fca51984371d9 Jani Nikula 2023-10-31  2452  	i915_reset_error_state(error->i915);
4fca51984371d9 Jani Nikula 2023-10-31  2453  
4fca51984371d9 Jani Nikula 2023-10-31 @2454  	return cnt;
4fca51984371d9 Jani Nikula 2023-10-31  2455  }
4fca51984371d9 Jani Nikula 2023-10-31  2456  

:::::: The code at line 2454 was first introduced by commit
:::::: 4fca51984371d930a5d9d5a8b0848b892dbfdecc drm/i915: move gpu error debugfs to i915_gpu_error.c

:::::: TO: Jani Nikula <jani.nikula@intel.com>
:::::: CC: Jani Nikula <jani.nikula@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
