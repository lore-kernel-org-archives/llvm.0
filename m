Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF7417BB2A;
	Tue, 11 Jun 2024 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106862; cv=none; b=e6/HIXP9UrDiHJfjQ4cOdn/RHCRgAmsF307pFyHe0uaDqUACF/+n7pMGMIZ75kGI1x6yjk6eJ2/t+5IGlR9yl/KBIWcmF46hCAfnknZp+p+2uT03MyUOKf+q36stnH10nTEW4Dc9Egs4sM9PYhV5L4OVN3AQ8mGLNc8TYr8kvUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106862; c=relaxed/simple;
	bh=RXnZ1t4/dNMnPV4XAGCcwz+Icd8ysL609s6Cljage+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiHAx6FpQQVVCQPKzPES8LjBjtUIjZOJltwJTuP2L390cJ2PAvFkCBcVEfyRrDuaG3mNlxSfXNQyyHC76wElhFcNsd4GtE5sEhpc4dDehNJ9fgNUxSbZo2MQxJhOSsCH7NnMozBu0ROELB0EpXJaovZiVRwDfvpJtwDeR2AIWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBKrwUjH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBKrwUjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718106861; x=1749642861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXnZ1t4/dNMnPV4XAGCcwz+Icd8ysL609s6Cljage+c=;
  b=dBKrwUjH8E68hxbGtfvM+R+QmHKYz3F4Fb1ZzaOP57uHggsMdl6JWVVN
   loOH3U4B68pMzWJeoe0Qhk2qTKtLmuBpz7OiHR1+J9CL0p8LMReGw4b43
   d6Mt/yir7wtr9cdl0WB4grQ8n0LmfqbWCfMOqxlZ4qTK8u9mFT6XcJKj4
   3AmtcZZwVR/BHPRscXJspGVCcvy/r6lgVSmUrxdjoQcRM00L2isHx0aFQ
   J3sekJwRphp1mwrUI+OP1NZuh4KuNrtPRoJiTAVQrI9kUaT3e6wGpNKpc
   8VciCtnrmVMkieUTHCMZ+qL3JoX28ZsIu/OKwGt4YMe6AcJ/W4jQWzFZl
   w==;
X-CSE-ConnectionGUID: iCvl0gUvRU6TtO6BQgQ2Tw==
X-CSE-MsgGUID: Fwg59RxrRwmLo4KGqPMciA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40212561"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="40212561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 04:54:20 -0700
X-CSE-ConnectionGUID: NBBWa6XRRoazUgyfTsbO9A==
X-CSE-MsgGUID: NzWmmTHXTkGQoMtKoQnf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="43804294"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2024 04:54:19 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH04u-0000Np-1W;
	Tue, 11 Jun 2024 11:54:16 +0000
Date: Tue, 11 Jun 2024 19:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>
Subject: [kees:dev/v6.10-rc2/kunit/usercopy 2/3] ERROR: modpost: "mm_alloc"
 [lib/kunit/kunit.ko] undefined!
Message-ID: <202406112223.kpN08na4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.10-rc2/kunit/usercopy
head:   29124c6aaedca2903feb3a7d403824c8fe25aed7
commit: cfcc9055b6e912590581199daa25f00de26cd5d7 [2/3] kunit: test: Add vm_mmap() allocation resource manager
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240611/202406112223.kpN08na4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112223.kpN08na4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112223.kpN08na4-lkp@intel.com/

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
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/af_alg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_skcipher.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
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
>> ERROR: modpost: "mm_alloc" [lib/kunit/kunit.ko] undefined!
>> ERROR: modpost: "arch_pick_mmap_layout" [lib/kunit/kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
