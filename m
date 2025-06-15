Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD0B13A41F;
	Sun, 15 Jun 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749997693; cv=none; b=FNguW6PZZfPzxpcbfN/xhAywZglMU1+6WOgqcQzNKOTeUtLS07JLXg5Usdu7qs4XuXSKxCvX+amYtYJNsvbHHLojP70PiuWteRj6E+uabUI0QmhraE8UwAg0gAZEM1KxLSIqqj5NU8e7TW6FbYRWljCpBWLcXeGrTlwAbZQES0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749997693; c=relaxed/simple;
	bh=d+bEPGbZ32eRHBPWuFiJZbVDZF3W4zfier/8Do1YGOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EW9HW0jpFN3IOuLP5/oNULJwJYeimwF5qVtmQ1B5ZP2fJqM6Se5PMIDt6ceGqd8446sG+GOTWkcsBTXaulUWKmNGbFqNavPztkjB/5YGjcoxlQJLZXD3EjjT753sZUa5INUYzuD2UBy/3oCNf5I6XRqeiMV8l4sYsVsW/K9C5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLat4uHg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLat4uHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749997692; x=1781533692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d+bEPGbZ32eRHBPWuFiJZbVDZF3W4zfier/8Do1YGOY=;
  b=jLat4uHgyhc7fcpv4/M959T57pbo8L+lX3eGbvVa/NjMJJyKgBhK/f8D
   JePEBE/u9pjtb4iQw0MYgAwNgIgALbEGlL/Aek5jRg94UxzjYV0bJ45mg
   jZoi2ItAd9bMTSI9rM9/wDKjuMYBxCNOtyJST0Vzgl6Z9dq9SEUjCAsto
   A1hPgHB+XNh9bXg+eJV2MGxORI2tgmJpnBQsUbQQTIP27X7OnTJb9t4aW
   3cNLHFiTOnxMo506ol6zRmQiqxJmTjUZICbDuInidoTse/TPvzVAKw/Yh
   UnOjVCitC9gUrb/C/lzGHIyvQD1AvjfmCp9v44vH930QPwVOVczv3UcBD
   A==;
X-CSE-ConnectionGUID: YcxA0nP0SPq2FpW8TD438g==
X-CSE-MsgGUID: m7HD9RHQTtyUA2tmrUhvyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52287163"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="52287163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 07:28:10 -0700
X-CSE-ConnectionGUID: +Bx5D87HRlaAf4Hdy+Sc4w==
X-CSE-MsgGUID: 37ZCB5gwTWeQI0uyayMB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="148631282"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jun 2025 07:28:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQoL7-000EMm-1l;
	Sun, 15 Jun 2025 14:28:05 +0000
Date: Sun, 15 Jun 2025 22:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Prashant Malani <pmalani@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Prashant Malani <pmalani@google.com>
Subject: Re: [PATCH] cpufreq: CPPC: Dont read counters for idle CPUs
Message-ID: <202506152245.BJAubGbp-lkp@intel.com>
References: <20250614003601.1600784-1-pmalani@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614003601.1600784-1-pmalani@google.com>

Hi Prashant,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/cpufreq-CPPC-Dont-read-counters-for-idle-CPUs/20250614-083659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250614003601.1600784-1-pmalani%40google.com
patch subject: [PATCH] cpufreq: CPPC: Dont read counters for idle CPUs
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250615/202506152245.BJAubGbp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506152245.BJAubGbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506152245.BJAubGbp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "idle_cpu" [drivers/cpufreq/cppc_cpufreq.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
