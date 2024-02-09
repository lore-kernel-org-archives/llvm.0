Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6461107A8;
	Fri,  9 Feb 2024 20:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707511784; cv=none; b=mqBV/rTdweZ+ynLUkVvDr2I9ddpPC1JnLcZaCiu8fG9K9FIKjdVzPTvhoM8V52KJMV94Go0MbBm4f9vWEQ6fjRArGCaOZwa4Vxzj3BTmiqqA9ijyrGLtLqc8YeWsqpAa7L3HWi4nGMFXU8CWBvNuzn/a+WKo49OZiZFIOe1C6nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707511784; c=relaxed/simple;
	bh=wwOdMWkCDLHmqd6uaQkKrs+59Gzyzmu+Bm15H3ilINI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACNSdseez4hJzr2DQ7Vi/3DTjJMirU0jWgVcK1t+Vxc+js0uXPXrV8sUCbs8Vdf70gOkoP+lezxAfCFk7FB9DF4IXQG2tFGpHwSfY4WBX8ZLFS8TbJONgIY+yOv7NVSTYEieS1r8SwVh6B2TkspcRx/q9UYszFFmweoaGcnO2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkI2A/2F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkI2A/2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707511783; x=1739047783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwOdMWkCDLHmqd6uaQkKrs+59Gzyzmu+Bm15H3ilINI=;
  b=ZkI2A/2F78sGkETvfEDeTKLXZb0NKKM7nWWStu3OPE8UzWL8tjTeHmGo
   J/c9+MPbBKkLIxDmvEIBLeVc/qcBC7koEULMU1TNrSxKTmnwi8OVALVha
   Ps+E+y5ZQpX8yeCeJlb/ZmA2wZXB4EdirPKRdbHNqsCRIah2FsN9bphXU
   Qp6j4wUwYlOQoGU7yWYwu78R0v9GAKyvD5BH1JiNP+NtgnSIgYSBH7FMh
   Kx//GY/gE2dkBH7+y4Xn9QcTeWy8V91sxkYIwlZMCOprHieEpKywrLQGQ
   vSC+fHWX2p1s/59uxaNZ6gu9f3ifQrS46o7IsmZhcECdh3hkyxiehkqam
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12583853"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12583853"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 12:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2238176"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 12:49:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYXoY-000562-2S;
	Fri, 09 Feb 2024 20:49:38 +0000
Date: Sat, 10 Feb 2024 04:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:timers/anna 27/28]
 kernel/time/timer_migration.c:18:10: fatal error:
 'trace/events/timer_migration.h' file not found
Message-ID: <202402100455.7sEwQGcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   7e542ba8af9a26c2951f3c5ec4c5e1513da16201
commit: ca2080d0534d1f1a3ea73d415dcfd5d7760abcb6 [27/28] timer_migration: Add tracepoints
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240210/202402100455.7sEwQGcw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100455.7sEwQGcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100455.7sEwQGcw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/timer_migration.c:18:10: fatal error: 'trace/events/timer_migration.h' file not found
   #include <trace/events/timer_migration.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 kernel/time/timer_migration.c

    16	
    17	#define CREATE_TRACE_POINTS
  > 18	#include <trace/events/timer_migration.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
