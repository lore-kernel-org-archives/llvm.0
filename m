Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7042F4A;
	Tue, 31 Dec 2024 02:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735611571; cv=none; b=Dj4PUjpzOjDn8S/vh/WN7Jx+16rz5fPrO6rIozcjJDP+uKh8hHGsEdqJnYF1+mDH7KG0ljvygFgbzvapOrHO0Cu6kJ57opdsRcKbX5GfIOsbnUOu+0X0q0/uxM79KyUEFktE50Zp4dzUb7bL+cxsShrnTU3l3YAaHHdzQ2IMoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735611571; c=relaxed/simple;
	bh=tdJlhW41V+3I2tQz2p1+NnnINk9kBploWqZwNNZg1i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9aT+MQCR8CF50V86Gc0gg2hErhz9Fp1+WE/ThcqHiAcuUHbLMrxIq4P2ckX4R7M7uEnVn285t8deAaP8XiWCey3Qy0Gl1kYrpVUCI2pAjmuIhn5GwJ+Zi/BitTPOzrxTKniV49rNB5kT9lquenxu9YN/0nsQQjE3IdNmV3LhVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PP3JuE5r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PP3JuE5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735611570; x=1767147570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tdJlhW41V+3I2tQz2p1+NnnINk9kBploWqZwNNZg1i8=;
  b=PP3JuE5rHQjJ/EAN9UoexInHn2nMk3s2RVS8uxFieXWIxpMC1Y4l4nxt
   04Bou3dEbqdWtmHV4Hu1gVcVMpSOnIS+DQ+8l6WfQvXHfggezfgegBz6o
   NA30+8sbzVgrhfhkcyH6tW2iahmsQnx2pDW8TsbeiRGAuVVR/IS7kMhQ2
   724+eJyEuKwHDgVvlVt4HlhpQDpfVfByFa1LUoPFbs1F01fof9m+wp9yz
   wk33Uh49SPAd34whKnN2pY2X1f14ozAwdDguyzaXdEwasjCC1umm8gxQp
   I/9WtWEjQeKHc3897om2CnH6TAn1oS7z+zr/XAovRDe14YQuGaFXizdTe
   A==;
X-CSE-ConnectionGUID: ZAQj/A3UQYiQxnjMjQqj1g==
X-CSE-MsgGUID: XIhvQWmKTJikBtRtnYKMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46483348"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="46483348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 18:19:23 -0800
X-CSE-ConnectionGUID: FLTzwZkXSbCs1Ej/qqofAg==
X-CSE-MsgGUID: cdqy156rTeSKdxkTdRbO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="101104280"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 18:19:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSRqp-0006ar-2c;
	Tue, 31 Dec 2024 02:19:19 +0000
Date: Tue, 31 Dec 2024 10:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: vmlinux.o: warning: objtool: do_user_addr_fault+0x1052:
 __stack_chk_fail() is missing a __noreturn annotation
Message-ID: <202412311010.rrcATd3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
commit: 7582b7be16d0ba90e3dbd9575a730cabd9eb852a kprobes: remove dependency on CONFIG_MODULES
date:   8 months ago
config: x86_64-buildonly-randconfig-006-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311010.rrcATd3z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311010.rrcATd3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311010.rrcATd3z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: x64_sys_call+0x23b9: __x64_sys_exit() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: do_user_addr_fault+0x1052: __stack_chk_fail() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
