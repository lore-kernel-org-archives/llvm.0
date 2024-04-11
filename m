Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09462144;
	Thu, 11 Apr 2024 04:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811491; cv=none; b=pv7wqkTmhzoKw9U5/O/8nKN8vfIhcGWhGQQYJC+OHou2ZOlyaqzj2+nRc9VkC0TJt1ST/ocvz6c42Snh2m1YXv7W8vfIt2FK7n7BW51hnEC1xtZvFKw4KeAuVJS7NfahNSDEu8weFeIKdFwB6/+MiQwYo3E4y7VejWvk/OK1Reg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811491; c=relaxed/simple;
	bh=RO76saKIKK2B5GxJo1lx6YM4dn9YroDjNfc6pgjgKHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkFIDARO17u1IhXZePl35YY2GoJMP/paYRJahj7Lcwfghx3kRHNqGmPyiAGt/RHquJzY8m1a5Ij9J1mH2L4Xou+kek3n9vX+JHlk2OE3kpw/AlDwdM8CAr6d1NUzOyiFEou0Al77+1KPGiZwf89AUWvKl7yuzUhYUHGxD8mazKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJUSlc8+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJUSlc8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712811488; x=1744347488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RO76saKIKK2B5GxJo1lx6YM4dn9YroDjNfc6pgjgKHQ=;
  b=SJUSlc8+vDoN7UFtaoMmDsDqx1tdgUq2+Vl6CCmG6mMiFkAD6yeDEvEE
   K73uJAv1kBVXW0+rtfRLlPZNzebNT9jpIt9L4ZmS195VVTM3Bs3JOE3Mc
   7Wd1lxAygRO7OhYWf5P9Loi3/WpElTw1e/XdX0HSRDyZ+AkErNRzu2C+S
   yRwRXmIdvk/7NkYx8mnTGFh750AMHqSBosvIqCEfYdRx2w39Wcub1I1E4
   u5JJMNAi+u7LvKOZo32GOFD4+4zpkQSdO0ASbzlLw+6rFyGS+lkrtzuCN
   4UmkyzVCtCkHFWRq+hejjqFmpl0tHF/6XnnogXxJxtkdFxsEfB68R/91V
   A==;
X-CSE-ConnectionGUID: h/mYxEVdQ6atsC/5OXAlBw==
X-CSE-MsgGUID: W+f7SwueQfeU/LLyRRx/tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18764705"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="18764705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:58:08 -0700
X-CSE-ConnectionGUID: 4j8awYRpRDGvPHLK/Jh2Xg==
X-CSE-MsgGUID: xhMhE1VDSxWWfO8myxA/IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="51749863"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2024 21:58:07 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rumVg-0008Eb-1v;
	Thu, 11 Apr 2024 04:58:04 +0000
Date: Thu, 11 Apr 2024 12:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 16/19] WARNING: modpost:
 vmlinux: section mismatch in reference: rb_range_meta_init+0xb8 (section:
 .text) -> rb_data_ptr (section: .init.data)
Message-ID: <202404111240.ZQUKatys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   26231feef0abf43a00e0ea834d7e0df0c017be2f
commit: 8201f07303fb08d20865133d8ee38a2c3a49a943 [16/19] ring-buffer: Save text and data locations in mapped meta data
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111240.ZQUKatys-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111240.ZQUKatys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111240.ZQUKatys-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: rb_range_meta_init+0xb8 (section: .text) -> rb_data_ptr (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rb_range_meta_init+0xd0 (section: .text) -> rb_data_ptr (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rb_range_meta_init+0x350 (section: .text) -> rb_data_ptr (section: .init.data)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
