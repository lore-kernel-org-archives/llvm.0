Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22F13C80E;
	Tue, 26 Nov 2024 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641288; cv=none; b=HskxeFYpss5TNsK7FhwA4396WtGxjjSwTOUKDHpviYVtl5cYjqh07y2Y6Q12MNvzDpalw4p8kG538OLgYm+ZjqMdndvaWyGg8ihVr601E5+i2YVV0govoOsotmo2Sh4cbBtSU/wQM/kM+g8Nl5WbaPj6r7HsK+AKaTfM6H9zdcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641288; c=relaxed/simple;
	bh=vsNfAO3drOc5W36lVGN9uUNJQYKX3KJXsuEALF+Oklk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MTYklWcHdXhCYqySovYJcIwIzdt9S5Bxs8lXnuGJvX941jTJlCSNVochxnvK+MJLMq/cqVF4okw5Q2zbx9Op2i+Gfuz+WeeMYNaPWg6wttj6BhvBOUa8Aei3nWucpuD0RZe1cNrjc3yzfCUHL4xvv7vo+zrZxH/7lQh2Fs3UHHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKm04F5j; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKm04F5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641287; x=1764177287;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vsNfAO3drOc5W36lVGN9uUNJQYKX3KJXsuEALF+Oklk=;
  b=jKm04F5jV1ngdv4j5FPHjlr4tvGTWVbmLbNZ2sHhO4meC+wQKXp9G/vS
   oXRRO/JmjHLOoEPDUQJtdKHwfeD7A36BiFq+CrhHVJJRHn3wRoyrZuV1K
   eCTtsr4ZUN+fSlrkeJnlmcV7VgJAIT45TV1ZB3drrHtvuFCe8B5oPFFcP
   56madUoDU0bEu+Zq/cSXHxKvg8xy998X1SyQH06mPga5WK8p3EgmlkjwR
   fRu907A+9T0hTfdRwcieDBEZrEfukkR+Es27GqUVEDcMXiXCRbWe8E8JW
   SQSQhW8EnMjRsbujth9ZPdkSRharZfV0BZkdYWC84rtcbQbLCk/AVpRcA
   g==;
X-CSE-ConnectionGUID: TXpHVp0YQT6H+aXUOI5Aww==
X-CSE-MsgGUID: Bk4QRUE5SGOHXG18Ey4PBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="58219912"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="58219912"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:14:46 -0800
X-CSE-ConnectionGUID: dsWXxZR9R0+yy6zD56xCDg==
X-CSE-MsgGUID: d2ZSjHULQE69XMPI7ekmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="96107148"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2024 09:14:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFz99-0007RV-0i;
	Tue, 26 Nov 2024 17:14:43 +0000
Date: Wed, 27 Nov 2024 01:14:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/counter/rz-mtu3-cnt.o: warning: objtool:
 rz_mtu3_action_read+0x243: unreachable instruction
Message-ID: <202411270158.iGnnUXaW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: Ariel Miculas <amiculas@cisco.com>

Hi Breno,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: aefb2f2e619b6c334bcb31de830aa00ba0b11129 x86/bugs: Rename CONFIG_RETPOLINE            => CONFIG_MITIGATION_RETPOLINE
date:   11 months ago
config: x86_64-buildonly-randconfig-005-20241124 (https://download.01.org/0day-ci/archive/20241127/202411270158.iGnnUXaW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270158.iGnnUXaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270158.iGnnUXaW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/counter/rz-mtu3-cnt.c:9:
   In file included from include/linux/counter.h:12:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> drivers/counter/rz-mtu3-cnt.o: warning: objtool: rz_mtu3_action_read+0x243: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
