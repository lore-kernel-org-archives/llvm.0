Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227561F668C;
	Sun,  2 Feb 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738505101; cv=none; b=aXIKJmwANwZfJt3q/EPubfEFxlygF5qtlifjk83kFrH0y+WpN7+hDSYDwdU2eS9qjhWy994YW7R+APwTYmZkWMhg+9VmqoyQz/6dI77rYt+Vk43MvmwmQ9yxKrdgoisy9QhjCVidbFRFxTN6fyPNDJwf31u+nLwJsN3e+MLX/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738505101; c=relaxed/simple;
	bh=l4qDGbzYTJ9VvpGWyiwRWmLcHDEQp8NHgONJ1Pe8WP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDLCCotcCRIeop7l8nVWiSoMo4HOhwsSkQbK2NWwEVH5R0Yxv4grbXrZtNsHONZnMPLDHTTB0DI70BX/SsS0MVz7VfZQWygLmaLkPjp3n34v/AQjy2lPxeibjfxhPwuuGNqVaY8iJGzK7V9csHeYtnSr1P6cI2uwgd3vNauvEts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RznrVQvw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RznrVQvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738505098; x=1770041098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4qDGbzYTJ9VvpGWyiwRWmLcHDEQp8NHgONJ1Pe8WP4=;
  b=RznrVQvwvhgKLYOyToKaXCHyls4ENMSKN5QifB+RuONxMKRrZk+Bsa3B
   XU1V7m4HXk0MwdsuMOMIpR93oW+5w4T2AoNALc9Z//ESPKxLulca2ZGIi
   +E80t6FZi5EuF2JLYcMsoX4QTKtJ6r3jhV9mVLSEVnNK9YBQnwFQmfOoP
   6pgVHwQp6USV/8CHJfV0LGR+ZdKuPKYz+KvjtGDyjFShCG0aN/zKgnyBK
   nr/I0NGDmP64B+5T6DwpP3hoLK0Dred/7HQuQtHilHs/24H2kznCxttwC
   mz0UdlqROvn/zlrvaM0i8W4+A91V/oeeos90f5TLgKfJ6MsSPHPPRjy8z
   g==;
X-CSE-ConnectionGUID: w74tN0A1Tf6bpeb/hbf/0Q==
X-CSE-MsgGUID: JwU+C+bJR4W0NqsDTHu5cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38915378"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="38915378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 06:04:54 -0800
X-CSE-ConnectionGUID: Vq2i/j/yTnGILpXYPSJ61Q==
X-CSE-MsgGUID: /mYI6dhDTBeDzGIBqG22kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115207239"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2025 06:04:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teaag-000pjz-0L;
	Sun, 02 Feb 2025 14:04:50 +0000
