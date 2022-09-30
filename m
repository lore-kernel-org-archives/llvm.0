Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96C5C85
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664579587; x=1696115587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNqZoDCoNQP9lQoysG2GRAlaO4f07prpPNubBzWRyB0=;
  b=mUurrrzmDWu6mQDkXp2KH9b9NCv6f2T1cVptPww2LXeGXPIMSECVVPxq
   raH3T2GRkhT/t9mZcNNQaAC62h35zQPODrBek0yWxrZxDGuBYjIoymyqE
   iYSv+DPa2+1qckHvKPewBngzzG1b4R6fTy25okSJFEunKVjAfS2XRLjew
   Cw/41wrU+80W8WswOiJXGnpHLejIoFrQ2cIBWmkJdeMHAWdSY1ukgkY1g
   S2KGuFK7PPORv4opmR+/m9UaclJbJ2LlJARsJ8J+P7T80hZodxNyKqeun
   MJYaH6Ym3sHydPRPG/pS+Cl7rd3JHZUxuMg4OAte9ymac4dP6d1vpqCwc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="285444945"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="285444945"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 16:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="625157167"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; 
   d="scan'208";a="625157167"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2022 16:13:04 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oePBn-0001dX-1e;
	Fri, 30 Sep 2022 23:13:03 +0000
Date: Sat, 1 Oct 2022 07:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7287/11993] s390x-linux-ld: topology.c:undefined
 reference to `__tsan_memcpy'
Message-ID: <202210010718.2kaVANGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="XL0wbiExcla69exK"
Content-Disposition: inline


--XL0wbiExcla69exK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   274d7803837da78dfc911bcda0d593412676fc20
commit: aa47a7c215e79a2ade6916f163c5a17b561bce4f [7287/11993] lib/cpumask: deprecate nr_cpumask_bits
config: s390-randconfig-r023-20220926
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aa47a7c215e79a2ade6916f163c5a17b561bce4f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout aa47a7c215e79a2ade6916f163c5a17b561bce4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390x-linux-ld: ipl.c:(.text+0x1004): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: ipl.c:(.text+0x1046): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_fcp_scpdata_write':
   ipl.c:(.text+0x1752): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: ipl.c:(.text+0x177e): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_nvme_scpdata_write':
   ipl.c:(.text+0x1dae): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: ipl.c:(.text+0x1dda): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_nss_name_store':
   ipl.c:(.text+0x2008): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_nss_vmparm_show':
   ipl.c:(.text+0x21f2): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `ipl_ccw_loadparm_show':
   ipl.c:(.text+0x2836): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `ipl_vm_parm_show':
   ipl.c:(.text+0x286c): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_ccw_init':
   ipl.c:(.init.text+0x9ca): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_fcp_init':
   ipl.c:(.init.text+0xbaa): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_nvme_init':
   ipl.c:(.init.text+0xdf8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o: in function `reipl_type_init':
   ipl.c:(.init.text+0x1046): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: ipl.c:(.init.text+0x107e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl.o:ipl.c:(.init.text+0x10b6): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/kernel/dis.o: in function `show_code':
   dis.c:(.text+0x112): undefined reference to `__tsan_memset'
   s390x-linux-ld: dis.c:(.text+0x124): undefined reference to `__tsan_memset'
   s390x-linux-ld: dis.c:(.text+0x458): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/dis.o: in function `copy_from_regs':
   dis.c:(.text+0x5b4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/dis.o: in function `print_fn_code':
   dis.c:(.text+0xace): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/diag.o: in function `diag210':
   diag.c:(.text+0x302): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: diag.c:(.text+0x356): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/sysinfo.o: in function `s390_adjust_jiffies':
   sysinfo.c:(.text+0x1f8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/sysinfo.o: in function `stsi_init_debugfs':
   sysinfo.c:(.init.text+0x1bc): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/lgr.o: in function `lgr_info_log':
   lgr.c:(.text+0x112): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/lgr.o: in function `lgr_info_get':
   lgr.c:(.text+0x1c8): undefined reference to `__tsan_memset'
   s390x-linux-ld: lgr.c:(.text+0x236): undefined reference to `__tsan_memset'
   s390x-linux-ld: lgr.c:(.text+0x2a0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: lgr.c:(.text+0x332): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: lgr.c:(.text+0x36e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: lgr.c:(.text+0x536): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/os_info.o: in function `os_info_old_entry':
   os_info.c:(.text+0x216): undefined reference to `__tsan_memset'
   s390x-linux-ld: os_info.c:(.text+0x2cc): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/os_info.o: in function `os_info_old_alloc':
   os_info.c:(.text+0x4ec): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/machine_kexec.o: in function `machine_kexec_prepare':
   machine_kexec.c:(.text+0x22e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/machine_kexec.o: in function `__do_machine_kdump':
   machine_kexec.c:(.text+0x774): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/runtime_instr.o: in function `__se_sys_s390_runtime_instr':
   runtime_instr.c:(.text+0x170): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/dumpstack.o: in function `show_stack':
   dumpstack.c:(.text+0x21e): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/guarded_storage.o: in function `__se_sys_s390_guarded_storage':
   guarded_storage.c:(.text+0x4b4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/sthyi.o: in function `sthyi_fill':
   sthyi.c:(.text+0xda): undefined reference to `__tsan_memset'
   s390x-linux-ld: sthyi.c:(.text+0x1f2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sthyi.c:(.text+0x224): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sthyi.c:(.text+0x2d0): undefined reference to `__tsan_memset'
   s390x-linux-ld: sthyi.c:(.text+0xa72): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/ipl_vmparm.o: in function `ipl_block_get_ascii_vmparm':
   ipl_vmparm.c:(.text+0x66): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/unwind_bc.o: in function `__unwind_start':
   unwind_bc.c:(.text+0x4dc): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `smp_emergency_stop':
   smp.c:(.text+0x7ec): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `smp_ctl_set_clear_bit':
   smp.c:(.text+0xec4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `smp_ctl_bit_callback':
   smp.c:(.text+0x1004): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `__cpu_up':
   smp.c:(.text+0x1510): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: smp.c:(.text+0x1522): undefined reference to `__tsan_memset'
   s390x-linux-ld: smp.c:(.text+0x1854): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `__cpu_disable':
   smp.c:(.text+0x1d32): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/smp.o: in function `smp_save_cpu_regs':
   smp.c:(.init.text+0x4b0): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/stacktrace.o: in function `arch_stack_walk':
   stacktrace.c:(.text+0x32): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/stacktrace.o:stacktrace.c:(.text+0x11e): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/nospec-sysfs.o: in function `cpu_show_spectre_v1':
   nospec-sysfs.c:(.text+0x24): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/nospec-sysfs.o: in function `cpu_show_spectre_v2':
   nospec-sysfs.c:(.text+0x8e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: nospec-sysfs.c:(.text+0xaa): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: nospec-sysfs.c:(.text+0xc6): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/topology.o: in function `update_cpu_masks':
   topology.c:(.text+0x17c): undefined reference to `__tsan_memset'
>> s390x-linux-ld: topology.c:(.text+0x31e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/topology.o: in function `cpu_group_map':
   topology.c:(.text+0x574): undefined reference to `__tsan_memset'
   s390x-linux-ld: topology.c:(.text+0x6b4): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: topology.c:(.text+0x70c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/topology.o: in function `__arch_update_cpu_topology':
   topology.c:(.text+0x8da): undefined reference to `__tsan_memset'
   s390x-linux-ld: topology.c:(.text+0x906): undefined reference to `__tsan_memset'
   s390x-linux-ld: topology.c:(.text+0x932): undefined reference to `__tsan_memset'
   s390x-linux-ld: topology.c:(.text+0xe14): undefined reference to `__tsan_memset'
   s390x-linux-ld: topology.c:(.text+0xe40): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/topology.o:topology.c:(.text+0xe6c): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/topology.o: in function `cpu_polarization_show':
   topology.c:(.text+0x124c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: topology.c:(.text+0x1268): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: topology.c:(.text+0x1284): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: topology.c:(.text+0x12a0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: topology.c:(.text+0x12bc): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_alloc':
   crash_dump.c:(.text+0x73e): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x804): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x890): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x8ac): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x922): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x934): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x946): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x958): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x978): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0x9ec): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xa08): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0xa2c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xa3e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xa50): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xa62): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0xaec): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xb28): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xbbe): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xc88): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.text+0xd52): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o:crash_dump.c:(.text+0xe18): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_alloc':
   crash_dump.c:(.text+0x12c0): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_read':
   crash_dump.c:(.text+0x1578): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_read_notes':
   crash_dump.c:(.text+0x15dc): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `get_vmcoreinfo_old':
   crash_dump.c:(.text+0x166a): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x16cc): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x16ee): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x175c): undefined reference to `__tsan_memset'
   s390x-linux-ld: crash_dump.c:(.text+0x1810): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `save_area_add_regs':
   crash_dump.c:(.init.text+0x132): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x144): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x156): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x168): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: crash_dump.c:(.init.text+0x17a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/crash_dump.o:crash_dump.c:(.init.text+0x294): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_components':
   machine_kexec_file.c:(.text+0x2a): undefined reference to `__tsan_memset'
   s390x-linux-ld: machine_kexec_file.c:(.text+0x10a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_initrd':
   machine_kexec_file.c:(.text+0x254): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_purgatory':
   machine_kexec_file.c:(.text+0x3be): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_ipl_report':
   machine_kexec_file.c:(.text+0x5b4): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/kexec_image.o: in function `kexec_file_add_kernel_image':
   kexec_image.c:(.text+0x58): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/kexec_elf.o: in function `kexec_file_add_kernel_elf':
   kexec_elf.c:(.text+0x1f0): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_event.o:perf_event.c:(.text+0x2d0): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_cpum_cf.o: in function `event_show':
   perf_cpum_cf.c:(.text+0x30fe): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumf_measurement_alert':
   perf_cpum_sf.c:(.text+0xb4c): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0xb9c): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `hw_perf_event_update':
   perf_cpum_sf.c:(.text+0xf98): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0xfc0): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0xff0): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o:perf_cpum_sf.c:(.text+0x165a): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_disable':
   perf_cpum_sf.c:(.text+0x1a70): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_event_init':
   perf_cpum_sf.c:(.text+0x1ce0): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x1e68): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x1eb8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_check_period':
   perf_cpum_sf.c:(.text+0x3720): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x376a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `event_show':
   perf_cpum_sf.c:(.text+0x398c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_output_event_pid':
   perf_cpum_sf.c:(.text+0x4126): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `setup_pmc_cpu':
   perf_cpum_sf.c:(.text+0x43e4): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x4422): undefined reference to `__tsan_memset'
   s390x-linux-ld: perf_cpum_sf.c:(.text+0x44ae): undefined reference to `__tsan_memset'
   s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `free_sampling_buffer':
--
   sys.c:(.text+0x36ec): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_old_getrlimit':
   sys.c:(.text+0x3858): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_prlimit64':
   sys.c:(.text+0x39ae): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x39c0): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x39d2): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x39f2): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x3ad2): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/sys.o:sys.c:(.text+0x408c): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/sys.o: in function `getrusage':
   sys.c:(.text+0x482c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sys.c:(.text+0x485c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_getrusage':
   sys.c:(.text+0x4978): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_prctl':
   sys.c:(.text+0x4b48): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x5190): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x5270): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x5288): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/sys.o:sys.c:(.text+0x54e2): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_prctl':
   sys.c:(.text+0x595e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sys.c:(.text+0x598e): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x5b2c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/sys.o: in function `__se_sys_sysinfo':
   sys.c:(.text+0x5eea): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x5f7a): undefined reference to `__tsan_memset'
   s390x-linux-ld: sys.c:(.text+0x6008): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/sys.o: in function `do_prlimit':
   sys.c:(.text+0x6416): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: sys.c:(.text+0x6432): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/umh.o: in function `__usermodehelper_disable':
   umh.c:(.text+0x438): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/umh.o: in function `call_usermodehelper_exec':
   umh.c:(.text+0x7c0): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/umh.o: in function `call_usermodehelper':
   umh.c:(.text+0xad0): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/umh.o: in function `proc_cap_handler':
   umh.c:(.text+0xb28): undefined reference to `__tsan_memset'
   s390x-linux-ld: umh.c:(.text+0xc1c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `trace_event_raw_event_workqueue_queue_work':
   workqueue.c:(.text+0x246): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `trace_event_raw_event_workqueue_activate_work':
   workqueue.c:(.text+0x63e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `trace_event_raw_event_workqueue_execute_start':
   workqueue.c:(.text+0x862): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `trace_event_raw_event_workqueue_execute_end':
   workqueue.c:(.text+0xaca): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `__flush_workqueue':
   workqueue.c:(.text+0x28b6): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o:workqueue.c:(.text+0x3678): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/workqueue.o: in function `alloc_workqueue_attrs':
   workqueue.c:(.text+0x423a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `alloc_workqueue':
   workqueue.c:(.text+0x43e2): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0x44a4): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `set_worker_desc':
   workqueue.c:(.text+0x64d6): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `print_worker_info':
   workqueue.c:(.text+0x6558): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0x656a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `create_worker':
   workqueue.c:(.text+0x6c9c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `wq_update_unbound_numa':
   workqueue.c:(.text+0x765a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `work_on_cpu':
   workqueue.c:(.text+0x7bcc): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `work_on_cpu_safe':
   workqueue.c:(.text+0x7d56): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `workqueue_set_unbound_cpumask':
   workqueue.c:(.text+0x8366): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0x837a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0x8554): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `init_worker_pool':
   workqueue.c:(.text+0x868c): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0x8740): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0x8798): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `apply_wqattrs_prepare':
   workqueue.c:(.text+0x99d2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0x9a20): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0x9a70): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0x9b36): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o:workqueue.c:(.text+0x9b7e): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: kernel/workqueue.o: in function `put_unbound_pool':
   workqueue.c:(.text+0xac62): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0xadf4): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `init_pwq':
   workqueue.c:(.text+0xb066): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `process_one_work':
   workqueue.c:(.text+0xc0ee): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0xc104): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0xc914): undefined reference to `__tsan_memset'
   s390x-linux-ld: workqueue.c:(.text+0xc928): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `wq_unbound_cpumask_store':
   workqueue.c:(.text+0xd9da): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/workqueue.o: in function `wq_sysfs_prep_attrs':
   workqueue.c:(.text+0xe320): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.text+0xe35e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o: in function `workqueue_init_early':
