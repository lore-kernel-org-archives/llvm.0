Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3792820AC;
	Tue,  3 Feb 2026 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151846; cv=none; b=KGp5i/a9u6mi9mpamvlcwDag0+nGX1bcC91U4nuSUrMaW5BCGCQykd2s3o/orqhB4zkKIBckyBy0WPLKzr+ATWewZ9uDHla+gShrSpj6jijpMCk8EzXQcf4dlrwiWmJJmQ/bBq1KhHDDJvUEFVlTrCufQ7bWoV6YduwUlHoQuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151846; c=relaxed/simple;
	bh=4ST4A18aqszU2Nr+2SWuqlUjzybC/A7BQuZGLQp8oMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JBom7yQw3buSYhuGIZ0G1/g3WO+OEav/PcUjuvBf2kNpUz+DJ977D25H287p1cMnwJB/oBaAIl4AaF7iUgObRpf0iZplzxVxozlRvp3QmjuZpOo/+FvPmUW7TB3T4bYfGZboCfMTCH89AvsVjnvZtsS9v25btbGrefdcZbQMftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPscGOK1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPscGOK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770151844; x=1801687844;
  h=date:from:to:cc:subject:message-id;
  bh=4ST4A18aqszU2Nr+2SWuqlUjzybC/A7BQuZGLQp8oMo=;
  b=NPscGOK15HXkB2v2+Ia0wO6akJVlU0421QPrjlm35eOsr8c8HX3tTiLj
   4DSgufx7Jzl3eFRx7CH3btCGkzSJWL7fCKpvGzg5GomDebFpuv3fFYNAe
   0WrsRecmldA4vVS2MM2DlrPKOY62gNs+/AAi//+rYCiJKRE+Uv1Wx73oI
   EmCR38gWE7Jq0xmCCzy0fmTP6bKYTkBGFlfbC1f8ge/2x4PS6Zovpaagq
   18jghofj0gX08CPemRditeLYjk8iGelQ5u32B8jvpr+CYhO11SXBaCdme
   C8DyCCFwerQwMXPQgZh80xYVGs68Cb0DO/Dk7cSNe+UiDgubp82NQoJOz
   A==;
X-CSE-ConnectionGUID: 5atPHzM6TE6dkS6VG8Hv9w==
X-CSE-MsgGUID: wF2AWDj/Q4OLk4VEmmeI9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75191397"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="75191397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 12:50:44 -0800
X-CSE-ConnectionGUID: NXvDqlwjQMWUh75vy3XN8A==
X-CSE-MsgGUID: cjUH/u8CQtmbrF2rzCSYFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214926806"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2026 12:50:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnNM8-00000000h3w-0hpX;
	Tue, 03 Feb 2026 20:50:40 +0000
Date: Wed, 04 Feb 2026 04:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core-v2 4/15]
 arch/powerpc/kernel/time.c:393:32: error: use of undeclared identifier 'now'
Message-ID: <202602040443.wI8RI6Wx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core-v2
head:   81a308913f624d7f0c0bed9430b00d1a285e1346
commit: 3121063df11a9ea312a4e72c4ac8b85e5c24f10c [4/15] powerpc/time: Prepare to stop elapsing in dynticks-idle
config: powerpc64-randconfig-001-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040443.wI8RI6Wx-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040443.wI8RI6Wx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040443.wI8RI6Wx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/time.c:393:32: error: use of undeclared identifier 'now'
     393 |         acct->startspurr = read_spurr(now);
         |                                       ^
   1 error generated.


vim +/now +393 arch/powerpc/kernel/time.c

   379	
   380	#ifdef CONFIG_NO_HZ_COMMON
   381	/**
   382	 * vtime_reset - Fast forward vtime entry clocks
   383	 *
   384	 * Called from dynticks idle IRQ entry to fast-forward the clocks to current time
   385	 * so that the IRQ time is still accounted by vtime while nohz cputime is paused.
   386	 */
   387	void vtime_reset(void)
   388	{
   389		struct cpu_accounting_data *acct = get_accounting(current);
   390	
   391		acct->starttime = mftb();
   392	#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
 > 393		acct->startspurr = read_spurr(now);
   394	#endif
   395	}
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
