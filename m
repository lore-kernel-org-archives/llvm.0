Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EFC1F4275;
	Mon,  3 Feb 2025 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619313; cv=none; b=XbI1EetaHnQf52QadicRqdKTqzd9jYRbJhgoa2zxF7sbBdFkU38RbOBT9oqXFDHZELLX91gs7Z6paoMlsylz2Ol7OJTQJpxUDXLIXhUf/Mq2JsvZpF8GuEjgD4rsJVVd9OgqXlS+mpTKHMNJfwa3Q/ixsmTqPAo/7anE37Wb/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619313; c=relaxed/simple;
	bh=2hu3O2MheQWk4o24L3SGL4IvG4fJtp7Dh0+EQC6FQwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pv+yj6TPKawOZ9T7II2rcx4SB+z0NRyAfjENU0tnLZ2cauLbDB2GpCe6QpqMm0ZBP1TVnXfSqIZMRB0bLQVLv9sUXmpj8oDLnN4aHFCZJGT4eaZLAPkbJpinPJAzkCjkAoLBNUvJH4G4YZ4ggyJFDpXnQVtrS19Y3kjSP0EeRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7WcfWhY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7WcfWhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738619310; x=1770155310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2hu3O2MheQWk4o24L3SGL4IvG4fJtp7Dh0+EQC6FQwk=;
  b=N7WcfWhY9XOgsOj3ZL/bh3MOddyRkaaExgs0HFhFKv8RaeVq47KT5rGO
   cXtgsyZHHDOURx1BUCZGfFWFBDvwaTNPspW4UWbcLabza4vmh2W+vfl7W
   P4qvJ/3aRRMa+dv5QmDEiZn8Y/CmyNJzTuuyLqORvXrwxGql5OM3bjmwI
   +RQ8wj7n5lWtQa6Y9IAkJCybGe3dnvZUqVDhwxQffvDOdYEcX0QghLMsT
   MKsQbejdG/pAfU/bqz0E0Cu+OZwLCg2vTLKAhQmKA37sU4PZs7JQWUO9V
   w4EfeyxNVXwkRWJzLYYHVH8eGRigC2SblmVFIsvRgVR5pNHbVdJINTCma
   Q==;
X-CSE-ConnectionGUID: OKQoJdEwQzeHLqv0jHz8uw==
X-CSE-MsgGUID: nn0zPGomSku0nPReO7kisQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39007398"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39007398"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 13:48:30 -0800
X-CSE-ConnectionGUID: QrG93zVzSYeqqejkku7Gkg==
X-CSE-MsgGUID: YHG1TpP8SjShulqp12zRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110953579"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 13:48:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf4Ir-000rYl-2I;
	Mon, 03 Feb 2025 21:48:25 +0000
