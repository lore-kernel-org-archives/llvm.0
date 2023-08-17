Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478E638;
	Thu, 17 Aug 2023 03:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692244274; x=1723780274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yZfgjuR8TyRHxDKxLFVns2Sc+NHfA9nImCmP5vX4I30=;
  b=ShBmuuj/k/8L8xXJDdaNhY+fqmmKuh5u3kgJMNgkSZLgB1ivcY4HElMF
   N+kBli1ihozkzYfwe31pJBGkN7mTx3OMp97xs08tGRfidrUaDmzBaB0j3
   MOIckPm1H9krJc37y8zCDqMtep6JXLWuEF9OluW/J3UdVXyMo6jo/Pi9X
   rQ75XaRlDRuMsLRudHf5gShGWTGqaX/KshPrwvlwy1ivv2gUfJXi0ajVM
   LJL3Kp/I8hXCz4jsnqAw9hqmGV6T+/mih0zAZcHQ1xGAEa2p6otypKDS4
   wVdQ8GYaReLecYsoUoZHe9ptbQLLF6RITYZyYnZQj7d8F+Vxr/RH3bjs4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353020848"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353020848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 20:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763875569"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="763875569"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Aug 2023 20:51:11 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWU2R-0000lz-0t;
	Thu, 17 Aug 2023 03:51:11 +0000
Date: Thu, 17 Aug 2023 11:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_dl_files 14/19] ld.lld: error: duplicate symbol:
 __tracepoint_devlink_hwmsg
Message-ID: <202308171135.7MOBGv6h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_dl_files
head:   00a5b9621f0bc27e4f004dc027f187a5ef824a53
commit: 0ff7fc74219efe0060acfa60c1e2d9029b8efbd9 [14/19] devlink: push trap related code into separate file
config: i386-buildonly-randconfig-r006-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171135.7MOBGv6h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171135.7MOBGv6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171135.7MOBGv6h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __tracepoint_devlink_hwmsg
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__tracepoint_devlink_hwmsg) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(__tracepoints+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_devlink_hwmsg
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__SCT__tp_func_devlink_hwmsg) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(.static_call.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_devlink_health_recover_aborted
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__SCT__tp_func_devlink_health_recover_aborted) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(.static_call.text+0x18) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __traceiter_devlink_health_recover_aborted
   >>> defined at devlink.h:112 (include/trace/events/devlink.h:112)
   >>>            net/devlink/leftover.o:(__traceiter_devlink_health_recover_aborted) in archive vmlinux.a
   >>> defined at devlink.h:112 (include/trace/events/devlink.h:112)
   >>>            net/devlink/trap.o:(.text+0x100) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __tracepoint_devlink_health_reporter_state_update
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__tracepoint_devlink_health_reporter_state_update) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(__tracepoints+0xA0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_devlink_health_reporter_state_update
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__SCT__tp_func_devlink_health_reporter_state_update) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(.static_call.text+0x20) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __traceiter_devlink_health_reporter_state_update
   >>> defined at devlink.h:146 (include/trace/events/devlink.h:146)
   >>>            net/devlink/leftover.o:(__traceiter_devlink_health_reporter_state_update) in archive vmlinux.a
   >>> defined at devlink.h:146 (include/trace/events/devlink.h:146)
   >>>            net/devlink/trap.o:(.text+0x160) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __tracepoint_devlink_trap_report
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__tracepoint_devlink_trap_report) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(__tracepoints+0xC8) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_devlink_trap_report
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__SCT__tp_func_devlink_trap_report) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(.static_call.text+0x28) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __traceiter_devlink_trap_report
   >>> defined at devlink.h:177 (include/trace/events/devlink.h:177)
   >>>            net/devlink/leftover.o:(__traceiter_devlink_trap_report) in archive vmlinux.a
   >>> defined at devlink.h:177 (include/trace/events/devlink.h:177)
   >>>            net/devlink/trap.o:(.text+0x1C0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_devlink_trap_report
   >>> defined at leftover.c
   >>>            net/devlink/leftover.o:(__SCK__tp_func_devlink_trap_report) in archive vmlinux.a
   >>> defined at trap.c
   >>>            net/devlink/trap.o:(.data+0x14) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
