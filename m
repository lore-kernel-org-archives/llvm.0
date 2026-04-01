Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE532D45B;
	Wed,  1 Apr 2026 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025401; cv=none; b=DzWooITxMWJ5+mnlhMYulBgMFocNmqafhn3oXo3ZEeQ5BdKYc46RNt5IAQCPka90WP1J4R+P73X/oALsSschke1TDQ8wZeeUpHZuXcTnb0WiNKZ+1tE/6ADyxWGWLEZP6dmGbi4jJitcPYHu4P0j1JSMssERUfPyo2UgeK7rrWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025401; c=relaxed/simple;
	bh=cfvbrRHeOnvTvIgkA8wTHBlFi/8s0wNbM3uCNRQDMl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gYaXef3TBK0n+Vl0QvKhPFMyZdVEjmcyTHBLDETR/2G8tv/RAT6aGV7K4Mry3AAiZDHHIH62RJQge6TLJQ6s9FAQKaXfGjbiNnhc8KAjFqhs7TBdL5BCoY3ENdl+zjrZAqfGfBUXXKIoKtt1wIAx8YmJY09ifk+HQJpLZ3DRHHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4oGMP6r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4oGMP6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025400; x=1806561400;
  h=date:from:to:cc:subject:message-id;
  bh=cfvbrRHeOnvTvIgkA8wTHBlFi/8s0wNbM3uCNRQDMl8=;
  b=d4oGMP6rD+0yRRVN8TQsZ/UNWBFufhwXgI4BAw7J/AsB9qeCC4xFVDxW
   gMigvZP46ops/9/iT2pmf2CDvtbbxDPiiG0RaXxe0JNwIXQi/sUb5DF68
   HbvoN2DEES5joJSY2ZvnD0fCsi2o0L/fAFAtpD3YYuDh4Zh8P+tdjqSvG
   08wQ90tOpqBsTm9E/C8VL7Sg/GzOgLuHy+V/NXxxd16wzh8A70avFAMzk
   6Mw+c+A4/aTiu2cWKy8CB8j2LyJ3UD6DwEUPY/mASG/jcSNIvtWpvf4yf
   wbfKre2Na+nPyYiAuZQ6RDfLPA0R3FI47hjTUdFZvD9nLHED40ULoOYea
   w==;
X-CSE-ConnectionGUID: qGlMCZKLRRKMO/hLxVjoKw==
X-CSE-MsgGUID: g7cPVY4fSNmGJe8PamwNmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87514016"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87514016"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:36:37 -0700
X-CSE-ConnectionGUID: q+IaMvyYRo67QPYKmBDbow==
X-CSE-MsgGUID: jN9eG/QVROGpbYQ3+s57WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249805327"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2026 23:36:35 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pBo-0000000002r-2Sc0;
	Wed, 01 Apr 2026 06:36:32 +0000
Date: Wed, 01 Apr 2026 14:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt 4/6] WARNING: modpost: EXPORT symbol
 "dma_map_phys" [vmlinux] version generation failed, symbol will not be
 versioned.
