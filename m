Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6ED3770B;
	Sat, 20 Sep 2025 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758347059; cv=none; b=orEDPkqee8tQoqvW64NS2ofLrPUQ2XLwHZH8ojThJTJj1eSaym9mDMyvXkPuRtyvWPYYgJFMm19o8DVXJ4wHiGHbD+p38WRPrTsxro3oiQkhMuRFS30DPOsYTgAfCMxoA4RjLdErYXG6CtFsM/8kJLetG524P2kVYiGieHpkygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758347059; c=relaxed/simple;
	bh=GF3gdAN8hkTnVx5Wspbbs4FlRADR3141bV+ii0KdOs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=liHwIspdTg8nXWG03sfabtwpGH/pDN9gfMiDiKHo1/7E16+Oci5aykqRdemOtKZWp/r3yfjbLPJ3EqUiKoRXrboJRm03r5NfYYs27FrnhzkS6GpmyQwr95mXRypBRiMLhSgefBR8A0Qqg5d8t162jRH1CPBN2rdOVtbDSK5eqxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5O8GhzJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5O8GhzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758347058; x=1789883058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GF3gdAN8hkTnVx5Wspbbs4FlRADR3141bV+ii0KdOs8=;
  b=O5O8GhzJo7YQTCzvnFKRbNeYmsDYlP2CXifWqQIFRvEIN51EZlXk1mRo
   WnKyTtF34ijiK6tXDG8p7YSdqnetDaL6r660GS6LrR6G6qiDLbPTPhUNM
   GDivMtybZm4GKMIzGisxaBgqJTVaRi+03DmwrnatnLWgSvig9UP10xGls
   OoK3o5mdtSp6RT5dPAdkZjyTl06MbUL5HzIW3PZjVUqKD5L0fkVVq0n+S
   dE9QrS2jfHQnzwrlOVW+N7zIBHiIIKp5n18SZwTAjQvHZIXuTDp7YyPP5
   WX6gvcC/3OrPxLa6gpioBy1JW0z0cB50niBcUqY5TQHlZSoaUZCtGY+tx
   A==;
X-CSE-ConnectionGUID: rGfcAKHlSF6Hf+l5GpwYuQ==
X-CSE-MsgGUID: SBJzZoIZSTKXuWzZ33NFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59728367"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="59728367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 22:44:17 -0700
X-CSE-ConnectionGUID: Lr2I9FIOTHKFNW8OvkVerQ==
X-CSE-MsgGUID: zon/iQGeRXK2HMpvfrtikg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="206756475"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Sep 2025 22:44:15 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzqOK-000555-2G;
	Sat, 20 Sep 2025 05:44:12 +0000
Date: Sat, 20 Sep 2025 13:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.namespace.ns_common 4/11]
 kernel/nscommon.c:10:9: error: call to undeclared function
 'proc_alloc_inum'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202509201323.9WxeTUNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.namespace.ns_common
head:   6f18c6b33f6beb4b50add5a46274534b2cf091b3
commit: 309de0163ea00ffb59634ebc4e538655cde0c21e [4/11] nscommon: move to separate file
config: x86_64-randconfig-072-20250919 (https://download.01.org/0day-ci/archive/20250920/202509201323.9WxeTUNX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201323.9WxeTUNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201323.9WxeTUNX-lkp@intel.com/

Note: the brauner-github/work.namespace.ns_common HEAD 6f18c6b33f6beb4b50add5a46274534b2cf091b3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/nscommon.c:10:9: error: call to undeclared function 'proc_alloc_inum'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      10 |                 ret = proc_alloc_inum(&ns->inum);
         |                       ^
   1 error generated.


vim +/proc_alloc_inum +10 kernel/nscommon.c

     4	
     5	int ns_common_init(struct ns_common *ns, const struct proc_ns_operations *ops,
     6			   bool alloc_inum)
     7	{
     8		if (alloc_inum) {
     9			int ret;
  > 10			ret = proc_alloc_inum(&ns->inum);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
