Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F579C7;
	Tue, 21 Mar 2023 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679389162; x=1710925162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cM67bWA7EAbckCmuagzTgc7V8T84qG4be43lSHcE2PE=;
  b=Y6Ut593uh4Lpe5rNE3WOD/L+h9opMjw6gj/uaISslgniL9T0siqdzrfD
   wyEeAfEKoLMrrEVZrsb3YefTmgEXVRW5KScNHFkdhR1ZW+oROi2hKBP/O
   kuB+/uC63Fj7fKeRn0EP2kUE92DBsQj+3/GcHarfXjAj6zDsH6iyVl8Ig
   +boXliPjXFB72l2F+RNXHyvypJZ4uo6dPulWLXw4hwn8jN418o6XjbWoX
   BU2M4Er5E9s7lNqVQFjaW3vO/Wjw18+n+Tu0H21glgC5mAMvr1x8hCG2B
   ifgRX1+Fd12qbKTZH6M0/N7i9STVXfXOe6uwMboZSfPh7xr+umU6j2PE9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318538247"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="318538247"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 01:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791990488"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="791990488"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 01:59:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peXpw-000BmQ-1K;
	Tue, 21 Mar 2023 08:59:20 +0000
Date: Tue, 21 Mar 2023 16:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 10/10]
 include/linux/perf_event.h:1876:1: error: function cannot return function
 type 'typeof(perf_snapshot_branch_stack_t)' (aka 'int (struct
 perf_branch_entry *, unsigned int)')
Message-ID: <202303211629.2X5K8Keh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   c3e6a1df113158f0064708092d043906341d560a
commit: b16845ccaeaedbd22fa17eda3037baf1fa7bbe4c [10/10] static_call,arm64: Fix CFI_CLANG + !HAVE_STATIC_CALL incompatibility
config: arm64-randconfig-r021-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211629.2X5K8Keh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=b16845ccaeaedbd22fa17eda3037baf1fa7bbe4c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout b16845ccaeaedbd22fa17eda3037baf1fa7bbe4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211629.2X5K8Keh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:36:
   In file included from include/kvm/arm_pmu.h:10:
>> include/linux/perf_event.h:1876:1: error: function cannot return function type 'typeof(perf_snapshot_branch_stack_t)' (aka 'int (struct perf_branch_entry *, unsigned int)')
   DECLARE_STATIC_CALL(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
   ^
   include/linux/static_call.h:138:2: note: expanded from macro 'DECLARE_STATIC_CALL'
           __DECLARE_STATIC_CALL_CFI(name, func)
           ^
   include/linux/static_call.h:311:43: note: expanded from macro '__DECLARE_STATIC_CALL_CFI'
           extern typeof(func) __STATIC_CALL_NOP_CFI(name);                \
                                                    ^
   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:36:
   In file included from include/kvm/arm_pmu.h:10:
>> include/linux/perf_event.h:1876:21: error: a parameter list without types is only allowed in a function definition
   DECLARE_STATIC_CALL(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
                       ^
>> include/linux/perf_event.h:1876:1: error: function cannot return function type 'typeof(perf_snapshot_branch_stack_t)' (aka 'int (struct perf_branch_entry *, unsigned int)')
   DECLARE_STATIC_CALL(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
   ^
   include/linux/static_call.h:138:2: note: expanded from macro 'DECLARE_STATIC_CALL'
           __DECLARE_STATIC_CALL_CFI(name, func)
           ^
   include/linux/static_call.h:312:44: note: expanded from macro '__DECLARE_STATIC_CALL_CFI'
           extern typeof(func) __STATIC_CALL_RET0_CFI(name)
                                                     ^
   In file included from arch/arm64/kernel/asm-offsets.c:16:
   In file included from include/linux/kvm_host.h:45:
   In file included from arch/arm64/include/asm/kvm_host.h:36:
   In file included from include/kvm/arm_pmu.h:10:
>> include/linux/perf_event.h:1876:21: error: a parameter list without types is only allowed in a function definition
   DECLARE_STATIC_CALL(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
                       ^
   4 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1876 include/linux/perf_event.h

51b646b2d9f84d Peter Zijlstra 2020-10-09  1855  
c22ac2a3d4bd83 Song Liu       2021-09-10  1856  /*
c22ac2a3d4bd83 Song Liu       2021-09-10  1857   * Snapshot branch stack on software events.
c22ac2a3d4bd83 Song Liu       2021-09-10  1858   *
c22ac2a3d4bd83 Song Liu       2021-09-10  1859   * Branch stack can be very useful in understanding software events. For
c22ac2a3d4bd83 Song Liu       2021-09-10  1860   * example, when a long function, e.g. sys_perf_event_open, returns an
c22ac2a3d4bd83 Song Liu       2021-09-10  1861   * errno, it is not obvious why the function failed. Branch stack could
c22ac2a3d4bd83 Song Liu       2021-09-10  1862   * provide very helpful information in this type of scenarios.
c22ac2a3d4bd83 Song Liu       2021-09-10  1863   *
c22ac2a3d4bd83 Song Liu       2021-09-10  1864   * On software event, it is necessary to stop the hardware branch recorder
c22ac2a3d4bd83 Song Liu       2021-09-10  1865   * fast. Otherwise, the hardware register/buffer will be flushed with
c22ac2a3d4bd83 Song Liu       2021-09-10  1866   * entries of the triggering event. Therefore, static call is used to
c22ac2a3d4bd83 Song Liu       2021-09-10  1867   * stop the hardware recorder.
c22ac2a3d4bd83 Song Liu       2021-09-10  1868   */
c22ac2a3d4bd83 Song Liu       2021-09-10  1869  
c22ac2a3d4bd83 Song Liu       2021-09-10  1870  /*
c22ac2a3d4bd83 Song Liu       2021-09-10  1871   * cnt is the number of entries allocated for entries.
c22ac2a3d4bd83 Song Liu       2021-09-10  1872   * Return number of entries copied to .
c22ac2a3d4bd83 Song Liu       2021-09-10  1873   */
c22ac2a3d4bd83 Song Liu       2021-09-10  1874  typedef int (perf_snapshot_branch_stack_t)(struct perf_branch_entry *entries,
c22ac2a3d4bd83 Song Liu       2021-09-10  1875  					   unsigned int cnt);
c22ac2a3d4bd83 Song Liu       2021-09-10 @1876  DECLARE_STATIC_CALL(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
c22ac2a3d4bd83 Song Liu       2021-09-10  1877  

:::::: The code at line 1876 was first introduced by commit
:::::: c22ac2a3d4bd83411ebf0b1726e9e5fc4f5e7ebf perf: Enable branch record for software events

:::::: TO: Song Liu <songliubraving@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
