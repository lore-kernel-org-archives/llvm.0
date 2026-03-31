Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69B12E03EA;
	Tue, 31 Mar 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976474; cv=none; b=BDD1YyFUDe83YJkG1A1CaET944xLYXww6SReLHqW3rp7tmzyj9EQcPaK0tpeCMRdPcnIIztdAuvWRxMTQ54V3/LzkKre3QcAjnP1BLN69B6QNe58JfKbSZToO1vS2BsBbrI4KizK29apInkDE3ZXBEXSPpmmgObj0GyzbCPWT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976474; c=relaxed/simple;
	bh=SDuVUKfWm3pjWznCF9QKJCQeOSJ+rUJExNzJKeSmuZ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dWDdqYZzJwIRUdU36xoEwqVCtLRqY13LxAvk+CK5UYS1Bppn6HrvzU5oUswNkS9eNw/BXmhNovUQwliH4VbFpPPMTR1faLkdsQCNdnOM/wmXly8AczUvphAN66v5VroxK5wJmYW41TQpE0fL3NlF9UsPUE9k2H5kQRtwV4rwohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgjhZn9m; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgjhZn9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774976471; x=1806512471;
  h=date:from:to:cc:subject:message-id;
  bh=SDuVUKfWm3pjWznCF9QKJCQeOSJ+rUJExNzJKeSmuZ0=;
  b=WgjhZn9mZE2hYX2NtC3VgYDZwzYGtWqoyStsx11Hm1aAsgwJcfXz7Slf
   7i/a5IowRIpeQQAlCAUtY/bk7BBWJx6nwUvVCMhzuQMXtFjDkUiSpA1iu
   +T7mGERmS5LP0TLLqjDypfFpSy2ZVDb/qah3TzM4oXpx5RmeZ2eGbg9q1
   DqE6BoZiwuXgJcJxNN47OPvQnneNZ93r8lbzo9++3RBtd0Q6qbBcAS3Jw
   WrEVbVIeGPEptb/ElHHMEWS08PWjeXUOXziwsT7/JVfTPGN/P05V9bCoQ
   AhCzGHDTPHDJspC/MrTbsVRSruEnEaqYDpVo7+qYuBqAFRqAYMJJ0SA2K
   g==;
X-CSE-ConnectionGUID: dxjVALqeRB+NoN9pO4GqBg==
X-CSE-MsgGUID: Hf/qc8yuTCCk9rrWQ+jTGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="101451055"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="101451055"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:01:09 -0700
X-CSE-ConnectionGUID: vg2HsSDqRwyRNe/8hJh2gQ==
X-CSE-MsgGUID: KBDTuf1kSWiQcKf2isJsqw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 10:01:08 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7cSf-000000003NV-37hU;
	Tue, 31 Mar 2026 17:01:05 +0000
Date: Wed, 01 Apr 2026 01:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt 4/6] WARNING: modpost: EXPORT symbol
 "ktime_add_safe" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202604010041.doZul5JL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   e5a10c0ef1457ad3c713a1bbe087da2b407d4722
