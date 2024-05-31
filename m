Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7473745D5;
	Fri, 31 May 2024 02:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717121665; cv=none; b=k4Pj6DJXsxkJvLwvqC/aDFCVJbgHoV7Lz6jFvxXPBQcwuq802lhOjBjTCLBnOeodbC64qLJ32av0cVFUGAnLsoYzMrak19su5n1ASURFgoEx3veQa2eaCvgR7YrKuxAgwlNGFScRbZGOWCAnatQV/vRE99tA3sYWdj7a/hfgnWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717121665; c=relaxed/simple;
	bh=eOHKQ8JxHfWVlQJItled/hhtg9RG1QB7ZNY++VrthUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SElRrfyHAfdpgmIYLrdyZxQ9U9lIQ31CX5mugdwx2mH+LFc+itUbbIl1Fdg3QtWRENonWwhtVtoXxwTERuqX+w8KjWZbGbvj2UONwrO/HeP3DGHCkizU5EJkFpeQcggYXzNp6pfCTGEH38+eroQjYT5zUXu2lnNv7gY0yKRPsus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOeb/Yeq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOeb/Yeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717121665; x=1748657665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eOHKQ8JxHfWVlQJItled/hhtg9RG1QB7ZNY++VrthUQ=;
  b=jOeb/YeqGPDEW9piMET/j5VfZXgbXtWTMUr+h2ZPIcwQpOmMAb42RL13
   jgr7J2R+yMyLIjW/xK8TMvaPimYvlTZlMAEDaL6MNpJjrSl8X/YXejwHr
   5LEYf7pzJVFyF2t0gliedt2dbJQ8ZRapNWOVQ1LRTZDSSe1zpWLQVn6ae
   y9NJbWE43BJvSSJ3vt4xI8XZa2rfcfHBQuvHxDlk0ukLQvWpa17C+KYeZ
   JqLr5W4Baf4NYDJY7C+joaY2SwJpf3x4WQif5dokXgaefX3d65o1Kad2g
   xwJFQsL9paNWQFehyR8lQ2EkpzXYw36iaRAFww6+EQJlqaIwZOg35Rhcv
   g==;
X-CSE-ConnectionGUID: XoYb8ceOSiSP0nb1OaZe3g==
X-CSE-MsgGUID: GYdhvIUBTo6z9mKMUdp7pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17480809"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="17480809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 19:14:23 -0700
X-CSE-ConnectionGUID: O4lSNZqvRwGOrqolWsiLgw==
X-CSE-MsgGUID: fkoyztfgTwqq7Rw0I1d7XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40940467"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 May 2024 19:14:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCrmc-000GOL-0C;
	Fri, 31 May 2024 02:14:18 +0000
Date: Fri, 31 May 2024 10:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 93/93] ERROR: modpost: "do_exit"
 [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202405311008.oux1PVXS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ce6297d0475422fa2de0db1d4f955633ba70d031
commit: ce6297d0475422fa2de0db1d4f955633ba70d031 [93/93] bcachefs: twf: Switch to create_io_thread()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311008.oux1PVXS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311008.oux1PVXS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311008.oux1PVXS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/s390/mm/cmm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/s390/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/nfs_acl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/af_alg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_skcipher.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/prime_numbers.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libpoly1305.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_kmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_bm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ts_fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/s390/lib/test_kprobes_s390.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/s390/lib/test_unwind.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/s390/lib/test_modules.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/cio/vfio_ccw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/block/dcssblk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/s390/net/lcs.o
>> ERROR: modpost: "do_exit" [fs/bcachefs/bcachefs.ko] undefined!
>> ERROR: modpost: "wake_up_new_task" [fs/bcachefs/bcachefs.ko] undefined!
>> ERROR: modpost: "__set_task_comm" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
