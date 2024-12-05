Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA291A8F77;
	Thu,  5 Dec 2024 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733382350; cv=none; b=aV+G8/AWD06IkT4bLwrc1UBhe4elDV5FiculA+hruge41l4S7l8yU2nXo2t2I+MRKKcJGzGrPKv9d7QxskDuHFT1XfSvbEBFWFlo8FrQ4XU0vnQIg7AKUci9u9tXh1QgmQouPm0y1kmdBvXJs9m6CDoxTAtCuguSJ2rdRPe0kN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733382350; c=relaxed/simple;
	bh=s+aYMHHJ8wuTeVRxlKHDW0XZRBovFWgf3na/Vvfs+fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJTiNKMtoHXg3jy6rv9UTzp7+5vunEF1TvI/0opyloU2aYij3bsoexMp90AKFT7r3CsptZt4hdX4g5u2egzCWWYJHQXbJ0lqsMlN8fMdt2KnLVqY9urEQdrDVfb+SJ9JMuEX+FUNnn4kJuorBcfD6mVhrmt15hniQ90t/2mP7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qx8GKW9n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qx8GKW9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733382348; x=1764918348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s+aYMHHJ8wuTeVRxlKHDW0XZRBovFWgf3na/Vvfs+fY=;
  b=Qx8GKW9n41FKKezzMctc6ddOhZWOuaZv+muaedebjqQe0sa0XMkE+VtW
   Okprgmhl+XMXbc83PW8Ae+I7qvEKxGtlew4LlbdmcHuENLUnNi33dswhQ
   hBeo7piCUxCi2IxyIjCIz7UPMIWLk/5CObLOmCDfNy+MJLnO91JtZ65PM
   46IadGaG2LjJQeSB/HJNqbv1D4KBgZG7LD9CPuoJc04A1j8Xm90XQmtC4
   fN8wsOOSw+KP7SKKBN03jsfr+BK9HssjbHnsbrK7DG9kCkfVZJ/KyO6BB
   47Sz1132Z20xZcFE4sdItV54utk1t9eKkYXgYSUfzgjgTiCtAdD0TUAEL
   Q==;
X-CSE-ConnectionGUID: DG087+eCQ0qGhw0rcTfwYw==
X-CSE-MsgGUID: GBij/8SxRV2L6VXdGfwLuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45054703"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="45054703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:05:47 -0800
X-CSE-ConnectionGUID: UakgS2diSHWOqbGXFnxltQ==
X-CSE-MsgGUID: HArFaIXhQOq9wXry2bxXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93690738"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 23:05:46 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5vk-0003vV-1X;
	Thu, 05 Dec 2024 07:05:44 +0000
Date: Thu, 5 Dec 2024 15:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tobias Huschle <huschle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] s390/topology: Add initial implementation for
 selection of parked CPUs
Message-ID: <202412051415.gGx8svUs-lkp@intel.com>
References: <20241204112149.25872-3-huschle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204112149.25872-3-huschle@linux.ibm.com>

Hi Tobias,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on s390/features]
[also build test ERROR on tip/sched/core linus/master v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tobias-Huschle/sched-fair-introduce-new-scheduler-group-type-group_parked/20241204-192421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20241204112149.25872-3-huschle%40linux.ibm.com
patch subject: [RFC PATCH 2/2] s390/topology: Add initial implementation for selection of parked CPUs
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20241205/202412051415.gGx8svUs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051415.gGx8svUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051415.gGx8svUs-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: kernel/sched/core.o: in function `ttwu_queue_wakelist':
>> core.c:(.text+0x2d66): undefined reference to `cpu_parked'
   s390x-linux-ld: kernel/sched/core.o: in function `select_task_rq':
   core.c:(.text+0x2f3e): undefined reference to `cpu_parked'
>> s390x-linux-ld: core.c:(.text+0x2f82): undefined reference to `cpu_parked'
   s390x-linux-ld: kernel/sched/core.o: in function `select_fallback_rq':
   core.c:(.text+0x5d02): undefined reference to `cpu_parked'
   s390x-linux-ld: core.c:(.text+0x5d50): undefined reference to `cpu_parked'
   s390x-linux-ld: kernel/sched/core.o:core.c:(.text+0x5e16): more undefined references to `cpu_parked' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