Date: Tue, 4 Feb 2025 05:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 27/28] WARNING: modpost: "dev_err_probe"
 [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
Message-ID: <202502040536.x2CrfEnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   e64bf5ab040e65a8cb92f59d3f3fd7bdd9f0a907
commit: 1ea1bda3b623909c56961b38efe15aedf571b863 [27/28] treewide: Annotate all struct mutex users
config: s390-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040536.x2CrfEnp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040536.x2CrfEnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040536.x2CrfEnp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "kernel_param_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "kernel_param_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "sched_setattr_nocheck" [vmlinux] version generation failed, symbol will not be versioned.
Is "sched_setattr_nocheck" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_nested" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_nested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "_mutex_lock_nest_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "_mutex_lock_nest_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_io_nested" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_io_nested" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "generic_handle_irq" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_handle_irq" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "call_srcu" [vmlinux] version generation failed, symbol will not be versioned.
Is "call_srcu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "srcutorture_get_gp_data" [vmlinux] version generation failed, symbol will not be versioned.
Is "srcutorture_get_gp_data" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "synchronize_rcu_expedited" [vmlinux] version generation failed, symbol will not be versioned.
Is "synchronize_rcu_expedited" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "perf_allow_kernel" [vmlinux] version generation failed, symbol will not be versioned.
Is "perf_allow_kernel" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "torture_init_begin" [vmlinux] version generation failed, symbol will not be versioned.
Is "torture_init_begin" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "torture_init_end" [vmlinux] version generation failed, symbol will not be versioned.
Is "torture_init_end" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "torture_cleanup_begin" [vmlinux] version generation failed, symbol will not be versioned.
Is "torture_cleanup_begin" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pcpu_alloc_noprof" [vmlinux] version generation failed, symbol will not be versioned.
Is "pcpu_alloc_noprof" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "split_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "split_page" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "fs_reclaim_acquire" [vmlinux] version generation failed, symbol will not be versioned.
Is "fs_reclaim_acquire" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "is_free_buddy_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "is_free_buddy_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "begin_new_exec" [vmlinux] version generation failed, symbol will not be versioned.
Is "begin_new_exec" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "setup_new_exec" [vmlinux] version generation failed, symbol will not be versioned.
Is "setup_new_exec" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bprm_change_interp" [vmlinux] version generation failed, symbol will not be versioned.
Is "bprm_change_interp" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pipe_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pipe_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pipe_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pipe_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "lock_rename" [vmlinux] version generation failed, symbol will not be versioned.
Is "lock_rename" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "lock_rename_child" [vmlinux] version generation failed, symbol will not be versioned.
Is "lock_rename_child" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "unlock_rename" [vmlinux] version generation failed, symbol will not be versioned.
Is "unlock_rename" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vfs_create" [vmlinux] version generation failed, symbol will not be versioned.
Is "vfs_create" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "d_splice_alias" [vmlinux] version generation failed, symbol will not be versioned.
Is "d_splice_alias" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "is_subdir" [vmlinux] version generation failed, symbol will not be versioned.
Is "is_subdir" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "receive_fd" [vmlinux] version generation failed, symbol will not be versioned.
Is "receive_fd" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__mnt_is_readonly" [vmlinux] version generation failed, symbol will not be versioned.
Is "__mnt_is_readonly" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "kernfs_notify" [vmlinux] version generation failed, symbol will not be versioned.
Is "kernfs_notify" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "key_link" [vmlinux] version generation failed, symbol will not be versioned.
Is "key_link" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_freeze" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_freeze" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_thaw" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_thaw" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_mark_dead" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_mark_dead" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__do_once_sleepable_start" [vmlinux] version generation failed, symbol will not be versioned.
Is "__do_once_sleepable_start" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__do_once_sleepable_done" [vmlinux] version generation failed, symbol will not be versioned.
Is "__do_once_sleepable_done" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tty_init_termios" [vmlinux] version generation failed, symbol will not be versioned.
Is "tty_init_termios" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tty_buffer_lock_exclusive" [vmlinux] version generation failed, symbol will not be versioned.
Is "tty_buffer_lock_exclusive" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tty_buffer_unlock_exclusive" [vmlinux] version generation failed, symbol will not be versioned.
Is "tty_buffer_unlock_exclusive" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tty_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "tty_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tty_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "tty_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "iommufd_access_create" [vmlinux] version generation failed, symbol will not be versioned.
Is "iommufd_access_create" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_driver_string" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_driver_string" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_store_ulong" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_ulong" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_show_ulong" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_ulong" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_store_int" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_int" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_show_int" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_int" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_store_bool" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_bool" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_show_bool" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_bool" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_show_string" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_string" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dev_err_probe" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_err_probe" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bus_rescan_devices" [vmlinux] version generation failed, symbol will not be versioned.
Is "bus_rescan_devices" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_driver_attach" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_driver_attach" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "regmap_attach_dev" [vmlinux] version generation failed, symbol will not be versioned.
Is "regmap_attach_dev" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_pm_opp_get_opp_table_ref" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get_opp_table_ref" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_pm_opp_get" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "comedi_auto_config" [vmlinux] version generation failed, symbol will not be versioned.
Is "comedi_auto_config" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "devfreq_update_target" [vmlinux] version generation failed, symbol will not be versioned.
Is "devfreq_update_target" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "torture_init_begin" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "torture_init_end" [kernel/locking/locktorture.ko] has no CRC!
>> WARNING: modpost: "torture_cleanup_begin" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "ww_mutex_unlock" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "torture_init_begin" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "torture_init_end" [kernel/rcu/rcuscale.ko] has no CRC!
>> WARNING: modpost: "torture_cleanup_begin" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "call_srcu" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "synchronize_rcu_expedited" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [kernel/time/test_udelay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/time/test_udelay.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "bprm_change_interp" [fs/binfmt_misc.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/ext2/ext2.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/ext2/ext2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ext2/ext2.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/minix/minix.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "bdev_thaw" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "bdev_freeze" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/isofs/isofs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/hfsplus/hfsplus.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/hfsplus/hfsplus.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hfsplus/hfsplus.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "vfs_create" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ntfs3/ntfs3.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/ufs/ufs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/ufs/ufs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ufs/ufs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/jffs2/jffs2.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/jffs2/jffs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/jffs2/jffs2.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/affs/affs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/affs/affs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/affs/affs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/romfs/romfs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/qnx4/qnx4.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/qnx6/qnx6.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/adfs/adfs.ko] has no CRC!
WARNING: modpost: "is_subdir" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "__mnt_is_readonly" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "vfs_create" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/jfs/jfs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/befs/befs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "call_srcu" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "bdev_thaw" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "bdev_freeze" [fs/bcachefs/bcachefs.ko] has no CRC!
>> WARNING: modpost: "fs_reclaim_acquire" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "pcpu_alloc_noprof" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [fs/pstore/pstore.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/pstore/pstore.ko] has no CRC!
>> WARNING: modpost: "pcpu_alloc_noprof" [block/kyber-iosched.ko] has no CRC!
>> WARNING: modpost: "fs_reclaim_acquire" [lib/test_xarray.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/test_lockup.ko] has no CRC!
>> WARNING: modpost: "dev_err_probe" [drivers/irqchip/irq-lan966x-oic.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "dev_driver_string" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/bus/mhi/host/mhi.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/pinctrl/pinctrl-mcp23s08_i2c.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/pinctrl/pinctrl-mcp23s08.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-latch.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-latch.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-mockup.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/gpio/gpio-virtio.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpio/gpio-virtio.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class-flash.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class-flash.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/led-class-multicolor.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/led-class-multicolor.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-aw200xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-aw200xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-aw200xx.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-bd2606mvv.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-gpio.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lm3642.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lm3642.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lp3944.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lp3944.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-lp50xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-lp50xx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-lp50xx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca9532.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca9532.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-pca955x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca955x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca955x.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/leds-pca963x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/leds-pca963x.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/leds-pwm.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/flash/leds-lm3601x.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/flash/leds-lm3601x.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/leds/flash/leds-rt8515.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/leds/flash/leds-sgm3140.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/char/ipmi/ipmb_dev_int.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/char/ipmi/ipmb_dev_int.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/max6875.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/max6875.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/idt_89hpesx.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/eeprom/ee1004.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/misc/eeprom/ee1004.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/eeprom/ee1004.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/lis3lv02d/lis3lv02d.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/lis3lv02d/lis3lv02d.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/ics932s401.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/ics932s401.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/misc/isl29020.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/isl29020.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/dax/kmem.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/dax/kmem.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/sd_mod.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/scsi/sg.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/sg.ko] has no CRC!
WARNING: modpost: EXPORT symbol "nvme_passthru_start" [drivers/nvme/host/nvme-core.ko] version generation failed, symbol will not be versioned.
Is "nvme_passthru_start" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "nvme_passthru_end" [drivers/nvme/host/nvme-core.ko] version generation failed, symbol will not be versioned.
Is "nvme_passthru_end" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-core.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "dev_driver_string" [drivers/nvme/host/nvme-fc.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/nvme/target/nvme-loop.ko] has no CRC!
WARNING: modpost: "dev_driver_string" [drivers/nvme/target/nvmet-fc.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/media/rc/rc-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/media/rc/rc-core.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/power/supply/max17040_battery.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/power/supply/max1720x_battery.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/power/supply/gpio-charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq2415x_charger.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/power/supply/bq2415x_charger.ko] has no CRC!
WARNING: modpost: "dev_err_probe" [drivers/power/supply/bq24257_charger.ko] has no CRC!
WARNING: modpost: "mutex_lock_nested" [drivers/power/supply/bq24257_charger.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
