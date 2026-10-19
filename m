Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0747F3C1;
	Mon, 19 Oct 2026 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384767; cv=none; b=uTMuaYvEXNJ2j+fpKrPk7jBrSkGbJNhzhKFdbCf1LQtat4Nj1OowRtROPdO84V/q/WXEG8xyUPL/lyWMz5hgSul25PasP9Omv3blBb3lhle2bpcjob0QQNv66yOPROrVvbMukSO+QYC7MDE0KMTJ0IiFHmA9dS4+lnOAicTs2fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384767; c=relaxed/simple;
	bh=bSTs+W1xRgrZHnx1sl5LkcE6Sb//CbbrvyTsbWXg14o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K1lmpooqVDJOQvFN1Gi0pywHIo+Zl1SJouNHW962gjvr6kLhfpVRSjQtbqoWLcQSV5WdD6kAnNizqv8HOQTkiqfkR+jc/Cai2dOxjgC8IE4W/8kp87NsUXlvxqoGg9KLaTfoE2Ik57i4Nw774s23WvIl3lgWwLAmJOvaG6qljg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqZYhwHI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqZYhwHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792384758; x=1823920758;
  h=date:from:to:cc:subject:message-id;
  bh=bSTs+W1xRgrZHnx1sl5LkcE6Sb//CbbrvyTsbWXg14o=;
  b=bqZYhwHIaBG+RLTF9pv31Tp3+O70iZApyEXmfdsX1qSnvrAUaO/aKbKJ
   ajT/x2N8GOImlKC2jlgKZPVhwtk6RT0aLj8KdJf4Au1LMxbGhoG8K8hdP
   CzuXMx6U0PPEEGkPQUbR5LJGe0QAf8DmmldNLhqkusdgS8KixcGJECHpa
   mpg9xre+5VJ7RnFqTmDEb2H2T/Y9jMyiNRHXZld2MJmJqRi8J5uuYjJH0
   2Qp03FWSvb0H+Hw+XKDnrfm/QLdAbVYdUaxd/MJ9wXZTcWDUEDSBGZsOZ
   MeEUiAXjwOQmSRK4aEihGHjFaQ7FJulWOpGJvKQ/xFuVHMDU58f66tdrz
   w==;
X-CSE-ConnectionGUID: puIPLHZmT2K45iH/si2TmQ==
X-CSE-MsgGUID: rAWkGXNxSb+xUGC3mqzSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="964414"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="964414"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 21:39:17 -0700
X-CSE-ConnectionGUID: 3BHnTylbS+GQLwDYX1IDOA==
X-CSE-MsgGUID: 7IZTsvZmTwmdMpKG6s7Njg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2314533"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2026 21:39:15 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIf9U-00000000LHS-0Jhd;
	Mon, 19 Oct 2026 04:39:12 +0000
Date: Mon, 19 Oct 2026 12:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 27/32] arch/x86/kernel/apic/apic.c:1058:15:
 error: invalid operand for instruction
Message-ID: <202610191244.sHoGL5wI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: af4f990bae706330577d32faa7a7970cb22943f1 [27/32] kss-debug-irq
config: i386-defconfig (https://download.01.org/0day-ci/archive/20261019/202610191244.sHoGL5wI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191244.sHoGL5wI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191244.sHoGL5wI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic.c:1058:15: error: invalid operand for instruction
    1058 |         asm volatile("rdsspq %0" : "+r" (ssp));
         |                      ^
   <inline asm>:1:9: note: instantiated into assembly here
       1 |         rdsspq %ebx
         |                ^~~~
   1 error generated.


vim +1058 arch/x86/kernel/apic/apic.c

  1053	
  1054	static __always_inline unsigned long rdssp(void)
  1055	{
  1056		unsigned long ssp = 0;
  1057	
> 1058		asm volatile("rdsspq %0" : "+r" (ssp));
  1059		return ssp;
  1060	}
  1061	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
