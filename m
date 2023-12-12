Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73785CBD;
	Tue, 12 Dec 2023 03:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U82ntE2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702352251; x=1733888251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anqJPSep1K/QL3wLSEj4yeXasMNMbJRcccs4iAoB5Aw=;
  b=U82ntE2xYcLfBGAa7b67708faTl8MZoNQCMiFiJXMtwDkElIbqvmff93
   nr3s706OEV43J1TnbasB8YuT0ZFtNt6v/9oMMHSXVjTU5WO0k3QKygBuR
   I7gL/zkdpUC22GPagKoTu6fb4KFjUNIQRDEJObd1NuEYVi7EuNbrIynRS
   4FFrdyWL7urDA5509Y3gjQr3aFFC7irV+BrMeZjyq3KoqUaEs50QvX1iP
   46r5QnBLAuUE9CqrGGJwv6x68ZRnZRQgOjkv22j3+wOfNvoBR23OFP3jR
   Ly7ybMizziMaXwzNaqdXR202Am24h13lO9ypE1naMdo3VuCapkVNT572/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480945605"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="480945605"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 19:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="891414651"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="891414651"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2023 19:37:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCtaK-000IjP-03;
	Tue, 12 Dec 2023 03:37:28 +0000
Date: Tue, 12 Dec 2023 11:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/248 2/8] drivers/gpu/drm/apple/dptxep.c:337:20:
 warning: unused variable 'dptx'
Message-ID: <202312121138.tMUGnZRQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/248
head:   36e1598e36825b674ada08388f0e354a7b68816a
commit: 49a9d0527e6c6bd2f5bdd60d06b6a6b5936091c8 [2/8] drm: apple: dptx: Wait for link config on connect
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231212/202312121138.tMUGnZRQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312121138.tMUGnZRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121138.tMUGnZRQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/dptxep.c:337:20: warning: unused variable 'dptx' [-Wunused-variable]
     337 |         struct dptx_port *dptx = service->cookie;
         |                           ^
   1 warning generated.


vim +/dptx +337 drivers/gpu/drm/apple/dptxep.c

f4f07ee9750648 Sven Peter   2022-11-05  333  
f4f07ee9750648 Sven Peter   2022-11-05  334  static int
f4f07ee9750648 Sven Peter   2022-11-05  335  dptxport_call_did_change_link_config(struct apple_epic_service *service)
f4f07ee9750648 Sven Peter   2022-11-05  336  {
b28bc9faab65ed Janne Grunau 2023-11-21 @337  	struct dptx_port *dptx = service->cookie;
f4f07ee9750648 Sven Peter   2022-11-05  338  	/* assume the link config did change and wait a little bit */
f4f07ee9750648 Sven Peter   2022-11-05  339  	mdelay(10);
49a9d0527e6c6b Janne Grunau 2023-12-03  340  
49a9d0527e6c6b Janne Grunau 2023-12-03  341  
f4f07ee9750648 Sven Peter   2022-11-05  342  	return 0;
f4f07ee9750648 Sven Peter   2022-11-05  343  }
f4f07ee9750648 Sven Peter   2022-11-05  344  

:::::: The code at line 337 was first introduced by commit
:::::: b28bc9faab65edee374bf29c729b6b34367e80a9 drm: apple: dptx: Wait for completion of dptx_connect.

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
