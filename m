Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9E477E58;
	Thu,  2 Jul 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993793; cv=none; b=L1ECCABKhQQbTEljnZJ2v77IhRJ8uTWCIHCs625WY2F2CfSnyXTcKclYV68LX6QB2jTLNvlglC0dbAZG57UK7CRs1+yGs1QbiwpE6Mzqfkz2EzQJPGSjPQ8JJqjsyoVT2yY1PMNWXmyd1KdpUR/yBAI3Gcq1JCvlE+jxUVNmCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993793; c=relaxed/simple;
	bh=jBLK50JAy2ASdpXs4fsM2MADgDdvmCk47ysHIo6n6q0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2GkBifW+LtJugq/650a6FwqJoyl8gBLPTeJiYwRbr+J5L76q0YuGQPnKgoEyMWNRy6byx0w+BuKyiMZAFhRVQfy8PHooDpCXWLb+OuPAH3VW1IEpfbRFbuASgmCkILfBXVmRcAoSq0XMFlen9v/V9FCDQhmewJNXTI7QI52E+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaD4CgMJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaD4CgMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782993792; x=1814529792;
  h=date:from:to:cc:subject:message-id;
  bh=jBLK50JAy2ASdpXs4fsM2MADgDdvmCk47ysHIo6n6q0=;
  b=RaD4CgMJy6nyAVQ8tIGo4I2G2cSIw5brc+NzutlI9KI93SGvda7L2cN/
   PANWi/6GCdNUdZQbG/dLuTmqvkiyyZT9qweghaeMNA/uxca5PbxI7tsHE
   yRyIOk1PROKX6g1bAa00vnXVXDelnS2RSQ5o/yQgYUioJ06Yks8oeI+Og
   CrpAbYfaXoHY8SHJsrGFWTxNl+NZRcLOLMOQ5qS0JdbkpMI2DnbmVDiyG
   QFQHpaDg+c80ivQaarQ01KUOi5XtiB1pAsNFsDAb0PGuFrPRj0kKoJlP1
   tEYMB+uLUzdlKGLMyD5BaJtoKfoQFnoMt6V8MTuLbqHVlHSNCeVr3hQDP
   A==;
X-CSE-ConnectionGUID: l7JRrheTTbudFiFRuAo5iw==
X-CSE-MsgGUID: QIvoUnxBT+aC9EPvOSpEjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82857913"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82857913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 05:03:10 -0700
X-CSE-ConnectionGUID: 9zuVUU/wTEaOIxXBjIBp1w==
X-CSE-MsgGUID: 2sTxHjljSHSuPO0E3vRd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290967881"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Jul 2026 05:03:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfG8H-00000000AlD-3mbC;
	Thu, 02 Jul 2026 12:03:05 +0000
Date: Thu, 02 Jul 2026 20:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: Taeyang Lee <0wn@theori.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/urgent 1/4] kernel/events/core.c:4732:34:
 error: expected ';' after top level declarator
Message-ID: <202607021930.nEzkT5dn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   91a15888098678641edd3ef4f5d66fa7e77dcc28
commit: f60c8830996ca8e468f96cc3ae79aab1e6fbfb12 [1/4] perf/core: Detach event groups during remove_on_exec
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607021930.nEzkT5dn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021930.nEzkT5dn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021930.nEzkT5dn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/core.c:4732:34: error: expected ';' after top level declarator
    4732 |                                   unsigned long detach_flags)
         |                                                              ^
         |                                                              ;
   1 error generated.


vim +4732 kernel/events/core.c

  4727	
  4728	static void perf_remove_from_owner(struct perf_event *event);
  4729	static void perf_event_exit_event(struct perf_event *event,
  4730					  struct perf_event_context *ctx,
  4731					  struct task_struct *task,
> 4732					  unsigned long detach_flags)
  4733	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
