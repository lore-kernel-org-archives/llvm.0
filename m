Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4675225A9;
	Sun,  4 Feb 2024 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707060130; cv=none; b=AxMwbjTUEYqXsI75+YFCSJWkkF9cgVxOqHJL0Lj0pSkZLlZexXBhS8TQSGwRym9dhj8SbSx0nhxc5v2rWBIf4Zl7XGWRf9N6bGDxrxNMKe1B8Y159qPHK86Nqe9d7kg6RlJd45t/6Z8X7U+04DfuyGiCiDK/YzyjeurHmbW0eQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707060130; c=relaxed/simple;
	bh=LaCWHyrZbq6+UikebP2Xia97+FUKOYJNzrsUnpDTRPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgnZb/boiFDz/VYn33LGaOtxfQhEcT/DGHVzM5BpbsjJr/lZtMoSGUzJo5SGwDWbDzexN2nrUdULOdGz3//RkP3McI9gBdschkqpxp7jawT/NcrTLlV4otPyWserzekfZ56ogLYC+0Tk5LbEvKSxLoy41sji3K/m1voLSpEraD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klg5SGl4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klg5SGl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707060129; x=1738596129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaCWHyrZbq6+UikebP2Xia97+FUKOYJNzrsUnpDTRPo=;
  b=klg5SGl4hhn7z0BYjGmiymbKPjcyIVKGSy8a5P31sp5GBsbayx2u2CgR
   DWeCTFSr+AIcEW2TrYRRFteolxBqZOpfQuCvJcgEIWKKsenYZxUROV7Js
   9pxCML90h4X6JdbzPbBCLqMtACFy6Nzv4pVxG253GsuuheZvwLEpkoDa/
   ePRZria6bMW0Z4z+Sl29Ppn9bCI0aWr0f8PQPwfxMDBdMu8VLiYfuVyfk
   VDEywrylE+WOYCILAqBlCP9VOQGEvo6XAClsMm9DRTFaxAOpYnY9DEZ8c
   YArY2EC2weL2aCe0ctKHRTLaqQsKyd5AYSxdX5mMS8J3scq5PL+at6Ctk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="25848742"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="25848742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 07:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="514542"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Feb 2024 07:22:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWeJm-0006S0-2G;
	Sun, 04 Feb 2024 15:22:02 +0000
Date: Sun, 4 Feb 2024 23:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kdave-btrfs-devel:fix-6.7-device-scanning 1/1]
 fs/btrfs/super.c:2304:12: warning: stack frame size (4176) exceeds limit
 (2048) in 'btrfs_show_devname'
Message-ID: <202402042308.jwDbzauR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git fix-6.7-device-scanning
head:   c9a96c234f18aeb5d5760a8e90a20971ec75be41
commit: c9a96c234f18aeb5d5760a8e90a20971ec75be41 [1/1] btrfs: fix device name in /proc/self/mountinfo
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240204/202402042308.jwDbzauR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402042308.jwDbzauR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402042308.jwDbzauR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/super.c:2304:12: warning: stack frame size (4176) exceeds limit (2048) in 'btrfs_show_devname' [-Wframe-larger-than]
    2304 | static int btrfs_show_devname(struct seq_file *m, struct dentry *root)
         |            ^
   1 warning generated.


vim +/btrfs_show_devname +2304 fs/btrfs/super.c

9e7cc91a6d18a4 Wang Xiaoguang 2016-08-01  2303  
9c5085c147989d Josef Bacik    2012-06-05 @2304  static int btrfs_show_devname(struct seq_file *m, struct dentry *root)
9c5085c147989d Josef Bacik    2012-06-05  2305  {
9c5085c147989d Josef Bacik    2012-06-05  2306  	struct btrfs_fs_info *fs_info = btrfs_sb(root->d_sb);
c9a96c234f18ae David Sterba   2024-02-03  2307  	char real[4096] = { "/dev/" };
9c5085c147989d Josef Bacik    2012-06-05  2308  
88c14590cdd6f3 David Sterba   2018-03-16  2309  	/*
6605fd2f394bba Anand Jain     2021-08-24  2310  	 * There should be always a valid pointer in latest_dev, it may be stale
6605fd2f394bba Anand Jain     2021-08-24  2311  	 * for a short moment in case it's being deleted but still valid until
6605fd2f394bba Anand Jain     2021-08-24  2312  	 * the end of RCU grace period.
88c14590cdd6f3 David Sterba   2018-03-16  2313  	 */
88c14590cdd6f3 David Sterba   2018-03-16  2314  	rcu_read_lock();
c9a96c234f18ae David Sterba   2024-02-03  2315  	scnprintf(real + 5, sizeof(real) - 5, "%pg", fs_info->fs_devices->latest_dev->bdev);
c9a96c234f18ae David Sterba   2024-02-03  2316  	seq_puts(m, real);
88c14590cdd6f3 David Sterba   2018-03-16  2317  	rcu_read_unlock();
6605fd2f394bba Anand Jain     2021-08-24  2318  
9c5085c147989d Josef Bacik    2012-06-05  2319  	return 0;
9c5085c147989d Josef Bacik    2012-06-05  2320  }
9c5085c147989d Josef Bacik    2012-06-05  2321  

:::::: The code at line 2304 was first introduced by commit
:::::: 9c5085c147989d48dfe74194b48affc23f376650 Btrfs: implement ->show_devname

:::::: TO: Josef Bacik <josef@redhat.com>
:::::: CC: Chris Mason <chris.mason@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
