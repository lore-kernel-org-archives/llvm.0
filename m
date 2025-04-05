Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F119E992;
	Sat,  5 Apr 2025 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743823540; cv=none; b=PIXlrIpx0/U63TulaEqtrnaXQ3hLrVVvotzV8IM+A+WtuB9jk2FKbZ5jPs8HCwQJ5gMT0BaiB9/owskpqFUraPxMFJiNIobV0EPmVJk1kG0NNT57ZmK1lEGLKigD6CF8xDMXcQx3Wq4j/R7va3pFtxZjuUyuOmQdd/Ikw3+9LXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743823540; c=relaxed/simple;
	bh=f5bCoWNtpRBvun2ExG/cKN8//HwVZaQxbYFP3iQZfYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnPxq8QEXnb+8iN4n62tFohb/w86pskHYI15A2P7u1YpT1moqK0LyoED36YUAl0cmXKgJgQyUnBav/9dSrLsXsS9fHDjHqJsF4QoqI3pXTfNphP9G8O5DLFdSvHKU7OUxuOWf0g28irjDSITp8pML+gT8JZS0e7R4Psp9sa9sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsXCA4DR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsXCA4DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743823539; x=1775359539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f5bCoWNtpRBvun2ExG/cKN8//HwVZaQxbYFP3iQZfYk=;
  b=XsXCA4DRUGy9EgKUSajnVMn/App6bzPYUGJaeN90KOP8xQ635Yb+jKWp
   efZc7v7mm0LDrpCtrPwLoIkDWRY04sYc67U8SjRphwVm2f1aW9bAPFj3L
   ncTNvoAwmR+ePWrSuKiXlyE4de9AUcWOJfAVpC+/P/ojC6qoS/08utupt
   fGRqgmxUqsUncMH2orcrcXH6GElN3441m7ap+hzll4AtZF0KIScIy2T5K
   LJSKOQEuMbBR7MjqO1hN0oJkixZL+fRkEFXV8gLPNmulptB0rv8AsI6mY
   J2RJC/zDJzYYdtlza7kYhwlftfJ5QJaOVRLQvNqDR23frYMZQ2bTm3KnD
   Q==;
X-CSE-ConnectionGUID: TGnVPUBJSpSE0MjEQTC5Mw==
X-CSE-MsgGUID: SLU1KoOPQSWI7/zOxt7Z+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67750619"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="67750619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:25:36 -0700
X-CSE-ConnectionGUID: 6eXt6FOSTaqAXRu1OkdjkA==
X-CSE-MsgGUID: 6mQjgL0NTYCTb8wRUciyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128317344"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 20:25:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uA0-0001mN-2p;
	Sat, 05 Apr 2025 03:25:32 +0000
Date: Sat, 5 Apr 2025 11:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] sched: Add sched tracepoints for RV task model
Message-ID: <202504051122.dzVIM0US-lkp@intel.com>
References: <20250404084512.98552-16-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404084512.98552-16-gmonaco@redhat.com>

Hi Gabriele,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e48e99b6edf41c69c5528aa7ffb2daf3c59ee105]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/tools-rv-Do-not-skip-idle-in-trace/20250404-165047
base:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
patch link:    https://lore.kernel.org/r/20250404084512.98552-16-gmonaco%40redhat.com
patch subject: [RFC PATCH 5/9] sched: Add sched tracepoints for RV task model
config: arm-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051122.dzVIM0US-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051122.dzVIM0US-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051122.dzVIM0US-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __trace_set_need_resched
   >>> referenced by sched.h:2071 (include/linux/sched.h:2071)
   >>>               kernel/sched/build_policy.o:(idle_inject_timer_fn) in archive vmlinux.a
   >>> referenced by sched.h:2071 (include/linux/sched.h:2071)
   >>>               kernel/rcu/tiny.o:(rcu_sched_clock_irq) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
