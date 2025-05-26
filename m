Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7B136E;
	Mon, 26 May 2025 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748219804; cv=none; b=ZzXWb5Yrl+ScqVhDdq2yXTlZrxbg+975ekj9iZX+DN+fqPOSkDzSNXAW3EJoLGIX55Uh7SvdBYjmhqq3yiwIwTjsp+B5I9fIfvy+WpEqQ4Qm6yhSq5Bm2I7cWYIt6CYfuMWZJwhZjTARrsw140Us7ezFr+ziNeun11wW5JBbt0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748219804; c=relaxed/simple;
	bh=wl/rwo4cvQ99cnE05I2raSPH9l4FYD/NCeJACTJObSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WhiI/SkjryBi/LsnPAZV4j3m6yT2vEMHgu2WJcZBh2sn0sihqGbQYawhbWooSSQp894K2qWpWKBrq52bvkbr2ql9+ykzqbXdJ9QJeJoCwntY579IBCj92vGZ0QGhvh0w9AZOcsunDgAtqNZiD+ZXI3+ep28wO/eaPQd7Mlwm72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Izl+UCqh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Izl+UCqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748219803; x=1779755803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wl/rwo4cvQ99cnE05I2raSPH9l4FYD/NCeJACTJObSY=;
  b=Izl+UCqh5ulXZXt6rTPoOPAAkD0auYZs3Q27Xmk5NmHDdmI9I0GIBcN5
   UPIF0qN2PQxWugVncT2fKMSbcwl8YZ9V46qoKogHFRt0aOYEbxIRXygCm
   bEjRQ8SuLfYBj48Bc4dbl0w2AK8TpdDzMkYkAj2uzCzFECUVRxCIF0tMX
   kX+6t0LpZdqYOEUG3VSoXET6sDWF9fNjU0Es2rSEe9NC6EGGbMmEiwVed
   tTxSNNzzwKQWqsZwJMBrFRJlWSbxF8vXU/1qtQYkOFj3V/WpO3sORK/Tb
   PTcSTBtR6a0z7qLW8yow6ZY3WEJrw8QA5T7hFSn81vRTCFFjpqe0Oe3wG
   g==;
X-CSE-ConnectionGUID: he5heWQtQI+kkaIMqhXwZw==
X-CSE-MsgGUID: Kd3FouSMRMmS+ijPFucxkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="49436904"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="49436904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 17:36:40 -0700
X-CSE-ConnectionGUID: oeiHjjWpSW+3wNom9pM9gg==
X-CSE-MsgGUID: k1c2gdXkRJ2f/1FEj8LT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="143074889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2025 17:36:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJLpU-000S34-3C;
	Mon, 26 May 2025 00:36:36 +0000
Date: Mon, 26 May 2025 08:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11584/13331] error[E0599]: no function or
 associated item named `from_of_cpumask` found for struct
 `rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table` in the current
 scope
Message-ID: <202505260856.ZQWHW2xT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 2207856ff0bc8d953d6e89bda70b8978c2de8bab [11584/13331] rust: cpufreq: Add initial abstractions for cpufreq framework
config: x86_64-buildonly-randconfig-003-20250526 (https://download.01.org/0day-ci/archive/20250526/202505260856.ZQWHW2xT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260856.ZQWHW2xT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260856.ZQWHW2xT-lkp@intel.com/

Note: the linux-next/master HEAD 176e917e010cb7dcc605f11d2bc33f304292482b builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `from_of_cpumask` found for struct `rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table` in the current scope
   --> rust/doctests_kernel_generated.rs:4025:32
   |
   4025 |     let mut opp_table = Table::from_of_cpumask(dev, mask)?;
   |                                ^^^^^^^^^^^^^^^ function or associated item not found in `Table`
   |
   note: if you're trying to build a new `rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table` consider using one of the following associated functions:
   rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table::from_raw_table
   rust_doctest_kernel_alloc_kbox_rs_4::kernel::opp::Table::from_dev
   --> rust/kernel/opp.rs:559:5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
