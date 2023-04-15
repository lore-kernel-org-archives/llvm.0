Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23413ED5;
	Sat, 15 Apr 2023 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681545633; x=1713081633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1jInIIQW8Lb3qdaqw74CCe2AXXvizivdjavcjnXC44=;
  b=Fo6F0MccjCi4Ds+WS+okQLEp4Q8mO6PvXU2sJN+iNisJOGEQ4pr15Lna
   XkI7Nz5RRC4pIwXOXCTAdsUhxfmYtMpn3LqAMgz4uukOoWdTURQnrQlDY
   knsWchJeqRKz4D/Apac/CGMWXbz+PFV4biFLL+dXXUom3n3+6w44Jp9XC
   T7I+l58OrLWH7/3yq7lB/8pkDOjUOaxMJG3vj+Pxo7uLOYIMQ8TKEXgJx
   5BkoN2ehJ1HkfTSkafCEmvcfPk59VXyrBFwTYRmbLpiWkjOgs5DKJwXCt
   xW9gcWl5K+5NkeNl2jY5m4kmPUwLAQAurioKvnMME4Io4djWaxd0kot2y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324974764"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324974764"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 01:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722744299"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722744299"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2023 01:00:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnapZ-000aiR-1p;
	Sat, 15 Apr 2023 08:00:21 +0000
Date: Sat, 15 Apr 2023 15:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.4/block 77/77] block/genhd.c:424:58: warning:
 comparison between pointer and integer ('bool' (aka '_Bool') and 'void *')
