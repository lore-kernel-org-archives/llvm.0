Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDAF5235;
	Sat,  7 Oct 2023 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STaun2mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696717177; x=1728253177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9S8HXupC1ZRNLj9S9q//SzufSLYOr5JSRKmXg6fVXw=;
  b=STaun2mu9Ghus8i8DZ7QK/Ad+qlglQtIHvfi8c+aiSEUBH6NuAI/AwG9
   1JBFDSDM1XfrcH6jOTthTtbRgic8VGmBqaYEkqREWikbDeED/4XN7d39e
   cF9Cx/sXlx/4ItJ/SnpFFQhRWkwnQ1bOVrQXVkKKnK8/vKcBQ3euCs9El
   IBUKZ7mtI0HP44kzYvs4u6VUlM2CzvfnpxjYWW+0fUVrzt8FhhAPFJDCk
   2Lyf6qPVUqXvOKdXnIoVUMyQTdSRALuoQ1kER+9Bro/P3KaQADTUprM8A
   J78JiKif5fv/w3kgSBSiUge+ZEv0iU8im+fVQSvInC/uQe0Y4CKByZdiR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364249775"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="364249775"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 15:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="843279328"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="843279328"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2023 15:19:34 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpFe0-0004rN-1E;
	Sat, 07 Oct 2023 22:19:32 +0000
Date: Sun, 8 Oct 2023 06:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:for-next 158/166] fs/btrfs/volumes.c:600:25:
 error: no member named 'opened' in 'struct btrfs_fs_devices'
