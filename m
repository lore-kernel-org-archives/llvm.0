Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16AB33F36D;
	Sat, 17 Oct 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225115; cv=none; b=FqpUWMDrqZA8pjnOorhl+GNrmGLeAsKFHQYwLimAFWsJPpwPX6sPds0igCdi40UnSBnzyWPi7zdqweh5oNgk4/7lt73N9EcbUUm+neyVo4jWM+eK72v2QDWZ2nCxhIvsvhrF48FLbAKqZuVgPecswIvRIuO0owpxNdM5zGOR8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225115; c=relaxed/simple;
	bh=nHxt/WmUrRpB4iJEI1ltQfLPzsyHtXDAtEEFSEvoh8k=;
	h=Date:From:Cc:Subject:Message-ID; b=bbcEcomjVwT6px5dk9GhKHdSSqKUywFczcYWa/SwMw7I27QELP1k12+Cdx/hQt9SBwguBQNTwXybs0JWuKmPT6Qllmse9bb2gRZZhErsqZE3FcphmJu87tiOjLa1n7sScLbYqnVjoszw6tenwjZNKjQjqWAnIQLasz3Q/mD/6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwP5q5Vf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwP5q5Vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792225113; x=1823761113;
  h=date:from:cc:subject:message-id;
  bh=nHxt/WmUrRpB4iJEI1ltQfLPzsyHtXDAtEEFSEvoh8k=;
  b=DwP5q5VfQ0Kx9UYnxJlQt70pu78o2HZ1AeavF0mgLUHxmUcsY+evmZoV
   GOxjh9CQkP9W7XI5nmNIQ0ddoUGKc2igODWvtueVMzHSCejFnGYnWizwJ
   6T+9rKeQPqsB3nsAz6/hwkT9ei2dGxwA+T+nl8GsHiV3uBdCDqKlyz4ks
   N/YSloapjEAW2wVx1yvrP9gz+ykb7kf7zehz/ph736k6Swo++phuhvF9U
   MLO4ZYXRkcNCN/smVuE+RE/2i0OnlkOncHPNWGZEbUrYg4KVwDx1huVq7
   0l/uYfagC5SlWHEMCeERbqV5FVYis8tEiSncggu0+vWuwkY91w8nzVTRc
   Q==;
X-CSE-ConnectionGUID: q1Z0GbjoSfWB8QIqvzZIXw==
X-CSE-MsgGUID: 88nWVx2tS3aZdWj1YBVoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="877458"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="877458"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 01:18:33 -0700
X-CSE-ConnectionGUID: QsbGFXNiTd6948AmWPu2fw==
X-CSE-MsgGUID: VvpJquxLRuSKw5wuSXIjMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2392574"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2026 01:18:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHzca-00000000JDs-3TNr;
	Sat, 17 Oct 2026 08:18:28 +0000
Date: Sat, 17 Oct 2026 16:18:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:sched/core 21/37] ld.lld: error:
 vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_prepare_alloc_entry:
 .text+0x75c): relocation R_RISCV_HI20 out of range: 531709 is not in
 [-524288, 524287]; references 'phys_ram_base'
Message-ID: <202610171626.dM4nRKss-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Andrea Righi <arighi@nvidia.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Srikar Dronamraju <srikar@linux.ibm.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Kayra Cizmeci <kayracizmeci@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   b99b7f60c5b473d374c68b53753153b4aa9e0702
commit: c8fc4136fd3c58458592b77168f0916d08dbea5a [21/37] sched/fair: Honor asymmetric SMT priority in idle selection
config: riscv-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171626.dM4nRKss-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171626.dM4nRKss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171626.dM4nRKss-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_prepare_alloc_entry: .text+0x75c): relocation R_RISCV_HI20 out of range: 531709 is not in [-524288, 524287]; references 'phys_ram_base'
   >>> referenced by alloc.c:355 (fs/nilfs2/alloc.c:355)
   >>> defined in vmlinux.a(arch/riscv/mm/init.o)
--
>> ld.lld: error: vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_prepare_alloc_entry: .text+0x764): relocation R_RISCV_HI20 out of range: 531709 is not in [-524288, 524287]; references 'kernel_map'
   >>> referenced by alloc.c:355 (fs/nilfs2/alloc.c:355)
   >>> defined in vmlinux.a(arch/riscv/mm/init.o)
--
>> ld.lld: error: vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_prepare_alloc_entry: .text+0x844): relocation R_RISCV_HI20 out of range: 532680 is not in [-524288, 524287]; references 'mem_map'
   >>> referenced by alloc.c:355 (fs/nilfs2/alloc.c:355)
   >>> defined in vmlinux.a(mm/mm_init.o)
--
>> ld.lld: error: vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_init_blockgroup: .text+0x28): relocation R_RISCV_HI20 out of range: 531709 is not in [-524288, 524287]; references 'kmalloc_caches'
   >>> referenced by slab.h:992 (include/linux/slab.h:992)
   >>> defined in vmlinux.a(mm/slab_common.o)
--
>> ld.lld: error: vmlinux.a(fs/nilfs2/alloc.o):(function nilfs_palloc_prepare_alloc_entry: .text+0x684): relocation R_RISCV_HI20 out of range: 525321 is not in [-524288, 524287]; references 'nilfs_palloc_desc_block_init'
   >>> referenced by alloc.c:355 (fs/nilfs2/alloc.c:355)
   >>> defined in vmlinux.a(fs/nilfs2/alloc.o)
--
>> ld.lld: error: vmlinux.a(drivers/scsi/scsi_trace.o):(function scsi_trace_parse_cdb: .text+0xec): relocation R_RISCV_HI20 out of range: 530523 is not in [-524288, 524287]; references '.LJTI0_0'
   >>> referenced by scsi_trace.c:0 (drivers/scsi/scsi_trace.c:0)
   >>> defined in vmlinux.a(drivers/scsi/scsi_trace.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
