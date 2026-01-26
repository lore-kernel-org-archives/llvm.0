Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C12C0298;
	Mon, 26 Jan 2026 20:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769459734; cv=none; b=uqWhL8iBJTkIp7Gzx2P2zBDNCoww9Do5DfqfFwWPHV9+PjJFv0VNPa8w4UoT6IMHrFDEu1Bb6Mj4HXteSiE3GUynIkXt/arlffDcZDYMLaz/GQE7V9HIEQJ19TpF0y7WaJPssiYg3zoNHkHnSYuj1BRQAm9etCuniQYc/NTvmvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769459734; c=relaxed/simple;
	bh=V1RzzugFq4lQjn+rRdnD+51syDtTdeDk9UK3+wcJ9r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tfWdZG2GWceW5Hh9hi4uLdgmCgLRwl0to6trMKZPcFpIO3aQ793jb8bUqGCeBx3pPXJW7+tqdOYmTUFpYLZedixJ+YdKhGYdTQdbbBiiERF6vgQnpILh/xadapqKqQSzUSDCqK26BY7T4YMG29Sr6aiE/Jn2MdXVnb4J5j154UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0RokPYe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0RokPYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769459732; x=1800995732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1RzzugFq4lQjn+rRdnD+51syDtTdeDk9UK3+wcJ9r4=;
  b=l0RokPYePyYID4DchkqJ8gh+PpTS3ISnGOfIB9aZVsdv73ZpVR92md78
   AqSA8mm5vxkHM0IOtD2P0CmncCPxH5Doml++Y9a5DPzJZkEJ0RLVhOiZf
   PmT7jS9eiBPOZMm8Y7dlrPh4BoDc4kPMOilWe7/n0WjdmrxX47+8icGuc
   l/VFF3K9CHIX67PDIT8v1038EHf/qwdxjt4CWWlmTSpmdJe/3ooqoWwx9
   wF0y5pR1JGaSRxO6iJcnJLEp+tjm8Qhsv+TvgAstqKlWhuXS2EgsnEiav
   0cWNFdLV6bIwJgzt2xR1mQrblDFuZmvyR82lIN3q4GoiX6TIBGe7jE/9p
   Q==;
X-CSE-ConnectionGUID: Oc2kUtlrQ9ieB9oeBPZbaQ==
X-CSE-MsgGUID: hyffc7jDTeSpvELlcD7aSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88223077"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="88223077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 12:35:32 -0800
X-CSE-ConnectionGUID: S59lCWnrT7qfeQEGD1Jk/Q==
X-CSE-MsgGUID: tbwxUyztSPmeprNDfLzwLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212238335"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 12:35:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkTJ2-00000000XfQ-2zGW;
	Mon, 26 Jan 2026 20:35:28 +0000
Date: Tue, 27 Jan 2026 04:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/42]
 kernel/time/hrtimer.c:121:45: error: static assertion expression is not an
 integral constant expression
Message-ID: <202601270426.K3P5aymt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   80461d79725e9de0ffda5d621552a2db3608f64d
commit: 2969d9693803a8bfd1c8bfcf3943af5a920be88f [41/42] hrtimer: Add support for auxiliary clocks
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601270426.K3P5aymt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270426.K3P5aymt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270426.K3P5aymt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/hrtimer.c:121:45: error: static assertion expression is not an integral constant expression
     121 | static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +121 kernel/time/hrtimer.c

   120	
 > 121	static_assert(HRTIMER_BASE_MONOTONIC_SOFT - HRTIMER_BASE_AUX0 == MAX_AUX_CLOCKS);
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
