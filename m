Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B3DA93A;
	Thu, 23 Mar 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679586595; x=1711122595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgAkob/Z48KbaDgCIXndDzrtMp/Smh5x57zGttss1MM=;
  b=TIhnuaMRxhwDAtLC50OWKWo6GfRzGS1mdVUrtdHi+a9izY24Dzf2ciiI
   OQnIsxjWxy7AExg5k+zP/EJFD4E4+uDNwNpOP0FOG00wxP1AyWQCwoJb4
   j2mzhXhEAjSQKpL7CO2/vSG1ejAzjuYvTfPjqBi4Q0yB6E2t4QVdXE9+a
   HjPKNL+V72mDsraN+l5iFf2yG1fL8yKBa4RkRBQQFi+5LUIsGLQhTZ7AJ
   3ZRv0RLYouMjYJQo6njyCT1lYiFxJb1uwkjBZV0z+aUJSkI7scDxbT4kr
   wXcBVpKdNmGrEgvGLm6ZFsRv1tTsqPWIKXztC3Bde3YPQezbUnKOXn2Hq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319183619"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="319183619"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 08:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684797693"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684797693"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 08:49:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfNC0-000EUr-0V;
	Thu, 23 Mar 2023 15:49:32 +0000
Date: Thu, 23 Mar 2023 23:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:smp/core 9/13] ld.lld: error: duplicate symbol:
 __tracepoint_ipi_raise
Message-ID: <202303232336.xsAJnXKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git smp/core
head:   6ce99af1c9685e7dd788092089a03e75612bd6ed
commit: dac32ddd3c4f2d55f9df1d64a0a93993d10f6978 [9/13] treewide: Trace IPIs sent via smp_send_reschedule()
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230323/202303232336.xsAJnXKe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=dac32ddd3c4f2d55f9df1d64a0a93993d10f6978
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue smp/core
        git checkout dac32ddd3c4f2d55f9df1d64a0a93993d10f6978
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232336.xsAJnXKe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __tracepoint_ipi_raise
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            virt/kvm/kvm_main.o:(__tracepoint_ipi_raise) in archive vmlinux.a
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            kernel/smp.o:(__tracepoints+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_ipi_raise
   >>> defined at kvm_main.c
   >>>            virt/kvm/kvm_main.o:(__SCT__tp_func_ipi_raise) in archive vmlinux.a
   >>> defined at smp.c
   >>>            kernel/smp.o:(.static_call.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_ipi_exit
   >>> defined at kvm_main.c
   >>>            virt/kvm/kvm_main.o:(__SCT__tp_func_ipi_exit) in archive vmlinux.a
   >>> defined at smp.c
   >>>            kernel/smp.o:(.static_call.text+0x18) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __traceiter_ipi_exit
   >>> defined at ipi.h:102 (include/trace/events/ipi.h:102)
   >>>            virt/kvm/kvm_main.o:(__traceiter_ipi_exit) in archive vmlinux.a
   >>> defined at ipi.h:102 (include/trace/events/ipi.h:102)
   >>>            kernel/smp.o:(.text+0x250) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_ipi_raise
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            virt/kvm/kvm_main.o:(__SCK__tp_func_ipi_raise) in archive vmlinux.a
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            kernel/smp.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_ipi_send_cpumask
   >>> defined at ipi.h:38 (include/trace/events/ipi.h:38)
   >>>            virt/kvm/kvm_main.o:(__SCK__tp_func_ipi_send_cpumask) in archive vmlinux.a
   >>> defined at ipi.h:38 (include/trace/events/ipi.h:38)
   >>>            kernel/smp.o:(.data+0x10) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_ipi_entry
   >>> defined at ipi.h:86 (include/trace/events/ipi.h:86)
   >>>            virt/kvm/kvm_main.o:(__SCK__tp_func_ipi_entry) in archive vmlinux.a
   >>> defined at ipi.h:86 (include/trace/events/ipi.h:86)
   >>>            kernel/smp.o:(.data+0x20) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCK__tp_func_ipi_exit
   >>> defined at ipi.h:102 (include/trace/events/ipi.h:102)
   >>>            virt/kvm/kvm_main.o:(__SCK__tp_func_ipi_exit) in archive vmlinux.a
   >>> defined at ipi.h:102 (include/trace/events/ipi.h:102)
   >>>            kernel/smp.o:(.data+0x30) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __traceiter_ipi_raise
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            virt/kvm/kvm_main.o:(__traceiter_ipi_raise) in archive vmlinux.a
   >>> defined at ipi.h:19 (include/trace/events/ipi.h:19)
   >>>            kernel/smp.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __tracepoint_ipi_send_cpumask
   >>> defined at ipi.h:38 (include/trace/events/ipi.h:38)
   >>>            virt/kvm/kvm_main.o:(__tracepoint_ipi_send_cpumask) in archive vmlinux.a
   >>> defined at ipi.h:38 (include/trace/events/ipi.h:38)
   >>>            kernel/smp.o:(__tracepoints+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __SCT__tp_func_ipi_send_cpumask
   >>> defined at kvm_main.c
   >>>            virt/kvm/kvm_main.o:(__SCT__tp_func_ipi_send_cpumask) in archive vmlinux.a
   >>> defined at smp.c
   >>>            kernel/smp.o:(.static_call.text+0x8) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