commit: 626ebfcc51b3666a71ed0415045bed9415b0164b [4/6] types: Add standard __ob_trap and __ob_wrap scalar types
config: um-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010041.doZul5JL-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010041.doZul5JL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010041.doZul5JL-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "ktime_add_safe" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_add_safe" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "hrtimer_start_range_ns" [vmlinux] version generation failed, symbol will not be versioned.
Is "hrtimer_start_range_ns" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "__hrtimer_get_remaining" [vmlinux] version generation failed, symbol will not be versioned.
Is "__hrtimer_get_remaining" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "hrtimer_cb_get_time" [vmlinux] version generation failed, symbol will not be versioned.
Is "hrtimer_cb_get_time" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_get" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_get_resolution_ns" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_resolution_ns" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_get_with_offset" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_with_offset" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_get_coarse_with_offset" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_coarse_with_offset" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_mono_to_any" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_mono_to_any" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ktime_get_raw" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_raw" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "random_get_entropy_fallback" [vmlinux] version generation failed, symbol will not be versioned.
Is "random_get_entropy_fallback" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "alarm_expires_remaining" [vmlinux] version generation failed, symbol will not be versioned.
Is "alarm_expires_remaining" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "add_swap_extent" [vmlinux] version generation failed, symbol will not be versioned.
Is "add_swap_extent" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "mark_buffer_dirty" [vmlinux] version generation failed, symbol will not be versioned.
Is "mark_buffer_dirty" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "generic_block_bmap" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_block_bmap" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "iomap_bmap" [vmlinux] version generation failed, symbol will not be versioned.
Is "iomap_bmap" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "fuse_file_poll" [vmlinux] version generation failed, symbol will not be versioned.
Is "fuse_file_poll" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "__blkdev_issue_discard" [vmlinux] version generation failed, symbol will not be versioned.
Is "__blkdev_issue_discard" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "__blkdev_issue_zeroout" [vmlinux] version generation failed, symbol will not be versioned.
Is "__blkdev_issue_zeroout" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "xxh32" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh32" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xxh64" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh64" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xxh64_digest" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh64_digest" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "LZ4_compress_fast" [vmlinux] version generation failed, symbol will not be versioned.
Is "LZ4_compress_fast" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "LZ4_compress_HC" [vmlinux] version generation failed, symbol will not be versioned.
Is "LZ4_compress_HC" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "virtqueue_get_desc_addr" [vmlinux] version generation failed, symbol will not be versioned.
Is "virtqueue_get_desc_addr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "virtqueue_get_avail_addr" [vmlinux] version generation failed, symbol will not be versioned.
Is "virtqueue_get_avail_addr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "virtqueue_get_used_addr" [vmlinux] version generation failed, symbol will not be versioned.
Is "virtqueue_get_used_addr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "virtqueue_map_page_attrs" [vmlinux] version generation failed, symbol will not be versioned.
Is "virtqueue_map_page_attrs" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "virtqueue_map_single_attrs" [vmlinux] version generation failed, symbol will not be versioned.
Is "virtqueue_map_single_attrs" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "input_get_timestamp" [vmlinux] version generation failed, symbol will not be versioned.
Is "input_get_timestamp" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mark_buffer_dirty" [fs/ext4/ext4.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/ext4/ext4.ko] has no CRC!
WARNING: modpost: "iomap_bmap" [fs/ext4/ext4.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/jbd2/jbd2.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/jbd2/jbd2.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/bfs/bfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/bfs/bfs.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/hpfs/hpfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/qnx4/qnx4.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/qnx6/qnx6.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/adfs/adfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/adfs/adfs.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/omfs/omfs.ko] has no CRC!
WARNING: modpost: "iomap_bmap" [fs/xfs/xfs.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_discard" [fs/xfs/xfs.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/xfs/xfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/befs/befs.ko] has no CRC!
WARNING: modpost: "random_get_entropy_fallback" [crypto/jitterentropy_rng.ko] has no CRC!
WARNING: modpost: "ktime_get" [crypto/jitterentropy_rng.ko] has no CRC!
WARNING: modpost: "ktime_get" [crypto/xor.ko] has no CRC!
WARNING: modpost: "ktime_get" [lib/math/test_mul_u64_u64_div_u64.ko] has no CRC!
WARNING: modpost: EXPORT symbol "crc4" [lib/crc/crc4.ko] version generation failed, symbol will not be versioned.
Is "crc4" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "ktime_get" [lib/find_bit_benchmark.ko] has no CRC!
WARNING: modpost: "ktime_get" [lib/test_dhry.ko] has no CRC!
WARNING: modpost: "ktime_get" [lib/test_bitops.ko] has no CRC!
WARNING: modpost: "ktime_get" [lib/test_vmalloc.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/scsi/st.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_discard" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_zeroout" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "input_get_timestamp" [drivers/input/evdev.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/power/supply/cw2015_battery.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/power/supply/rt9756.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/power/supply/charger-manager.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/power/supply/bq25890_charger.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/watchdog/watchdog.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [drivers/watchdog/watchdog.ko] has no CRC!
WARNING: modpost: "md_check_recovery" [drivers/md/raid10.ko] has no CRC!
WARNING: modpost: EXPORT symbol "raid5_set_cache_size" [drivers/md/raid456.ko] version generation failed, symbol will not be versioned.
Is "raid5_set_cache_size" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "md_check_recovery" [drivers/md/raid456.ko] has no CRC!
WARNING: modpost: EXPORT symbol "md_rdev_clear" [drivers/md/md-mod.ko] version generation failed, symbol will not be versioned.
Is "md_rdev_clear" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_do_sync" [drivers/md/md-mod.ko] version generation failed, symbol will not be versioned.
Is "md_do_sync" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "md_check_recovery" [drivers/md/md-mod.ko] version generation failed, symbol will not be versioned.
Is "md_check_recovery" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "__blkdev_issue_discard" [drivers/md/md-mod.ko] has no CRC!
WARNING: modpost: EXPORT symbol "dm_set_target_max_io_len" [drivers/md/dm-mod.ko] version generation failed, symbol will not be versioned.
Is "dm_set_target_max_io_len" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_table_get_size" [drivers/md/dm-mod.ko] version generation failed, symbol will not be versioned.
Is "dm_table_get_size" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "ktime_get" [drivers/md/dm-mod.ko] has no CRC!
WARNING: modpost: EXPORT symbol "dm_bufio_get_device_size" [drivers/md/dm-bufio.ko] version generation failed, symbol will not be versioned.
Is "dm_bufio_get_device_size" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_bufio_get_block_number" [drivers/md/dm-bufio.ko] version generation failed, symbol will not be versioned.
Is "dm_bufio_get_block_number" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "dm_set_target_max_io_len" [drivers/md/dm-dust.ko] has no CRC!
WARNING: modpost: "dm_set_target_max_io_len" [drivers/md/dm-switch.ko] has no CRC!
WARNING: modpost: "dm_set_target_max_io_len" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: "dm_table_get_size" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: "dm_bufio_get_device_size" [drivers/md/dm-snapshot.ko] has no CRC!
WARNING: modpost: EXPORT symbol "dm_array_walk" [drivers/md/persistent-data/dm-persistent-data.ko] version generation failed, symbol will not be versioned.
Is "dm_array_walk" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_block_location" [drivers/md/persistent-data/dm-persistent-data.ko] version generation failed, symbol will not be versioned.
Is "dm_block_location" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_bm_read_lock" [drivers/md/persistent-data/dm-persistent-data.ko] version generation failed, symbol will not be versioned.
Is "dm_bm_read_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_btree_empty" [drivers/md/persistent-data/dm-persistent-data.ko] version generation failed, symbol will not be versioned.
Is "dm_btree_empty" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "dm_btree_lookup" [drivers/md/persistent-data/dm-persistent-data.ko] version generation failed, symbol will not be versioned.
Is "dm_btree_lookup" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
