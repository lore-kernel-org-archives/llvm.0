Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7804EBB;
	Mon,  6 May 2024 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030770; cv=none; b=T7p1di5RbvTST3YjBSLtmmL3BPPTsSG1qysx0iiLZye4xbxxI66ReZOSJN3XV2A9R98VasSFoKZXyOYjdNi+seAaEAyojAvhIdwxuLAOmngq7gEBmr53o5fPLbMbf+bRPo0lEd13JnKReA5P2b5eeudHHc3+mqk6MuwWFsnK58I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030770; c=relaxed/simple;
	bh=m5C2gI0SKqo58my5hF9LMo5sVf2W5A90zO6JgvQNUQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxW05dL+tgO/qKMNBxdZKvaWo0ZYdh6NVjsUwfLOwASIwE9Oai7bKjlh8hi5/UI0GlFk3C7nX5D4S96QN9qM98JcQhwr68mQ3xsMDaVamCdhiybeJO7Mc3yUQqaj52a0mahkDxf+vsLMbzFpKdxgDJIsOy0zyrqXr07voOMiW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLxXDz3Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLxXDz3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715030769; x=1746566769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5C2gI0SKqo58my5hF9LMo5sVf2W5A90zO6JgvQNUQc=;
  b=iLxXDz3YNfE1B8knKI00BDAW48F9Syfc8VQyN9+mLKOqvaraHn4XxsFI
   RxN2rmQ761sBNADyb08Sy8I40Hwrrn/l8cS2r6xYINt3qva7tBSwIRx45
   L5BJTHoRFQ6/0mg3Ur5tbl7C1YGbUAFuSrw6+YC2OAEDpPG+bzn893eQB
   fa6maDHY1pFi+p1hHnwdkNiT2f0Cyg7osMy6WIX/2n6e0brezxooNEEkS
   G1G1pn5rJjcFDdiS8ViHf9e6BD4NcCT+IWxVuKW5I2wPuQHZqD6j9NTOL
   bo82aOdOp67Qlqx5CJfC0gaKnr3NC6Hee0nXzSln+bdQXekawhXWC/Ojo
   w==;
X-CSE-ConnectionGUID: 35/JA7OVSrGoNqqweJzU3Q==
X-CSE-MsgGUID: Zq7RU/sARji4HTlqFzehAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21957346"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="21957346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 14:26:08 -0700
X-CSE-ConnectionGUID: dk3ZGl1IQpaL+HtH/3qtCA==
X-CSE-MsgGUID: r18z21nQTB+E9PWy+U44lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="32763059"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 May 2024 14:26:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s45qW-00013B-27;
	Mon, 06 May 2024 21:26:04 +0000
Date: Tue, 7 May 2024 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 40/42] fs/f2fs/f2fs.h:4605:5: warning: no
 previous prototype for function 'f2fs_build_fault_attr'
Message-ID: <202405070512.zeqTIFxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   6fd891b7248d0b825dbff6454be21f60c7ba1fb0
commit: 28a4fc03f837d64c67eeeba5ef226dbed4b369dc [40/42] f2fs: check validation of fault attrs in f2fs_build_fault_attr()
config: x86_64-buildonly-randconfig-005-20240507 (https://download.01.org/0day-ci/archive/20240507/202405070512.zeqTIFxN-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070512.zeqTIFxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070512.zeqTIFxN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
>> fs/f2fs/f2fs.h:4605:5: warning: no previous prototype for function 'f2fs_build_fault_attr' [-Wmissing-prototypes]
    4605 | int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
         |     ^
   fs/f2fs/f2fs.h:4605:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4605 | int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
         | ^
         | static 
   1 warning generated.
--
   In file included from fs/f2fs/node.c:16:
>> fs/f2fs/f2fs.h:4605:5: warning: no previous prototype for function 'f2fs_build_fault_attr' [-Wmissing-prototypes]
    4605 | int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
         |     ^
   fs/f2fs/f2fs.h:4605:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4605 | int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
         | ^
         | static 
   fs/f2fs/node.c:1357:1: warning: unused label 'out_dec' [-Wunused-label]
    1357 | out_dec:
         | ^~~~~~~~
   2 warnings generated.


vim +/f2fs_build_fault_attr +4605 fs/f2fs/f2fs.h

  4600	
  4601	#ifdef CONFIG_F2FS_FAULT_INJECTION
  4602	extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4603								unsigned long type);
  4604	#else
> 4605	int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4606								unsigned long type)
  4607	{
  4608		return 0;
  4609	}
  4610	#endif
  4611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