Date: Sun, 2 Feb 2025 22:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 27/28] WARNING: modpost: EXPORT symbol
 "mc13xxx_lock" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202502022210.750Ls2c4-lkp@intel.com>
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
config: arm-imx_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20250202/202502022210.750Ls2c4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502022210.750Ls2c4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502022210.750Ls2c4-lkp@intel.com/

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
>> WARNING: modpost: EXPORT symbol "lock_system_sleep" [vmlinux] version generation failed, symbol will not be versioned.
Is "lock_system_sleep" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "unlock_system_sleep" [vmlinux] version generation failed, symbol will not be versioned.
Is "unlock_system_sleep" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "console_list_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "generic_handle_irq" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_handle_irq" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "probe_irq_on" [vmlinux] version generation failed, symbol will not be versioned.
Is "probe_irq_on" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "probe_irq_mask" [vmlinux] version generation failed, symbol will not be versioned.
Is "probe_irq_mask" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "probe_irq_off" [vmlinux] version generation failed, symbol will not be versioned.
Is "probe_irq_off" prototyped in <asm/asm-prototypes.h>?
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
>> WARNING: modpost: EXPORT symbol "vfs_create" [vmlinux] version generation failed, symbol will not be versioned.
Is "vfs_create" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "d_splice_alias" [vmlinux] version generation failed, symbol will not be versioned.
Is "d_splice_alias" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "is_subdir" [vmlinux] version generation failed, symbol will not be versioned.
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
WARNING: modpost: EXPORT symbol "fat_free_clusters" [vmlinux] version generation failed, symbol will not be versioned.
Is "fat_free_clusters" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "fat_build_inode" [vmlinux] version generation failed, symbol will not be versioned.
Is "fat_build_inode" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "__clk_get_name" [vmlinux] version generation failed, symbol will not be versioned.
Is "__clk_get_name" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "drm_master_internal_acquire" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_master_internal_acquire" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_master_internal_release" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_master_internal_release" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_crtc_create_scaling_filter_property" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_crtc_create_scaling_filter_property" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_dev_register" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_dev_register" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_open" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_open" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_release" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_release" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_read" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_read" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_poll" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_poll" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_gem_handle_create" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_gem_handle_create" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_gem_object_release" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_gem_object_release" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_modeset_lock_all" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_modeset_lock_all" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_modeset_unlock_all" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_modeset_unlock_all" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_plane_enable_fb_damage_clips" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_plane_enable_fb_damage_clips" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_gem_prime_fd_to_handle" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_gem_prime_fd_to_handle" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_client_modeset_dpms" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_client_modeset_dpms" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_atomic_helper_shutdown" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_atomic_helper_shutdown" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_atomic_helper_suspend" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_atomic_helper_suspend" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "drm_atomic_helper_resume" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_atomic_helper_resume" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_fb_helper_initial_config" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_fb_helper_initial_config" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_driver_string" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_driver_string" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_store_ulong" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_ulong" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_show_ulong" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_ulong" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_store_int" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_int" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_show_int" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_int" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_store_bool" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_store_bool" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_show_bool" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_bool" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "device_show_string" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_show_string" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_vprintk_emit" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_vprintk_emit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bus_rescan_devices" [vmlinux] version generation failed, symbol will not be versioned.
Is "bus_rescan_devices" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_driver_attach" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_driver_attach" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dpm_resume_start" [vmlinux] version generation failed, symbol will not be versioned.
Is "dpm_resume_start" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "pm_clk_add" [vmlinux] version generation failed, symbol will not be versioned.
Is "pm_clk_add" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "regmap_attach_dev" [vmlinux] version generation failed, symbol will not be versioned.
Is "regmap_attach_dev" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mc13xxx_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mc13xxx_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mc13xxx_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "mc13xxx_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_pio_need_iordy" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_pio_need_iordy" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_do_dev_read_id" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_do_dev_read_id" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_cable_40wire" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_cable_40wire" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_dev_set_feature" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_dev_set_feature" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_std_qc_defer" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_std_qc_defer" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_msleep" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_msleep" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_wait_register" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_wait_register" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ata_std_error_handler" [vmlinux] version generation failed, symbol will not be versioned.
Is "ata_std_error_handler" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_bus_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_bus_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_bus_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_bus_unlock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_write_then_read" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_write_then_read" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_mem_exec_op" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_mem_exec_op" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_mem_dirmap_read" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_mem_dirmap_read" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "spi_mem_dirmap_write" [vmlinux] version generation failed, symbol will not be versioned.
Is "spi_mem_dirmap_write" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_save_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_save_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_select_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_select_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_restore_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_restore_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_read_paged" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_read_paged" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_write_paged" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_write_paged" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_modify_paged_changed" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_modify_paged_changed" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_modify_paged" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_modify_paged" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "phy_package_leave" [vmlinux] version generation failed, symbol will not be versioned.
Is "phy_package_leave" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_disable_ltm" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_disable_ltm" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_root_hub_lost_power" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_root_hub_lost_power" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_hcd_pci_probe" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_hcd_pci_probe" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_stor_CB_transport" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_stor_CB_transport" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_stor_pre_reset" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_stor_pre_reset" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "usb_stor_post_reset" [vmlinux] version generation failed, symbol will not be versioned.
Is "usb_stor_post_reset" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ps2_begin_command" [vmlinux] version generation failed, symbol will not be versioned.
Is "ps2_begin_command" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ps2_end_command" [vmlinux] version generation failed, symbol will not be versioned.
Is "ps2_end_command" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "media_entity_pads_init" [vmlinux] version generation failed, symbol will not be versioned.
Is "media_entity_pads_init" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "media_graph_walk_init" [vmlinux] version generation failed, symbol will not be versioned.
Is "media_graph_walk_init" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "v4l2_m2m_fop_poll" [vmlinux] version generation failed, symbol will not be versioned.
Is "v4l2_m2m_fop_poll" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "video_ioctl2" [vmlinux] version generation failed, symbol will not be versioned.
Is "video_ioctl2" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "v4l2_event_dequeue" [vmlinux] version generation failed, symbol will not be versioned.
Is "v4l2_event_dequeue" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "cec_transmit_msg" [vmlinux] version generation failed, symbol will not be versioned.
Is "cec_transmit_msg" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "cec_s_phys_addr" [vmlinux] version generation failed, symbol will not be versioned.
Is "cec_s_phys_addr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "cec_s_log_addrs" [vmlinux] version generation failed, symbol will not be versioned.
Is "cec_s_log_addrs" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_wait_for_all_buffers" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_wait_for_all_buffers" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_thread_start" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_thread_start" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "_vb2_fop_release" [vmlinux] version generation failed, symbol will not be versioned.
Is "_vb2_fop_release" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_fop_write" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_fop_write" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_fop_read" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_fop_read" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_fop_poll" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_fop_poll" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_video_unregister_device" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_video_unregister_device" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_ops_wait_prepare" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_ops_wait_prepare" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "vb2_ops_wait_finish" [vmlinux] version generation failed, symbol will not be versioned.
Is "vb2_ops_wait_finish" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_pm_opp_get_opp_table_ref" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get_opp_table_ref" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_pm_opp_get" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "cpuidle_pause_and_lock" [vmlinux] version generation failed, symbol will not be versioned.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
