Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45423E32B;
	Wed, 21 May 2025 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747870900; cv=none; b=uqqQDAhnc4BQRhFVdQ0qXSfDT9WkK/hdpJNMIwvILrEoZG8Ya5oSeLoGLEL7GRn7udviuvDS78KgJe8lcsuSTyvP0RnUmRyFraE6Etm7Z4JI5fRbxEfiQGxPVEyT4kYiHSseCWLJGtET5KUeB68KRJAYAVpPwxu8U7pzqhFyWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747870900; c=relaxed/simple;
	bh=BYtNCCtjouYOT3LO3B7GmsL//4gBWBdFiXDrdOfy45E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DUGFbrB076XxCtsyO4NJM2ueu5ajmXsCb9fYvzP+FqcfZjeg7WIO8sU4VDojKBk30tJdQoNu2VFhpI7bB/Iju3RAKjjauYBzBvcFT2IovpZK9AVPzoYC0yVQDdrd+LrgVKf4pUmqIl1mdEpdkTFFS3byRGtxwlrk5j3yX1Jcez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiCMWbmk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiCMWbmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747870898; x=1779406898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYtNCCtjouYOT3LO3B7GmsL//4gBWBdFiXDrdOfy45E=;
  b=NiCMWbmkzYnFBVBqE9GvwpJezT4Z+UdK/Q7Dzorr9Djde5YpHr4kTS48
   RnVh0qDn2eTwpj5K9UwUJtnedFg5tL++gvDQEjeQyC96S10839AjyUM5f
   wYE+mYI/UCL+7J8L145bK8RoXpWi2giZ7SmheqHBxxN+R0siXYHcpLQ3H
   S3SQRZMg0hWGZ2s8sTzPPiaJ/mG6btCE3sQfgXboHpIxIXzRHPGXhHmv3
   0FZdOjZMBRM1GIU7yGjnC0GabozhlTly4yeuQldUN75NI1WZ7NQzsQp9m
   S7MhUtV2FRmNFeDYpkgXeNXmPzzKZP/mmGZhEpZL+uwIcXdygSW/L8kG1
   w==;
X-CSE-ConnectionGUID: b3MF7fl6SByJar/P3i2q3w==
X-CSE-MsgGUID: WhfF14I6Q8i3Y4wUwo1WvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50014413"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="50014413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:41:33 -0700
X-CSE-ConnectionGUID: bW+xgYYMQJ67NmCgwGpUwg==
X-CSE-MsgGUID: SVZC3WdvQPWNUxSadExryg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140836539"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2025 16:41:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHt3u-000Ojk-1G;
	Wed, 21 May 2025 23:41:26 +0000
Date: Thu, 22 May 2025 07:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [linux-next:master 8543/12618] ld.lld: error: undefined symbol:
 ntmp_init_cbdr
Message-ID: <202505220734.x6TF6oHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: e3f4a0a8ddb41962efa51c6353e869b90d183e68 [8543/12618] net: enetc: add command BD ring support for i.MX95 ENETC
config: arm-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220734.x6TF6oHR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220734.x6TF6oHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220734.x6TF6oHR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ntmp_init_cbdr
   >>> referenced by enetc_cbdr.c:88 (drivers/net/ethernet/freescale/enetc/enetc_cbdr.c:88)
   >>>               drivers/net/ethernet/freescale/enetc/enetc_cbdr.o:(enetc4_setup_cbdr) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ntmp_free_cbdr
   >>> referenced by enetc_cbdr.c:96 (drivers/net/ethernet/freescale/enetc/enetc_cbdr.c:96)
   >>>               drivers/net/ethernet/freescale/enetc/enetc_cbdr.o:(enetc4_teardown_cbdr) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
