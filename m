Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224022C80
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644560734; x=1676096734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apOCdSx56OUiu3kduwnCNTPvU+GxrnSwBeFMzCEGc3E=;
  b=Giavkk0+FlV4KxGPdApB2rJu5/jDCoU5nB9eHmtxaqgz++wDLeryDBZ1
   ijrIU73uoPxeN/iy6Ono0WzHZWiwD41XDrJeLCjrd04EcelcqWAAd4oWq
   zWDlxjWYJ0j+18HvcZPGKVgfdTTxLiTn1VrTPrggxHAprvdtu5Uhmg8qw
   zVBhN4kHRGooLCSS3IfYi8Mk4s4yscXWBXhxGtkCRmUSvYDO4sTz1SKdu
   SCHlvZMJKyt3FByekfluh1ZGKaPyvjUwhoU+jZ5nQ+G8HbWcbVwoHHAZc
   9cLulOJh/OCFTKv8DOJkMgv2qqj2+tt7sITr9k5c3mbqsLi4VGtCxthWv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248503237"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="248503237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 22:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="774149087"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2022 22:25:32 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIPN5-0004Dx-MX; Fri, 11 Feb 2022 06:25:31 +0000
Date: Fri, 11 Feb 2022 14:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/media/platform/marvell-ccic/mmp-driver.c:366:34: warning:
 unused variable 'mmpcam_of_match'
Message-ID: <202202111412.5iSkckar-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1baf68e1383f6ed93eb9cff2866d46562607a43
commit: b408b611eb951594691abfee8ca687b405d27757 mips: ar7: convert to CONFIG_COMMON_CLK
date:   8 months ago
config: mips-buildonly-randconfig-r001-20220211 (https://download.01.org/0day-ci/archive/20220211/202202111412.5iSkckar-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b408b611eb951594691abfee8ca687b405d27757
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b408b611eb951594691abfee8ca687b405d27757
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/atmel/ drivers/media/platform/marvell-ccic/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/marvell-ccic/mmp-driver.c:366:34: warning: unused variable 'mmpcam_of_match' [-Wunused-const-variable]
   static const struct of_device_id mmpcam_of_match[] = {
                                    ^
   1 warning generated.


vim +/mmpcam_of_match +366 drivers/media/platform/marvell-ccic/mmp-driver.c

bb0a896e3d5083 drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Corbet 2011-12-30  365  
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28 @366  static const struct of_device_id mmpcam_of_match[] = {
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  367  	{ .compatible = "marvell,mmp2-ccic", },
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  368  	{},
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  369  };
08aac0e32fe44b drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-07-22  370  MODULE_DEVICE_TABLE(of, mmpcam_of_match);
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Corbet 2011-06-11  371  

:::::: The code at line 366 was first introduced by commit
:::::: 83c40e6611ec1e548ece34f6940f516333abc16a media: marvell-ccic/mmp: add devicetree support

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