Message-ID: <202310080648.9BTBCYcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git for-next
head:   c4eefe171f3f284d0a18a9873367ee265af8b06a
commit: bfbdf5432d1ad4a2b695ef132b15f1037c449ffc [158/166] btrfs: split btrfs_fs_devices.opened
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231008/202310080648.9BTBCYcA-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310080648.9BTBCYcA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310080648.9BTBCYcA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/volumes.c:600:25: error: no member named 'opened' in 'struct btrfs_fs_devices'
                           if (devt_fs_devices->opened == 0) {
                               ~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +600 fs/btrfs/volumes.c

4fde46f0cc71c7 Anand Jain 2015-06-17  556  
744a019be43f2d Anand Jain 2023-09-28  557  static struct btrfs_fs_devices *find_fsid_by_device(
279620e5a0860b Anand Jain 2023-09-28  558  					struct btrfs_super_block *disk_super,
279620e5a0860b Anand Jain 2023-09-28  559  					dev_t devt, bool *same_fsid_diff_dev)
744a019be43f2d Anand Jain 2023-09-28  560  {
744a019be43f2d Anand Jain 2023-09-28  561  	struct btrfs_fs_devices *fsid_fs_devices;
279620e5a0860b Anand Jain 2023-09-28  562  	struct btrfs_fs_devices *devt_fs_devices;
744a019be43f2d Anand Jain 2023-09-28  563  	const bool has_metadata_uuid = (btrfs_super_incompat_flags(disk_super) &
744a019be43f2d Anand Jain 2023-09-28  564  					BTRFS_FEATURE_INCOMPAT_METADATA_UUID);
279620e5a0860b Anand Jain 2023-09-28  565  	bool found_by_devt = false;
744a019be43f2d Anand Jain 2023-09-28  566  
744a019be43f2d Anand Jain 2023-09-28  567  	/* Find the fs_device by the usual method, if found use it. */
744a019be43f2d Anand Jain 2023-09-28  568  	fsid_fs_devices = find_fsid(disk_super->fsid,
744a019be43f2d Anand Jain 2023-09-28  569  		    has_metadata_uuid ? disk_super->metadata_uuid : NULL);
744a019be43f2d Anand Jain 2023-09-28  570  
279620e5a0860b Anand Jain 2023-09-28  571  	/* The temp_fsid feature is supported only with single device filesystem. */
279620e5a0860b Anand Jain 2023-09-28  572  	if (btrfs_super_num_devices(disk_super) != 1)
744a019be43f2d Anand Jain 2023-09-28  573  		return fsid_fs_devices;
279620e5a0860b Anand Jain 2023-09-28  574  
49f31140758081 Anand Jain 2023-10-04  575  	/*
49f31140758081 Anand Jain 2023-10-04  576  	 * A seed device is an integral component of the sprout device, which
49f31140758081 Anand Jain 2023-10-04  577  	 * functions as a multi-device filesystem. So, temp-fsid feature is
49f31140758081 Anand Jain 2023-10-04  578  	 * not supported.
49f31140758081 Anand Jain 2023-10-04  579  	 */
49f31140758081 Anand Jain 2023-10-04  580  	if (btrfs_super_flags(disk_super) & BTRFS_SUPER_FLAG_SEEDING)
49f31140758081 Anand Jain 2023-10-04  581  		return fsid_fs_devices;
49f31140758081 Anand Jain 2023-10-04  582  
279620e5a0860b Anand Jain 2023-09-28  583  	/* Try to find a fs_devices by matching devt. */
279620e5a0860b Anand Jain 2023-09-28  584  	list_for_each_entry(devt_fs_devices, &fs_uuids, fs_list) {
279620e5a0860b Anand Jain 2023-09-28  585  		struct btrfs_device *device;
279620e5a0860b Anand Jain 2023-09-28  586  
279620e5a0860b Anand Jain 2023-09-28  587  		list_for_each_entry(device, &devt_fs_devices->devices, dev_list) {
279620e5a0860b Anand Jain 2023-09-28  588  			if (device->devt == devt) {
279620e5a0860b Anand Jain 2023-09-28  589  				found_by_devt = true;
279620e5a0860b Anand Jain 2023-09-28  590  				break;
279620e5a0860b Anand Jain 2023-09-28  591  			}
279620e5a0860b Anand Jain 2023-09-28  592  		}
279620e5a0860b Anand Jain 2023-09-28  593  		if (found_by_devt)
279620e5a0860b Anand Jain 2023-09-28  594  			break;
279620e5a0860b Anand Jain 2023-09-28  595  	}
279620e5a0860b Anand Jain 2023-09-28  596  
279620e5a0860b Anand Jain 2023-09-28  597  	if (found_by_devt) {
279620e5a0860b Anand Jain 2023-09-28  598  		/* Existing device. */
279620e5a0860b Anand Jain 2023-09-28  599  		if (fsid_fs_devices == NULL) {
279620e5a0860b Anand Jain 2023-09-28 @600  			if (devt_fs_devices->opened == 0) {
279620e5a0860b Anand Jain 2023-09-28  601  				/* Stale device. */
279620e5a0860b Anand Jain 2023-09-28  602  				return NULL;
279620e5a0860b Anand Jain 2023-09-28  603  			} else {
279620e5a0860b Anand Jain 2023-09-28  604  				/* temp_fsid is mounting a subvol. */
279620e5a0860b Anand Jain 2023-09-28  605  				return devt_fs_devices;
279620e5a0860b Anand Jain 2023-09-28  606  			}
279620e5a0860b Anand Jain 2023-09-28  607  		} else {
279620e5a0860b Anand Jain 2023-09-28  608  			/* Regular or temp_fsid device mounting a subvol. */
279620e5a0860b Anand Jain 2023-09-28  609  			return devt_fs_devices;
279620e5a0860b Anand Jain 2023-09-28  610  		}
279620e5a0860b Anand Jain 2023-09-28  611  	} else {
279620e5a0860b Anand Jain 2023-09-28  612  		/* New device. */
279620e5a0860b Anand Jain 2023-09-28  613  		if (fsid_fs_devices == NULL) {
279620e5a0860b Anand Jain 2023-09-28  614  			return NULL;
279620e5a0860b Anand Jain 2023-09-28  615  		} else {
279620e5a0860b Anand Jain 2023-09-28  616  			/* sb::fsid is already used create a new temp_fsid. */
279620e5a0860b Anand Jain 2023-09-28  617  			*same_fsid_diff_dev = true;
279620e5a0860b Anand Jain 2023-09-28  618  			return NULL;
279620e5a0860b Anand Jain 2023-09-28  619  		}
279620e5a0860b Anand Jain 2023-09-28  620  	}
279620e5a0860b Anand Jain 2023-09-28  621  
279620e5a0860b Anand Jain 2023-09-28  622  	/* Not reached. */
744a019be43f2d Anand Jain 2023-09-28  623  }
744a019be43f2d Anand Jain 2023-09-28  624  

:::::: The code at line 600 was first introduced by commit
:::::: 279620e5a0860b725da00bd32ef3b05001dec4b4 btrfs: support cloned-device mount capability

:::::: TO: Anand Jain <anand.jain@oracle.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
