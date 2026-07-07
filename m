Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB41246784;
	Tue,  7 Jul 2026 20:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783454430; cv=none; b=V3Vi7MPYuyGagpLUfSN4uCoaHTiul+/mhKn5rXF40dI61S9ZEi0tNQULdaQt/HY9T+Ukn5Z1nnLxFZDveNLRJ6xJ/x2ZI/WH7iirPKxFtdnK0onK5Mko4VwPlvDq/st4SzlcaeeLJ1RkuARU+L5V6MDoaHLSPdtQCcXBJ72HMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783454430; c=relaxed/simple;
	bh=cpYkMS+90E7cw1ojaoEVTBK0EHk3bsYl16QYAqaJH5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JxoKkbUtnufV4b2ufCM+dRJfHslKp+HvFsKmsPmdr4QUv3YCzKrxQoKoIY7LJdrmNRgMu029/1hB5bQguDq9JU2W2QftzZ4WUZJVYor1u4sXXYrVxlaO8UCRYVgpAh9LJBy2R+mfbWxEzjjkQ6h8lXrgATyLk3/SkUvJwiyx3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldwuQ990; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldwuQ990"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783454427; x=1814990427;
  h=date:from:to:cc:subject:message-id;
  bh=cpYkMS+90E7cw1ojaoEVTBK0EHk3bsYl16QYAqaJH5c=;
  b=ldwuQ990cEBjmxfGq2AeRm7lVRG00WLTOOY/zcD50fTUKdP9CsgDKHDA
   tEUbBHnFg9Wqb88FeZOFPiSu7Dv7PE6tfc78RA+prXERuRwGCMi6tDUat
   0ql/dFhv7xLxfwib1Uqv9UE2UWdBxbddHz2FJwVbv9ZID7VPd+w1kNt7g
   ETDRRjJbGKUNueTIW4ST9QZ4VyPoz37/uR1mOJ44Jgx0dvvkJp+TsjRr0
   4YNi1HkZe7BsHu0DCqHB775fpckhXN+zNQPtuvD2xhVMjKz/115qIc2Uy
   t5Hhz2r0/Sha5K+UnPPSbrGtBtpXaxDVH0AJ0lO6WKpPEEXGIdmDvIJ1p
   g==;
X-CSE-ConnectionGUID: ETHrWgbVTcWK89iX5r0TyA==
X-CSE-MsgGUID: SyDlztAeTjeRrvXVPZg/Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83986616"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83986616"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 13:00:26 -0700
X-CSE-ConnectionGUID: MpEHJ2oATyugzG0hs9WTdg==
X-CSE-MsgGUID: GZDNigK+SDSjvzoZ36i+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250732181"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2026 13:00:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whBxl-00000000Fe3-2uL1;
	Tue, 07 Jul 2026 20:00:15 +0000
Date: Wed, 08 Jul 2026 03:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 26/30]
 arch/arm64/include/asm/fpsimd.h:790:59: error: use of undeclared identifier
 'SME_VQ_INVALID'
Message-ID: <202607080305.JOXJKwDK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   489202b3db0a02f59477f8ec63009dc3d998341f
commit: e698ce954a7916331bb640d94f345a0a23f99d18 [26/30] KVM: arm64: Provide interface for configuring and enabling SME for guests
config: arm64-randconfig-002-20260708 (https://download.01.org/0day-ci/archive/20260708/202607080305.JOXJKwDK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080305.JOXJKwDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080305.JOXJKwDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:17:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:95:
   In file included from arch/arm64/include/asm/spinlock.h:9:
   In file included from ./arch/arm64/include/generated/asm/qrwlock.h:1:
   In file included from include/asm-generic/qrwlock.h:18:
   In file included from arch/arm64/include/asm/processor.h:419:
>> arch/arm64/include/asm/fpsimd.h:790:59: error: use of undeclared identifier 'SME_VQ_INVALID'
     790 | static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
         |                                                           ^~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm64/kernel/asm-offsets.c:11:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/arm64/include/asm/elf.h:141:


vim +/SME_VQ_INVALID +790 arch/arm64/include/asm/fpsimd.h

   785	
   786	static inline void sme_alloc(struct task_struct *task, bool flush) { }
   787	static inline void sme_setup(void) { }
   788	static inline unsigned int sme_get_vl(void) { return 0; }
   789	static inline int sme_max_vl(void) { return 0; }
 > 790	static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
   791	static inline int sme_set_current_vl(unsigned long arg) { return -EINVAL; }
   792	static inline int sme_get_current_vl(void) { return -EINVAL; }
   793	static inline void sme_suspend_exit(void) { }
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
