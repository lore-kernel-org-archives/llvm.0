Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4801FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649786915; x=1681322915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b8QFmnWow+tn4c0d3t0Yw578XXQ4OwfQ33krTRfpXBA=;
  b=d3yZUMuZLQ4CM1eQAcTR5nweNAvE6AyjrkK8RTocuVJaZGdtZuZyv0eF
   ofR1sao7hgzCM6G+qCxeIN+tOJ2mj+27WLRHHuGKhTHn0gn7HTEI00iKy
   QZf/azFugVTpR4C/TKWEZW2nsN2wq6FQKK5v4nxWdZcNht7Pf8MCN+7rg
   xwoH/LYrj9TjSPhEmKpACHTQqEHvzuNS81eUvzptEr/tzt+Ewy9QMWV/0
   SAfjDtIdpl385r0Z6E2ve0YwBE0PhB1/51RGRBsKi7nRndb1m2buYBTFe
   3rCHvQOu3q1JXbLUHsyl9mZ87Ip2HgyGrHd2n/9JT2F3Ne27W7Rlfaes3
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261905974"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="261905974"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724565754"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 11:01:05 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neKp7-000328-5N;
	Tue, 12 Apr 2022 18:01:05 +0000
Date: Wed, 13 Apr 2022 02:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 1/8] perf: Consolidate branch sample filter helpers
Message-ID: <202204130108.zoxwYdF8-lkp@intel.com>
References: <20220412115455.293119-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412115455.293119-2-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on linus/master linux/master v5.18-rc2]
[cannot apply to tip/perf/core tip/master next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220412-204141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: i386-randconfig-a003-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130108.zoxwYdF8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d93333c8ddf355a33ed0f51718603406412afbb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220412-204141
        git checkout 6d93333c8ddf355a33ed0f51718603406412afbb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/ fs//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mce/core.c:50:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:9:
   In file included from include/linux/entry-common.h:7:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   1 error generated.
--
   In file included from arch/x86/entry/common.c:13:
   In file included from include/linux/entry-common.h:7:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   arch/x86/entry/common.c:119:24: warning: no previous prototype for function 'do_int80_syscall_32' [-Wmissing-prototypes]
   __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
                          ^
   arch/x86/entry/common.c:119:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
                     ^
                     static 
   arch/x86/entry/common.c:186:24: warning: no previous prototype for function 'do_fast_syscall_32' [-Wmissing-prototypes]
   __visible noinstr long do_fast_syscall_32(struct pt_regs *regs)
                          ^
   arch/x86/entry/common.c:186:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible noinstr long do_fast_syscall_32(struct pt_regs *regs)
                     ^
                     static 
   arch/x86/entry/common.c:238:24: warning: no previous prototype for function 'do_SYSENTER_32' [-Wmissing-prototypes]
   __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
                          ^
   arch/x86/entry/common.c:238:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
                     ^
                     static 
   3 warnings and 1 error generated.
--
   In file included from arch/x86/kernel/doublefault_32.c:11:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:9:
   In file included from include/linux/entry-common.h:7:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   arch/x86/kernel/doublefault_32.c:23:36: warning: no previous prototype for function 'doublefault_shim' [-Wmissing-prototypes]
   asmlinkage noinstr void __noreturn doublefault_shim(void)
                                      ^
   arch/x86/kernel/doublefault_32.c:23:20: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage noinstr void __noreturn doublefault_shim(void)
                      ^
                      static 
   arch/x86/kernel/doublefault_32.c:114:6: warning: no previous prototype for function 'doublefault_init_cpu_tss' [-Wmissing-prototypes]
   void doublefault_init_cpu_tss(void)
        ^
   arch/x86/kernel/doublefault_32.c:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void doublefault_init_cpu_tss(void)
   ^
   static 
   2 warnings and 1 error generated.
--
   In file included from arch/x86/kernel/kprobes/core.c:36:
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   arch/x86/kernel/kprobes/core.c:1081:23: warning: no previous prototype for function 'trampoline_handler' [-Wmissing-prototypes]
   __used __visible void trampoline_handler(struct pt_regs *regs)
                         ^
   arch/x86/kernel/kprobes/core.c:1081:18: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __used __visible void trampoline_handler(struct pt_regs *regs)
                    ^
                    static 
   1 warning and 1 error generated.


vim +1685 include/linux/perf_event.h

  1682	
  1683	static inline bool branch_sample_priv(const struct perf_event *event)
  1684	{
> 1685		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
