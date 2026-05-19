Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FE03932CE;
	Tue, 19 May 2026 21:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779226885; cv=none; b=UpuOEAfIY6huegYgUJiiL20iPNs2c5gKS3tf+PDTdaaozuYaX/pRrP0yVRiixUYQxHQmkneI6P6HuY0VNdk8KijAeSXbghzFLQpq3wxJTG+DGOB7bggnQBr0A5DJEZrtdVYlhbPsaaSqFUmkkaXQCAX2cx4VhgcR91Oye49xsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779226885; c=relaxed/simple;
	bh=TtqYTf2P30/KykNdACV2ue1Vw1/vXNxkQdDxzeYcn54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jQAvJUv35uLF9KggYXxAsEj9PLSyayYUNB6PfsctvBYaaJmiMass2YN5WAlEMkXyzTYa0ARss5Ls4VFy4HX1HuoQcVfIXpMMmra+dakAbP/XQ+4nx/slRLRDcs+A3d1z6z6cff6eIESx0KF6b3JyfZIxb8/lmcQ34bavkwQLYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfGGFg1/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfGGFg1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779226884; x=1810762884;
  h=date:from:to:cc:subject:message-id;
  bh=TtqYTf2P30/KykNdACV2ue1Vw1/vXNxkQdDxzeYcn54=;
  b=dfGGFg1/geo2GDFuNsjbqgdcudneNe6KojZr/MpPWkKrfEzgKeFqL4Je
   iXHMzTboayksGZUgzFvkLlAMwBXWvX5ZkATpa/M3oAG3MEJPleOfIumUP
   11w1qoLa8I+KMl2/w9FNx8elwHq2otwm1whofa8fJvmTUVXk5XoD1u/1H
   aD16NUGMP3PqjocAnKpKQA9uv/tAmNRPZPm+kpM08eUxlqK4aKnZeN6Sk
   Qb0nVfEhkkui3+uz9eD4IapVoS0snTOgeyl/UqDBNcjl9Z+RAt4sI4bJn
   sqhEl0kw+azj9w2VCjMMU8sba0W0N2PLw2TtcMEquD8iz+1hjiJ2/k7Ht
   w==;
X-CSE-ConnectionGUID: hhrGnR4sTYS+IxBOWyzCHQ==
X-CSE-MsgGUID: DT793YLWSbCxN2zbjq+EAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="84000465"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="84000465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:41:24 -0700
X-CSE-ConnectionGUID: xO510tOSSWOaAhAzZeFNuQ==
X-CSE-MsgGUID: mMgs+lChSNivIPgFD7Y81Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239958867"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 14:41:22 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSBG-000000001xD-2TMo;
	Tue, 19 May 2026 21:40:56 +0000
Date: Wed, 20 May 2026 05:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/asm-cleanup 17/18]
 arch/arm64/include/asm/fpsimd.h:781:77: error: call to undeclared function
 'BUILD_BU'; ISO C99 and later do not support implicit function declarations
Message-ID: <202605200546.ETVfEvjV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/asm-cleanup
head:   9a625452a16d74ae234b328853e88722a53ba633
commit: eedf6eece9afecf4bf671050632c6b5f3ef8d587 [17/18] WIP: arm64: fpsimd: Move SME save/restore inline
config: arm64-randconfig-003-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200546.ETVfEvjV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200546.ETVfEvjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200546.ETVfEvjV-lkp@intel.com/

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
>> arch/arm64/include/asm/fpsimd.h:781:77: error: call to undeclared function 'BUILD_BU'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     781 | static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
         |                                                                             ^
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


vim +/BUILD_BU +781 arch/arm64/include/asm/fpsimd.h

   779	
   780	static inline void sme_save_state(struct sme_state *state, bool zt) { BUILD_BUG(); }
 > 781	static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
