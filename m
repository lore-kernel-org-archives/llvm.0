Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1B5250;
	Fri,  4 Aug 2023 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691145874; x=1722681874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12zlVYuzmMIqnsQ14M7whm4ZOEOamQFDiA0wYpiu5/Q=;
  b=UrqDwbzIIk6O8hxn5mbkDNcRN8DPSVBtMWALIo/nGh/kHWsIhHPiG/XL
   d4X/bGMDMHMiVz4crYw9dRdeewnC2M9RAIBDDWFskXmDIQm94Oet1puXS
   B/keBtNJ70Rk5OKMsS1198OpTh/CLMVlegpLErMN7cjwP3vOxu+VMt8PC
   NkXUww5WB48c77iSrTAOGR1iaQZnpg1xOA4ybmQc9ISog1vUMkkv7ttY5
   LBrZe79bgnKNKZz/iDiqd+y60TZOt3OQR0spHUkV0o2LqjistyD9JCbKX
   GeaXs4LxJ4+86u/rx/X4ED6wh+nGLB8AnrfMxnShXa4NXczPylAJV8iI/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="401083147"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="401083147"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 03:44:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706978875"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="706978875"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Aug 2023 03:41:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRsFH-0002nZ-0C;
	Fri, 04 Aug 2023 10:41:23 +0000
Date: Fri, 4 Aug 2023 18:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v8 1/15] ld.lld: error: cannot open
 drivers/nvme/common/: Is a directory
Message-ID: <202308041811.vWjFJJLi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v8
head:   fe5c5678d10ec3d17d9a29641bd64a4304f8abb7
commit: 67827b320abd757857ab7679741b8ee6d1acf8cc [1/15] nvme-keyring: register '.nvme' keyring
config: x86_64-randconfig-x006-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041811.vWjFJJLi-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041811.vWjFJJLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041811.vWjFJJLi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open drivers/nvme/common/: Is a directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
