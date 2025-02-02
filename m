Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33951E495;
	Sun,  2 Feb 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738506419; cv=none; b=N7v8w45dbFEgifABBZpHzjDPHS9pmeln1ZB9/29BJ0x4MiWioF2cOrpK5O0AI5p7fEckX1TdHYyCdBDHljcO2zCCXI0QygtXDjQbszYAi7n8AlFdNJS8Ej3mHI+6g33ZtO2ObiMejb2e84GlhAr/8GwKgbLOC6btqr+euWAiqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738506419; c=relaxed/simple;
	bh=dwLs/Cl9YGLQTlQ7/2I0TXzF75oqcXzlJnnhF3N18Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfIK/hnswcRpixLvQg+to3Jv3RVRO7ODaEVDpq9t5rBLZ4+qZey4D/ImwicopyRO8awVQMnWaR7sqGnIla7wlQKiXbmWJdlhWhvWslr1JXy3EscBSuVM7yfTpwFGsXRAeQi4liWxDJg9e6aT02xjLNRSJb1JERYWALDukR0rHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoCdgkvY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoCdgkvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738506417; x=1770042417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwLs/Cl9YGLQTlQ7/2I0TXzF75oqcXzlJnnhF3N18Es=;
  b=YoCdgkvYnPhb0kqtJM+odiXh5LhY3DrWb+0Yb9GDLEsmvRTpzOXJiidI
   kYN7HHKetvRBXvzG1MYewEBjryKHBNcXJlqNU8XPgDmQgiXHotUTBqBDQ
   +uBktKxLK7A/7dlzd3xO4wPwaDZOYdT6xha0o463Wj0EnQERWofzDtWDA
   qEdVdppbllw8njhMGkJ/6WmQGuZMEE/lhQWAkPF1MTUi9PQMwfBXsl0o7
   TllvxRUXc5vahsBOaSh9l1M8/EikP5VTPJqFKAe21RxtlX0So4llOV1VJ
   quiyyX1fZmqEVpusLNCMhRulAmRlYKCVn/VnKzqhxzXKRa8KA9HH7D3uM
   w==;
X-CSE-ConnectionGUID: cQ23NzcXRIuQMmDdqaXr2g==
X-CSE-MsgGUID: uhR3GzNBT6KoueKkUwsfrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39166523"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="39166523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 06:26:56 -0800
X-CSE-ConnectionGUID: j6s6Yrn0QNO+mMsblh/xUA==
X-CSE-MsgGUID: YcQMNU70QRmleu82ETo9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="115065582"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2025 06:26:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teaw0-000pkl-0q;
	Sun, 02 Feb 2025 14:26:52 +0000
Date: Sun, 2 Feb 2025 22:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 6/28] WARNING: modpost: "mutex_trylock"
 [arch/s390/crypto/paes_s390.ko] has no CRC!
Message-ID: <202502022217.BEB10v2n-lkp@intel.com>
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
commit: 165738e93ed8ffda3d0ee4b2d958b89a23acd6d3 [6/28] linux/mutex.h: Annotate struct mutex and mutex functions
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250202/202502022217.BEB10v2n-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502022217.BEB10v2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502022217.BEB10v2n-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

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
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/des_s390.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/crypto/aes_s390.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/crypto/aes_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_trylock" [arch/s390/crypto/paes_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [arch/s390/crypto/paes_s390.ko] has no CRC!
>> WARNING: modpost: "mutex_lock_interruptible" [arch/s390/crypto/prng.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [arch/s390/crypto/prng.ko] has no CRC!
WARNING: modpost: "mutex_lock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock_killable" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [arch/s390/kvm/kvm.ko] has no CRC!
WARNING: modpost: "mutex_lock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_trylock" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "mutex_lock" [kernel/torture.ko] has no CRC!
WARNING: modpost: "mutex_unlock" [kernel/torture.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/fuse/cuse.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/fuse/cuse.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/fuse/virtiofs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/fuse/virtiofs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/configfs/configfs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/configfs/configfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "mutex_trylock" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/netfs/netfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/cramfs/cramfs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/cramfs/cramfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: "mutex_unlock" [fs/squashfs/squashfs.ko] has no CRC!
>> WARNING: modpost: "mutex_lock" [fs/fat/fat.ko] has no CRC!
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