>> workqueue.c:(.init.text+0xbc): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.init.text+0x260): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: workqueue.c:(.init.text+0x38e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/workqueue.o:workqueue.c:(.init.text+0x41c): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: kernel/workqueue.o: in function `wq_numa_init':
   workqueue.c:(.init.text+0xc9c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/pid.o: in function `alloc_pid':
   pid.c:(.text+0x4f2): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/pid.o: in function `pid_idr_init':
   pid.c:(.init.text+0x12a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/params.o: in function `param_array_set':
   params.c:(.text+0x1536): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/params.o: in function `param_array_get':
   params.c:(.text+0x16c0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/params.o: in function `param_sysfs_builtin':
   params.c:(.init.text+0x156): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/params.o: in function `add_sysfs_param':
   params.c:(.init.text+0x57a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/kthread.o: in function `kthread_create_on_node':
   kthread.c:(.text+0x950): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/kthread.o: in function `__kthread_create_on_node':
   kthread.c:(.text+0x9cc): undefined reference to `__tsan_memset'
   s390x-linux-ld: kthread.c:(.text+0xb88): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/kthread.o:kthread.c:(.text+0xb9a): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/kthread.o: in function `kthread_use_mm':
   kthread.c:(.text+0x363c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kthread.c:(.text+0x389c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/nsproxy.o: in function `__se_sys_setns':
   nsproxy.c:(.text+0xa64): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/ksysfs.o: in function `uevent_helper_store':
   ksysfs.c:(.text+0xf8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/ksysfs.o: in function `notes_read':
   ksysfs.c:(.text+0x428): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/cred.o: in function `prepare_creds':
   cred.c:(.text+0x750): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/cred.o: in function `prepare_kernel_cred':
   cred.c:(.text+0x1a4c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: cred.c:(.text+0x1b48): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/reboot.o: in function `register_sys_off_handler':
   reboot.c:(.text+0x694): undefined reference to `__tsan_memset'
   s390x-linux-ld: reboot.c:(.text+0x6b0): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/reboot.o: in function `unregister_sys_off_handler':
   reboot.c:(.text+0x832): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/reboot.o: in function `__se_sys_reboot':
   reboot.c:(.text+0xcac): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/async.o:async.c:(.text+0x69a): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/range.o: in function `add_range_with_merge':
   range.c:(.text+0x11a): undefined reference to `__tsan_memmove'
   s390x-linux-ld: range.c:(.text+0x13e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/range.o: in function `subtract_range':
   range.c:(.text+0x21e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/range.o: in function `clean_sort_range':
   range.c:(.text+0x3fc): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/ucount.o: in function `put_ucounts':
   ucount.c:(.text+0x106): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/locking/mutex.o: in function `trace_event_raw_event_lock_acquire':
   mutex.c:(.text+0x28e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/locking/mutex.o:mutex.c:(.text+0x62c): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/printk/printk.o: in function `trace_event_raw_event_console':
   printk.c:(.text+0x19a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk.o: in function `perf_trace_console':
   printk.c:(.text+0x322): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk.o: in function `devkmsg_read':
   printk.c:(.text+0x69e): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk.c:(.text+0x90c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `devkmsg_poll':
   printk.c:(.text+0xc98): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `devkmsg_open':
   printk.c:(.text+0xdf2): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `do_syslog':
   printk.c:(.text+0x13e6): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o:printk.c:(.text+0x1acc): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/printk/printk.o: in function `vprintk_store':
   printk.c:(.text+0x29be): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: printk.c:(.text+0x2a4c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk.o: in function `printk_sprint':
   printk.c:(.text+0x2c1e): undefined reference to `__tsan_memmove'
   s390x-linux-ld: kernel/printk/printk.o: in function `early_printk':
   printk.c:(.text+0x35cc): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk.c:(.text+0x35de): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `kmsg_dump_get_line':
   printk.c:(.text+0x5520): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `record_print_text':
   printk.c:(.text+0x5754): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk.c:(.text+0x58a6): undefined reference to `__tsan_memmove'
   s390x-linux-ld: printk.c:(.text+0x58b8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk.o: in function `kmsg_dump_get_buffer':
   printk.c:(.text+0x59dc): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `find_first_fitting_seq':
   printk.c:(.text+0x5c94): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `console_emit_next_record':
   printk.c:(.text+0x643c): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk.c:(.text+0x66c0): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `setup_log_buf':
   printk.c:(.init.text+0x298): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o:printk.c:(.init.text+0x8f6): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/printk/printk.o: in function `add_to_rb':
   printk.c:(.init.text+0x9a0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: printk.c:(.init.text+0xafe): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk.o: in function `console_setup':
   printk.c:(.init.text+0xc06): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `_printk':
   printk.c:(.text.unlikely.+0x26): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `_printk_deferred':
   printk.c:(.text.unlikely.+0x86): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk.o: in function `devkmsg_emit':
   printk.c:(.text.unlikely.+0x108): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `prb_reserve_in_last':
   printk_ringbuffer.c:(.text+0x9a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o:printk_ringbuffer.c:(.text+0x482): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `prb_reserve_in_last':
   printk_ringbuffer.c:(.text+0x982): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `prb_reserve':
   printk_ringbuffer.c:(.text+0x1296): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x1676): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x17de): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `_prb_read_valid':
   printk_ringbuffer.c:(.text+0x1e00): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x1ec2): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x1fe6): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x213e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `desc_read':
   printk_ringbuffer.c:(.text+0x23e6): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `prb_init':
   printk_ringbuffer.c:(.text+0x24f4): undefined reference to `__tsan_memset'
   s390x-linux-ld: printk_ringbuffer.c:(.text+0x250a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/printk/printk_ringbuffer.o: in function `data_push_tail':
   printk_ringbuffer.c:(.text+0x2786): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/irqdesc.o: in function `alloc_desc':
   irqdesc.c:(.text+0x132): undefined reference to `__tsan_memset'
   s390x-linux-ld: irqdesc.c:(.text+0x1f8): undefined reference to `__tsan_memset'
   s390x-linux-ld: irqdesc.c:(.text+0x3a8): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/irqdesc.o: in function `irq_get_percpu_devid_partition':
   irqdesc.c:(.text+0xc82): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/irqdesc.o: in function `early_irq_init':
   irqdesc.c:(.init.text+0x272): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/manage.o: in function `synchronize_irq':
   manage.c:(.text+0x20a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/manage.o: in function `irq_do_set_affinity':
>> manage.c:(.text+0x626): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/manage.o: in function `irq_update_affinity_desc':
   manage.c:(.text+0xa0c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/manage.o: in function `irq_affinity_notify':
   manage.c:(.text+0xf24): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/manage.o: in function `irq_setup_affinity':
   manage.c:(.text+0x116e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/manage.o: in function `wake_up_and_wait_for_irq_thread_ready':
   manage.c:(.text+0x4e12): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/manage.o: in function `irq_thread_check_affinity':
   manage.c:(.text+0x53c0): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/irq/irqdomain.o: in function `irq_create_of_mapping':
   irqdomain.c:(.text+0x1f4c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/irqdomain.o: in function `irq_domain_xlate_twocell':
   irqdomain.c:(.text+0x2308): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/irq/affinity.o: in function `irq_create_affinity_masks':
   affinity.c:(.text+0x16a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: affinity.c:(.text+0x22c): undefined reference to `__tsan_memset'
   s390x-linux-ld: affinity.c:(.text+0x23e): undefined reference to `__tsan_memset'
   s390x-linux-ld: affinity.c:(.text+0x2fe): undefined reference to `__tsan_memset'
>> s390x-linux-ld: affinity.c:(.text+0x52a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: DWARF error: invalid or unhandled FORM value: 0x23
   kernel/rcu/update.o: in function `trace_event_raw_event_rcu_utilization':
   update.c:(.text+0xdb6): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_grace_period':
   update.c:(.text+0xfea): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_future_grace_period':
   update.c:(.text+0x126c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_grace_period_init':
   update.c:(.text+0x159e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_exp_grace_period':
   update.c:(.text+0x189e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o:update.c:(.text+0x1b20): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_segcb_stats':
   update.c:(.text+0x3164): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: update.c:(.text+0x3176): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/rcu/update.o: in function `perf_trace_rcu_segcb_stats':
   update.c:(.text+0x329a): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: update.c:(.text+0x32ac): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_kvfree_callback':
   update.c:(.text+0x333a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_batch_start':
   update.c:(.text+0x35de): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_invoke_callback':
   update.c:(.text+0x385c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_invoke_kvfree_callback':
   update.c:(.text+0x3af4): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o: in function `trace_event_raw_event_rcu_invoke_kfree_bulk_callback':
   update.c:(.text+0x3d76): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/update.o:update.c:(.text+0x3ff8): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: DWARF error: invalid or unhandled FORM value: 0x23
   kernel/rcu/rcutorture.o: in function `rcu_torture_one_read':
   rcutorture.c:(.text+0x5274): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_stats_print':
   rcutorture.c:(.text+0x5b56): undefined reference to `__tsan_memset'
   s390x-linux-ld: rcutorture.c:(.text+0x5b68): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_fwd_prog':
   rcutorture.c:(.text+0x752c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/rcutorture.o: in function `rcu_torture_barrier_cbs':
   rcutorture.c:(.text+0x8a2a): undefined reference to `__tsan_memset'
   s390x-linux-ld: rcutorture.c:(.text+0x8aca): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/rcu/rcutorture.o:rcutorture.c:(.text+0x8e1e): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/dma/swiotlb.o: in function `swiotlb_bounce':
   swiotlb.c:(.text+0x185e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/dma/swiotlb.o: in function `swiotlb_exit':
   swiotlb.c:(.init.text+0x912): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/entry/common.o: in function `trace_event_raw_event_sys_enter':
   common.c:(.text+0x13a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/entry/common.o: in function `trace_event_raw_event_sys_exit':
   common.c:(.text+0x43a): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/entry/common.o: in function `syscall_exit_to_user_mode_work':
   common.c:(.text+0xdb2): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/entry/syscall_user_dispatch.o: in function `syscall_user_dispatch':
   syscall_user_dispatch.c:(.text+0x1c8): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/kcmp.o:kcmp.c:(.text+0x8b0): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/time/timer.o: in function `call_timer_fn':
   timer.c:(.text+0x5d0c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timer.c:(.text+0x5d1e): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/timer.o: in function `schedule_timeout':
   timer.c:(.sched.text+0x32): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/hrtimer.o: in function `__hrtimer_init':
   hrtimer.c:(.text+0x13c): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/hrtimer.o: in function `clock_was_set':
   hrtimer.c:(.text+0x3a2): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/hrtimer.o: in function `hrtimer_nanosleep':
   hrtimer.c:(.text+0x3100): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/hrtimer.o:hrtimer.c:(.text+0x3312): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/time/timekeeping.o: in function `tk_set_wall_to_mono':
   timekeeping.c:(.text+0x3b44): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_update':
   timekeeping.c:(.text+0x3e04): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x3e34): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x3e68): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x3e98): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/time/timekeeping.o:timekeeping.c:(.text+0x3ed0): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_inject_offset':
   timekeeping.c:(.text+0x40ca): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x41de): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/timekeeping.o: in function `read_persistent_clock64':
   timekeeping.c:(.text+0x4e14): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_resume':
   timekeeping.c:(.text+0x51ee): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x5200): undefined reference to `__tsan_memset'
   s390x-linux-ld: kernel/time/timekeeping.o:timekeeping.c:(.text+0x54ca): more undefined references to `__tsan_memset' follow
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_resume':
   timekeeping.c:(.text+0x556c): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x55ea): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x560e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_suspend':
   timekeeping.c:(.text+0x58fc): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x596e): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x59fe): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x5a24): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x5a56): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x5b18): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x5b48): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: timekeeping.c:(.text+0x5b5e): undefined reference to `__tsan_memcpy'
   s390x-linux-ld: kernel/time/timekeeping.o:timekeeping.c:(.text+0x5ba6): more undefined references to `__tsan_memcpy' follow
   s390x-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_advance':
   timekeeping.c:(.text+0x60f8): undefined reference to `__tsan_memset'
   s390x-linux-ld: timekeeping.c:(.text+0x67dc): undefined reference to `__tsan_memset'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--XL0wbiExcla69exK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 6.0.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=160000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_HAVE_KERNEL_UNCOMPRESSED=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_KERNEL_UNCOMPRESSED=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# CONFIG_BPF_PRELOAD is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
# CONFIG_TASK_IO_ACCOUNTING is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKHEADERS=y
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_PRINTK_INDEX=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CPUSETS=y
# CONFIG_PROC_PID_CPUSET is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
# CONFIG_CGROUP_BPF is not set
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_FHANDLE is not set
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
# CONFIG_BUG is not set
# CONFIG_ELF_CORE is not set
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
# CONFIG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_MMU=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_PGSTE=y
CONFIG_AUDIT_ARCH=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_HAVE_LIVEPATCH=y

#
# Processor type and features
#
CONFIG_HAVE_MARCH_Z10_FEATURES=y
CONFIG_HAVE_MARCH_Z196_FEATURES=y
CONFIG_HAVE_MARCH_ZEC12_FEATURES=y
CONFIG_HAVE_MARCH_Z13_FEATURES=y
CONFIG_HAVE_MARCH_Z14_FEATURES=y
CONFIG_HAVE_MARCH_Z15_FEATURES=y
CONFIG_HAVE_MARCH_Z16_FEATURES=y
# CONFIG_MARCH_Z10 is not set
# CONFIG_MARCH_Z196 is not set
# CONFIG_MARCH_ZEC12 is not set
# CONFIG_MARCH_Z13 is not set
# CONFIG_MARCH_Z14 is not set
# CONFIG_MARCH_Z15 is not set
CONFIG_MARCH_Z16=y
CONFIG_MARCH_Z15_TUNE=y
# CONFIG_TUNE_DEFAULT is not set
# CONFIG_TUNE_Z10 is not set
# CONFIG_TUNE_Z196 is not set
# CONFIG_TUNE_ZEC12 is not set
# CONFIG_TUNE_Z13 is not set
# CONFIG_TUNE_Z14 is not set
CONFIG_TUNE_Z15=y
# CONFIG_TUNE_Z16 is not set
CONFIG_64BIT=y
CONFIG_COMMAND_LINE_SIZE=4096
CONFIG_SMP=y
CONFIG_NR_CPUS=64
CONFIG_HOTPLUG_CPU=y
CONFIG_NUMA=y
CONFIG_NODES_SHIFT=1
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_BOOK=y
CONFIG_SCHED_DRAWER=y
CONFIG_SCHED_TOPOLOGY=y
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KERNEL_NOBP=y
# CONFIG_RELOCATABLE is not set
# end of Processor type and features

#
# Memory setup
#
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_MAX_PHYSMEM_BITS=46
# end of Memory setup

#
# I/O subsystem
#
# CONFIG_QDIO is not set
CONFIG_CHSC_SCH=y
CONFIG_SCM_BUS=y
CONFIG_EADM_SCH=y
# end of I/O subsystem

#
# Dump support
#
CONFIG_CRASH_DUMP=y
# end of Dump support

CONFIG_CCW=y
CONFIG_HAVE_PNETID=y

#
# Virtualization
#
CONFIG_PROTECTED_VIRTUALIZATION_GUEST=y
# CONFIG_PFAULT is not set
CONFIG_CMM=y
CONFIG_S390_HYPFS_FS=y
CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_KVM_ASYNC_PF_SYNC=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_HAVE_KVM_INVALID_WAKEUPS=y
CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=y
CONFIG_KVM_S390_UCONTROL=y
CONFIG_S390_GUEST=y
# end of Virtualization

CONFIG_S390_MODULES_SANITY_TEST_HELPERS=y

#
# Selftests
#
# CONFIG_S390_UNWIND_SELFTEST is not set
CONFIG_S390_MODULES_SANITY_TEST=y
# end of Selftests

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_GENERIC_ENTRY=y
CONFIG_JUMP_LABEL=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_USTAT_F_TINODE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_MMU_GATHER_NO_GATHER=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE=y
CONFIG_ARCH_HAS_SCALED_CPUTIME=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_CLONE_BACKWARDS2=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_VDSO_DATA=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
# CONFIG_MODULES is not set
# CONFIG_BLOCK is not set
CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_COMPAT_BRK=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
# CONFIG_COMPACTION is not set
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_TRANSPARENT_HUGEPAGE is not set
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_USERFAULTFD is not set

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_KUNIT_TEST=y
# CONFIG_DAMON_VADDR is not set
CONFIG_DAMON_PADDR=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_RECLAIM=y
# CONFIG_DAMON_LRU_SORT is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
# CONFIG_UNIX is not set
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
CONFIG_XFRM_SUB_POLICY=y
# CONFIG_XFRM_MIGRATE is not set
CONFIG_XFRM_ESP=y
# CONFIG_NET_KEY is not set
CONFIG_XFRM_ESPINTCP=y
# CONFIG_IUCV is not set
CONFIG_AFIUCV=y
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
# CONFIG_IP_MROUTE is not set
CONFIG_SYN_COOKIES=y
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
# CONFIG_INET_AH is not set
CONFIG_INET_ESP=y
CONFIG_INET_ESP_OFFLOAD=y
CONFIG_INET_ESPINTCP=y
# CONFIG_INET_IPCOMP is not set
CONFIG_INET_DIAG=y
CONFIG_INET_TCP_DIAG=y
CONFIG_INET_UDP_DIAG=y
CONFIG_INET_RAW_DIAG=y
CONFIG_INET_DIAG_DESTROY=y
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=y
CONFIG_TCP_CONG_HTCP=y
# CONFIG_TCP_CONG_HSTCP is not set
# CONFIG_TCP_CONG_HYBLA is not set
# CONFIG_TCP_CONG_VEGAS is not set
# CONFIG_TCP_CONG_NV is not set
# CONFIG_TCP_CONG_SCALABLE is not set
# CONFIG_TCP_CONG_LP is not set
# CONFIG_TCP_CONG_VENO is not set
# CONFIG_TCP_CONG_YEAH is not set
CONFIG_TCP_CONG_ILLINOIS=y
CONFIG_TCP_CONG_DCTCP=y
CONFIG_TCP_CONG_CDG=y
# CONFIG_TCP_CONG_BBR is not set
# CONFIG_DEFAULT_CUBIC is not set
# CONFIG_DEFAULT_HTCP is not set
# CONFIG_DEFAULT_WESTWOOD is not set
# CONFIG_DEFAULT_DCTCP is not set
CONFIG_DEFAULT_CDG=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cdg"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
# CONFIG_NETLABEL is not set
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_ADVANCED is not set

#
# Core Netfilter Configuration
#
# CONFIG_NETFILTER_INGRESS is not set
# CONFIG_NETFILTER_EGRESS is not set
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_LOG=y
# CONFIG_NF_CONNTRACK is not set
CONFIG_NF_LOG_SYSLOG=y
CONFIG_NF_TABLES=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=y
CONFIG_NFT_LOG=y
CONFIG_NFT_LIMIT=y
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
CONFIG_NFT_QUOTA=y
CONFIG_NFT_REJECT=y
CONFIG_NFT_COMPAT=y
CONFIG_NFT_HASH=y
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=y
CONFIG_NFT_TPROXY=y
CONFIG_NF_DUP_NETDEV=y
CONFIG_NFT_DUP_NETDEV=y
# CONFIG_NFT_FWD_NETDEV is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=y

#
# Xtables targets
#
# CONFIG_NETFILTER_XT_TARGET_LOG is not set
CONFIG_NETFILTER_XT_TARGET_NFLOG=y
CONFIG_NETFILTER_XT_TARGET_SECMARK=y
# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set

#
# Xtables matches
#
# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
CONFIG_NETFILTER_XT_MATCH_POLICY=y
# end of Core Netfilter Configuration

CONFIG_IP_SET=y
CONFIG_IP_SET_MAX=256
# CONFIG_IP_SET_BITMAP_IP is not set
CONFIG_IP_SET_BITMAP_IPMAC=y
CONFIG_IP_SET_BITMAP_PORT=y
CONFIG_IP_SET_HASH_IP=y
# CONFIG_IP_SET_HASH_IPMARK is not set
# CONFIG_IP_SET_HASH_IPPORT is not set
CONFIG_IP_SET_HASH_IPPORTIP=y
CONFIG_IP_SET_HASH_IPPORTNET=y
CONFIG_IP_SET_HASH_IPMAC=y
CONFIG_IP_SET_HASH_MAC=y
# CONFIG_IP_SET_HASH_NETPORTNET is not set
CONFIG_IP_SET_HASH_NET=y
CONFIG_IP_SET_HASH_NETNET=y
# CONFIG_IP_SET_HASH_NETPORT is not set
CONFIG_IP_SET_HASH_NETIFACE=y
CONFIG_IP_SET_LIST_SET=y
# CONFIG_IP_VS is not set

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=y
CONFIG_NF_SOCKET_IPV4=y
CONFIG_NF_TPROXY_IPV4=y
# CONFIG_NF_TABLES_IPV4 is not set
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=y
CONFIG_NF_LOG_ARP=y
CONFIG_NF_LOG_IPV4=y
CONFIG_NF_REJECT_IPV4=y
# CONFIG_IP_NF_IPTABLES is not set
# end of IP: Netfilter Configuration

# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=y

#
# DCCP CCIDs Configuration
#
CONFIG_IP_DCCP_CCID2_DEBUG=y
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=y
# CONFIG_RDS is not set
CONFIG_TIPC=y
CONFIG_TIPC_MEDIA_UDP=y
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=y
CONFIG_ATM=y
# CONFIG_ATM_CLIP is not set
CONFIG_ATM_LANE=y
CONFIG_ATM_MPOA=y
# CONFIG_ATM_BR2684 is not set
CONFIG_L2TP=y
CONFIG_L2TP_DEBUGFS=y
# CONFIG_L2TP_V3 is not set
CONFIG_STP=y
CONFIG_GARP=y
# CONFIG_BRIDGE is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
# CONFIG_VLAN_8021Q_MVRP is not set
# CONFIG_DECNET is not set
CONFIG_LLC=y
CONFIG_LLC2=y
CONFIG_ATALK=y
CONFIG_DEV_APPLETALK=y
# CONFIG_IPDDP is not set
CONFIG_X25=y
CONFIG_LAPB=y
CONFIG_PHONET=y
# CONFIG_IEEE802154 is not set
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=y
CONFIG_NET_SCH_HTB=y
# CONFIG_NET_SCH_HFSC is not set
CONFIG_NET_SCH_ATM=y
# CONFIG_NET_SCH_PRIO is not set
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=y
CONFIG_NET_SCH_SFB=y
# CONFIG_NET_SCH_SFQ is not set
# CONFIG_NET_SCH_TEQL is not set
CONFIG_NET_SCH_TBF=y
CONFIG_NET_SCH_CBS=y
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
# CONFIG_NET_SCH_GRED is not set
CONFIG_NET_SCH_DSMARK=y
CONFIG_NET_SCH_NETEM=y
# CONFIG_NET_SCH_DRR is not set
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=y
CONFIG_NET_SCH_QFQ=y
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=y
# CONFIG_NET_SCH_FQ is not set
CONFIG_NET_SCH_HHF=y
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_PLUG=y
CONFIG_NET_SCH_ETS=y
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ_CODEL is not set
CONFIG_DEFAULT_PFIFO_FAST=y
CONFIG_DEFAULT_NET_SCH="pfifo_fast"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=y
# CONFIG_NET_CLS_TCINDEX is not set
# CONFIG_NET_CLS_ROUTE4 is not set
CONFIG_NET_CLS_FW=y
# CONFIG_NET_CLS_U32 is not set
CONFIG_NET_CLS_RSVP=y
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=y
# CONFIG_NET_CLS_BPF is not set
CONFIG_NET_CLS_FLOWER=y
CONFIG_NET_CLS_MATCHALL=y
# CONFIG_NET_EMATCH is not set
# CONFIG_NET_CLS_ACT is not set
CONFIG_NET_SCH_FIFO=y
# CONFIG_DCB is not set
CONFIG_DNS_RESOLVER=y
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
CONFIG_VSOCKETS=y
# CONFIG_VSOCKETS_DIAG is not set
CONFIG_VSOCKETS_LOOPBACK=y
CONFIG_VIRTIO_VSOCKETS=y
CONFIG_VIRTIO_VSOCKETS_COMMON=y
# CONFIG_NETLINK_DIAG is not set
# CONFIG_MPLS is not set
# CONFIG_NET_NSH is not set
CONFIG_HSR=y
# CONFIG_NET_SWITCHDEV is not set
# CONFIG_NET_L3_MASTER_DEV is not set
# CONFIG_QRTR is not set
CONFIG_NET_NCSI=y
# CONFIG_NCSI_OEM_CMD_GET_MAC is not set
CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_CAN is not set
CONFIG_AF_RXRPC=y
CONFIG_AF_RXRPC_INJECT_LOSS=y
# CONFIG_AF_RXRPC_DEBUG is not set
CONFIG_RXKAD=y
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
CONFIG_CAIF=y
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=y
CONFIG_CAIF_USB=y
CONFIG_CEPH_LIB=y
CONFIG_CEPH_LIB_PRETTYDEBUG=y
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
# CONFIG_PSAMPLE is not set
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y
CONFIG_NETDEV_ADDR_LIST_TEST=y

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_MHI_BUS=y
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
# CONFIG_OF_UNITTEST is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
CONFIG_ISL29020=y
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
CONFIG_HMC6352=y
# CONFIG_DS1682 is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=y
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
CONFIG_ECHO=y
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

CONFIG_NETDEVICES=y
# CONFIG_NET_CORE is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
CONFIG_CAIF_DRIVERS=y
CONFIG_CAIF_TTY=y
CONFIG_CAIF_VIRTIO=y
CONFIG_ETHERNET=y
# CONFIG_NET_VENDOR_ALACRITECH is not set
CONFIG_ALTERA_TSE=y
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ASIX is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_NET_VENDOR_CORTINA is not set
# CONFIG_NET_VENDOR_DAVICOM is not set
# CONFIG_NET_VENDOR_ENGLEDER is not set
CONFIG_NET_VENDOR_EZCHIP=y
# CONFIG_NET_VENDOR_FUNGIBLE is not set
# CONFIG_NET_VENDOR_GOOGLE is not set
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
CONFIG_NET_VENDOR_WANGXUN=y
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLXSW_CORE=y
CONFIG_MLXSW_I2C=y
CONFIG_MLXSW_MINIMAL=y
CONFIG_MLXFW=y
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_NET_VENDOR_MICROSEMI is not set
# CONFIG_NET_VENDOR_MICROSOFT is not set
# CONFIG_NET_VENDOR_NI is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NET_VENDOR_PENSANDO is not set
# CONFIG_NET_VENDOR_QUALCOMM is not set
# CONFIG_NET_VENDOR_RENESAS is not set
# CONFIG_NET_VENDOR_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_NET_VENDOR_SOCIONEXT=y
# CONFIG_NET_VENDOR_SYNOPSYS is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_XILINX is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
CONFIG_ADIN_PHY=y
CONFIG_ADIN1100_PHY=y
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
CONFIG_BROADCOM_PHY=y
# CONFIG_BCM54140_PHY is not set
CONFIG_BCM7XXX_PHY=y
# CONFIG_BCM84881_PHY is not set
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_BCM_NET_PHYPTP=y
# CONFIG_CICADA_PHY is not set
CONFIG_CORTINA_PHY=y
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=y
# CONFIG_LXT_PHY is not set
CONFIG_INTEL_XWAY_PHY=y
CONFIG_LSI_ET1011C_PHY=y
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88X2222_PHY=y
# CONFIG_MAXLINEAR_GPHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=y
CONFIG_MICROSEMI_PHY=y
CONFIG_MOTORCOMM_PHY=y
CONFIG_NATIONAL_PHY=y
CONFIG_NXP_C45_TJA11XX_PHY=y
CONFIG_QSEMI_PHY=y
# CONFIG_REALTEK_PHY is not set
CONFIG_RENESAS_PHY=y
CONFIG_ROCKCHIP_PHY=y
CONFIG_SMSC_PHY=y
# CONFIG_STE10XP is not set
CONFIG_TERANETICS_PHY=y
CONFIG_DP83822_PHY=y
CONFIG_DP83TC811_PHY=y
# CONFIG_DP83848_PHY is not set
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=y
CONFIG_DP83TD510_PHY=y
# CONFIG_VITESSE_PHY is not set
CONFIG_XILINX_GMII2RGMII=y
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_BITBANG=y
CONFIG_MDIO_GPIO=y

#
# MDIO Multiplexers
#
# CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PPP is not set
CONFIG_SLIP=y
# CONFIG_SLIP_COMPRESSED is not set
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set

#
# S/390 network device drivers
#
# CONFIG_LCS is not set
CONFIG_CTCM=y
CONFIG_CCWGROUP=y
# end of S/390 network device drivers

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WAN=y
CONFIG_HDLC=y
CONFIG_HDLC_RAW=y
# CONFIG_HDLC_RAW_ETH is not set
CONFIG_HDLC_CISCO=y
CONFIG_HDLC_FR=y
# CONFIG_HDLC_PPP is not set
CONFIG_HDLC_X25=y
# CONFIG_LAPBETHER is not set

#
# Wireless WAN
#
CONFIG_WWAN=y
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=y
CONFIG_MHI_WWAN_CTRL=y
CONFIG_MHI_WWAN_MBIM=y
# CONFIG_RPMSG_WWAN_CTRL is not set
# end of Wireless WAN

# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=y

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADI is not set
CONFIG_JOYSTICK_COBRA=y
# CONFIG_JOYSTICK_GF2K is not set
CONFIG_JOYSTICK_GRIP=y
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
# CONFIG_JOYSTICK_IFORCE is not set
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_SERIAL_WACOM4=y
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
CONFIG_TOUCHSCREEN_AR1021_I2C=y
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
CONFIG_TOUCHSCREEN_BU21013=y
# CONFIG_TOUCHSCREEN_BU21029 is not set
CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=y
CONFIG_TOUCHSCREEN_CY8CTMA140=y
CONFIG_TOUCHSCREEN_CY8CTMG110=y
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
CONFIG_TOUCHSCREEN_EETI=y
# CONFIG_TOUCHSCREEN_EGALAX is not set
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=y
CONFIG_TOUCHSCREEN_GOODIX=y
CONFIG_TOUCHSCREEN_HIDEEP=y
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_ILI210X=y
# CONFIG_TOUCHSCREEN_ILITEK is not set
CONFIG_TOUCHSCREEN_S6SY761=y
CONFIG_TOUCHSCREEN_GUNZE=y
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
CONFIG_TOUCHSCREEN_ELAN=y
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
CONFIG_TOUCHSCREEN_MAX11801=y
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
CONFIG_TOUCHSCREEN_MTOUCH=y
CONFIG_TOUCHSCREEN_IMAGIS=y
# CONFIG_TOUCHSCREEN_INEXIO is not set
CONFIG_TOUCHSCREEN_MK712=y
CONFIG_TOUCHSCREEN_PENMOUNT=y
CONFIG_TOUCHSCREEN_EDT_FT5X06=y
CONFIG_TOUCHSCREEN_TOUCHRIGHT=y
CONFIG_TOUCHSCREEN_TOUCHWIN=y
# CONFIG_TOUCHSCREEN_PIXCIR is not set
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
CONFIG_TOUCHSCREEN_RM_TS=y
CONFIG_TOUCHSCREEN_SILEAD=y
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=y
CONFIG_TOUCHSCREEN_STMFTS=y
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=y
CONFIG_TOUCHSCREEN_ZET6223=y
# CONFIG_TOUCHSCREEN_ZFORCE is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=y
CONFIG_TOUCHSCREEN_IQS5XX=y
CONFIG_TOUCHSCREEN_ZINITIX=y
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F30 is not set
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_LIBPS2 is not set
CONFIG_SERIO_RAW=y
CONFIG_SERIO_PS2MULT=y
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
CONFIG_GAMEPORT_L4=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
# CONFIG_CONSOLE_TRANSLATIONS is not set
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
# CONFIG_UNIX98_PTYS is not set
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set
CONFIG_N_GSM=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
# CONFIG_HVC_IUCV is not set
# CONFIG_RPMSG_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_S390=y
# CONFIG_DEVMEM is not set
CONFIG_HANGCHECK_TIMER=y

#
# S/390 character device drivers
#
CONFIG_TN3270=y
CONFIG_TN3270_TTY=y
CONFIG_TN3270_FS=y
CONFIG_TN3270_CONSOLE=y
CONFIG_TN3215=y
# CONFIG_TN3215_CONSOLE is not set
CONFIG_CCW_CONSOLE=y
# CONFIG_SCLP_TTY is not set
CONFIG_SCLP_VT220_TTY=y
CONFIG_SCLP_VT220_CONSOLE=y
# CONFIG_HMC_DRV is not set
CONFIG_SCLP_OFB=y
# CONFIG_S390_UV_UAPI is not set
# CONFIG_S390_TAPE is not set
CONFIG_VMCP=y
CONFIG_VMCP_CMA_SIZE=4
# CONFIG_MONWRITER is not set
# CONFIG_S390_VMUR is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
# CONFIG_XILLYBUS_OF is not set
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
# CONFIG_I2C_HELPER_AUTO is not set
# CONFIG_I2C_SMBUS is not set

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

# CONFIG_I2C_SLAVE is not set
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_MCP23S08 is not set
CONFIG_PINCTRL_SX150X=y

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
CONFIG_GPIO_TPIC2810=y
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_IP5XXX_POWER=y
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2782=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=y
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=y
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_DETECTOR_MAX14656=y
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
CONFIG_CHARGER_BD99954=y
# CONFIG_BATTERY_UG3105 is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

#
# Graphics support
#

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
# end of Console display driver support
# end of Graphics support

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELECOM=y
CONFIG_HID_EZKEY=y
CONFIG_HID_GEMBIRD=y
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=y
CONFIG_HID_WALTOP=y
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_XIAOMI=y
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=y
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NINTENDO=y
# CONFIG_NINTENDO_FF is not set
CONFIG_HID_NTI=y
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=y
CONFIG_HID_PICOLCD_LEDS=y
# CONFIG_HID_PICOLCD_CIR is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PLAYSTATION is not set
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
# CONFIG_HID_STEELSERIES is not set
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
# CONFIG_HID_THINGM is not set
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_WIIMOTE=y
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# I2C HID support
#
CONFIG_I2C_HID_OF=y
CONFIG_I2C_HID_OF_ELAN=y
# CONFIG_I2C_HID_OF_GOODIX is not set
# end of I2C HID support

CONFIG_I2C_HID_CORE=y
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_LM3530=y
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3642=y
# CONFIG_LEDS_LM3692X is not set
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
# CONFIG_LEDS_GPIO is not set
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
# CONFIG_LEDS_LP50XX is not set
# CONFIG_LEDS_LP55XX_COMMON is not set
CONFIG_LEDS_LP8860=y
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_BD2802=y
# CONFIG_LEDS_LT3593 is not set
CONFIG_LEDS_TCA6507=y
CONFIG_LEDS_TLC591XX=y
# CONFIG_LEDS_LM355x is not set
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=y
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_KTD2692 is not set
# CONFIG_LEDS_LM3601X is not set
CONFIG_LEDS_RT4505=y
CONFIG_LEDS_RT8515=y
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
CONFIG_SPEAKUP=y
# CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
CONFIG_SPEAKUP_SYNTH_APOLLO=y
# CONFIG_SPEAKUP_SYNTH_AUDPTR is not set
CONFIG_SPEAKUP_SYNTH_BNS=y
CONFIG_SPEAKUP_SYNTH_DECTLK=y
CONFIG_SPEAKUP_SYNTH_DECEXT=y
CONFIG_SPEAKUP_SYNTH_LTLK=y
CONFIG_SPEAKUP_SYNTH_SOFT=y
CONFIG_SPEAKUP_SYNTH_SPKOUT=y
CONFIG_SPEAKUP_SYNTH_TXPRT=y
# CONFIG_SPEAKUP_SYNTH_DUMMY is not set
# end of Speakup console speech

# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VDPA=y
CONFIG_VDPA_SIM=y
CONFIG_VDPA_SIM_NET=y
CONFIG_VDPA_SIM_BLOCK=y
CONFIG_VDPA_USER=y
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_RING=y
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
CONFIG_COMEDI_ISA_DRIVERS=y
# CONFIG_COMEDI_PCL711 is not set
CONFIG_COMEDI_PCL724=y
CONFIG_COMEDI_PCL726=y
CONFIG_COMEDI_PCL730=y
CONFIG_COMEDI_PCL812=y
# CONFIG_COMEDI_PCL816 is not set
CONFIG_COMEDI_PCL818=y
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=y
# CONFIG_COMEDI_AMPLC_PC236_ISA is not set
CONFIG_COMEDI_AMPLC_PC263_ISA=y
CONFIG_COMEDI_RTI800=y
CONFIG_COMEDI_RTI802=y
# CONFIG_COMEDI_DAC02 is not set
CONFIG_COMEDI_DAS16M1=y
CONFIG_COMEDI_DAS08_ISA=y
CONFIG_COMEDI_DAS16=y
CONFIG_COMEDI_DAS800=y
# CONFIG_COMEDI_DAS1800 is not set
# CONFIG_COMEDI_DAS6402 is not set
# CONFIG_COMEDI_DT2801 is not set
# CONFIG_COMEDI_DT2811 is not set
# CONFIG_COMEDI_DT2814 is not set
# CONFIG_COMEDI_DT2815 is not set
CONFIG_COMEDI_DT2817=y
CONFIG_COMEDI_DT282X=y
CONFIG_COMEDI_DMM32AT=y
CONFIG_COMEDI_FL512=y
# CONFIG_COMEDI_AIO_AIO12_8 is not set
# CONFIG_COMEDI_AIO_IIRO_16 is not set
# CONFIG_COMEDI_C6XDIGIO is not set
# CONFIG_COMEDI_MPC624 is not set
# CONFIG_COMEDI_ADQ12B is not set
CONFIG_COMEDI_NI_AT_A2150=y
CONFIG_COMEDI_NI_AT_AO=y
CONFIG_COMEDI_NI_ATMIO=y
CONFIG_COMEDI_NI_ATMIO16D=y
CONFIG_COMEDI_NI_LABPC_ISA=y
CONFIG_COMEDI_PCMAD=y
CONFIG_COMEDI_PCMDA12=y
# CONFIG_COMEDI_PCMMIO is not set
# CONFIG_COMEDI_PCMUIO is not set
CONFIG_COMEDI_MULTIQ3=y
CONFIG_COMEDI_S526=y
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=y
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_LABPC=y
CONFIG_COMEDI_NI_TIO=y
CONFIG_COMEDI_NI_ROUTING=y
CONFIG_COMEDI_TESTS=y
# CONFIG_COMEDI_TESTS_EXAMPLE is not set
CONFIG_COMEDI_TESTS_NI_ROUTES=y
CONFIG_STAGING=y
# CONFIG_STAGING_MEDIA is not set
CONFIG_GREYBUS_BOOTROM=y
# CONFIG_GREYBUS_HID is not set
# CONFIG_GREYBUS_LIGHT is not set
# CONFIG_GREYBUS_LOG is not set
CONFIG_GREYBUS_LOOPBACK=y
CONFIG_GREYBUS_POWER=y
# CONFIG_GREYBUS_RAW is not set
CONFIG_GREYBUS_VIBRATOR=y
CONFIG_GREYBUS_BRIDGED_PHY=y
# CONFIG_GREYBUS_GPIO is not set
# CONFIG_GREYBUS_I2C is not set
CONFIG_GREYBUS_PWM=y
# CONFIG_GREYBUS_UART is not set
CONFIG_FIELDBUS_DEV=y
CONFIG_HMS_ANYBUSS_BUS=y
CONFIG_HMS_PROFINET=y
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
# CONFIG_MICROCHIP_PIT64B is not set
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
CONFIG_IOMMU_IOVA=y
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
CONFIG_EXTCON_MAX3355=y
CONFIG_EXTCON_PTN5150=y
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
# CONFIG_EXTCON_USB_GPIO is not set
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_ATMEL_TCB=y
CONFIG_PWM_PCA9685=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
# end of IRQ chip support

CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_TI_TPS380X=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_CAN_TRANSCEIVER is not set

#
# PHY drivers for Broadcom platforms
#
# end of PHY drivers for Broadcom platforms
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_DTPM is not set

#
# Performance monitor support
#
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
CONFIG_ANDROID_BINDER_IPC_SELFTEST=y
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
# CONFIG_STM is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_FSI is not set
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
CONFIG_PECI=y
CONFIG_PECI_CPU=y
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_XINO_AUTO=y
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_DEBUG=y
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
# CONFIG_HUGETLBFS is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_CRAMFS=y
# CONFIG_PSTORE is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=y
# CONFIG_NFS_V4_1 is not set
# CONFIG_NFS_FSCACHE is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFSD=y
# CONFIG_NFSD_V3_ACL is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_CEPH_FS=y
# CONFIG_CEPH_FSCACHE is not set
# CONFIG_CEPH_FS_POSIX_ACL is not set
CONFIG_CEPH_FS_SECURITY_LABEL=y
CONFIG_CIFS=y
# CONFIG_CIFS_STATS2 is not set
# CONFIG_CIFS_ALLOW_INSECURE_LEGACY is not set
# CONFIG_CIFS_UPCALL is not set
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_DEBUG=y
CONFIG_CIFS_DEBUG2=y
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_FSCACHE is not set
CONFIG_SMB_SERVER=y
CONFIG_SMB_SERVER_CHECK_CAP_NET_ADMIN=y
# CONFIG_SMB_SERVER_KERBEROS5 is not set
CONFIG_SMBFS_COMMON=y
CONFIG_CODA_FS=y
CONFIG_AFS_FS=y
CONFIG_AFS_DEBUG=y
# CONFIG_AFS_FSCACHE is not set
CONFIG_AFS_DEBUG_CURSOR=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
CONFIG_NLS_CODEPAGE_850=y
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
CONFIG_NLS_CODEPAGE_950=y
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=y
CONFIG_NLS_UTF8=y
CONFIG_DLM=y
CONFIG_DLM_DEPRECATED_API=y
# CONFIG_DLM_DEBUG is not set
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_BIG_KEYS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_KEY_NOTIFICATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_LSM_MMAP_MIN_ADDR=65536
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
# CONFIG_SECURITY_SELINUX_DISABLE is not set
# CONFIG_SECURITY_SELINUX_DEVELOP is not set
# CONFIG_SECURITY_SELINUX_AVC_STATS is not set
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=0
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_DEBUG=y
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS=y
CONFIG_SECURITY_APPARMOR_DEBUG_MESSAGES=y
CONFIG_SECURITY_APPARMOR_INTROSPECT_POLICY=y
CONFIG_SECURITY_APPARMOR_HASH=y
# CONFIG_SECURITY_APPARMOR_HASH_DEFAULT is not set
# CONFIG_SECURITY_APPARMOR_EXPORT_BINARY is not set
# CONFIG_SECURITY_APPARMOR_PARANOID_LOAD is not set
CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
# CONFIG_SECURITY_YAMA is not set
CONFIG_SECURITY_SAFESETID=y
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_NG_TEMPLATE is not set
CONFIG_IMA_SIG_TEMPLATE=y
CONFIG_IMA_DEFAULT_TEMPLATE="ima-sig"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH_SM3=y
CONFIG_IMA_DEFAULT_HASH="sm3"
# CONFIG_IMA_WRITE_POLICY is not set
CONFIG_IMA_READ_POLICY=y
CONFIG_IMA_APPRAISE=y
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_IMA_DISABLE_HTABLE=y
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization

CONFIG_CC_HAS_RANDSTRUCT=y
CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
# CONFIG_CRYPTO_FIPS is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
# CONFIG_CRYPTO_CRYPTD is not set
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=y

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
# CONFIG_CRYPTO_DH is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=y
# CONFIG_CRYPTO_XTS is not set
# CONFIG_CRYPTO_KEYWRAP is not set
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_ADIANTUM=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=y
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_CRC32_S390 is not set
# CONFIG_CRYPTO_XXHASH is not set
# CONFIG_CRYPTO_BLAKE2B is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
# CONFIG_CRYPTO_SHA512_S390 is not set
CONFIG_CRYPTO_SHA1_S390=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA256_S390=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SHA3_256_S390=y
CONFIG_CRYPTO_SHA3_512_S390=y
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
# CONFIG_CRYPTO_STREEBOG is not set
# CONFIG_CRYPTO_WP512 is not set
# CONFIG_CRYPTO_GHASH_S390 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_AES_S390=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARC4=y
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_DES_S390 is not set
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA_S390=y
CONFIG_CRYPTO_SEED=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
# CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=y
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
# CONFIG_CRC8 is not set
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
# CONFIG_ZLIB_DFLTCC is not set
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_CMA is not set
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_REF_TRACKER=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_VMLINUX_MAP=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_UBSAN_TRAP=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
# CONFIG_UBSAN_LOCAL_BOUNDS is not set
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_UNREACHABLE is not set
CONFIG_UBSAN_BOOL=y
# CONFIG_UBSAN_ENUM is not set
CONFIG_UBSAN_SANITIZE_ALL=y
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
CONFIG_KCSAN=y
CONFIG_CC_HAS_TSAN_COMPOUND_READ_BEFORE_WRITE=y
# CONFIG_KCSAN_VERBOSE is not set
CONFIG_KCSAN_SELFTEST=y
CONFIG_KCSAN_KUNIT_TEST=y
CONFIG_KCSAN_EARLY_ENABLE=y
CONFIG_KCSAN_NUM_WATCHPOINTS=64
CONFIG_KCSAN_UDELAY_TASK=80
CONFIG_KCSAN_UDELAY_INTERRUPT=20
CONFIG_KCSAN_DELAY_RANDOMIZE=y
CONFIG_KCSAN_SKIP_WATCH=4000
CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=y
CONFIG_KCSAN_INTERRUPT_WATCHER=y
CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
# CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN is not set
# CONFIG_KCSAN_STRICT is not set
CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY=y
CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y
# CONFIG_KCSAN_IGNORE_ATOMICS is not set
CONFIG_KCSAN_PERMISSIVE=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
# CONFIG_NET_NS_REFCNT_TRACKER is not set
# CONFIG_DEBUG_NET is not set
# end of Networking Debugging

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
# CONFIG_PAGE_OWNER is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
# CONFIG_DEBUG_OBJECTS_FREE is not set
CONFIG_DEBUG_OBJECTS_TIMERS=y
# CONFIG_DEBUG_OBJECTS_WORK is not set
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
# CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_INFO=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
CONFIG_DEBUG_LOCKDEP=y
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
# CONFIG_WW_MUTEX_SELFTEST is not set
CONFIG_SCF_TORTURE_TEST=y
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y
CONFIG_DEBUG_KOBJECT_RELEASE=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_NOP_MCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
# CONFIG_FUNCTION_TRACER is not set
# CONFIG_STACK_TRACER is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_TRACE_BRANCH_PROFILING=y
# CONFIG_BRANCH_PROFILE_NONE is not set
CONFIG_PROFILE_ANNOTATED_BRANCHES=y
# CONFIG_PROFILE_ALL_BRANCHES is not set
# CONFIG_BRANCH_TRACER is not set
# CONFIG_UPROBE_EVENTS is not set
CONFIG_DYNAMIC_EVENTS=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
CONFIG_TRACE_EVENT_INJECT=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
# CONFIG_RING_BUFFER_BENCHMARK is not set
CONFIG_TRACE_EVAL_MAP_FILE=y
CONFIG_FTRACE_SELFTEST=y
CONFIG_FTRACE_STARTUP_TEST=y
# CONFIG_EVENT_TRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
CONFIG_SYNTH_EVENT_GEN_TEST=y
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_RV=y
# CONFIG_RV_MON_WWNR is not set
CONFIG_RV_REACTORS=y
CONFIG_RV_REACT_PRINTK=y
CONFIG_RV_REACT_PANIC=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# s390 Debugging
#
CONFIG_EARLY_PRINTK=y
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_CIO_INJECT is not set
# end of s390 Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
# CONFIG_KCOV_INSTRUMENT_ALL is not set
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=y
CONFIG_CPUMASK_KUNIT_TEST=y
CONFIG_TEST_LIST_SORT=y
# CONFIG_TEST_MIN_HEAP is not set
CONFIG_TEST_SORT=y
CONFIG_TEST_DIV64=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_TEST_REF_TRACKER=y
# CONFIG_RBTREE_TEST is not set
CONFIG_REED_SOLOMON_TEST=y
CONFIG_INTERVAL_TREE_TEST=y
# CONFIG_ATOMIC64_SELFTEST is not set
CONFIG_TEST_HEXDUMP=y
CONFIG_STRING_SELFTEST=y
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=y
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=y
CONFIG_TEST_XARRAY=y
CONFIG_TEST_RHASHTABLE=y
CONFIG_TEST_SIPHASH=y
CONFIG_TEST_IDA=y
CONFIG_FIND_BIT_BENCHMARK=y
# CONFIG_TEST_FIRMWARE is not set
CONFIG_BITFIELD_KUNIT=y
CONFIG_HASH_KUNIT_TEST=y
CONFIG_RESOURCE_KUNIT_TEST=y
CONFIG_SYSCTL_KUNIT_TEST=y
CONFIG_LIST_KUNIT_TEST=y
# CONFIG_LINEAR_RANGES_TEST is not set
CONFIG_CMDLINE_KUNIT_TEST=y
CONFIG_BITS_TEST=y
CONFIG_MEMCPY_KUNIT_TEST=y
CONFIG_OVERFLOW_KUNIT_TEST=y
CONFIG_STACKINIT_KUNIT_TEST=y
CONFIG_TEST_UDELAY=y
CONFIG_TEST_MEMCAT_P=y
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--XL0wbiExcla69exK--
