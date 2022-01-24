Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4F173
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643014649; x=1674550649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7sd5PogBaRcqPkb30zcpAbnKRuKI3zOjGkgVhLXRSEw=;
  b=biBVvbX8hDe6K7Wefve+VTplHJo6/o8kKP/ZKgRZExNzXC5H5bxZ7hMK
   Bwq/R5OJDZ8gB/S9l8Rtw3YqxnEXiqfyY/aFVjNX3xHkj0dIOug4iuBty
   HwgRQlqcPJn4Vu6NkyHJ05pdoUWepDPimj5Hzodgo5yZ1M3Zp6GHTGsWW
   ZxnbPoWHG8fGvEyisq9Du4W24rBgnsIemKEexkpOn95ptXPUbSN7m3nCz
   S0kIIPi2j+I1yAwsWWup6ffNR/J4T08siJdhdMRla66pwLNZnnt0W+D1e
   AwFizaK1lN+jm5kgRguAUzhOceoE/1QNpEyM6hHA+qcmRqgfGLhI5VsrG
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245944956"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="245944956"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 00:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="768614027"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2022 00:57:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBvAC-000I3x-HA; Mon, 24 Jan 2022 08:57:24 +0000
Date: Mon, 24 Jan 2022 16:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V1 01/11] perf: Consolidate branch sample filter helpers
Message-ID: <202201241639.ksLTFBFO-lkp@intel.com>
References: <1642998653-21377-2-git-send-email-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642998653-21377-2-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/master linux/master linus/master v5.17-rc1 next-20220124]
[cannot apply to tip/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220124-123403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: hexagon-randconfig-r031-20220124 (https://download.01.org/0day-ci/archive/20220124/202201241639.ksLTFBFO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9006bf424847bf91f0a624ffc27ad165c7b804c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/896e736b386a6365048d447a32149f03c2544d47
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220124-123403
        git checkout 896e736b386a6365048d447a32149f03c2544d47
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash arch/hexagon/mm/ drivers/char/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/hexagon/mm/vm_fault.c:21:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   arch/hexagon/mm/vm_fault.c:36:6: warning: no previous prototype for function 'do_page_fault' [-Wmissing-prototypes]
   void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
        ^
   arch/hexagon/mm/vm_fault.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void do_page_fault(unsigned long address, long cause, struct pt_regs *regs)
   ^
   static 
   arch/hexagon/mm/vm_fault.c:162:6: warning: no previous prototype for function 'read_protection_fault' [-Wmissing-prototypes]
   void read_protection_fault(struct pt_regs *regs)
        ^
   arch/hexagon/mm/vm_fault.c:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void read_protection_fault(struct pt_regs *regs)
   ^
   static 
   arch/hexagon/mm/vm_fault.c:169:6: warning: no previous prototype for function 'write_protection_fault' [-Wmissing-prototypes]
   void write_protection_fault(struct pt_regs *regs)
        ^
   arch/hexagon/mm/vm_fault.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void write_protection_fault(struct pt_regs *regs)
   ^
   static 
   arch/hexagon/mm/vm_fault.c:176:6: warning: no previous prototype for function 'execute_protection_fault' [-Wmissing-prototypes]
   void execute_protection_fault(struct pt_regs *regs)
        ^
   arch/hexagon/mm/vm_fault.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void execute_protection_fault(struct pt_regs *regs)
   ^
   static 
   4 warnings and 4 errors generated.
--
   In file included from fs/binfmt_misc.c:27:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   4 errors generated.
--
   In file included from fs/d_path.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   fs/d_path.c:318:7: warning: no previous prototype for function 'simple_dname' [-Wmissing-prototypes]
   char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
         ^
   fs/d_path.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *simple_dname(struct dentry *dentry, char *buffer, int buflen)
   ^
   static 
   1 warning and 4 errors generated.
--
   In file included from fs/statfs.c:2:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
>> fs/statfs.c:131:3: warning: 'memcpy' will always overflow; destination buffer has size 64, but size argument is 88 [-Wfortify-source]
                   memcpy(&buf, st, sizeof(*st));
                   ^
   1 warning and 4 errors generated.
--
   In file included from fs/aio.c:20:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   In file included from fs/aio.c:29:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from drivers/char/random.c:335:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1653:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1658:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1663:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1668:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
>> drivers/char/random.c:1257:41: warning: shift count >= width of type [-Wshift-count-overflow]
           c_high = (sizeof(cycles) > 4) ? cycles >> 32 : 0;
                                                  ^  ~~
   drivers/char/random.c:1258:35: warning: shift count >= width of type [-Wshift-count-overflow]
           j_high = (sizeof(now) > 4) ? now >> 32 : 0;
                                            ^  ~~
   drivers/char/random.c:2272:6: warning: no previous prototype for function 'add_hwgenerator_randomness' [-Wmissing-prototypes]
   void add_hwgenerator_randomness(const char *buffer, size_t count,
        ^
   drivers/char/random.c:2272:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void add_hwgenerator_randomness(const char *buffer, size_t count,
   ^
   static 
   3 warnings and 4 errors generated.


vim +1653 include/linux/perf_event.h

  1650	
  1651	static inline bool branch_sample_no_flags(const struct perf_event *event)
  1652	{
> 1653		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
  1654	}
  1655	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
