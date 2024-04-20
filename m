Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD413E478;
	Sat, 20 Apr 2024 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653713; cv=none; b=eXNnGKay8qTy31RR5tfCzLYq5zZPPhVhNbjMQzsubQgo0di1LULIlpfIf4u0DFhnlcITZKURPD82eXLVlHavW+Dqq4Dp9PBqCKUfqG0MP6eVjBR/Aij8fzSs4girHEzw4DJsYss6ndyWxZMfivrcjvxJJQMnbUjS1fuupqZ4KVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653713; c=relaxed/simple;
	bh=z2pJtrm+DGfiep3KTn8L1Oy4W0Cox1dN74beNvxyiRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T0RLFn5WmjmdgkpFyFgKdeeVBGb+DoKUDAdnj1OvQAlTa8RMpW5NhMs8GjYWoYe8O6roc26mH8WcS08enbk4aQMD59TNkP2geq8gM0BbqTN/J1yD84L30nl/q35TXSKsmVKKHfn2mujmcUyk4gpuYtdsre6VUv7ekdy1SrgXOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awAhZsd6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awAhZsd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713653711; x=1745189711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2pJtrm+DGfiep3KTn8L1Oy4W0Cox1dN74beNvxyiRE=;
  b=awAhZsd6HMxlKecE+oAUiDlEEO83RGZVXBKgEqMAE8dDUBsgmi8yeQKX
   MZKArQMnI7Dysv4EwUT+nHfqpmLnhd5saE/C/zg7oidUp6q/UPLmXSywY
   5/3PeFJu1uLfhEX8p8hH5qfdwZQlWjf+er6eIme73xuauCTT5zeD3lskZ
   mPmDiGu7cKRZ4PzoOD6NZf+7keYXDDr19KjSj1XOCCsfqPHXn26fXVVj/
   3jVPlY8x3BVE8wk6Lk41Xmjpl8aGu86KffJn1+GfCERSxklWK+enUUpKG
   u5UXsEcecma51Q6CYBA0kutnd79HE0chmi/meABgmjqpoWwWr9kvie4ez
   Q==;
X-CSE-ConnectionGUID: vyF6LplrQu66bMCsBE+QPw==
X-CSE-MsgGUID: 2IFz6fhtQG6iUX3+UO8nFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9385992"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9385992"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 15:55:11 -0700
X-CSE-ConnectionGUID: sk79g/LRQIif86GaBSXEvg==
X-CSE-MsgGUID: g/XnbA51RTCHUOQZTQKSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="28123158"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2024 15:55:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryJbu-000BYA-2k;
	Sat, 20 Apr 2024 22:55:06 +0000
Date: Sun, 21 Apr 2024 06:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_virtio_test 1/5] ERROR: modpost:
 "unregister_virtio_device" [drivers/virtio/virtio_pci.ko] undefined!
Message-ID: <202404210602.8t9w6Svg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_virtio_test
head:   e810345cfbf58ce6a60f67ae4095dc4cb9bf11af
commit: 95c9aa71b26340b2b6bdf6f0d2cc978c460446a3 [1/5] virtio: add debugfs infrastructure to allow to debug virtio features
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240421/202404210602.8t9w6Svg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210602.8t9w6Svg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210602.8t9w6Svg-lkp@intel.com/

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
>> ERROR: modpost: "unregister_virtio_driver" [fs/fuse/virtiofs.ko] undefined!
>> ERROR: modpost: "virtio_reset_device" [fs/fuse/virtiofs.ko] undefined!
>> ERROR: modpost: "__register_virtio_driver" [fs/fuse/virtiofs.ko] undefined!
>> ERROR: modpost: "virtio_config_changed" [drivers/virtio/virtio_pci.ko] undefined!
>> ERROR: modpost: "unregister_virtio_device" [drivers/virtio/virtio_pci.ko] undefined!
>> ERROR: modpost: "register_virtio_device" [drivers/virtio/virtio_pci.ko] undefined!
>> ERROR: modpost: "__register_virtio_driver" [drivers/virtio/virtio_balloon.ko] undefined!
>> ERROR: modpost: "unregister_virtio_driver" [drivers/virtio/virtio_balloon.ko] undefined!
>> ERROR: modpost: "virtio_check_driver_offered_feature" [drivers/virtio/virtio_balloon.ko] undefined!
>> ERROR: modpost: "virtio_reset_device" [drivers/virtio/virtio_balloon.ko] undefined!
WARNING: modpost: suppressed 22 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
