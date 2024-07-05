Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD021A0B;
	Fri,  5 Jul 2024 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720146174; cv=none; b=JpbQ1qBVCnbDJQa2pKsxlGNk5q8EnHJDjXcTMXuy7osFgyRWgx93vMHeGxkbIZ8oPaBRDmMPiyycYcKyzdD2TAkF5peJfNFeROKPI31UV86TpJgVV/U0iT74L30BlX0vyAR60MX4KNcqYnLuj8Y0Q1oXeb17ia+RYQ40CtNT8lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720146174; c=relaxed/simple;
	bh=diPbfO+jdXe6BXw3OzqaJloVwYmHtgFdrObaLkiJXVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeM+UllJg0HUNzsbVHsIDisSDVVVTW7FxeGTtUBQ8MLEvt3ni9TBIZ4+n2XiYKHHenU6vLte20WKR1vymQV2XEW0TSOYi9cUBX56r8DmHWvM8DGvI9Ww+w/hWn8G8FFM1MaS43wTN9Sfe9LTJYGd049W/2DYglrRM+xtwRC5RSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mksMhb6E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mksMhb6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720146170; x=1751682170;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=diPbfO+jdXe6BXw3OzqaJloVwYmHtgFdrObaLkiJXVw=;
  b=mksMhb6EblBG19tJRwS4DY4kblfRyvFC2hfJn8yQTHm2DEd9hEe6ybBo
   jmt8510d/wIHRkybtuitQ8wSXMJbMkPDJlqirn+OvDQ0lPKsd/n0v12hm
   k53ACZW3e95QzFLyWFhyxLUdwzRbpuP6aU7tjYvjqUkLvjvBxXMTJT4+c
   OR32arugG3B9iMf2m0Q+gvywjAi4CpcV2VeKYnX1xYrPKZKwphPPcb3HV
   potXyW09dpWu5RtRWmf4uA/GtnD3r81COsBTj9ACx3y/R1srkU02T9FsS
   +OJtnL+pYvWu16y6L/D0Da7Q2bny52HPXkmOOFg7VgmTLINpEAKDv8M0U
   Q==;
X-CSE-ConnectionGUID: YO6x6tMjQcKen+putP2z9w==
X-CSE-MsgGUID: hKyn7E1MQledBtOzx+FaTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17250493"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17250493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 19:22:47 -0700
X-CSE-ConnectionGUID: qKoa7i/1Qz6SMGBpeA0Fyg==
X-CSE-MsgGUID: FX0oSaJdSmmqLYn3zLCujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51172777"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 19:22:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPYaw-000RnG-2i;
	Fri, 05 Jul 2024 02:22:42 +0000
Date: Fri, 5 Jul 2024 10:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [linux-next:master 5890/10451] drivers/block/loop.c:1009:16: error:
 variable 'inode' set but not used
Message-ID: <202407051018.4qDH70ea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: a17ece76bcfe7b86327b19cae1652d7c62068a30 [5890/10451] loop: regularize upgrading the block size for direct I/O
config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/0day-ci/archive/20240705/202407051018.4qDH70ea-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051018.4qDH70ea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051018.4qDH70ea-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/loop.c:1009:16: error: variable 'inode' set but not used [-Werror,-Wunused-but-set-variable]
    1009 |         struct inode *inode;
         |                       ^
   1 error generated.


vim +/inode +1009 drivers/block/loop.c