Message-ID: <202604011425.Zc0Fg8kj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   4ea34e6b6a719e744a10a08cbe8d0fdaa4682f9a
commit: 626ebfcc51b3666a71ed0415045bed9415b0164b [4/6] types: Add standard __ob_trap and __ob_wrap scalar types
config: loongarch-loongson64_defconfig (https://download.01.org/0day-ci/archive/20260401/202604011425.Zc0Fg8kj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011425.Zc0Fg8kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011425.Zc0Fg8kj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "dma_map_phys" [vmlinux] version generation failed, symbol will not be versioned.
Is "dma_map_phys" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dma_map_page_attrs" [vmlinux] version generation failed, symbol will not be versioned.
Is "dma_map_page_attrs" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dma_map_resource" [vmlinux] version generation failed, symbol will not be versioned.
Is "dma_map_resource" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_add_safe" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_add_safe" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "hrtimer_start_range_ns" [vmlinux] version generation failed, symbol will not be versioned.
Is "hrtimer_start_range_ns" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__hrtimer_get_remaining" [vmlinux] version generation failed, symbol will not be versioned.
Is "__hrtimer_get_remaining" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "hrtimer_cb_get_time" [vmlinux] version generation failed, symbol will not be versioned.
Is "hrtimer_cb_get_time" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_get" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_get_resolution_ns" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_resolution_ns" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_get_with_offset" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_with_offset" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_get_coarse_with_offset" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_coarse_with_offset" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_mono_to_any" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_mono_to_any" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "ktime_get_raw" [vmlinux] version generation failed, symbol will not be versioned.
Is "ktime_get_raw" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "random_get_entropy_fallback" [vmlinux] version generation failed, symbol will not be versioned.
Is "random_get_entropy_fallback" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "alarm_expires_remaining" [vmlinux] version generation failed, symbol will not be versioned.
Is "alarm_expires_remaining" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "add_swap_extent" [vmlinux] version generation failed, symbol will not be versioned.
Is "add_swap_extent" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "hmm_dma_map_pfn" [vmlinux] version generation failed, symbol will not be versioned.
Is "hmm_dma_map_pfn" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "hmm_dma_unmap_pfn" [vmlinux] version generation failed, symbol will not be versioned.
Is "hmm_dma_unmap_pfn" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "mark_buffer_dirty" [vmlinux] version generation failed, symbol will not be versioned.
Is "mark_buffer_dirty" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "generic_block_bmap" [vmlinux] version generation failed, symbol will not be versioned.
Is "generic_block_bmap" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "iomap_bmap" [vmlinux] version generation failed, symbol will not be versioned.
Is "iomap_bmap" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__blkdev_issue_discard" [vmlinux] version generation failed, symbol will not be versioned.
Is "__blkdev_issue_discard" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__blkdev_issue_zeroout" [vmlinux] version generation failed, symbol will not be versioned.
Is "__blkdev_issue_zeroout" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "blkg_rwstat_init" [vmlinux] version generation failed, symbol will not be versioned.
Is "blkg_rwstat_init" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xxh32" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh32" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xxh64" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh64" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xxh64_digest" [vmlinux] version generation failed, symbol will not be versioned.
Is "xxh64_digest" prototyped in <asm/asm-prototypes.h>?
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
>> WARNING: modpost: EXPORT symbol "drm_edid_match" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_edid_match" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_mode_legacy_fb_format" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_mode_legacy_fb_format" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_driver_legacy_fb_format" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_driver_legacy_fb_format" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_driver_color_mode_format" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_driver_color_mode_format" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_format_info_min_pitch" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_format_info_min_pitch" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_of_crtc_port_mask" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_of_crtc_port_mask" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "drm_of_find_possible_crtcs" [vmlinux] version generation failed, symbol will not be versioned.
Is "drm_of_find_possible_crtcs" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ttm_resource_manager_usage" [vmlinux] version generation failed, symbol will not be versioned.
Is "ttm_resource_manager_usage" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "xhci_msi_irq" [vmlinux] version generation failed, symbol will not be versioned.
Is "xhci_msi_irq" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "input_get_timestamp" [vmlinux] version generation failed, symbol will not be versioned.
Is "input_get_timestamp" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "rtc_tm_to_ktime" [vmlinux] version generation failed, symbol will not be versioned.
Is "rtc_tm_to_ktime" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "piix4_sb800_port_sel" [vmlinux] version generation failed, symbol will not be versioned.
Is "piix4_sb800_port_sel" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "ptp_convert_timestamp" [vmlinux] version generation failed, symbol will not be versioned.
Is "ptp_convert_timestamp" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dm_set_target_max_io_len" [vmlinux] version generation failed, symbol will not be versioned.
Is "dm_set_target_max_io_len" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "dm_table_get_size" [vmlinux] version generation failed, symbol will not be versioned.
Is "dm_table_get_size" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "snd_sgbuf_get_addr" [vmlinux] version generation failed, symbol will not be versioned.
Is "snd_sgbuf_get_addr" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__sock_recv_timestamp" [vmlinux] version generation failed, symbol will not be versioned.
Is "__sock_recv_timestamp" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "xp_raw_get_dma" [vmlinux] version generation failed, symbol will not be versioned.
Is "xp_raw_get_dma" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "ktime_get" [arch/loongarch/kvm/kvm.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [arch/loongarch/kvm/kvm.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/minix/minix.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/minix/minix.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/hfsplus/hfsplus.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/hfs/hfs.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/hfs/hfs.ko] has no CRC!
WARNING: modpost: "add_swap_extent" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "iomap_bmap" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/ufs/ufs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/ufs/ufs.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [fs/ubifs/ubifs.ko] has no CRC!
WARNING: modpost: EXPORT symbol "fuse_file_poll" [fs/fuse/fuse.ko] version generation failed, symbol will not be versioned.
Is "fuse_file_poll" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "fuse_file_poll" [fs/fuse/cuse.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "generic_block_bmap" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "ktime_mono_to_any" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "ktime_get_with_offset" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "ktime_get_with_offset" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mark_buffer_dirty" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "iomap_bmap" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "ktime_get_with_offset" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "ktime_get_coarse_with_offset" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "add_swap_extent" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_discard" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "LZ4_compress_HC" [fs/f2fs/f2fs.ko] has no CRC!
WARNING: modpost: "ktime_get" [fs/ceph/ceph.ko] has no CRC!
WARNING: modpost: "iomap_bmap" [fs/erofs/erofs.ko] has no CRC!
WARNING: modpost: "xxh32" [fs/erofs/erofs.ko] has no CRC!
WARNING: modpost: "LZ4_compress_HC" [crypto/lz4hc.ko] has no CRC!
WARNING: modpost: "ktime_get" [crypto/jitterentropy_rng.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [crypto/async_tx/async_memcpy.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [crypto/async_tx/async_xor.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [crypto/async_tx/async_pq.ko] has no CRC!
WARNING: modpost: EXPORT symbol "LZ4_compress_fast" [lib/lz4/lz4_compress.ko] version generation failed, symbol will not be versioned.
Is "LZ4_compress_fast" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "LZ4_compress_HC" [lib/lz4/lz4hc_compress.ko] version generation failed, symbol will not be versioned.
Is "LZ4_compress_HC" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "ktime_get" [drivers/char/ipmi/ipmi_si.ko] has no CRC!
WARNING: modpost: "virtqueue_get_desc_addr" [drivers/virtio/virtio_mmio.ko] has no CRC!
WARNING: modpost: "virtqueue_get_avail_addr" [drivers/virtio/virtio_mmio.ko] has no CRC!
WARNING: modpost: "virtqueue_get_used_addr" [drivers/virtio/virtio_mmio.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/gpu/drm/display/drm_display_helper.ko] has no CRC!
WARNING: modpost: "drm_edid_match" [drivers/gpu/drm/drm_panel_backlight_quirks.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/gpu/drm/scheduler/gpu-sched.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/gpu/drm/radeon/radeon.ko] has no CRC!
WARNING: modpost: "ttm_resource_manager_usage" [drivers/gpu/drm/radeon/radeon.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/gpu/drm/radeon/radeon.ko] has no CRC!
WARNING: modpost: "drm_mode_legacy_fb_format" [drivers/gpu/drm/radeon/radeon.ko] has no CRC!
WARNING: modpost: "ttm_resource_manager_usage" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "dma_map_resource" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "hrtimer_cb_get_time" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "ktime_get_with_offset" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "ktime_get_raw" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] has no CRC!
WARNING: modpost: "dma_map_resource" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "ktime_get_coarse_with_offset" [drivers/block/zram/zram.ko] has no CRC!
WARNING: modpost: "LZ4_compress_fast" [drivers/block/zram/zram.ko] has no CRC!
WARNING: modpost: "LZ4_compress_HC" [drivers/block/zram/zram.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/scsi/qla2xxx/qla2xxx.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/scsi/qla4xxx/qla4xxx.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/scsi/lpfc/lpfc.ko] has no CRC!
WARNING: modpost: "hrtimer_start_range_ns" [drivers/scsi/lpfc/lpfc.ko] has no CRC!
WARNING: modpost: "hrtimer_cb_get_time" [drivers/scsi/lpfc/lpfc.ko] has no CRC!
WARNING: modpost: "nvmet_fc_register_targetport" [drivers/scsi/lpfc/lpfc.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/nvme/host/nvme-rdma.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/nvme/host/nvme-fc.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_discard" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "__blkdev_issue_zeroout" [drivers/nvme/target/nvmet.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/nvme/target/nvmet-rdma.ko] has no CRC!
WARNING: modpost: EXPORT symbol "nvmet_fc_register_targetport" [drivers/nvme/target/nvmet-fc.ko] version generation failed, symbol will not be versioned.
Is "nvmet_fc_register_targetport" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "dma_map_page_attrs" [drivers/nvme/target/nvmet-fc.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/spi/spi-loongson-core.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/net/ethernet/chelsio/cxgb/cxgb.ko] has no CRC!
WARNING: modpost: "ktime_get" [drivers/net/ethernet/chelsio/cxgb/cxgb.ko] has no CRC!
WARNING: modpost: "dma_map_page_attrs" [drivers/net/ethernet/chelsio/cxgb3/cxgb3.ko] has no CRC!
WARNING: modpost: EXPORT symbol "cxgb4_map_skb" [drivers/net/ethernet/chelsio/cxgb4/cxgb4.ko] version generation failed, symbol will not be versioned.
Is "cxgb4_map_skb" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
