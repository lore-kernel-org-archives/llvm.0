Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328E214810;
	Fri, 10 Jan 2025 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736539142; cv=none; b=IqtaYKZ6H70bbIDViYla5XN2nJVQ7ZG6dH5gR5b/1D58FkMsAzBCyQU4NmKef95o4I0CS1+f3tUO8LlmlEbHMJ7aqQTzUt5y7xS1eGGEzEkleGmMX3J+pqnuQEYnV76a+YcpA16TdPDwjA0W+/oLL/wZp0TDvECE0IBM8hQISNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736539142; c=relaxed/simple;
	bh=mWDl8mNKFVU0KGeb7074ZMXNUpL3gRHqUJFOW1m/AJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtsaaVKms2nBeU+BdZnQvu3LSwsM1EesPWMvvGZLn4N/YJPT9COhv6f56RY2CQwWOuPSa67T1x6flqOf227Wvd6avad6IXQHh3F5JgOk368wh54MP4YGG907FUlw2mqNVKf6YXyQxGHr113X9epfQn6KaoRb8VQCImgGYfvj0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EA3FGy33; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EA3FGy33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736539141; x=1768075141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWDl8mNKFVU0KGeb7074ZMXNUpL3gRHqUJFOW1m/AJg=;
  b=EA3FGy33kwKt+A1Gp/0PAFh3h8F7s2akCo4oAHUlat4GBWQU/RC3SMkU
   FbDEJa0KTJ9b4N6iTbNO+KMMaN47l//QBllxmYA7jf/QR8pBm7Q2xXZVc
   Fx3dGyNtfIdBMTSa3e8EDKiZ/s2QdluS6dXpxrMAlhUxyMm1BuXyeJc0l
   WCUWt7qLP79Tm3Dg1crnff2+sXisV59awn4k6DbTC4oqcGgWvzuD/rE6x
   FK5n3cYhtgz8ok99l55Y0YQIa2n6+hQK4tDvPDuGxGPuML52l0js3kdv9
   ph92L3Ut6ISecWXYZqSAmAt0okx8JMHbQsMVeVTyPFQjaTT8SEAM2OI9C
   g==;
X-CSE-ConnectionGUID: +kJSlf96RrO+XxTjmI1z5A==
X-CSE-MsgGUID: 2w+FkDxOSa2EQb+OFOFDpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36531270"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36531270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:59:00 -0800
X-CSE-ConnectionGUID: Rv6qzW9kQAGjo+GieSg4AA==
X-CSE-MsgGUID: L29Oy+vxTaOka7Ad90zTyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103634250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jan 2025 11:58:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWL9k-000Jgo-0c;
	Fri, 10 Jan 2025 19:58:56 +0000
Date: Sat, 11 Jan 2025 03:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>
Subject: [peterz-queue:sched/core 44/45] ld.lld: error: undefined symbol:
 __setparam_fair
Message-ID: <202501110331.ZfWHFW4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   82563deef777b32ef169230d5cdf4e37ba9e9bde
commit: 12ef9ed8faba2301620ce093e2f5b5e3ca886ae0 [44/45] sched/fair: Encapsulate set custom slice in a __setparam_fair() function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250111/202501110331.ZfWHFW4Z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110331.ZfWHFW4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110331.ZfWHFW4Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __setparam_fair
   >>> referenced by build_policy.c
   >>>               kernel/sched/build_policy.o:(__sched_setscheduler) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
