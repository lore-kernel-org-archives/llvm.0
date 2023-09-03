Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB9621;
	Sun,  3 Sep 2023 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693701820; x=1725237820;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rswJvSBgJXUsmMslG0htBAQt0JUxYWgZcAJX+0u++QM=;
  b=bdwHMWsDEXA5lDhPNE6eBai4jJzv6iL6ltidjhP6/ym6fb5HWCfk8mjm
   omrZf6IJeSfVa/ANXT22I4O2HW4U8o4WHdi2L0sWLC+FgvHCJmsSERcTb
   ksx312/ivUQeI2/ZgRs+x9jk23Z7tjVF1JhOLirGsYl1L18UDhhaoMVcH
   3ntNvHKZ3Kya2rCdDfmTFX83T4BA33bULg5ldwHseI5XA95d4zNG/vx80
   +hpYH5DnJMhEdMjjhyQQjNjj74YgrdnBjTyxvERLUuzU1f79cGRmKDICY
   mGe0lYy6Y1dyVg1+/S3fEtnOqhFH53GOHBTY3TmYv0QnTBg1HOWGSMfOk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="442813496"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="442813496"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="1071164745"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="1071164745"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2023 17:43:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcbDC-0002kN-27;
	Sun, 03 Sep 2023 00:43:34 +0000
Date: Sun, 3 Sep 2023 08:42:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask:
 .text+0x14): relocation R_RISCV_HI20 out of range: 526890 is not in
 [-524288, 524287]; references cpu_bit_bitmap
Message-ID: <202309030807.lgGb87Ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: 8dbfc14fc736eb701089aff09645c3d4ad3decb1 btrfs: account block group tree when calculating global reserve size
date:   6 weeks ago
config: riscv-randconfig-r033-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030807.lgGb87Ej-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030807.lgGb87Ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030807.lgGb87Ej-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask: .text+0x14): relocation R_RISCV_HI20 out of range: 526890 is not in [-524288, 524287]; references cpu_bit_bitmap
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/cpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x3a): relocation R_RISCV_HI20 out of range: 528511 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in vmlinux.a(arch/riscv/kernel/process.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x198): relocation R_RISCV_HI20 out of range: 528511 is not in [-524288, 524287]; references initcall_calltime
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x1ca): relocation R_RISCV_HI20 out of range: 527690 is not in [-524288, 524287]; references .L.str.53
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x70): relocation R_RISCV_HI20 out of range: 528112 is not in [-524288, 524287]; references blacklisted_initcalls
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0xc8): relocation R_RISCV_HI20 out of range: 528511 is not in [-524288, 524287]; references initcall_debug
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
