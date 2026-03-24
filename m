Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939545BE3;
	Tue, 24 Mar 2026 22:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392330; cv=none; b=tEkkctrh8HoWzxzSL8kvSex+Q+loU/AET1ykEYJaZkBn6RCJH5CaFxbUcz+vczDBdsBKpK5gzic5FIh0bu45idtVKfN5JtDGY6JFUFcWd6+0ODsHviPM77g5MpHBLsmWhzJZF82M+ImsCoWEiFQxgDb2sLw3MptliCAPOyM8VaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392330; c=relaxed/simple;
	bh=THc06DQ3l8ptVCXlPt5mAa/4t4qSjj1h5BSZc2NRN2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMCnFYEqzLBftKMG6tMH8AVpKFAiiJy+FjZQ1Y+9FrJUZXLlmKwCaGFYIjEx+hg3DF0HPqywL3NP4t3Q1CVOri/hGRrKsL6ivtMs3c6LYUDJzkMs5fdbDFSkT/nmHmEHiV2mCGrJV4R0JxACrGhSCMyhHv+wtT0DmNaAlng9dvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxKm7bmr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxKm7bmr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774392328; x=1805928328;
  h=date:from:to:cc:subject:message-id;
  bh=THc06DQ3l8ptVCXlPt5mAa/4t4qSjj1h5BSZc2NRN2E=;
  b=mxKm7bmrn5KD/Lj0ObzXz0KIZfBXXuZIgkQQFfs9qWg9kJZKJucHStwf
   2Sa41VJLleKnqqf/zZp+tXzy1hU+Sm+FmfvY4oDsbs7gDDN05xPV36kBz
   6glMhx9WeXMDTpMiQ1mBq0B94F1MIfZl4Z8WFz2GK8fITePmUjwHRD0Fi
   BhY7w6Kz+mksQFEcYLIqdiePYrTMnRhttlkX0IAuY5uveITcONsYHIv0D
   7FhSymMClpQROP32s1t79cQUiONAZiTkaSYcW8EdZLEXr/6QGd24xXup7
   EC3KCDgv97eBM7dCfI7YhI4wXMKHEG8nw+SEaQ6+AmAPNDGaOsOvwi6k+
   A==;
X-CSE-ConnectionGUID: jGEHiVcZTlW7lRn08tgr9w==
X-CSE-MsgGUID: QDoXlo5wRlO+uwEgPARNNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62974051"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="62974051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 15:45:28 -0700
X-CSE-ConnectionGUID: C6cAAbLkRAeKmEkBr40evg==
X-CSE-MsgGUID: 0dRBhlIBT8OwvegCpJQmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224449563"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2026 15:45:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5AV0-000000005X7-1qTc;
	Tue, 24 Mar 2026 22:45:22 +0000
Date: Wed, 25 Mar 2026 06:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Kees Cook <kees@kernel.org>
Subject: [kees:dev/v7.0-rc2/obt 2/4]
 include/linux/compiler_attributes.h:409:10: error: '__trap' macro redefined
Message-ID: <202603250654.OxFzRiGv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   537858cd27d509ec0dedfa4b96bc1d0e461367b1
commit: 368a623ca334a5de414be74df0471266c5985152 [2/4] compiler_attributes: Add overflow_behavior macros __wrap and __trap
config: powerpc64-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603250654.OxFzRiGv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250654.OxFzRiGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250654.OxFzRiGv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:88:
>> include/linux/compiler_attributes.h:409:10: error: '__trap' macro redefined [-Werror,-Wmacro-redefined]
     409 | # define __trap
         |          ^
   <built-in>:406:9: note: previous definition is here
     406 | #define __trap __builtin_ppc_trap
         |         ^
   1 error generated.


vim +/__trap +409 include/linux/compiler_attributes.h

   398	
   399	/*
   400	 * Optional: only supported by Clang with -Xclang -experimental-foverflow-behavior-types
   401	 * passed via CONFIG_UBSAN_INTEGER_WRAP
   402	 *
   403	 * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
   404	 */
   405	#if __has_attribute(overflow_behavior) && defined(INTEGER_WRAP)
   406	# define __trap                     __attribute__((overflow_behavior(trap)))
   407	# define __wrap                     __attribute__((overflow_behavior(wrap)))
   408	#else
 > 409	# define __trap
   410	# define __wrap
   411	#endif
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
