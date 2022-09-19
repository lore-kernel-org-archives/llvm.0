Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85296113
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663598264; x=1695134264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JN2XRJsRrzAe7ARGj9s/q2wm7KSt2v2nWnPxY8W/7Cg=;
  b=Jmu8qR5ej/RUOUAp3Jn8vXdda0vxklQrwCWKAFqCxrXfh5yqq+wMUAZt
   CHMieWnP1KAMtfPW+rE1VdrkIN5+OKMgOCYdyS7GZlwNAfDv2nMH1ZjZd
   1OM3TMlKgZJ3NCK4lWbUWHIwh4PycWtbFbd+4ecpx+rtTzLN0+GrKg7o0
   2D/7CoD89dqVyS//fvGtvfKVPYzLaTUQxPvkAPUMRTl10t5C4WsBl/2SE
   ExqlQBBfNO3HrR6p3HGGL1CH779aaPqM7aWyMWYgxlorKL9pLuAXSyNsr
   Cl0QCWbTWN4o1QsBsoD9qFtQIzJe9dfFTBqMguMEtthpWYOJVp/Deu4Zj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="361154741"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="361154741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 07:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="649167661"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Sep 2022 07:37:42 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaHu1-000220-18;
	Mon, 19 Sep 2022 14:37:41 +0000
Date: Mon, 19 Sep 2022 22:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [linux-next:master 6912/7934] perf_pai_ext.c:undefined reference to
 `__tsan_memcpy'
Message-ID: <202209192219.ypFkfT0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
commit: c432fefe8e6262bf3d288ab82d006cfafa78a139 [6912/7934] s390/pai: Add support for PAI Extension 1 NNPA counters
config: s390-randconfig-r001-20220919 (https://download.01.org/0day-ci/archive/20220919/202209192219.ypFkfT0K-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c432fefe8e6262bf3d288ab82d006cfafa78a139
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c432fefe8e6262bf3d288ab82d006cfafa78a139
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 4c9ca5b1597e3222177ba2a94658f78fa5ef4f58 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   s390x-linux-ld: crash_dump.c:(.text+0xee6): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xef8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xf18): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xf86): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xfa2): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0xfc6): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xfd8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xfea): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xffc): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1086): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x10c2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x1158): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x1222): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x12ec): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o:crash_dump.c:(.text+0x13b2): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_alloc':
   crash_dump.c:(.text+0x197c): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_read':
   crash_dump.c:(.text+0x1cd4): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_read_notes':
   crash_dump.c:(.text+0x1d4e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `get_vmcoreinfo_old':
   crash_dump.c:(.text+0x1dce): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1de0): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1ec0): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1ee2): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1fb4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o:crash_dump.c:(.text+0x2150): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `save_area_add_regs':
   crash_dump.c:(.init.text+0x2dc): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x2ee): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x300): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x312): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x324): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o:crash_dump.c:(.init.text+0x454): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_components':
   machine_kexec_file.c:(.text+0x3a): undefined reference to `__tsan_memset'
   s390x-linux-ld: machine_kexec_file.c:(.text+0x2ae): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_initrd':
   machine_kexec_file.c:(.text+0x564): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_purgatory':
   machine_kexec_file.c:(.text+0x77a): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_ipl_report':
   machine_kexec_file.c:(.text+0xb4c): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/kexec_image.o: in function `kexec_file_add_kernel_image':
   kexec_image.c:(.text+0x94): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/kexec_elf.o: in function `kexec_file_add_kernel_elf':
   kexec_elf.c:(.text+0x444): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_event.o:perf_event.c:(.text+0x57a): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_cpum_cf.o: in function `event_show':
   perf_cpum_cf.c:(.text+0x59d0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumf_measurement_alert':
   perf_cpum_sf.c:(.text+0xfce): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x1040): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `hw_perf_event_update':
   perf_cpum_sf.c:(.text+0x191a): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x1942): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x1966): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o:perf_cpum_sf.c:(.text+0x28a4): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_disable':
   perf_cpum_sf.c:(.text+0x3138): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_event_init':
   perf_cpum_sf.c:(.text+0x364c): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x393c): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x39aa): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_check_period':
   perf_cpum_sf.c:(.text+0x61ae): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x6216): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `event_show':
   perf_cpum_sf.c:(.text+0x648a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_output_event_pid':
   perf_cpum_sf.c:(.text+0x7442): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `setup_pmc_cpu':
   perf_cpum_sf.c:(.text+0x75d8): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x7640): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x771e): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `free_sampling_buffer':
   perf_cpum_sf.c:(.text+0x7c32): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o:perf_cpum_sf.c:(.text+0x84d2): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_cpum_cf_events.o: in function `event_show':
   perf_cpum_cf_events.c:(.text+0x38): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_cf_events.o: in function `cpumf_cf_event_group':
   perf_cpum_cf_events.c:(.init.text+0x38): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `paicrypt_sched_task':
   perf_pai_crypto.c:(.text+0x12fc): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_crypto.c:(.text+0x130e): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_crypto.c:(.text+0x1320): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_crypto.c:(.text+0x1348): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o:perf_pai_crypto.c:(.text+0x1610): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `event_show':
   perf_pai_crypto.c:(.text+0x165a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `paicrypt_init':
   perf_pai_crypto.c:(.init.text+0x36): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_pai_ext.o: in function `paiext_sched_task':
   perf_pai_ext.c:(.text+0x159e): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_ext.c:(.text+0x15b0): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_ext.c:(.text+0x15c2): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_pai_ext.c:(.text+0x1740): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_pai_ext.o:perf_pai_ext.c:(.text+0x1752): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_pai_ext.o: in function `event_show':
