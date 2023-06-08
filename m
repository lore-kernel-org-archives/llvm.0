Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3820101D6;
	Thu,  8 Jun 2023 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686242130; x=1717778130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=veQhTchAfnha6TSGQ8oHaXlBvjwa/QQKR6qpNgtP/Jw=;
  b=YH69pICbgCKJh+psaDnFpuo6Pb2+UuhDN2ixrDfJgPwLiuehyAaM8mDv
   nD9TqJulXAACQqXjrV69jnMfr6vKfA5jT0bqrCPvjlO3v5G4VuA5lYAr1
   gliRDNrfbUwPA+d2Cx/6o8gB+4lM2dMvKvvjGxi44QRHpdcto1mfA5ScY
   tq8TT4KOCYjnCZYr0mb7CQEQCYxxvZ2Iw9DabmAzVk1SfKbNCUe3YOuUS
   c6BqnNlM1DLdZON1XvtQuX9JVyONANgNSGThMG0AaHlz58uZlnaSG9YEI
   FCGXbjSjd+CrGYSlBBdt2tIMaAds5IrW2AALJgrm9xYVD4WQ+yKwodPIG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="420939769"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="420939769"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 09:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="660456380"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="660456380"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jun 2023 09:35:28 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7Ibf-000832-2p;
	Thu, 08 Jun 2023 16:35:27 +0000
Date: Fri, 9 Jun 2023 00:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: drivers/ata/libata-eh.c:2411:6: warning: stack frame size (2288)
 exceeds limit (2048) in 'ata_eh_report'
Message-ID: <202306090021.YucfHGtk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f63595ebd82f56a2dd36ca013dd7f5ff2e2416a
commit: 742bef476ca5352b16063161fb73a56629a6d995 ata: libata: move ata_{port,link,dev}_dbg to standard pr_XXX() macros
date:   1 year, 5 months ago
config: riscv-randconfig-r012-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090021.YucfHGtk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=742bef476ca5352b16063161fb73a56629a6d995
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 742bef476ca5352b16063161fb73a56629a6d995
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ata/ drivers/gpu/drm/ drivers/hid/ drivers/media/tuners/ lib/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090021.YucfHGtk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/libata-eh.c:2411:6: warning: stack frame size (2288) exceeds limit (2048) in 'ata_eh_report' [-Wframe-larger-than]
   void ata_eh_report(struct ata_port *ap)
        ^
   drivers/ata/libata-eh.c:3550:5: warning: stack frame size (4320) exceeds limit (2048) in 'ata_eh_recover' [-Wframe-larger-than]
   int ata_eh_recover(struct ata_port *ap, ata_prereset_fn_t prereset,
       ^
   2 warnings generated.
--
>> drivers/ata/libata-pmp.c:915:12: warning: stack frame size (3296) exceeds limit (2048) in 'sata_pmp_eh_recover' [-Wframe-larger-than]
   static int sata_pmp_eh_recover(struct ata_port *ap)
              ^
   1 warning generated.


vim +/ata_eh_report +2411 drivers/ata/libata-eh.c

022bdb075b9e1f drivers/scsi/libata-eh.c Tejun Heo 2006-05-15  2401  
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2402  /**
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2403   *	ata_eh_report - report error handling to user
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2404   *	@ap: ATA port to report EH about
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2405   *
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2406   *	Report EH to user.
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2407   *
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2408   *	LOCKING:
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2409   *	None.
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2410   */
fb7fd61454c868 drivers/ata/libata-eh.c  Tejun Heo 2007-09-23 @2411  void ata_eh_report(struct ata_port *ap)
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2412  {
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2413  	struct ata_link *link;
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2414  
1eca4365be25c5 drivers/ata/libata-eh.c  Tejun Heo 2008-11-03  2415  	ata_for_each_link(link, ap, HOST_FIRST)
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2416  		ata_eh_link_report(link);
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2417  }
9b1e2658faf3f3 drivers/ata/libata-eh.c  Tejun Heo 2007-08-06  2418  

:::::: The code at line 2411 was first introduced by commit
:::::: fb7fd61454c8681cd2621051a710b78a00369203 libata-pmp-prep: make a number of functions global to libata

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
