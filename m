Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BD917CE;
	Thu, 23 Mar 2023 04:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679544009; x=1711080009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NsGdUJBncGKWfC7GpKnDTmKlDEqGv3Q1q5ABVkhCRKs=;
  b=fmiQ8RVdpuIuNTwK4dNpMwj/geTUioGtXT6LvqKLOyE/wrfSie3mGaHi
   izLGJ+6HBWZcFVWDhQU/ATMWiJ7sfCFCp25uVP3xUw48/QXu9cUn5mPh5
   pe62/clgUj/R2G9sDE64QrjC6/c7kMWMt7sdtpbwEcw1YgrRiTIE2Abz8
   EWAtQQ5EarVAQksAyAQupzDBRSeFVL87vGDL79r4OKtMF/TEnedSt11yZ
   xfcf+0i1jY3xylLmE7bJrm4QEA1BZiYJtG9JqfWKtjr4KwzLqYPQmxMHc
   vnwo37L8m4v8EYurMWCJSumn+v7lGMEwD4/Pw/GKOXLxPdb4F73PRgMII
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336894974"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="336894974"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 21:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751325355"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="751325355"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 21:00:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfC7T-000Dvq-16;
	Thu, 23 Mar 2023 04:00:07 +0000
Date: Thu, 23 Mar 2023 12:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230322-deprecate-bdev_disk_changed 1/1]
 block/partitions/core.c:701:1: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <202303231125.zhFczwGo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230322-deprecate-bdev_disk_changed
head:   64988d63873be8d60ab3ebb87c869cba3960116e
commit: 64988d63873be8d60ab3ebb87c869cba3960116e [1/1] block: annotate bdev_disk_changed() deprecation with a symbol namespace
config: arm-randconfig-r046-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231125.zhFczwGo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=64988d63873be8d60ab3ebb87c869cba3960116e
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230322-deprecate-bdev_disk_changed
        git checkout 64988d63873be8d60ab3ebb87c869cba3960116e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash block/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231125.zhFczwGo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/partitions/core.c:701:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL_NS(bdev_disk_changed, BLOCK_DEPRECATED);
   ^
   int
>> block/partitions/core.c:701:22: error: a parameter list without types is only allowed in a function definition
   EXPORT_SYMBOL_GPL_NS(bdev_disk_changed, BLOCK_DEPRECATED);
                        ^
   2 errors generated.


vim +/int +701 block/partitions/core.c

   654	
   655	int bdev_disk_changed(struct gendisk *disk, bool invalidate)
   656	{
   657		int ret = 0;
   658	
   659		lockdep_assert_held(&disk->open_mutex);
   660	
   661		if (!disk_live(disk))
   662			return -ENXIO;
   663	
   664	rescan:
   665		if (disk->open_partitions)
   666			return -EBUSY;
   667		sync_blockdev(disk->part0);
   668		invalidate_bdev(disk->part0);
   669		blk_drop_partitions(disk);
   670	
   671		clear_bit(GD_NEED_PART_SCAN, &disk->state);
   672	
   673		/*
   674		 * Historically we only set the capacity to zero for devices that
   675		 * support partitions (independ of actually having partitions created).
   676		 * Doing that is rather inconsistent, but changing it broke legacy
   677		 * udisks polling for legacy ide-cdrom devices.  Use the crude check
   678		 * below to get the sane behavior for most device while not breaking
   679		 * userspace for this particular setup.
   680		 */
   681		if (invalidate) {
   682			if (!(disk->flags & GENHD_FL_NO_PART) ||
   683			    !(disk->flags & GENHD_FL_REMOVABLE))
   684				set_capacity(disk, 0);
   685		}
   686	
   687		if (get_capacity(disk)) {
   688			ret = blk_add_partitions(disk);
   689			if (ret == -EAGAIN)
   690				goto rescan;
   691		} else if (invalidate) {
   692			/*
   693			 * Tell userspace that the media / partition table may have
   694			 * changed.
   695			 */
   696			kobject_uevent(&disk_to_dev(disk)->kobj, KOBJ_CHANGE);
   697		}
   698	
   699		return ret;
   700	}
 > 701	EXPORT_SYMBOL_GPL_NS(bdev_disk_changed, BLOCK_DEPRECATED);
   702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
