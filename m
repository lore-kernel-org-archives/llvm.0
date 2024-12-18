Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1921B425A;
	Wed, 18 Dec 2024 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537544; cv=none; b=RxNuQV1Ucm3Et46MPnitwRmpR/NUN6jd/S6wra8515bhmRRhhCc24dxqM1Ik1/2HSEeyaNiUkR2JqjHGpS87S0vnoSabLpLpfFlkTX2Gsikmkh68aDj31vcri5H1fDBW3WIAcBfOp5Ykhk+3pFV01j6jKe1WPvR12r3R5WNCoRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537544; c=relaxed/simple;
	bh=uRWBdD+wkQYmU2Quh2zMdZNMKN3h/zCSd5yD8w865cc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkS3Q8P4ictOCrIfj3mmo02bxwM0aYVdzp3/FtsLDHnnbGT+4u9h663DB23lRlvCG2MvfPRL0+eiFkldODiJkogF5EJDrGzJs+KeYbnxDmA6YxsBB2ju1jJpLrrO0Ikrb2AQ5St2i3qQiyjnbrQENHqjCQwRAJ56UNW/cI/XHLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MeUk/OpG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MeUk/OpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734537543; x=1766073543;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uRWBdD+wkQYmU2Quh2zMdZNMKN3h/zCSd5yD8w865cc=;
  b=MeUk/OpGfyy1UIoqIhzawj8oCLkt3N88pIqkEuf45HNqT45l/B7rWKCU
   3QKOu6sxNvNGVwEpc1kcKXfREXb7EVYbu8o9ddCs0K1BTC+upLEvwoV+B
   WafO2wlNyintNKtrL/NNicEHYa/9iVIA/aOgnQc8QQos0PAYUTM1/P1dy
   wJcZD86XzT2nBUnwpvVe53x62eo+BXQ7Bz8gJd++C9EeQfZ+qU3zhGG8b
   /H+S0KgDHjr/63V+pJVl+pHnJyqjmjtT0kyL54nxzIjsdlmDmcNuHGMaJ
   retm9+b17n1HHYyLV3TY2X2Zktczc+zdvlwgkvSwMMKpQw80FvBLWO0pM
   A==;
X-CSE-ConnectionGUID: 2tqyGMyGT5GIhFR+dtfmdg==
X-CSE-MsgGUID: XZOp6DHBRFSPYl5CN7wGZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52546294"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="52546294"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 07:59:02 -0800
X-CSE-ConnectionGUID: +2eo1zsrRJiXkTSW7vmJFA==
X-CSE-MsgGUID: 3toIyd1fQbuZrNwU5ldoBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102044509"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:59:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNwRv-000GSC-14;
	Wed, 18 Dec 2024 15:58:59 +0000
Date: Wed, 18 Dec 2024 23:58:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: SiS_GetCRT2Ptr+0x1b3: stack state
 mismatch: cfa1=4+8 cfa2=5+16
Message-ID: <202412182351.4U3ABVW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: fcc22ac5baf06dd17193de44b60dbceea6461983 cleanup: Adjust scoped_guard() macros to avoid potential warning
date:   8 weeks ago
config: x86_64-randconfig-006-20241218 (https://download.01.org/0day-ci/archive/20241218/202412182351.4U3ABVW5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412182351.4U3ABVW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412182351.4U3ABVW5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x54: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: SiS_GetCRT2Ptr+0x1b3: stack state mismatch: cfa1=4+8 cfa2=5+16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
