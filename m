Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951C366072;
	Thu, 26 Mar 2026 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513393; cv=none; b=YeHt2UABNuBRPm4+NczsK4CkYIAv85SmybDQVYgjIR98tW27EoY1Lt7tcC0G73Ukuvp64SGj/6H5ne+KVy8yF5f1vBLcGe7r34Ks4YF6EE27CwHiRYQrOFIrmyxBTFiTcq09tnDG8NZ3otRhT3iRgFqdBLW0Ysv7r6KnFOMckRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513393; c=relaxed/simple;
	bh=WTaUtC0r/KiECQrGkfO/LoqlwFjhcGdy11GM10xmsxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MPY1w8DuRaqY4zLwGTmtSkHFYNHrw4J8h6txj25H0kaFK3L8UYEg/CRnVC2igevg3tZzoeUvAPmKvvhZzUE94Dio4VFjt+tl+3bNN2maWwrykBW/Y4YW5KI7YipOR2qmovMyDSMIv7UzYxiHxbYKjxQafPjOC2eMYRw5nwpA8mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjqZLd33; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjqZLd33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774513392; x=1806049392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTaUtC0r/KiECQrGkfO/LoqlwFjhcGdy11GM10xmsxw=;
  b=JjqZLd33ee0xyKtvTfrChcPGdvplbfrBKk/rv1j24MQEv6jZpyYVRKMk
   0Ay5cVEt5DCkNC83LcocaYEzmOSLCrLoH5mxpHnHrhewHL9y1t9XDcX5r
   3/RezIh+mg5RFriR8BPhpZQy6hTUEAdZI0BRLytURBPP/6LHR40+1OEYx
   gAaXcoP/Txk0Fvqj0BgTuqXn+s1TUuRsKDW5CFgQIZlYTU5WIN5IACnrj
   N4NyW4h6uvD2p6fY9JoZ598zioLEm/qjkgGfqrb3F3gEKyCpdCxKLjgr7
   Mq1I4aZRx0+HEWJLBhjfOXIaRP2I9z1ujMAOTZrOyg9vZ54EfnCi3Bwq7
   A==;
X-CSE-ConnectionGUID: SVE3bjMcTqq3YQwLBpqwCw==
X-CSE-MsgGUID: a+kKOS8kRCio3JSCBcJCgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87040576"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="87040576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:23:11 -0700
X-CSE-ConnectionGUID: tNrHZWnITairD3+8RVgyaQ==
X-CSE-MsgGUID: 1ToxLyUTSGCBhDLY95wmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="222031427"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 01:23:09 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fze-000000008fP-2CTA;
	Thu, 26 Mar 2026 08:23:06 +0000
Date: Thu, 26 Mar 2026 16:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/nolibc-rcutorture 40/40]
 kernel/rcu/rcutorture-init.c:3:10: fatal error: 'unistd.h' file not found
Message-ID: <202603261643.Ha4DqhvA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/nolibc-rcutorture
head:   a55c66cad77542e2efcb3248af724efce7cc2d87
commit: a55c66cad77542e2efcb3248af724efce7cc2d87 [40/40] rcurorture init
config: hexagon-randconfig-001-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261643.Ha4DqhvA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261643.Ha4DqhvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261643.Ha4DqhvA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture-init.c:3:10: fatal error: 'unistd.h' file not found
       3 | #include <unistd.h>
         |          ^~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GEN_INIT_CPIO
   Depends on [n]: BLK_DEV_INITRD [=n]
   Selected by [y]:
   - RCU_TORTURE_TEST [=y] && DEBUG_KERNEL [=y]


vim +3 kernel/rcu/rcutorture-init.c

     2	
   > 3	#include <unistd.h>
     4	#include <stdio.h>
     5	#include <sys/time.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
