Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A05737F8DB;
	Thu,  7 May 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165653; cv=none; b=IveEerSm9TeSW+nxu9bRXGNBESniPzcbE7lFI/9/t39oy+i/9S7B84OZzIqFT3ap1GrLhPtAh+YM5FEfm+rPbdSlXNOeIviRIxfXoeXvY8wYXzMoEkDHqOuMPOC8Oh6QdGo06AG2HTvvrW19nZDsKxrJCZBSe3r7RUFP1fglGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165653; c=relaxed/simple;
	bh=qd2PKgHO0opDpYY0vNPNmv+NmBn8RZFuPTTNfmnmkJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JIGdo5hvhG2HmZa559IFEG4eTFF/eP1Fj+XG3/ixkSVuGfGNB1mGrQ/X5FvFHlTbTLeIy/POzc3U9dltc5HTgDI8ggtgNN/tfMF5sSqlTX69UwcOFZdH1fuE78jZx4GZWvUuRVyZ7DKQsd5d+svh00jTQGAKMefkLPiZ9L+X7qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiFdKHE8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiFdKHE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778165653; x=1809701653;
  h=date:from:to:cc:subject:message-id;
  bh=qd2PKgHO0opDpYY0vNPNmv+NmBn8RZFuPTTNfmnmkJ8=;
  b=XiFdKHE8hv5hW0jF1CRYYXAFM6Ewl9bOCdNQRpT50PUuebEThXL8IJb1
   kkEtg5wfWrDBxpxO4EP68+ja4pNZ68zK54zRCXmzEX9V3SMOu35Xpa7OE
   Ucnr2GDpdzRqosh8dr/Wq/qu4HjZfNouYm4mpoGIPTTm0rzYoTrsx0853
   UmTLB7aQuyu8+zvYUPKY5toE9Rh9Nj7Q7vVH6270f+/WvGpNgrEbuKNCd
   TTdGnCwcLCNusVorx5vwRa8j5wKUwlUda0p04ilY/Rd5S4imRnrcBAO46
   wwNl9Wjth4OOSVW6kww4Rw5cDQn7gyxfWe2S2MAzjDyeKQSNH4E2r3fv9
   w==;
X-CSE-ConnectionGUID: oJLnu00HQCy33SR2dXEY+A==
X-CSE-MsgGUID: gxt7rl9DTAa2cwDOT+/UhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79303983"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79303983"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:54:12 -0700
X-CSE-ConnectionGUID: pPTmqhldSJqmNGKxK1dR3w==
X-CSE-MsgGUID: z0/z1LafQ8qyMRUyIJAy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241463670"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 07:54:10 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL076-000000000BP-1Ete;
	Thu, 07 May 2026 14:54:08 +0000
Date: Thu, 07 May 2026 22:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v4 9/15]
 kernel/sched/core.c:5521:3: error: field designator 'idle_sleeptime_seq' does
 not refer to any field in type 'typeof(struct kernel_cpustat)' (aka 'struct
 kernel_cpustat')
Message-ID: <202605072245.sxSsDd16-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v4
head:   4c91a3f3d50ec8ceda89c083db92beb25a5526ee
commit: e7ac735799f7047514ea9badbbdff16e96a5556d [9/15] tick/sched: Move dyntick-idle cputime accounting to cputime code
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605072245.sxSsDd16-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072245.sxSsDd16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072245.sxSsDd16-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:5521:3: error: field designator 'idle_sleeptime_seq' does not refer to any field in type 'typeof(struct kernel_cpustat)' (aka 'struct kernel_cpustat')
    5521 |         .idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8055:12: warning: array index -1 is before the beginning of the array [-Warray-bounds]
    8055 |                                        preempt_modes[preempt_dynamic_mode] : "undef",
         |                                        ^             ~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:8030:1: note: array 'preempt_modes' declared here
    8030 | const char *preempt_modes[] = {
         | ^
   1 warning and 1 error generated.


vim +5521 kernel/sched/core.c

  5518	
  5519	DEFINE_PER_CPU(struct kernel_stat, kstat);
  5520	DEFINE_PER_CPU(struct kernel_cpustat, kernel_cpustat) = {
> 5521		.idle_sleeptime_seq = SEQCNT_ZERO(kernel_cpustat.idle_sleeptime_seq)
  5522	};
  5523	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
