Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D8154423;
	Mon, 13 Oct 2025 01:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760319569; cv=none; b=aSNtJYBzGsp2+lA4CAiU8x8OpWxzod3xEyTQlyflgJyMrGdPxcPf5qDhIXO59AP3VAXAyZZmBom7iObbtR+V0iyBSQ6cSDWRvFmjfD2AwllXRjwDORDbCmtUnr75LHezNI3ZVxRZTYdlHorXCbp0lRsgW9bF2L2s59mPHOvxMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760319569; c=relaxed/simple;
	bh=/1pP5zxscWVetNDfmqGKBR9fVFN+psIun5cGGATKom0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdkSzpWuc5KkE3iZJ0vux7vWM2jwVzWAol1c+CSn5M6pWrOnMC3rS5BuAcSDWaELTyrd4RUCre5YSfY1guphPFLTrbP1e7LrUzcQSJKDyCt1p44ReuahVFSwYKeyB21yiod7lrRlKo9v0YBxleKmjXA3JO6nA97qEq3i5A5yqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4/4EA63; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4/4EA63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760319567; x=1791855567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1pP5zxscWVetNDfmqGKBR9fVFN+psIun5cGGATKom0=;
  b=L4/4EA63fE6/yp4+34wIdKPfs0MuODFsaNFUSo6aNwngtj5mMYakMPDj
   GVfO6JMcbD6PWHm0XoE8P+SwaZglxmBCL48uZue6+93yD9YORNMVPwnmc
   PbyT/kXxIMJvWUJJbw+IFAwj2ijKouN6Ej5F4i5Tge+UbNyCS+AySlQKT
   p9EUzGlv/AWv4tFA0sFLE7OMGB4KZ/YvnLErHS4yHWIy+p/7P5yiDTcnv
   S8SjUgFDWY/GR/EwERz2uaN6lAP/JI0Y9vuhcKLAfJTTHNVXb9vj1VACp
   dbGYiWOxrs3caffvJANBpxFj+rQjBPjnqEnPEiYRwcC9IJ2wFOLg7NvQ+
   Q==;
X-CSE-ConnectionGUID: 934XwZPvSCGM5ZBCbhJ+fA==
X-CSE-MsgGUID: 81Nac9naSdKgyFejXu6xyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62492173"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="62492173"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 18:39:27 -0700
X-CSE-ConnectionGUID: iq8KFnQKQuGQ1Gb0RcOhrA==
X-CSE-MsgGUID: UHsOALlNS7m1QfTPGQNzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181888557"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2025 18:39:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v87WI-00005P-2o;
	Mon, 13 Oct 2025 01:38:48 +0000
Date: Mon, 13 Oct 2025 09:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC RFC PATCH] mm: convert VM flags from macros to enum
Message-ID: <202510130950.c1X8jzTs-lkp@intel.com>
References: <20251011093054.886460-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011093054.886460-1-ye.liu@linux.dev>

Hi Ye,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Liu/mm-convert-VM-flags-from-macros-to-enum/20251011-173307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251011093054.886460-1-ye.liu%40linux.dev
patch subject: [RFC RFC PATCH] mm: convert VM flags from macros to enum
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251013/202510130950.c1X8jzTs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130950.c1X8jzTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510130950.c1X8jzTs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
   3743 |         struct cpumask *cpumask;
   |                         ^
   1 warning generated.
>> error[E0425]: cannot find value `VM_NONE` in crate `bindings`
   --> rust/kernel/mm/virt.rs:396:44
   |
   396  |     pub const NONE: vm_flags_t = bindings::VM_NONE as vm_flags_t;
   |                                            ^^^^^^^ help: a constant with a similar name exists: `EM_NONE`
   |
   ::: rust/bindings/bindings_generated.rs:8324:1
   |
   8324 | pub const EM_NONE: u32 = 0;
   | ---------------------- similarly named constant `EM_NONE` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
