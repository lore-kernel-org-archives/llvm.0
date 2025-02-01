Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D62F5E;
	Sat,  1 Feb 2025 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738437172; cv=none; b=h6e/GrzSYbC3wJG7k6eiF7z5Lyyu/SxxYvdi8fARtgX7Buo0og1T3dzUswzibUSRJU5iaeRKSULtbWYtuwB8rTXWmoUnm8IQ3zev4XZTB2yQ8YTxQz8+/g6cqIDhkK3guSllIsZe/ayKM68HnvHuzKRU6UrMpxgZRX6oZRjqR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738437172; c=relaxed/simple;
	bh=wnIqNCIpm2UjWIRAhDTq5EbKNSKyN/JmTR9466QJiAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hywl5m2uUWJcUBZpNSMKfJ32BDUA5BGj+Z2n0tmWLUOH877/WrMMq+0jW6/Mt4SxtOoq4Dek8FhXijOWAKd4tOlF69vw50ryYOjWqJr/lYYKAlfjtTUdB4/yerIqAh+wHAN40Ejo+WKJxvakRGUqfZFk6N9Znz4sCBZ7cfE6Gvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idD88nua; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idD88nua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738437170; x=1769973170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnIqNCIpm2UjWIRAhDTq5EbKNSKyN/JmTR9466QJiAo=;
  b=idD88nuaVUziAehR2OPQ9Xwg9wtCgkIHGzJcWCjMb4qptu0Bcwmi/3Ws
   +DBVafXcajzd9M4c0LknMEFEkd1GG/NJAiga4KRewrREGWKHe6v+yGeHE
   FgpBaY5ekrK6HirJgfJ2suUoK/VWOm51nGdSG5A+TO0seICNnd6wGIuxH
   QQ/m7nWqNlI+3SLrMBPw4aMwagx6+9NRSkR2ZgOJz3+BdxcsWZBlSltlR
   DrXhzsA0mabr2rrRVKGuru0v7UBELzcMbRGcJIfSw+LaqoivC719dpjFV
   hBt746kbGIZ67jNMcuGwGxZzNSmMtPcFK8txPFqnGb3/4PvR62fqW2wzO
   Q==;
X-CSE-ConnectionGUID: gwm84VrQRw+88Gj1itx+Iw==
X-CSE-MsgGUID: 0Tv+s15iT/6MAACD73UvIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="39138130"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="39138130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 11:12:49 -0800
X-CSE-ConnectionGUID: m34j58XdRzGces0OVwyj1A==
X-CSE-MsgGUID: 44lgg8u2S/a2UCoyUlV7iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="109691097"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2025 11:12:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teIv7-000oV5-2X;
	Sat, 01 Feb 2025 19:12:45 +0000
Date: Sun, 2 Feb 2025 03:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 27/28] WARNING: modpost: EXPORT symbol
 "bdev_freeze" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202502020336.aG3gxsCZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux thread-safety
head:   edb8f58988e23eb5e665bf55625f2461a878483b
commit: 764be7505819829512a767795ea7063f2fd2e132 [27/28] treewide: Annotate all struct mutex users
config: s390-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020336.aG3gxsCZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020336.aG3gxsCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020336.aG3gxsCZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "kernel_param_lock" [vmlinux] version generation failed, symbol will not be versioned.
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
>> WARNING: modpost: EXPORT symbol "console_list_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "console_list_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "console_list_unlock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "generic_handle_irq" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_handle_irq" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "call_srcu" [vmlinux] version generation failed, symbol will not be versioned.
Is "call_srcu" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "srcutorture_get_gp_data" [vmlinux] version generation failed, symbol will not be versioned.
Is "srcutorture_get_gp_data" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "synchronize_rcu_expedited" [vmlinux] version generation failed, symbol will not be versioned.
Is "synchronize_rcu_expedited" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "pcpu_alloc_noprof" [vmlinux] version generation failed, symbol will not be versioned.
Is "pcpu_alloc_noprof" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "split_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "split_page" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "is_free_buddy_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "is_free_buddy_page" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "begin_new_exec" [vmlinux] version generation failed, symbol will not be versioned.
Is "begin_new_exec" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "setup_new_exec" [vmlinux] version generation failed, symbol will not be versioned.
Is "setup_new_exec" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "bprm_change_interp" [vmlinux] version generation failed, symbol will not be versioned.
Is "bprm_change_interp" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "pipe_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pipe_lock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "pipe_unlock" [vmlinux] version generation failed, symbol will not be versioned.
Is "pipe_unlock" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "lock_rename" [vmlinux] version generation failed, symbol will not be versioned.
Is "lock_rename" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "lock_rename_child" [vmlinux] version generation failed, symbol will not be versioned.
Is "lock_rename_child" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "unlock_rename" [vmlinux] version generation failed, symbol will not be versioned.
Is "unlock_rename" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "d_splice_alias" [vmlinux] version generation failed, symbol will not be versioned.
Is "d_splice_alias" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "receive_fd" [vmlinux] version generation failed, symbol will not be versioned.
Is "receive_fd" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__mnt_is_readonly" [vmlinux] version generation failed, symbol will not be versioned.
Is "__mnt_is_readonly" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "kernfs_notify" [vmlinux] version generation failed, symbol will not be versioned.
Is "kernfs_notify" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "netfs_writeback_single" [vmlinux] version generation failed, symbol will not be versioned.
Is "netfs_writeback_single" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "blkg_conf_prep" [vmlinux] version generation failed, symbol will not be versioned.
Is "blkg_conf_prep" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "blkg_conf_exit" [vmlinux] version generation failed, symbol will not be versioned.
Is "blkg_conf_exit" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "dev_vprintk_emit" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_vprintk_emit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bus_rescan_devices" [vmlinux] version generation failed, symbol will not be versioned.
Is "bus_rescan_devices" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "device_driver_attach" [vmlinux] version generation failed, symbol will not be versioned.
Is "device_driver_attach" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "regmap_attach_dev" [vmlinux] version generation failed, symbol will not be versioned.
Is "regmap_attach_dev" prototyped in <asm/asm-prototypes.h>?
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
WARNING: modpost: EXPORT symbol "dev_pm_opp_get_opp_table_ref" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get_opp_table_ref" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dev_pm_opp_get" [vmlinux] version generation failed, symbol will not be versioned.
Is "dev_pm_opp_get" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "of_changeset_apply" [vmlinux] version generation failed, symbol will not be versioned.
Is "of_changeset_apply" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "of_changeset_revert" [vmlinux] version generation failed, symbol will not be versioned.
Is "of_changeset_revert" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "comedi_auto_config" [vmlinux] version generation failed, symbol will not be versioned.
Is "comedi_auto_config" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "devfreq_update_target" [vmlinux] version generation failed, symbol will not be versioned.
Is "devfreq_update_target" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: EXPORT symbol "kvm_set_internal_memslot" [arch/s390/kvm/kvm.ko] version generation failed, symbol will not be versioned.
Is "kvm_set_internal_memslot" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/minix/minix.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "lock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "unlock_rename" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/freevxfs/freevxfs.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "d_splice_alias" [fs/overlayfs/overlay.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
