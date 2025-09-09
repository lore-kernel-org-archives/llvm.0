Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1CD3570C2;
	Tue,  9 Sep 2025 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757446712; cv=none; b=CPtXTbpaybBufkSKzlcKEDeXFYP6Q2b0s2j50/aeaRtK9EzaKYtIeYyhBgVjg0J56H9I3nUhk1fv0+DcAZB5q3i2Lfo0HvOpHjtdgxbEyGaSEp7GrO+oJ3yxK1rtuw7TtETq34onVeHTJx0LIyq5HUBJ1unGuW/BUAu0WGh+6yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757446712; c=relaxed/simple;
	bh=B2FP7eDKHKFs7/vxbnlcBUXE0jZLStdlCk1bdLPO1eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mdenDP2I7oJcvwtUxr21WwePO6ujyzsjjtHKdMhRoNdUHF9oybTUi8ZjJP9YlgeISO8UNQUd1Li0+48sMISbF3879DHq5gBXbrK5fIFEPhcLrhDMngOJ1FR7e7VX39iDr4+GExtr5BazUyqAZVxiBvgu8JVS2d5TzLtuC8HpiTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGR73D50; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGR73D50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757446710; x=1788982710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2FP7eDKHKFs7/vxbnlcBUXE0jZLStdlCk1bdLPO1eI=;
  b=lGR73D50uaNpijzMM1Z9nSfhi842uNx338w/rXyIOuksS6DzF8/g/qNa
   RoJ9JSQv35x27i4yBAILPFR0ACZB1645gnrEKniAkCEox/DhIUgCcyIV6
   xOteadRuKy6F+lSfbDZ0CRHXi+99Vh8VMCJJfWZdL8ebTjGpjC5U/Ra7P
   lor1xI/zRipkhrCVKIJEoKtQfDwEbS8bncyOwKBtt/H4RSz8rWaKAczoi
   1Y2K/U/v9/Tp+LJ3l7Qyn++dfgTTI1yrbOUrLm2q+ykjG7vP+JGf0YR4W
   nBz/vHdj+1IcuYCit4UHcOl4yDj+DyCyV4UOf/h0EN9B+u2kDEuUZlpal
   w==;
X-CSE-ConnectionGUID: XccnFhzuRFSNa3TyA+LDDQ==
X-CSE-MsgGUID: jsUVAYRSRM2G+1W+YF5MmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58960283"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="58960283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 12:38:30 -0700
X-CSE-ConnectionGUID: subOw/nmRneTOws9v8UkBw==
X-CSE-MsgGUID: ciuauH7TSsW4jG4AP8wXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="178394831"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Sep 2025 12:38:28 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw4Ab-0005DH-2w;
	Tue, 09 Sep 2025 19:38:25 +0000
Date: Wed, 10 Sep 2025 03:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 52/58] ld.lld: error: undefined symbol:
 __arm64_sys_rseq_sched_yield
Message-ID: <202509100310.pU42HMkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   b9025298977a359f4b407e221158b3e47e8de250
commit: 736344110a7fbfa156deb091a218dcc282fb358c [52/58] rseq: Implement sys_rseq_slice_yield()
config: arm64-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250910/202509100310.pU42HMkv-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100310.pU42HMkv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100310.pU42HMkv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __arm64_sys_rseq_sched_yield
   >>> referenced by sys.c
   >>>               arch/arm64/kernel/sys.o:(sys_call_table) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
