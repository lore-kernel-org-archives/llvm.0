Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676613E41A;
	Wed, 19 Feb 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739934379; cv=none; b=MHy1hjLWqpVzyGW+guch0xEJLe6JAUM2rr8eh7VtsZE/0x0monj5jzkYRkJMAc0Li9lW95LoumXAq7fQsgAd6pdSq+RUYijEukofafLxBM5jThJCbEHScsweDecUlXevXY5lkWD5ShynYbGHaNDFOJ9VPCl5rqkazbT2SL/Uhy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739934379; c=relaxed/simple;
	bh=/VC6d/FurEbvICWPsw4rqsXuMgMvqwURwmuZ8kn81C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9e8VVMyPAU+SYl6vxvgtmUZVPR/Ky0x1HgyUj/gKoFcmCVqOTq/uXox/vTLGmQFYKdsmjOTYWk8PdjeWQRkXDdHax3uxVZf3tiNCusSHFg60/vPuacCsxZQdEz/IfXm/tVfJH5uVvGT8+ROT79w1yeSd+K7N6mGkOBwBlnTqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VozDNN15; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VozDNN15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739934378; x=1771470378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VC6d/FurEbvICWPsw4rqsXuMgMvqwURwmuZ8kn81C4=;
  b=VozDNN15VEOPDHUy3iMUqwd9CCaqtl406e/GBSMBU2Db/yC/UNOXu2Hv
   N4PSLf++jjTeWjV8jkVBFcEeI7zJeYUFiCmq6ueLKwOOWet+MYi2SbEG2
   3Y5y4CMYs4+SA44JFRtgEBeykcISbjRZV57zB+fyujjjGtCoG6TOHUyuf
   rpMbRgqhhVEeQEOB0Cledl6B6z7cP0SS1PzrnvUGSEZp0pmVHOaga7w/v
   NH3WYKCSZvUpP3J8jcJC3eJPCzXx4bMYR/Ax/6bdePIAzm9L6vjDuHvRM
   XZ0pEXaS7JDVI5RDOy+bfl7Urd9bZmfe20tGoCN+YeyWZ6iVFzdqw8hJ+
   Q==;
X-CSE-ConnectionGUID: Q14o0qPIR2mruhUkGTRlpg==
X-CSE-MsgGUID: OGnWTqgGR8Oguj5/uNq2Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40864884"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40864884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 19:06:15 -0800
X-CSE-ConnectionGUID: sbbPW/PqTrSfldnaVI22Qg==
X-CSE-MsgGUID: Zm9r219UQ5yblq35FNifOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="119565480"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2025 19:06:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkaPa-0001Af-2w;
	Wed, 19 Feb 2025 03:06:10 +0000
Date: Wed, 19 Feb 2025 11:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/fineibt-bhi 16/17] ld.lld: error: undefined
 symbol: cfi_bhi
Message-ID: <202502191013.OXGHIkug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi
head:   fc37d12eb49df491173cf99055fce6108a2a99a3
commit: 5095a689d0f306c9ce4c9ff5d905626f0fa557ed [16/17] x86/ibt: Implement FineIBT-BHI mitigation
config: x86_64-buildonly-randconfig-002-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191013.OXGHIkug-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191013.OXGHIkug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191013.OXGHIkug-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cfi_bhi
   >>> referenced by alternative.c:1002 (arch/x86/kernel/alternative.c:1002)
   >>>               arch/x86/kernel/alternative.o:(cfi_get_func_arity) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
