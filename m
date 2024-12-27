Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92ED1F8694;
	Fri, 27 Dec 2024 21:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735335415; cv=none; b=RaeIlxTGgZU0a5TLme5PhuZsSXY1n+5JYxxuku47+fR+NFRtICNRt6F/Fe6isEeoeHr2wjMF85x5tp4gv8gxBrQr12S49c6dBU03qsaLTSK+vsyIfQZrpiuM/u9CtnkrKf4m5CporYx5ALM2FaqN0J1de0iUMtQOjTvL4fy9I9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735335415; c=relaxed/simple;
	bh=EJb4fFZEtlimAkMV80FV2gDzkTHV2XTjBuVAbG26Ui0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OmTOuqCnf8E3gafYzylhJVJee6qPGfoo1S+qDUEhDF2MHD6lPbv4CZH/CnjKNtk2IBJB83EQV4mURu76+bH9C6iiVMBrjkC8xnIw0LbTFRhEC8DeMD2BhMxwlRKTPG/uoTC4uZEcxQMwo4/fTQppPlEOyUYGZEI4pMOhrwlcBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIKf55el; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIKf55el"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735335411; x=1766871411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJb4fFZEtlimAkMV80FV2gDzkTHV2XTjBuVAbG26Ui0=;
  b=TIKf55elNk93apiJ7MRJyYZgSw+Fa8bTQc9/G/38SYrQB7GfyrJ9k0Wz
   eUGBHIZqgLvoXgugbKxor1IRy8IvPi8mdTWl8K0xjixWTqf1EW3pF0L4c
   Zsr90L31a6QN9+0LTg65ZQFZz3uFhag/zk5y8aNUjwWZt0yvMcBpXnglE
   8X01djcz0l+GpvW+zlkQHwuUGluF8SOE03WLKBJfLxd137Yo8TY0mHGah
   jlMAdEB0GtoW2Elp0rXCdIw3Nocrng6F7Kken35bnDQGj70VWQl3KNVPJ
   JyJwQf45SLnyB5GYabS/9PlpRDG55CV4H9V4IFdskoUWIlwE/hr+lKUyX
   g==;
X-CSE-ConnectionGUID: wwzlw/H/QyyP8W7aBiStPA==
X-CSE-MsgGUID: hKJ45IRRSCi/9ZepBKTzhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="58194774"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="58194774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:36:48 -0800
X-CSE-ConnectionGUID: aL+csauTQpGUaHwZzYMxmg==
X-CSE-MsgGUID: nxVU4jM8Shuzy9C6kAxQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105249878"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2024 13:36:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRI0i-0003e3-0H;
	Fri, 27 Dec 2024 21:36:44 +0000
Date: Sat, 28 Dec 2024 05:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool:
 vmw_host_printf+0xe: unknown CFA base reg 0
Message-ID: <202412280559.QOqkmqm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8379578b11d5e073792b5db2690faa12effce8e0
commit: 30c2de0a267c04046d89e678cc0067a9cfb455df mm/vmstat: fix a W=1 clang compiler warning
date:   9 days ago
config: x86_64-buildonly-randconfig-001-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280559.QOqkmqm5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280559.QOqkmqm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280559.QOqkmqm5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_host_printf+0xe: unknown CFA base reg 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
