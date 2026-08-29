Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E013D891;
	Sat, 29 Aug 2026 23:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788046608; cv=none; b=n9nxOqnCmxRLHgjMS1uBi2znWcjVLqz7J584P9TbOck7xbnN37pRxCIp/WkIFpKFCAlatqOQiX/feLTYmOm/8N8sI5yE3fP9KnbGA0KCuJYwVQHbsOLS0dHFpLuZUBS8WZ/K0DqMVVeYcILCO9GTRk1ZHn+8ZjvCuY0pcOTnXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788046608; c=relaxed/simple;
	bh=KIXoKzuc1xlHfekwTJat6y8+ZKMkgmFO/sGHluWo3VY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f2lIPIRVJYXsj8ML675kV0DaRX8o0GHuQsxQJBwbzcfPwHrh1pP+OALz1GJ2aRfd8BGwcsHUjdPKRDrpQY88XISme5Ft1mv13HjO1EgtKtnmzyD4BpWkCW3caK5BvuWoslGlii8CbsXdrrdYiDAIXuEVgVlop7s0wlrK+5fRxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REMRo7mS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REMRo7mS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788046605; x=1819582605;
  h=date:from:to:cc:subject:message-id;
  bh=KIXoKzuc1xlHfekwTJat6y8+ZKMkgmFO/sGHluWo3VY=;
  b=REMRo7mSOZoNHrlqfac31RTCcYVhSX1Ur9tckI6M/lskKb2HuhSHUIif
   ftYSE7wGJYCa0cUPpXiy1oL/qYBe/utQKwe79XRefHHTcl7dF0jx0HgrK
   FElm6J4cZpOC0hfTL8jA2TMJKFNrpVkGnYbkzu3BWCq1bCBwKstOhnseX
   PWv5slwVI01Ztxc+uTxOGRc8DpeEAKpJcDXT38WjmduUDomegrNtemz2P
   3qhM+2NCwzqkkFKAyGSAH1Rw1u0nu8HQG2ruBcbkCbiPiGzsQihft90Ie
   4N1K8bN48Fd7/jdTLAVNkCSRqW+RzY1lJoF1TCpfnSuqCncfmq51aK09n
   w==;
X-CSE-ConnectionGUID: x+gphhT5SQ6RdZOqc9I8DQ==
X-CSE-MsgGUID: jM8Of5rPQNGqnmu+bhInPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="106032820"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="106032820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 16:36:44 -0700
X-CSE-ConnectionGUID: 6O+Oi5hIR8SfHY1enUlLoQ==
X-CSE-MsgGUID: N+9JE2IuSqGcRPBxBSnAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="293279207"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2026 16:36:42 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0SbH-00000000DOo-33N4;
	Sat, 29 Aug 2026 23:36:39 +0000
Date: Sun, 30 Aug 2026 07:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>, Lyude Paul <lyude@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [tglx-devel:irqflags 2/20]
 kernel/irq/refcount_interrupt_test.c:7:10: fatal error:
 'linux/interrupt_rc.h' file not found
Message-ID: <202608300738.zJrEP2cA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 80deadb1a815addda89fa7d485109a13b4a851a7 [2/20] Revert: irq,spin_lock: Add counted interrupt disabling/enabling
config: x86_64-randconfig-004-20260830 (https://download.01.org/0day-ci/archive/20260830/202608300738.zJrEP2cA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300738.zJrEP2cA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300738.zJrEP2cA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/refcount_interrupt_test.c:7:10: fatal error: 'linux/interrupt_rc.h' file not found
       7 | #include <linux/interrupt_rc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +7 kernel/irq/refcount_interrupt_test.c

07a88e2bcd5b5bd Lyude Paul 2026-08-04 @7  #include <linux/interrupt_rc.h>
07a88e2bcd5b5bd Lyude Paul 2026-08-04  8  

:::::: The code at line 7 was first introduced by commit
:::::: 07a88e2bcd5b5bd7881b2e12b6aad1897a7ee1de irq: Add KUnit test for refcounted interrupt enable/disable

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
