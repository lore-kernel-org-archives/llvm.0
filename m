Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0175617555;
	Sun, 24 Aug 2025 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756017203; cv=none; b=Ub51uo+BeSsJuMhQoa/qKMVIj4hg8mi9IeAFPmEeWRjqBZAdnOM1LgFRPvC7emPwZeWQ/XbnpATHJBow/d/7dBz0u8T3Z0+agBj0lYIIqBxIGY6WIIjVIaU+dysnz0gyt2jiO5OUDoN2l1wHshlSjAuYsmfybjNx/XzOYr5r5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756017203; c=relaxed/simple;
	bh=gJ7brMJ7j9Jf+pX5rF+KPff9Z+TTXk4Vge0KzSZ/Puc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n+0GUyx0p9fE87IznBywKe/Nuhy77AUe/in0bSWo1HRD37Wv7Ql/SF+vB9f5e8szB4JOt4rMgazHUMdFgiGG5aHTD73XqDwY7UejulV+DsmLW+DoJopzYVr3wJ21S8gjZh7dSbbVxSvaYS7y/QfV1HvY1Vmu0MYQ3NBNasIRWXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDyx1DNO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDyx1DNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756017202; x=1787553202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJ7brMJ7j9Jf+pX5rF+KPff9Z+TTXk4Vge0KzSZ/Puc=;
  b=aDyx1DNOfQDhhIrnrpgkO91p/NEBRIWT9Rd3diEqb9st2xZ7E8bC6O7E
   nhzwB2TTop4znefKFNFIpJaaV36LmDLh8Pz9+W9Sybw27F4KHOFLzU8/b
   FZJgp0FosCeMLxmoG6VRjRmTq4S3+HVtcRT/bepn0LEqfopg5anbMDTFk
   r/sZTybPLPILyFu90ExoDH35I156NrR4EoirPkbSEnj8qjIaGXLhg2dz4
   hjYh59X47ywy7dPIi/Fdk/9lWsH6Bb/0/6Hu0sv0jREYXzKhik7UuAYKm
   nlibCEW8GI67kf+Vn52rfUeSsYUlm3kWyVsOr9Qh/wzJGNU0OIPnBHuIz
   g==;
X-CSE-ConnectionGUID: mE+vT2VmRd6Js36Z9YgfTg==
X-CSE-MsgGUID: PvVNzZXxRJaTcpOoXuHcUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58190255"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58190255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 23:33:20 -0700
X-CSE-ConnectionGUID: dfhS840gSHyLhMpICQABKw==
X-CSE-MsgGUID: haTiPpeBRxSMphQUCwGWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169405883"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2025 23:33:18 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq4I0-0002Cd-0b;
	Sun, 24 Aug 2025 06:33:16 +0000
Date: Sun, 24 Aug 2025 08:32:48 +0200
From: kernel test robot <lkp@intel.com>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>,
	Roman Kisel <romank@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [linux-next:master 3139/4234] error: <unknown>:0:0: ran out of
 registers during register allocation in function 'hv_call_get_vp_registers'
Message-ID: <202508240828.pVaUV45D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: 96a1d2495c2f48467a91b8657bd594350b84ea9e [3139/4234] Drivers: hv: Introduce mshv_vtl driver
config: i386-buildonly-randconfig-2003-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240828.pVaUV45D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240828.pVaUV45D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_vp_registers'
>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_set_vp_registers'
>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_call_get_partition_property'
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
