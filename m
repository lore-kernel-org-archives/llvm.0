Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8B19CC3E;
	Wed, 26 Mar 2025 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743003218; cv=none; b=rdywjGZIm8bVNOgexNtsSY9qao8tOzaVJxBINGmHw+s6JmFxO26UxoMiyU8NPWXnTbdap8V66h1Bd2/T+BEFQY+ng4K9WOdflOp9WWnGJOgBfl46VRi/ixs4eR9iLp4UWlzjIRood5C5vrsHK/Uku2H8iHY4aATusc6A2FPvRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743003218; c=relaxed/simple;
	bh=1fK9Ufpr7ejSFo6vt/G/1dWEVUcHZJSf2mkL3DIm23s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpQl7LNz9PlQNnFS+aWTfYEErU1DYUQynQLb0tUiwsnuw52gu9j6mZ2YLqeaZcRUfjoSFf7R1tka2V2jqTBJiam3E4ACetDHiZFIF40jMQ/8sidHVZqWMCLYhIhEhm9PSbTdrHO+8WLbNdjiiTt0lSEk6haBk6Hf8x0vv4X1hoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvBMjdhj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvBMjdhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743003217; x=1774539217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fK9Ufpr7ejSFo6vt/G/1dWEVUcHZJSf2mkL3DIm23s=;
  b=LvBMjdhjtpv2IS7tlqM28l7EkoRLeEHEDSC8K7LngP/8XYruwmexulLc
   GGtXc1u4RgnqjQM46BMyb8hK2975T8c5KWTlCOJ7l6Q6sv3hJ6DCyoH5U
   HL6w2Cd4o2zHPxyewg2zJvgZfzncVWtc5wjyZr0ssopMrt7FwdumB9g9j
   VUeuoVYxOplfVSDb0d5BkUllCxsrR0U1mn8dDKrg1Dipxw11lQeqsevob
   GUIyoAI2T0gHQbust23ZusCqytUp8LwWspunsQB1zqYweUhqFQuXFStAx
   vTkpk5ckVdE1ztL/Mv5HKtSG6U0SPg0MyEj/b7wPfLltnLiHzqPcCzhgv
   A==;
X-CSE-ConnectionGUID: ISr6i8q4RomFBoOLv9eelA==
X-CSE-MsgGUID: PW2H3xQjR9KLSncFXyUlZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44400950"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44400950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 08:33:36 -0700
X-CSE-ConnectionGUID: f7gqYllfSJagX1UVAl2yKw==
X-CSE-MsgGUID: 0B3NSWv6RWClDBmEhsKCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125319973"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2025 08:33:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txSl2-0005px-14;
	Wed, 26 Mar 2025 15:33:32 +0000
Date: Wed, 26 Mar 2025 23:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/19] ld.lld: error:
 undefined symbol: shmem_init_fs_context
Message-ID: <202503262329.c3bCsGbV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   d10563e28bf421b3991f2c36e20b2e14e03c8c41
commit: 0387b99af182a8e49e0873834ebe0e226726dcf2 [15/19] kunit: Introduce UAPI testing framework
config: arm-randconfig-002-20250326 (https://download.01.org/0day-ci/archive/20250326/202503262329.c3bCsGbV-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503262329.c3bCsGbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503262329.c3bCsGbV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: shmem_init_fs_context
   >>> referenced by do_mounts.c
   >>>               init/do_mounts.o:(rootfs_init_fs_context) in archive vmlinux.a
   >>> referenced by devtmpfs.c
   >>>               drivers/base/devtmpfs.o:(devtmpfs_init_fs_context) in archive vmlinux.a
   >>> referenced by devtmpfs.c
   >>>               drivers/base/devtmpfs.o:(internal_fs_type) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TMPFS
   Depends on [n]: SHMEM [=n]
   Selected by [y]:
   - KUNIT_UAPI [=y] && KUNIT [=y] && (CC_CAN_LINK_STATIC [=n] || ARCH_HAS_NOLIBC [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