Message-ID: <202304151536.mDbGQlr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.4/block
head:   87e5c949c2e63cb409450f35f7512c40649e3d19
commit: 87e5c949c2e63cb409450f35f7512c40649e3d19 [77/77] block: store bdev->bd_disk->fops->submit_bio state in bdev
config: mips-cu1830-neo_defconfig (https://download.01.org/0day-ci/archive/20230415/202304151536.mDbGQlr2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=87e5c949c2e63cb409450f35f7512c40649e3d19
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.4/block
        git checkout 87e5c949c2e63cb409450f35f7512c40649e3d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151536.mDbGQlr2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:424:58: warning: comparison between pointer and integer ('bool' (aka '_Bool') and 'void *') [-Wpointer-integer-compare]
           disk->part0->bd_submit_bio = disk->part0->bd_submit_bio != NULL;
                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~
   1 warning generated.


vim +424 block/genhd.c

   394	
   395	/**
   396	 * device_add_disk - add disk information to kernel list
   397	 * @parent: parent device for the disk
   398	 * @disk: per-device partitioning information
   399	 * @groups: Additional per-device sysfs groups
   400	 *
   401	 * This function registers the partitioning information in @disk
   402	 * with the kernel.
   403	 */
   404	int __must_check device_add_disk(struct device *parent, struct gendisk *disk,
   405					 const struct attribute_group **groups)
   406	
   407	{
   408		struct device *ddev = disk_to_dev(disk);
   409		int ret;
   410	
   411		/* Only makes sense for bio-based to set ->poll_bio */
   412		if (queue_is_mq(disk->queue) && disk->fops->poll_bio)
   413			return -EINVAL;
   414	
   415		/*
   416		 * The disk queue should now be all set with enough information about
   417		 * the device for the elevator code to pick an adequate default
   418		 * elevator if one is needed, that is, for devices requesting queue
   419		 * registration.
   420		 */
   421		elevator_init_mq(disk->queue);
   422	
   423		/* Mark bdev as having a submit_bio, if needed */
 > 424		disk->part0->bd_submit_bio = disk->part0->bd_submit_bio != NULL;
   425	
   426		/*
   427		 * If the driver provides an explicit major number it also must provide
   428		 * the number of minors numbers supported, and those will be used to
   429		 * setup the gendisk.
   430		 * Otherwise just allocate the device numbers for both the whole device
   431		 * and all partitions from the extended dev_t space.
   432		 */
   433		ret = -EINVAL;
   434		if (disk->major) {
   435			if (WARN_ON(!disk->minors))
   436				goto out_exit_elevator;
   437	
   438			if (disk->minors > DISK_MAX_PARTS) {
   439				pr_err("block: can't allocate more than %d partitions\n",
   440					DISK_MAX_PARTS);
   441				disk->minors = DISK_MAX_PARTS;
   442			}
   443			if (disk->first_minor + disk->minors > MINORMASK + 1)
   444				goto out_exit_elevator;
   445		} else {
   446			if (WARN_ON(disk->minors))
   447				goto out_exit_elevator;
   448	
   449			ret = blk_alloc_ext_minor();
   450			if (ret < 0)
   451				goto out_exit_elevator;
   452			disk->major = BLOCK_EXT_MAJOR;
   453			disk->first_minor = ret;
   454		}
   455	
   456		/* delay uevents, until we scanned partition table */
   457		dev_set_uevent_suppress(ddev, 1);
   458	
   459		ddev->parent = parent;
   460		ddev->groups = groups;
   461		dev_set_name(ddev, "%s", disk->disk_name);
   462		if (!(disk->flags & GENHD_FL_HIDDEN))
   463			ddev->devt = MKDEV(disk->major, disk->first_minor);
   464		ret = device_add(ddev);
   465		if (ret)
   466			goto out_free_ext_minor;
   467	
   468		ret = disk_alloc_events(disk);
   469		if (ret)
   470			goto out_device_del;
   471	
   472		if (!sysfs_deprecated) {
   473			ret = sysfs_create_link(block_depr, &ddev->kobj,
   474						kobject_name(&ddev->kobj));
   475			if (ret)
   476				goto out_device_del;
   477		}
   478	
   479		/*
   480		 * avoid probable deadlock caused by allocating memory with
   481		 * GFP_KERNEL in runtime_resume callback of its all ancestor
   482		 * devices
   483		 */
   484		pm_runtime_set_memalloc_noio(ddev, true);
   485	
   486		ret = blk_integrity_add(disk);
   487		if (ret)
   488			goto out_del_block_link;
   489	
   490		disk->part0->bd_holder_dir =
   491			kobject_create_and_add("holders", &ddev->kobj);
   492		if (!disk->part0->bd_holder_dir) {
   493			ret = -ENOMEM;
   494			goto out_del_integrity;
   495		}
   496		disk->slave_dir = kobject_create_and_add("slaves", &ddev->kobj);
   497		if (!disk->slave_dir) {
   498			ret = -ENOMEM;
   499			goto out_put_holder_dir;
   500		}
   501	
   502		ret = blk_register_queue(disk);
   503		if (ret)
   504			goto out_put_slave_dir;
   505	
   506		if (!(disk->flags & GENHD_FL_HIDDEN)) {
   507			ret = bdi_register(disk->bdi, "%u:%u",
   508					   disk->major, disk->first_minor);
   509			if (ret)
   510				goto out_unregister_queue;
   511			bdi_set_owner(disk->bdi, ddev);
   512			ret = sysfs_create_link(&ddev->kobj,
   513						&disk->bdi->dev->kobj, "bdi");
   514			if (ret)
   515				goto out_unregister_bdi;
   516	
   517			/* Make sure the first partition scan will be proceed */
   518			if (get_capacity(disk) && !(disk->flags & GENHD_FL_NO_PART) &&
   519			    !test_bit(GD_SUPPRESS_PART_SCAN, &disk->state))
   520				set_bit(GD_NEED_PART_SCAN, &disk->state);
   521	
   522			bdev_add(disk->part0, ddev->devt);
   523			if (get_capacity(disk))
   524				disk_scan_partitions(disk, FMODE_READ);
   525	
   526			/*
   527			 * Announce the disk and partitions after all partitions are
   528			 * created. (for hidden disks uevents remain suppressed forever)
   529			 */
   530			dev_set_uevent_suppress(ddev, 0);
   531			disk_uevent(disk, KOBJ_ADD);
   532		} else {
   533			/*
   534			 * Even if the block_device for a hidden gendisk is not
   535			 * registered, it needs to have a valid bd_dev so that the
   536			 * freeing of the dynamic major works.
   537			 */
   538			disk->part0->bd_dev = MKDEV(disk->major, disk->first_minor);
   539		}
   540	
   541		disk_update_readahead(disk);
   542		disk_add_events(disk);
   543		set_bit(GD_ADDED, &disk->state);
   544		return 0;
   545	
   546	out_unregister_bdi:
   547		if (!(disk->flags & GENHD_FL_HIDDEN))
   548			bdi_unregister(disk->bdi);
   549	out_unregister_queue:
   550		blk_unregister_queue(disk);
   551		rq_qos_exit(disk->queue);
   552	out_put_slave_dir:
   553		kobject_put(disk->slave_dir);
   554		disk->slave_dir = NULL;
   555	out_put_holder_dir:
   556		kobject_put(disk->part0->bd_holder_dir);
   557	out_del_integrity:
   558		blk_integrity_del(disk);
   559	out_del_block_link:
   560		if (!sysfs_deprecated)
   561			sysfs_remove_link(block_depr, dev_name(ddev));
   562	out_device_del:
   563		device_del(ddev);
   564	out_free_ext_minor:
   565		if (disk->major == BLOCK_EXT_MAJOR)
   566			blk_free_ext_minor(disk->first_minor);
   567	out_exit_elevator:
   568		if (disk->queue->elevator)
   569			elevator_exit(disk->queue);
   570		return ret;
   571	}
   572	EXPORT_SYMBOL(device_add_disk);
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
