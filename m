Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27A4A04;
	Sun,  2 Feb 2025 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738538517; cv=none; b=B0Fyvn2iMMwKWC4j+IYBym97/sB/qeXlOPBv2ZOD0fvrb1vQ86IZk92zf7quVCZqXC8miOy2IqKnXW1YuwqTwyqjcz63wtxxIQytlqGn3aRptfdJcKualDGto2hy3qxhDUTu5md6lXF7/MqJqnLIYG1PbuT9sCWRryjFpb2Q/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738538517; c=relaxed/simple;
	bh=694RFz1/VA0sdL07oF0/KKHf/9dCH3I9qjwGa8GQKrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYEAtgCshZhapTmBd0cbO1asbh4XWyIWduReEdpLAt1f9CxsV7+IhFwyZYGJZyHzRTBUgvXfkTtUq1g3F3xTKyNIR8NSHW8v6WIuvm+a88o09uCIKyxcTIWnkgx/HaLm+nXZ6F1gu5NHTBRrkOAB+sP0MT3xPQGVTyhr/c7urLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUddUjPa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUddUjPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738538515; x=1770074515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=694RFz1/VA0sdL07oF0/KKHf/9dCH3I9qjwGa8GQKrw=;
  b=LUddUjPazQIsgAAUzUoHL+y7VnXGpn/GT9t+6IOYPi9B1nob+6yr64f0
   kGzYGhO4yUMHEmIlGP/ny3MWNAYqTkIb8Q28IxTHeFvrfODaI1DtYmjFX
   /HnBRwllRr+M2Cfwf7u7C0NT0B3l2jA0Fcz0QFsfX3Y6vuiA5jXpBnIVc
   Ck0MFsqIT7CWx0+HkzvP4OCQ5jH43054ikoo/90cX/BeIQdvkckJfK1xs
   OJpJT1NgvFcXzZS5BRHMzRBVokM+w1sAtOH1WEVPMEkBzkKHuP6iS343b
   s8oaVm+ms6YwDKy+DzWHy2s15cb0+XVI9W2zKj1IsXMMPSJyIfF0qPVBE
   A==;
X-CSE-ConnectionGUID: /KWXw31pTiSBY3qeWuR2OQ==
X-CSE-MsgGUID: VB3SC45CShKPu1Al5faHGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38233323"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="38233323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 15:21:54 -0800
X-CSE-ConnectionGUID: FwO0+ZiARPqMzPbqcX2IoA==
X-CSE-MsgGUID: 0VBUPvvERQ2RIGT6obcwnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114160547"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2025 15:21:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tejHi-000qEx-1N;
	Sun, 02 Feb 2025 23:21:50 +0000
Date: Mon, 3 Feb 2025 07:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 27/28] WARNING: modpost: EXPORT symbol
 "dm_internal_suspend_fast" [vmlinux] version generation failed, symbol will
 not be versioned.