473516b361936c Christoph Hellwig   2024-02-13  1003  
05bdb9965305bb Christoph Hellwig   2023-06-08  1004  static int loop_configure(struct loop_device *lo, blk_mode_t mode,
3448914e8cc550 Martijn Coenen      2020-05-13  1005  			  struct block_device *bdev,
3448914e8cc550 Martijn Coenen      2020-05-13  1006  			  const struct loop_config *config)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1007  {
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1008  	struct file *file = fget(config->fd);
^1da177e4c3f41 Linus Torvalds      2005-04-16 @1009  	struct inode *inode;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1010  	struct address_space *mapping;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1011  	int error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1012  	loff_t size;
85b0a54a82e4fb Jan Kara            2018-11-08  1013  	bool partscan;
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1014  	bool is_loop;
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1015  
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1016  	if (!file)
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1017  		return -EBADF;
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1018  	is_loop = is_loop_device(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1019  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1020  	/* This is safe, since we have a reference from open(). */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1021  	__module_get(THIS_MODULE);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1022  
33ec3e53e7b186 Jan Kara            2019-05-16  1023  	/*
33ec3e53e7b186 Jan Kara            2019-05-16  1024  	 * If we don't hold exclusive handle for the device, upgrade to it
33ec3e53e7b186 Jan Kara            2019-05-16  1025  	 * here to avoid changing device under exclusive owner.
33ec3e53e7b186 Jan Kara            2019-05-16  1026  	 */
05bdb9965305bb Christoph Hellwig   2023-06-08  1027  	if (!(mode & BLK_OPEN_EXCL)) {
0718afd47f70cf Christoph Hellwig   2023-06-01  1028  		error = bd_prepare_to_claim(bdev, loop_configure, NULL);
ecbe6bc0003bfd Christoph Hellwig   2020-07-16  1029  		if (error)
757ecf40b7e029 Jan Kara            2018-11-08  1030  			goto out_putf;
33ec3e53e7b186 Jan Kara            2019-05-16  1031  	}
33ec3e53e7b186 Jan Kara            2019-05-16  1032  
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1033  	error = loop_global_lock_killable(lo, is_loop);
33ec3e53e7b186 Jan Kara            2019-05-16  1034  	if (error)
33ec3e53e7b186 Jan Kara            2019-05-16  1035  		goto out_bdev;
757ecf40b7e029 Jan Kara            2018-11-08  1036  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1037  	error = -EBUSY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1038  	if (lo->lo_state != Lo_unbound)
757ecf40b7e029 Jan Kara            2018-11-08  1039  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1040  
d2ac838e4cd7e5 Theodore Ts'o       2018-05-07  1041  	error = loop_validate_file(file, bdev);
d2ac838e4cd7e5 Theodore Ts'o       2018-05-07  1042  	if (error)
757ecf40b7e029 Jan Kara            2018-11-08  1043  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1044  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1045  	mapping = file->f_mapping;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1046  	inode = mapping->host;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1047  
3448914e8cc550 Martijn Coenen      2020-05-13  1048  	if ((config->info.lo_flags & ~LOOP_CONFIGURE_SETTABLE_FLAGS) != 0) {
3448914e8cc550 Martijn Coenen      2020-05-13  1049  		error = -EINVAL;
3448914e8cc550 Martijn Coenen      2020-05-13  1050  		goto out_unlock;
3448914e8cc550 Martijn Coenen      2020-05-13  1051  	}
3448914e8cc550 Martijn Coenen      2020-05-13  1052  
3448914e8cc550 Martijn Coenen      2020-05-13  1053  	if (config->block_size) {
af3c570fb0df42 Xie Yongji          2021-10-26  1054  		error = blk_validate_block_size(config->block_size);
3448914e8cc550 Martijn Coenen      2020-05-13  1055  		if (error)
3448914e8cc550 Martijn Coenen      2020-05-13  1056  			goto out_unlock;
3448914e8cc550 Martijn Coenen      2020-05-13  1057  	}
3448914e8cc550 Martijn Coenen      2020-05-13  1058  
3448914e8cc550 Martijn Coenen      2020-05-13  1059  	error = loop_set_status_from_info(lo, &config->info);
3448914e8cc550 Martijn Coenen      2020-05-13  1060  	if (error)
3448914e8cc550 Martijn Coenen      2020-05-13  1061  		goto out_unlock;
3448914e8cc550 Martijn Coenen      2020-05-13  1062  
05bdb9965305bb Christoph Hellwig   2023-06-08  1063  	if (!(file->f_mode & FMODE_WRITE) || !(mode & BLK_OPEN_WRITE) ||
283e7e5d249f48 Al Viro             2015-04-03  1064  	    !file->f_op->write_iter)
3448914e8cc550 Martijn Coenen      2020-05-13  1065  		lo->lo_flags |= LO_FLAGS_READ_ONLY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1066  
d292dc80686aea Christoph Hellwig   2022-03-30  1067  	if (!lo->workqueue) {
87579e9b7d8dc3 Dan Schatzberg      2021-06-28  1068  		lo->workqueue = alloc_workqueue("loop%d",
87579e9b7d8dc3 Dan Schatzberg      2021-06-28  1069  						WQ_UNBOUND | WQ_FREEZABLE,
d292dc80686aea Christoph Hellwig   2022-03-30  1070  						0, lo->lo_number);
87579e9b7d8dc3 Dan Schatzberg      2021-06-28  1071  		if (!lo->workqueue) {
87579e9b7d8dc3 Dan Schatzberg      2021-06-28  1072  			error = -ENOMEM;
757ecf40b7e029 Jan Kara            2018-11-08  1073  			goto out_unlock;
87579e9b7d8dc3 Dan Schatzberg      2021-06-28  1074  		}
d292dc80686aea Christoph Hellwig   2022-03-30  1075  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1076  
bb430b69422640 Alyssa Ross         2023-03-20  1077  	/* suppress uevents while reconfiguring the device */
bb430b69422640 Alyssa Ross         2023-03-20  1078  	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 1);
bb430b69422640 Alyssa Ross         2023-03-20  1079  
ab6860f62bfe32 Christoph Hellwig   2023-08-11  1080  	disk_force_media_change(lo->lo_disk);
7a2f0ce19f2e2e Christoph Hellwig   2020-11-03  1081  	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1082  
3448914e8cc550 Martijn Coenen      2020-05-13  1083  	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1084  	lo->lo_device = bdev;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1085  	lo->lo_backing_file = file;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1086  	lo->old_gfp_mask = mapping_gfp_mask(mapping);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1087  	mapping_set_gfp_mask(mapping, lo->old_gfp_mask & ~(__GFP_IO|__GFP_FS));
^1da177e4c3f41 Linus Torvalds      2005-04-16  1088  
3448914e8cc550 Martijn Coenen      2020-05-13  1089  	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
21d0727f639e4b Jens Axboe          2016-03-30  1090  		blk_queue_write_cache(lo->lo_queue, true, false);
68db1961bbf4e1 Nikanth Karthikesan 2009-03-24  1091  
a17ece76bcfe7b Christoph Hellwig   2024-06-17  1092  	error = loop_reconfigure_limits(lo, config->block_size);
473516b361936c Christoph Hellwig   2024-02-13  1093  	if (WARN_ON_ONCE(error))
473516b361936c Christoph Hellwig   2024-02-13  1094  		goto out_unlock;
85560117d00f5d Martijn Coenen      2019-09-04  1095  
56a85fd8376ef3 Holger Hoffstätte   2019-02-12  1096  	loop_update_rotational(lo);
2e5ab5f379f96a Ming Lei            2015-08-17  1097  	loop_update_dio(lo);
ee86273062cbb3 Milan Broz          2010-08-23  1098  	loop_sysfs_init(lo);
79e5dc59e2974a Martijn Coenen      2020-08-25  1099  
79e5dc59e2974a Martijn Coenen      2020-08-25  1100  	size = get_loop_size(lo, file);
5795b6f5607f7e Martijn Coenen      2020-05-13  1101  	loop_set_size(lo, size);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1102  
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1103  	/* Order wrt reading lo_state in loop_validate_file(). */
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1104  	wmb();
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1105  
6c9979185c7ef4 Serge Hallyn        2006-09-29  1106  	lo->lo_state = Lo_bound;
e03c8dd14915fa Kay Sievers         2011-08-23  1107  	if (part_shift)
e03c8dd14915fa Kay Sievers         2011-08-23  1108  		lo->lo_flags |= LO_FLAGS_PARTSCAN;
85b0a54a82e4fb Jan Kara            2018-11-08  1109  	partscan = lo->lo_flags & LO_FLAGS_PARTSCAN;
fe6a8fc5ed2f00 Lennart Poettering  2020-08-10  1110  	if (partscan)
b9684a71fca793 Christoph Hellwig   2022-05-27  1111  		clear_bit(GD_SUPPRESS_PART_SCAN, &lo->lo_disk->state);
c1681bf8a7b1b9 Anatol Pomozov      2013-04-01  1112  
bb430b69422640 Alyssa Ross         2023-03-20  1113  	/* enable and uncork uevent now that we are done */
bb430b69422640 Alyssa Ross         2023-03-20  1114  	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
bb430b69422640 Alyssa Ross         2023-03-20  1115  
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1116  	loop_global_unlock(lo, is_loop);
85b0a54a82e4fb Jan Kara            2018-11-08  1117  	if (partscan)
0384264ea8a39b Christoph Hellwig   2021-06-24  1118  		loop_reread_partitions(lo);
bb430b69422640 Alyssa Ross         2023-03-20  1119  
05bdb9965305bb Christoph Hellwig   2023-06-08  1120  	if (!(mode & BLK_OPEN_EXCL))
37c3fc9abb25cd Christoph Hellwig   2020-11-25  1121  		bd_abort_claiming(bdev, loop_configure);
498ef5c777d9c8 Christoph Hellwig   2022-03-30  1122  
bb430b69422640 Alyssa Ross         2023-03-20  1123  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1124  
757ecf40b7e029 Jan Kara            2018-11-08  1125  out_unlock:
3ce6e1f662a910 Tetsuo Handa        2021-07-06  1126  	loop_global_unlock(lo, is_loop);
33ec3e53e7b186 Jan Kara            2019-05-16  1127  out_bdev:
05bdb9965305bb Christoph Hellwig   2023-06-08  1128  	if (!(mode & BLK_OPEN_EXCL))
37c3fc9abb25cd Christoph Hellwig   2020-11-25  1129  		bd_abort_claiming(bdev, loop_configure);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1130  out_putf:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1131  	fput(file);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1132  	/* This is safe: open() is still holding a reference. */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1133  	module_put(THIS_MODULE);
bb430b69422640 Alyssa Ross         2023-03-20  1134  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1135  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  1136  

:::::: The code at line 1009 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