>> perf_pai_ext.c:(.text+0x1aa4): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_pai_ext.o: in function `paiext_init':
   perf_pai_ext.c:(.init.text+0x36): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/trace.o: in function `trace_event_raw_event_s390_diagnose':
   trace.c:(.text+0x116): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/init.o: in function `set_memory_encrypted':
   init.c:(.text+0xe6): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/init.o: in function `set_memory_decrypted':
   init.c:(.text+0x288): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_type':
   extmem.c:(.text+0x36): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/extmem.o:extmem.c:(.text+0x274): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/mm/extmem.o: in function `query_segment_type':
   extmem.c:(.text+0x716): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_by_name':
   extmem.c:(.text+0x1724): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_save':
   extmem.c:(.text+0x224a): undefined reference to `__tsan_memset'
   s390x-linux-ld: extmem.c:(.text+0x225c): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/mmap.o: in function `arch_get_unmapped_area':
   mmap.c:(.text+0xa4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/mmap.o: in function `arch_get_unmapped_area_topdown':
   mmap.c:(.text+0x5aa): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/vmem.o:vmem.c:(.ref.text+0x8ba): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/mm/maccess.o: in function `s390_kernel_write':
   maccess.c:(.text+0x72): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/mm/maccess.o: in function `memcpy_real':
   maccess.c:(.text+0x486): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/maccess.o: in function `xlate_dev_mem_ptr':
   maccess.c:(.text+0x7be): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: maccess.c:(.text+0x8be): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/mm/extable.o: in function `fixup_exception':
   extable.c:(.text+0x30e): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/mm/dump_pagetables.o: in function `ptdump_check_wx':
   dump_pagetables.c:(.text+0x58): undefined reference to `__tsan_memset'
   s390x-linux-ld: dump_pagetables.c:(.text+0x9e): undefined reference to `__tsan_memset'
   s390x-linux-ld: dump_pagetables.c:(.text+0xb6): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/mm/dump_pagetables.o: in function `pt_dump_init':
   dump_pagetables.c:(.text+0xdb8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha256_s390.o: in function `sha256_export':
   sha256_s390.c:(.text+0x158): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha256_s390.c:(.text+0x16a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha256_s390.o: in function `sha256_import':
   sha256_s390.c:(.text+0x1de): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha256_s390.o:sha256_s390.c:(.text+0x1f0): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/crypto/sha256_s390.o: in function `sha256_s390_init':
   sha256_s390.c:(.init.text+0xd2): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/sha_common.o: in function `s390_sha_update':
   sha_common.c:(.text+0x126): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha_common.c:(.text+0x24e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha_common.o: in function `s390_sha_final':
   sha_common.c:(.text+0x49c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha_common.c:(.text+0x4b4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/sha512_s390.o: in function `sha512_export':
   sha512_s390.c:(.text+0x1a8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha512_s390.c:(.text+0x1ba): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha512_s390.o: in function `sha512_import':
   sha512_s390.c:(.text+0x2b2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha512_s390.c:(.text+0x2c4): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha512_s390.o: in function `init':
   sha512_s390.c:(.init.text+0xd2): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_224_init':
   sha3_256_s390.c:(.text+0x3a): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_256_export':
   sha3_256_s390.c:(.text+0xb8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha3_256_s390.c:(.text+0xca): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_224_import':
   sha3_256_s390.c:(.text+0x13e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha3_256_s390.c:(.text+0x150): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_256_init':
   sha3_256_s390.c:(.text+0x1b0): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_256_import':
   sha3_256_s390.c:(.text+0x234): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sha3_256_s390.c:(.text+0x246): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/sha3_256_s390.o: in function `sha3_256_s390_init':
   sha3_256_s390.c:(.init.text+0xd2): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ecb_paes_set_key':
   paes_s390.c:(.text+0x366): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0x3ae): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x48e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x4fc): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0x69e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `ecb_paes_crypt':
   paes_s390.c:(.text+0x9d2): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0xa80): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0xbba): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0xd68): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0xdb2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `cbc_paes_set_key':
   paes_s390.c:(.text+0xf36): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0xf7e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x105e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x10cc): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0x126e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/crypto/paes_s390.o: in function `cbc_paes_crypt':
   paes_s390.c:(.text+0x15a2): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0x163e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x1664): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x175e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: paes_s390.c:(.text+0x17b2): undefined reference to `__tsan_memset'
   s390x-linux-ld: paes_s390.c:(.text+0x1960): undefined reference to `__tsan_memcpy'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