Message-ID: <202502030702.xwLrhLOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   1fb61c841ca602318a356ae71432c2b8afbf7224
commit: 9982aac0189f15803125d3bcca57e5347586d442 [27/28] treewide: Annotate all struct mutex users
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250203/202502030702.xwLrhLOu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030702.xwLrhLOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030702.xwLrhLOu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "kernel_param_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "kernel_param_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "sched_setattr_nocheck" [vmlinux] version generation failed, symbol will not be versioned.
Is "sched_setattr_nocheck" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_lock_killable" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_lock_killable" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mutex_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mutex_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ww_mutex_lock_interruptible" [vmlinux] version generation failed, symbol will not be versioned.
Is "ww_mutex_lock_interruptible" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "generic_handle_irq" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_handle_irq" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "msi_lock_descs" [vmlinux] version generation failed, symbol will not be versioned.
Is "msi_lock_descs" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "msi_unlock_descs" [vmlinux] version generation failed, symbol will not be versioned.
Is "msi_unlock_descs" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "call_srcu" [vmlinux] version generation failed, symbol will not be versioned.
Is "call_srcu" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "srcutorture_get_gp_data" [vmlinux] version generation failed, symbol will not be versioned.
Is "srcutorture_get_gp_data" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "synchronize_rcu_expedited" [vmlinux] version generation failed, symbol will not be versioned.
Is "synchronize_rcu_expedited" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "__register_bpf_struct_ops" [vmlinux] version generation failed, symbol will not be versioned.
Is "__register_bpf_struct_ops" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "perf_allow_kernel" [vmlinux] version generation failed, symbol will not be versioned.
Is "perf_allow_kernel" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pcpu_alloc_noprof" [vmlinux] version generation failed, symbol will not be versioned.
Is "pcpu_alloc_noprof" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "split_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "split_page" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "jbd2_journal_update_sb_errno" [vmlinux] version generation failed, symbol will not be versioned.
Is "jbd2_journal_update_sb_errno" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "jbd2_journal_clear_features" [vmlinux] version generation failed, symbol will not be versioned.
Is "jbd2_journal_clear_features" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "key_link" [vmlinux] version generation failed, symbol will not be versioned.
Is "key_link" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ima_file_hash" [vmlinux] version generation failed, symbol will not be versioned.
Is "ima_file_hash" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_freeze" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_freeze" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_thaw" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_thaw" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bdev_mark_dead" [vmlinux] version generation failed, symbol will not be versioned.
Is "bdev_mark_dead" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "blkg_conf_prep" [vmlinux] version generation failed, symbol will not be versioned.
Is "blkg_conf_prep" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "blkg_conf_exit" [vmlinux] version generation failed, symbol will not be versioned.
Is "blkg_conf_exit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__do_once_sleepable_start" [vmlinux] version generation failed, symbol will not be versioned.
Is "__do_once_sleepable_start" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__do_once_sleepable_done" [vmlinux] version generation failed, symbol will not be versioned.
Is "__do_once_sleepable_done" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_lock_rescan_remove" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_lock_rescan_remove" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_unlock_rescan_remove" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_unlock_rescan_remove" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_dev_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_dev_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_dev_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_dev_trylock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_dev_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_dev_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_reset_function" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_reset_function" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "pci_probe_reset_slot" [vmlinux] version generation failed, symbol will not be versioned.
Is "pci_probe_reset_slot" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "tpm_chip_alloc" [vmlinux] version generation failed, symbol will not be versioned.
Is "tpm_chip_alloc" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tpm_is_tpm2" [vmlinux] version generation failed, symbol will not be versioned.
Is "tpm_is_tpm2" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tpm_pcr_read" [vmlinux] version generation failed, symbol will not be versioned.
Is "tpm_pcr_read" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tpm_pcr_extend" [vmlinux] version generation failed, symbol will not be versioned.
Is "tpm_pcr_extend" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tpm_get_random" [vmlinux] version generation failed, symbol will not be versioned.
Is "tpm_get_random" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "dev_vprintk_emit" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_vprintk_emit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bus_rescan_devices" [vmlinux] version generation failed, symbol will not be versioned.
Is "bus_rescan_devices" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_driver_attach" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_driver_attach" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mddev_suspend" [vmlinux] version generation failed, symbol will not be versioned.
Is "mddev_suspend" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_idle_sync_thread" [vmlinux] version generation failed, symbol will not be versioned.
Is "md_idle_sync_thread" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_frozen_sync_thread" [vmlinux] version generation failed, symbol will not be versioned.
Is "md_frozen_sync_thread" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_unfrozen_sync_thread" [vmlinux] version generation failed, symbol will not be versioned.
Is "md_unfrozen_sync_thread" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_set_array_sectors" [vmlinux] version generation failed, symbol will not be versioned.
Is "md_set_array_sectors" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dm_get_md" [vmlinux] version generation failed, symbol will not be versioned.
Is "dm_get_md" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dm_internal_suspend_fast" [vmlinux] version generation failed, symbol will not be versioned.
Is "dm_internal_suspend_fast" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dm_internal_resume_fast" [vmlinux] version generation failed, symbol will not be versioned.
Is "dm_internal_resume_fast" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__dev_get_by_name" [vmlinux] version generation failed, symbol will not be versioned.
Is "__dev_get_by_name" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__napi_schedule" [vmlinux] version generation failed, symbol will not be versioned.
Is "__napi_schedule" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "napi_schedule_prep" [vmlinux] version generation failed, symbol will not be versioned.
Is "napi_schedule_prep" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rtnl_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "rtnl_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rtnl_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "rtnl_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "refcount_dec_and_rtnl_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "refcount_dec_and_rtnl_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "tcf_idr_release" [vmlinux] version generation failed, symbol will not be versioned.
Is "tcf_idr_release" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "tcf_generic_walker" [vmlinux] version generation failed, symbol will not be versioned.
Is "tcf_generic_walker" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__netlink_dump_start" [vmlinux] version generation failed, symbol will not be versioned.
Is "__netlink_dump_start" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "genl_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "genl_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "genl_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "genl_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ethtool_sprintf" [vmlinux] version generation failed, symbol will not be versioned.
Is "ethtool_sprintf" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "devl_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "devl_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "devl_trylock" [vmlinux] version generation failed, symbol will not be versioned.
Is "devl_trylock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "devl_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "devl_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/paes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/paes_s390.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [arch/s390/crypto/prng.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/prng.ko] has no CRC!
WARNING: modpost: EXPORT symbol "kvm_set_internal_memslot" [arch/s390/kvm/kvm.ko] version generation failed, symbol will not be versioned.
Is "kvm_set_internal_memslot" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "torture_init_begin" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_lock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "torture_init_end" [kernel/rcu/rcutorture.ko] has no CRC!
>> WARNING: modpost: "torture_cleanup_begin" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "call_srcu" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "srcutorture_get_gp_data" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "synchronize_rcu_expedited" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "torture_init_begin" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "torture_init_end" [kernel/rcu/refscale.ko] has no CRC!
>> WARNING: modpost: "torture_cleanup_begin" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: EXPORT symbol "torture_init_begin" [kernel/torture.ko] version generation failed, symbol will not be versioned.
Is "torture_init_begin" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "torture_init_end" [kernel/torture.ko] version generation failed, symbol will not be versioned.
Is "torture_init_end" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "torture_cleanup_begin" [kernel/torture.ko] version generation failed, symbol will not be versioned.
Is "torture_cleanup_begin" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock" [kernel/torture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/torture.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fuse/cuse.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/cuse.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "bprm_change_interp" [fs/binfmt_misc.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/configfs/configfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/configfs/configfs.ko] has no CRC!
>> WARNING: modpost: "call_srcu" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: EXPORT symbol "netfs_writeback_single" [fs/netfs/netfs.ko] version generation failed, symbol will not be versioned.
Is "netfs_writeback_single" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cramfs/cramfs.ko] has no CRC!
>> WARNING: modpost: "d_splice_alias" [fs/squashfs/squashfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: "pcpu_alloc_noprof" [fs/squashfs/squashfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: EXPORT symbol "fat_free_clusters" [fs/fat/fat.ko] version generation failed, symbol will not be versioned.
Is "fat_free_clusters" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "fat_build_inode" [fs/fat/fat.ko] version generation failed, symbol will not be versioned.
Is "fat_build_inode" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/fat.ko] has no CRC!
>> WARNING: modpost: "fat_free_clusters" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "fat_build_inode" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "fat_free_clusters" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "fat_build_inode" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "bdev_thaw" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "bdev_freeze" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "vfs_create" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "pcpu_alloc_noprof" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "rpc_put_sb_net" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rpc_get_sb_net" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "__mnt_is_readonly" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "vfs_create" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/lockd/lockd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/lockd/lockd.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/romfs/romfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "is_subdir" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "__mnt_is_readonly" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "vfs_create" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "jbd2_journal_clear_features" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "is_subdir" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "pcpu_alloc_noprof" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "call_srcu" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "bdev_thaw" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "bdev_freeze" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "pcpu_alloc_noprof" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [crypto/crypto_user.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [crypto/crypto_user.ko] has no CRC!
WARNING: modpost: "__netlink_dump_start" [crypto/crypto_user.ko] has no CRC!
WARNING: modpost: "pcpu_alloc_noprof" [crypto/cryptd.ko] has no CRC!
WARNING: modpost: EXPORT symbol "kunit_platform_device_prepare_wait_for_probe" [lib/kunit/kunit.ko] version generation failed, symbol will not be versioned.
Is "kunit_platform_device_prepare_wait_for_probe" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
