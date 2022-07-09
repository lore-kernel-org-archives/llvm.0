Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C097E8
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 03:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657336643; x=1688872643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/YlEfGURF5k3pwIh7EE5UdiFOfwrHwAaIC9aKkOk5I=;
  b=YwWB3gnEyaVbDUt6bGDitPJwWExoYWUzo+NgpPWsLnCiSA1cpxpTAX7s
   tgjszXEmMEHgCWzsC7RSJ1D0u5bgq4er+utMpsngGLx4N716sXyPyQIqP
   oy7AfD4TLJRZHtYDngvLtCW+gZdZ+koV7t/3RiKCiFSLbESfyhx9Fc8KG
   vuN8fX/0L0539MWBG0zBGotynGprVlUKfLqSbezm00yiEAIg+BXJLtMmM
   xDA/zsXx/vBifMlDCs8JnmF18UEK5lgB0URLeJm4ZDOTpNCaM318DIuQG
   z7al7g9FAael+AZlZWA1R7WGDtj2zOSvnLY/wrurMxdu1t503W5JCNPkm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="264182069"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="264182069"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 20:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="626904148"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jul 2022 20:17:20 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oA0y7-000OFU-OT;
	Sat, 09 Jul 2022 03:17:19 +0000
Date: Sat, 9 Jul 2022 11:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [mcgrof-next:20220707-dm-zoned-npo2 1/13] fs/btrfs/zoned.h:311:5:
 error: call to undeclared function 'bdev_zone_sectors'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202207091156.CM7phKD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20220707-dm-zoned-npo2
head:   3d1b6e41f76394610669e380da4f65bc5e7cf8ac
commit: a37ed4b355c02ec383a85c961f0e121df104cc1a [1/13] block: make bdev_nr_zones and disk_zone_no generic for npo2 zsze
config: hexagon-randconfig-r041-20220707 (https://download.01.org/0day-ci/archive/20220709/202207091156.CM7phKD9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f6839980bfac61babb40d83772c51427011)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=a37ed4b355c02ec383a85c961f0e121df104cc1a
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20220707-dm-zoned-npo2
        git checkout a37ed4b355c02ec383a85c961f0e121df104cc1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash block/ fs/btrfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/extent_io.c:30:
>> fs/btrfs/zoned.h:311:5: error: call to undeclared function 'bdev_zone_sectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           (bdev_zone_sectors(bdev) << SECTOR_SHIFT);
                            ^
   fs/btrfs/zoned.h:311:5: note: did you mean 'bdev_nr_sectors'?
   include/linux/blkdev.h:807:24: note: 'bdev_nr_sectors' declared here
   static inline sector_t bdev_nr_sectors(struct block_device *bdev)
                          ^
   1 error generated.
--
>> block/ioctl.c:496:25: error: call to undeclared function 'bdev_zone_sectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return put_uint(argp, bdev_zone_sectors(bdev));
                                         ^
   block/ioctl.c:496:25: note: did you mean 'bdev_nr_sectors'?
   include/linux/blkdev.h:807:24: note: 'bdev_nr_sectors' declared here
   static inline sector_t bdev_nr_sectors(struct block_device *bdev)
                          ^
   1 error generated.


vim +/bdev_zone_sectors +311 fs/btrfs/zoned.h

5b316468983dfa9 Naohiro Aota       2020-11-10  298  
b70f509774ad4b7 Naohiro Aota       2020-11-10  299  static inline bool btrfs_check_device_zone_type(const struct btrfs_fs_info *fs_info,
b70f509774ad4b7 Naohiro Aota       2020-11-10  300  						struct block_device *bdev)
b70f509774ad4b7 Naohiro Aota       2020-11-10  301  {
b70f509774ad4b7 Naohiro Aota       2020-11-10  302  	if (btrfs_is_zoned(fs_info)) {
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  303  		/*
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  304  		 * We can allow a regular device on a zoned filesystem, because
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  305  		 * we will emulate the zoned capabilities.
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  306  		 */
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  307  		if (!bdev_is_zoned(bdev))
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  308  			return true;
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  309  
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04  310  		return fs_info->zone_size ==
3c9daa09ccd43f6 Johannes Thumshirn 2021-02-04 @311  			(bdev_zone_sectors(bdev) << SECTOR_SHIFT);
b70f509774ad4b7 Naohiro Aota       2020-11-10  312  	}
b70f509774ad4b7 Naohiro Aota       2020-11-10  313  
b70f509774ad4b7 Naohiro Aota       2020-11-10  314  	/* Do not allow Host Manged zoned device */
b70f509774ad4b7 Naohiro Aota       2020-11-10  315  	return bdev_zoned_model(bdev) != BLK_ZONED_HM;
b70f509774ad4b7 Naohiro Aota       2020-11-10  316  }
b70f509774ad4b7 Naohiro Aota       2020-11-10  317  

:::::: The code at line 311 was first introduced by commit
:::::: 3c9daa09ccd43f68104634020b364d834c01738c btrfs: zoned: allow zoned filesystems on non-zoned block devices

:::::: TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
