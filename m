Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1E17F1;
	Fri, 20 Jan 2023 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674212129; x=1705748129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5OFwdc32M+Xwi1ux8ZfnG2qm4l89aFvXeqk1Ei4yuCU=;
  b=mkGVYkzMYcDTsB8zVTKnGkOcyllgC4JKzSD/l3ExwaQPW53fFAeJlDVX
   U5NwOax41ZnP6muAa/uRuw0qplinufT8MH4kQo6VjjdXZYJeuB63AzLRl
   /K8TFIkXANZ19Ga5eCdCdySu5qTeRscuTpKpWFsGnIa+vzv36saHhVK1a
   BWjZ3UlqCvg+udnIXogyN65RdQK+stcXHi1CYjouqu1xE+xr1HprA9t0G
   ATH5tN6lC32Vjfcwb/p7rNTUXts+LU8B1FcNCw/I3+2/A+qtrP1UH09Gi
   DHhRuaUAmlxIz/0gaQ5rK1fFKb8StaYMdNxBZ1rN3bDZnHRaCzxFLsnEn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323243808"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="323243808"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="653754079"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="653754079"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2023 02:54:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIp2u-0002UK-0K;
	Fri, 20 Jan 2023 10:54:56 +0000
Date: Fri, 20 Jan 2023 18:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: [madvenka786:orc_v3 20/21] include/linux/ftrace.h:119:6: error:
 expected identifier or '('
Message-ID: <202301201855.ORACPe0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   a0c212ed0823caa5a7ec431d3a5ec07b46964384
commit: 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738 [20/21] arm64: Miscellaneous changes required for enabling livepatch
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230120/202301201855.ORACPe0m-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/madvenka786/linux/commit/1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/fsi/fsi-core.c:96:
   In file included from include/trace/events/fsi.h:214:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from drivers/fsi/fsi-core.c:96:
   In file included from include/trace/events/fsi.h:214:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   2 errors generated.
--
   In file included from net/sunrpc/sched.c:25:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:753:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2370:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from net/sunrpc/sched.c:31:
   In file included from include/trace/events/sunrpc.h:2370:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   1 warning and 2 errors generated.
--
   In file included from drivers/acpi/processor_idle.c:24:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from drivers/acpi/processor_idle.c:24:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   drivers/acpi/processor_idle.c:1101:12: warning: no previous prototype for function 'acpi_processor_ffh_lpi_probe' [-Wmissing-prototypes]
   int __weak acpi_processor_ffh_lpi_probe(unsigned int cpu)
              ^
   drivers/acpi/processor_idle.c:1101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak acpi_processor_ffh_lpi_probe(unsigned int cpu)
   ^
   static 
   drivers/acpi/processor_idle.c:1170:12: warning: no previous prototype for function 'acpi_processor_ffh_lpi_enter' [-Wmissing-prototypes]
   int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
              ^
   drivers/acpi/processor_idle.c:1170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
   ^
   static 
   2 warnings and 2 errors generated.
--
   In file included from kernel/sched/fair.c:55:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/sched/fair.c:55:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   kernel/sched/fair.c:673:5: warning: no previous prototype for function 'sched_update_scaling' [-Wmissing-prototypes]
   int sched_update_scaling(void)
       ^
   kernel/sched/fair.c:673:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_update_scaling(void)
   ^
   static 
   1 warning and 2 errors generated.
--
   In file included from drivers/dma/idxd/init.c:23:
   In file included from drivers/dma/idxd/idxd.h:15:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from drivers/dma/idxd/init.c:23:
   In file included from drivers/dma/idxd/idxd.h:15:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   drivers/dma/idxd/init.c:642:45: warning: shift count >= width of type [-Wshift-count-overflow]
           rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
                                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 2 errors generated.
--
   In file included from kernel/time/hrtimer.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/time/hrtimer.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   kernel/time/hrtimer.c:120:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
                                     ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           [CLOCK_TAI]             = HRTIMER_BASE_TAI,
                                     ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:118:27: note: previous initialization is here
           [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
                                     ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings and 2 errors generated.
--
   In file included from kernel/time/posix-stubs.c:13:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/time/posix-stubs.c:13:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   kernel/time/posix-stubs.c:25:17: warning: no previous prototype for function 'sys_ni_posix_timers' [-Wmissing-prototypes]
   asmlinkage long sys_ni_posix_timers(void)
                   ^
   kernel/time/posix-stubs.c:25:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage long sys_ni_posix_timers(void)
              ^
              static 
   1 warning and 2 errors generated.
--
   In file included from kernel/events/core.c:34:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/events/core.c:34:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   In file included from kernel/events/core.c:43:
   include/linux/mman.h:154:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:132:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from kernel/sysctl.c:52:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/sysctl.c:52:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   In file included from kernel/sysctl.c:54:
   In file included from include/linux/nfs_fs.h:31:
   In file included from include/linux/sunrpc/auth.h:13:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:753:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from kernel/signal.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   arch/x86/include/asm/ftrace.h:65:2: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
           ^
   In file included from kernel/signal.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
>> include/linux/ftrace.h:119:6: error: expected identifier or '('
   arch/x86/include/asm/ftrace.h:65:35: note: expanded from macro 'ftrace_instruction_pointer_set'
           do { (fregs)->regs.ip = (_ip); } while (0)
                                            ^
   kernel/signal.c:137:37: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: ready  = signal->sig[3] &~ blocked->sig[3];
                                              ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:137:19: warning: array index 3 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 4: ready  = signal->sig[3] &~ blocked->sig[3];
                            ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:138:30: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   ready |= signal->sig[2] &~ blocked->sig[2];
                                              ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:138:12: warning: array index 2 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   ready |= signal->sig[2] &~ blocked->sig[2];
                            ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:139:30: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   ready |= signal->sig[1] &~ blocked->sig[1];
                                              ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:139:12: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
                   ready |= signal->sig[1] &~ blocked->sig[1];
                            ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:143:37: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 2: ready  = signal->sig[1] &~ blocked->sig[1];
                                              ^            ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   kernel/signal.c:143:19: warning: array index 1 is past the end of the array (which contains 1 element) [-Warray-bounds]
           case 2: ready  = signal->sig[1] &~ blocked->sig[1];
                            ^           ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   8 warnings and 2 errors generated.
..


vim +119 include/linux/ftrace.h

   113	
   114	/*
   115	 * ftrace_instruction_pointer_set() is to be defined by the architecture
   116	 * if to allow setting of the instruction pointer from the ftrace_regs
   117	 * to support live kernel patching.
   118	 */
 > 119	void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
   120					    unsigned long pc);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
