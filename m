Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2645A29D0D;
	Sun,  2 Feb 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738515679; cv=none; b=X6rxPYch04aAglLYspQHBwKzkSAozpBhrd/Dm8gX7dH/3D1ppD5MntK9/0Bprb62TW5eWAX+44tuGqhKDLLQNRdlGcyLfCv0tmSpNWPz3eWZLiMGoNWmXKLZTIrYPEOp4wE+XZb8Fkq+JTFQT3uMqJCq1LsZCFI53jbY0o+5qfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738515679; c=relaxed/simple;
	bh=J/oLaV2P8FkecYC8k9GOwakzMeUlA5hQSlpcPfvoIjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JveA/yOa0jbtCHsnUIGZVp6uBaBjb4NXDd5Bc1SU7qex3GXQzH/oxj5OiyJ7bvRqFOnjg7L1KjZA2V2oEaBYmtfPSS2J9pTbSfOrK+VCL1A0dvhlRa//YNVdWH77Hzti/jNgUW7mv6OSm9bOjqkPIrzv+x7gdHVPZgV0EYU5yHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fAFh0qSk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAFh0qSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738515678; x=1770051678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/oLaV2P8FkecYC8k9GOwakzMeUlA5hQSlpcPfvoIjI=;
  b=fAFh0qSkwjTBFukOUMs1rhdpnUfXrz2TM1OkmxEEYvX9X4tptEq/tPhJ
   wrYKfqHaOlTYH0pvv3vgHK+j1/XEVWWpz0lCcNiIjLBo035vQ5p7+pJL1
   Y2alQZuzqanPPenDWpbjPwtZS6LCXfDPEJxkOx90HdlUnnnIMt1/OgM6+
   iuRGazqE3rYxPHCaqp8dA3ubB0OUkLopV9zGs15AeyyZkGUXuflndnuIl
   z+v6SnIj/VrARRzXarnMCiFmQtHuMKwFJhekcMfFW07AA8make+pHoxqU
   qwldwCg8tgwUvAp7sdunUCqi10f2Xvr8z+H0Hu9RPWnupvpN4Ij9tntVv
   A==;
X-CSE-ConnectionGUID: q8dZIIOKRYiqNzVwtAf6Jw==
X-CSE-MsgGUID: tyD2JqiJQhGGYP7AhR37hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42769216"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="42769216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 09:01:15 -0800
X-CSE-ConnectionGUID: CLBpFGO4Trm9MUve+Evezw==
X-CSE-MsgGUID: JEpXKWFnRI2qRH4YO19s3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115078622"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Feb 2025 09:01:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tedLK-000pvL-2x;
	Sun, 02 Feb 2025 17:01:10 +0000
Date: Mon, 3 Feb 2025 01:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 7/28] WARNING: modpost:
 "__mnt_is_readonly" [fs/nfsd/nfsd.ko] has no CRC!
Message-ID: <202502030002.BO2WF8s1-lkp@intel.com>
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
commit: b62070be0ff6a179566a2603fba3d5b730d191b2 [7/28] include/linux/cleanup.h: Add thread-safety annotations
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250203/202502030002.BO2WF8s1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030002.BO2WF8s1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030002.BO2WF8s1-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: EXPORT symbol "atomic_dec_and_mutex_lock" [vmlinux] version generation failed, symbol will not be versioned.
Is "atomic_dec_and_mutex_lock" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__mnt_is_readonly" [vmlinux] version generation failed, symbol will not be versioned.
Is "__mnt_is_readonly" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/paes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/paes_s390.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [arch/s390/crypto/prng.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/prng.ko] has no CRC!
WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_lock" [kernel/torture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/torture.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fuse/cuse.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/cuse.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fuse/virtiofs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/configfs/configfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/configfs/configfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/dlm/dlm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/netfs/netfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cramfs/cramfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/squashfs/squashfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/squashfs/squashfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/fat.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/vfat.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/fat/msdos.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/exfat/exfat.ko] has no CRC!
WARNING: modpost: "atomic_dec_and_mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ecryptfs/ecryptfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfs/nfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfs/nfsv4.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "__mnt_is_readonly" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/lockd/lockd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/lockd/lockd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/smb/client/cifs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ntfs3/ntfs3.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/autofs/autofs4.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "__mnt_is_readonly" [fs/overlayfs/overlay.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/udf/udf.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/jfs/jfs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/nilfs2/nilfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/cachefiles/cachefiles.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/ocfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/ocfs2_stack_user.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/ocfs2/cluster/ocfs2_nodemanager.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "mutex_lock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [fs/bcachefs/bcachefs.ko] has no CRC!
WARNING: modpost: "mutex_lock" [crypto/crypto_user.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [crypto/crypto_user.ko] has no CRC!
WARNING: modpost: "mutex_lock" [lib/kunit/kunit.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [lib/kunit/kunit.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/kunit/kunit.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/math/prime_numbers.ko] has no CRC!
WARNING: modpost: "mutex_lock" [lib/math/prime_numbers.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_lock" [lib/test_lockup.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/virtio/virtio_balloon.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/virtio/virtio_balloon.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/virtio/virtio_balloon.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/virtio/virtio_mem.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/virtio/virtio_mem.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/char/hw_random/rng-core.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/char/hw_random/rng-core.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/char/hw_random/rng-core.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock_interruptible" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "ww_mutex_unlock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "ww_mutex_trylock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "atomic_dec_and_mutex_lock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpu/drm/drm.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock_interruptible" [drivers/gpu/drm/drm_shmem_helper.ko] has no CRC!
WARNING: modpost: "ww_mutex_unlock" [drivers/gpu/drm/drm_shmem_helper.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock" [drivers/gpu/drm/drm_shmem_helper.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpu/drm/drm_kms_helper.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/gpu/drm/drm_kms_helper.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpu/drm/drm_kms_helper.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock_interruptible" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "ww_mutex_unlock" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "ww_mutex_lock" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/gpu/drm/virtio/virtio-gpu.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/block/loop.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/block/loop.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [drivers/block/loop.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/block/nbd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/block/nbd.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/block/nbd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/block/drbd/drbd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/block/rbd.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/block/rbd.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/misc/enclosure.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/misc/enclosure.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/device_handler/scsi_dh_alua.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/device_handler/scsi_dh_alua.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/scsi_transport_spi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_spi.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/scsi_transport_iscsi.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_iscsi.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_sas.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/libsas/libsas.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_lock_interruptible" [drivers/scsi/scsi_transport_srp.ko] has no CRC!
WARNING: modpost: "mutex_lock" [drivers/scsi/libiscsi.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
