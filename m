Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED52B9B9;
	Fri,  7 Feb 2025 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925334; cv=none; b=OgUy3QnBkJ6jkFpK/pqNR9zAz07hpPyLeg/UpfyyA4ZeOBEixd4hpI9XqKUzmb3hp9tpCid9rQ6VZN9NXlW3lFyBXUYuQjjYIVPWJ3QoMtuQd1bl9gQ9aYrFw3pFnvk+2zMIqYMNS35Hg+pehMgEukh2aaOSBV1GZZ8riMgtId0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925334; c=relaxed/simple;
	bh=6l8XbOLdf5xg5mtBc4I+radcjmLRZ+AzgYh7FYgy3H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ABTMWJTTvp3nD4bu7M5QEAk/2Bigmc4+poNMtlDoI17RGbdbE9xvVO6qNWhf+s9zWWagGFS/x5OfRGzPFVOqL18+6ANt2g4vl7tieN8a85uKY+yX3ngz60GoPlzC49xFKBGtr38yz1RokBEL4cugDeSDOHCAz2byqHX/AsDr1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1ZnZmPn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1ZnZmPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738925332; x=1770461332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6l8XbOLdf5xg5mtBc4I+radcjmLRZ+AzgYh7FYgy3H8=;
  b=d1ZnZmPn25dU8qkt8XKXkuEHhFD5FxUBw7S6fvaxOQg0Y9ye4P9WkUj9
   tr0efTUPPUcQPuu9dpYnxj2L3fHJaz8pnNbKg1/iknudpE8hbqKedOjOZ
   cWUH8aj9i56hWrS/Jlil6v7Ul7DchpamhHAtWn8UgSDcHPrnn9k6Wa0zX
   iMXbi+BEB/Km6BEcHbscrd3VQQQ6NffyNwPUG8OQc16s6lmGEJa93RaSK
   6FsxD5gYAsRE/1DD5utIarNuB0CaJDK4cceoUCRupax49V3WghTIRWYv2
   s6W5jUqyiGNT1HUWivEZFFjZiijoY2veLfQoyA1CH8k5uIaJpw9PkEuLV
   w==;
X-CSE-ConnectionGUID: xSWwgGncQXSQ3HfkSQSIPw==
X-CSE-MsgGUID: b17sQSdHSPKlbB5iJuPmZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50543411"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50543411"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:48:52 -0800
X-CSE-ConnectionGUID: F5NYU9ywQhKQWodSXE8koQ==
X-CSE-MsgGUID: 05xTL9DtRKWjfD682rVGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="142371381"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2025 02:48:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgLuh-000yBj-0S;
	Fri, 07 Feb 2025 10:48:47 +0000
Date: Fri, 7 Feb 2025 18:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [linux-next:master 2057/2219] fs/f2fs/super.c:3203:5: warning: no
 previous prototype for function 'f2fs_quota_sync'
Message-ID: <202502071851.xAEy4fSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed58d103e6da15a442ff87567898768dc3a66987
commit: 7e8588cc6b09f027f986a340092ffea747b8edce [2057/2219] f2fs: quota: fix to avoid warning in dquot_writeback_dquots()
config: hexagon-randconfig-002-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071851.xAEy4fSP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071851.xAEy4fSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071851.xAEy4fSP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:3203:5: warning: no previous prototype for function 'f2fs_quota_sync' [-Wmissing-prototypes]
    3203 | int f2fs_quota_sync(struct super_block *sb, int type)
         |     ^
   fs/f2fs/super.c:3203:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3203 | int f2fs_quota_sync(struct super_block *sb, int type)
         | ^
         | static 
   1 warning generated.


vim +/f2fs_quota_sync +3203 fs/f2fs/super.c

10a26878564f27 Chao Yu 2021-10-28  3202  
af033b2aa8a874 Chao Yu 2018-09-20 @3203  int f2fs_quota_sync(struct super_block *sb, int type)
af033b2aa8a874 Chao Yu 2018-09-20  3204  {
af033b2aa8a874 Chao Yu 2018-09-20  3205  	return 0;
af033b2aa8a874 Chao Yu 2018-09-20  3206  }
af033b2aa8a874 Chao Yu 2018-09-20  3207  

:::::: The code at line 3203 was first introduced by commit
:::::: af033b2aa8a874fd5737fafe90d159136527b5b4 f2fs: guarantee journalled quota data by checkpoint

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
