Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9129A3
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653065456; x=1684601456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g9bdBj3ql8h+7P1tweuhkg3AlJoWZiW9c4tHoZzHR+k=;
  b=AyO1s9Nbn17FqA7UV9E0FlNyotuuwwlKQgHnYUHm3di3X2IWy9LLbI9d
   LWqVhOFe3FXV3w+pO77t8RMNp6w1hb3GagJfFDo0MAbXFYxL0V1iO9tiR
   6Y93e6bPvZVpWi5sOb6n8+kBWiGdeHv/lQK+GhCgH3RNchSpzUD+H6k02
   tvpSiX/KWW1c9o70v2ydWfNwaPWKJKX5o1VuQ8GwhERCevsoAYb928u/G
   MW1wuoHd3c5hhOUo/07CSLRzUbeDW15ji/oZm+ygbGY8rJ7Fxp5RH1tyd
   yiTI5DDmYorH8nbfZJoxYPvh5C1n+2ZQ9DIqRPvUEA7XooNy7qqVvVi9b
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="260247425"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="260247425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 09:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; 
   d="scan'208";a="628252784"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 May 2022 09:50:54 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ns5q1-0004xw-JM;
	Fri, 20 May 2022 16:50:53 +0000
Date: Sat, 21 May 2022 00:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bean Huo <beanhuo@micron.com>
Subject: [linux-next:master 13283/13468]
 drivers/ufs/host/ufs-exynos.c:1598:34: warning: unused variable
 'exynos_ufs_of_match'
Message-ID: <202205210041.hiIpWG5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 [13283/13468] scsi: ufs: Split the drivers/scsi/ufs directory
config: hexagon-randconfig-r001-20220519 (https://download.01.org/0day-ci/archive/20220521/202205210041.hiIpWG5f-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/ufs/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-exynos.c:1598:34: warning: unused variable 'exynos_ufs_of_match' [-Wunused-const-variable]
   static const struct of_device_id exynos_ufs_of_match[] = {
                                    ^
   1 warning generated.


vim +/exynos_ufs_of_match +1598 drivers/ufs/host/ufs-exynos.c

55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1597  
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28 @1598  static const struct of_device_id exynos_ufs_of_match[] = {
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1599  	{ .compatible = "samsung,exynos7-ufs",
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1600  	  .data	      = &exynos_ufs_drvs },
cc52e15397cc5d drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1601  	{ .compatible = "samsung,exynosautov9-ufs",
cc52e15397cc5d drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1602  	  .data	      = &exynosauto_ufs_drvs },
be39f4fd8dd430 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1603  	{ .compatible = "samsung,exynosautov9-ufs-vh",
be39f4fd8dd430 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1604  	  .data	      = &exynosauto_ufs_vh_drvs },
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1605  	{},
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1606  };
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1607  

:::::: The code at line 1598 was first introduced by commit
:::::: 55f4b1f73631a0817717fe6e98517de51b4c3527 scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs

:::::: TO: Alim Akhtar <alim.akhtar@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
