Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFB38DDE;
	Sun, 21 Jan 2024 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705872031; cv=none; b=eZbmy42cGPMLd9jMCWi6S3ahQkgdVdmDHJ38V23ittDsoaPiRNaZpvSoWEKU/r5pDK401YSbP+AwIXf8eXUXztO6rsARGlzYQZBSaRGDz6UFUx3LvxYRWkRMfaElaGflNzamKFfbQVRbQOAGzWFHmIO0g0EdQkWYqATG9pjIzWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705872031; c=relaxed/simple;
	bh=11V1eSr3B4ClOPG8tzFhCImcJPCD0nsuQC8rvCO7hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5ZiJti/e3GrqPpqZhQsaMUzzqgcF6trc7V591Kz+MeKpZ4DkqAYXpKQgHkRnZlvDNOJKL9xpeL54i3CHpggH2jTft1E5Py9s8lxMUkO/VGhPN3C9Gvt3Yj7Ly48PaSvVxqHwtNACIRoCmqLXcQdoq/cQePlAZ6NqdHl7yDp93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVJlquF3; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVJlquF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705872029; x=1737408029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=11V1eSr3B4ClOPG8tzFhCImcJPCD0nsuQC8rvCO7hfM=;
  b=BVJlquF31nkf3fd7qd51dSnr9H00J8hiC8DAqnlkoOMX0plQxhA/FBFa
   rYP7dkslv2mlahASDoUTGmiKLi1uBEyRfJH4guo5tfK/GPMk2BkZDqpt6
   j2Gg4jmhh6hc93/K7394ozPoC2k5cBaHT7Hlc8KlF3OLqHqj7+9+tzJGY
   70N97It8+s/vZL0kJR0EFq9QAJD462xzRHE9D44v7symCK1UddIUPTI7b
   Xl7/+HOXrFpXqU4+vLJqGi0lrgGbCW1bPRxmHcAG9RJOpO6/kLn+syEXS
   2q5jVdVTp+8kYipjT1Y1iiBwf5TW02n15EZO8VjzGvE+Wsq7Vc0zSh/Gm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="467442139"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="467442139"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 13:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778420761"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778420761"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2024 13:20:27 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRfEu-0006CC-2Z;
	Sun, 21 Jan 2024 21:20:24 +0000
Date: Mon, 22 Jan 2024 05:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Danielle Ratson <danieller@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 8/9]
 net/ethtool/cmis_fw_update.c:240:23: warning: converting the enum constant
 to a boolean
Message-ID: <202401220520.5K1hLmww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   2d94043682e019700926235499d603818f42460a
commit: 828c7605e322a6ae571a754298dfe361741bdcf2 [8/9] ethtool: cmis_fw_update: add a layer for supporting firmware update using CDB
config: i386-randconfig-001-20240122 (https://download.01.org/0day-ci/archive/20240122/202401220520.5K1hLmww-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220520.5K1hLmww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220520.5K1hLmww-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/cmis_fw_update.c:240:23: warning: converting the enum constant to a boolean [-Wint-in-bool-context]
     240 |                         (CMIS_MODULE_READY || CMIS_MODULE_LOW_PWR));
         |                                            ^
   1 warning generated.


vim +240 net/ethtool/cmis_fw_update.c

   236	
   237	static bool module_is_ready(u8 data)
   238	{
   239		return (((data >> 1) & 7) ==
 > 240				(CMIS_MODULE_READY || CMIS_MODULE_LOW_PWR));
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
