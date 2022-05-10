Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D623C2
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652172261; x=1683708261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rWbe2fRVPllrAjYURz1X0g9OX3W8yMh9tncdPnUQRJA=;
  b=Cd5VDIcqiiIImoDGpBJ2AZ0nZF4o6zOV15sI8TPKrfGnUXkKs1rj4yaZ
   WVjogqc3GRjD/MiIC1xM6l5o8kOtYlzDvSWEmbFE19IqiKuq5ng+Y3Yzj
   y+xVe1yeZdcTy5UNppigoNSqCDefZubENR7P2t8btQvucxxjc/6MxaF8E
   p8TmbTVM/KaPGxbIPblaCzlv4tf1m144n8ABkJydEIYoFibb4uJTBnwhA
   nsNwG1ejGFfJ+nQTibx/+ezc2YDK0izS9n6KahrZs9PQVSFZCyunnXMNt
   aSEyo1b6i/7gyQTvx+IidbQzHW3Eomnrja7Oa02pShp9vMOkNCw9HjD7U
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269445420"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="269445420"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 01:44:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="552728259"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2022 01:44:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noLTe-000HaM-Vc;
	Tue, 10 May 2022 08:44:18 +0000
Date: Tue, 10 May 2022 16:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 7/9] cgroup: Add cgroup_put() in
 !CONFIG_CGROUPS case
Message-ID: <202205101623.w91YVtfT-lkp@intel.com>
References: <20220510001807.4132027-8-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510001807.4132027-8-yosryahmed@google.com>

Hi Yosry,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf/master]
[also build test ERROR on tj-cgroup/for-next v5.18-rc6]
[cannot apply to bpf-next/master next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
config: arm-pcm027_defconfig (https://download.01.org/0day-ci/archive/20220510/202205101623.w91YVtfT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/9875d89daad0e55350e2dc6e5876806be99d29a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/bpf-cgroup-hierarchical-stats-collection/20220510-082111
        git checkout 9875d89daad0e55350e2dc6e5876806be99d29a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/ethernet/eth.c:45:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   1 error generated.
--
   In file included from kernel/bpf/core.c:21:
   In file included from include/linux/filter.h:20:
   In file included from include/linux/if_vlan.h:10:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   kernel/bpf/core.c:1645:12: warning: no previous prototype for function 'bpf_probe_read_kernel' [-Wmissing-prototypes]
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
              ^
   kernel/bpf/core.c:1645:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
   ^
   static 
   kernel/bpf/core.c:2088:6: warning: no previous prototype for function 'bpf_patch_call_args' [-Wmissing-prototypes]
   void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
        ^
   kernel/bpf/core.c:2088:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
   ^
   static 
   2 warnings and 1 error generated.
--
   In file included from net/ipv4/route.c:72:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   net/ipv4/route.c:879:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
           int log_martians;
               ^
   1 warning and 1 error generated.
--
   In file included from net/ipv4/ip_output.c:60:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   In file included from net/ipv4/ip_output.c:82:
   In file included from include/linux/netfilter_bridge.h:5:
   In file included from include/uapi/linux/netfilter_bridge.h:12:
   In file included from include/linux/if_pppox.h:19:
   include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'struct sockaddr_pppox' is less aligned than 'union (unnamed union at include/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           } sa_addr;
             ^
   1 warning and 1 error generated.
--
   In file included from net/ipv4/igmp.c:80:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   net/ipv4/igmp.c:1905:6: warning: variable 'changerec' set but not used [-Wunused-but-set-variable]
           int     changerec = 0;
                   ^
   1 warning and 1 error generated.
--
   In file included from fs/proc/meminfo.c:6:
   In file included from include/linux/hugetlb.h:9:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   fs/proc/meminfo.c:22:28: warning: no previous prototype for function 'arch_report_meminfo' [-Wmissing-prototypes]
   void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
                              ^
   fs/proc/meminfo.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from drivers/net/ethernet/smsc/smc91x.c:74:
   In file included from include/linux/netdevice.h:42:
   In file included from include/net/netprio_cgroup.h:11:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   drivers/net/ethernet/smsc/smc91x.c:634:16: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
           unsigned long flags;
                         ^
   1 warning and 1 error generated.
--
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:59:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   init/main.c:769:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
   void __init __weak arch_post_acpi_subsys_init(void) { }
                      ^
   init/main.c:769:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_post_acpi_subsys_init(void) { }
   ^
   static 
   init/main.c:781:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init __weak mem_encrypt_init(void) { }
                      ^
   init/main.c:781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak mem_encrypt_init(void) { }
   ^
   static 
   init/main.c:783:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
   void __init __weak poking_init(void) { }
                      ^
   init/main.c:783:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak poking_init(void) { }
   ^
   static 
   3 warnings and 1 error generated.
--
   In file included from arch/arm/mm/fault.c:19:
   In file included from include/linux/perf_event.h:59:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   arch/arm/mm/fault.c:535:1: warning: no previous prototype for function 'do_DataAbort' [-Wmissing-prototypes]
   do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
   ^
   arch/arm/mm/fault.c:534:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void
              ^
              static 
   arch/arm/mm/fault.c:565:1: warning: no previous prototype for function 'do_PrefetchAbort' [-Wmissing-prototypes]
   do_PrefetchAbort(unsigned long addr, unsigned int ifsr, struct pt_regs *regs)
   ^
   arch/arm/mm/fault.c:564:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void
              ^
              static 
   2 warnings and 1 error generated.
--
   In file included from arch/arm/mm/init.c:9:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   arch/arm/mm/init.c:97:13: warning: no previous prototype for function 'setup_dma_zone' [-Wmissing-prototypes]
   void __init setup_dma_zone(const struct machine_desc *mdesc)
               ^
   arch/arm/mm/init.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init setup_dma_zone(const struct machine_desc *mdesc)
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from arch/arm/mm/flush.c:17:
   In file included from include/linux/hugetlb.h:9:
>> include/linux/cgroup.h:764:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
   {}
    ^
   arch/arm/mm/flush.c:357:6: warning: no previous prototype for function '__flush_anon_page' [-Wmissing-prototypes]
   void __flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
        ^
   arch/arm/mm/flush.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
   ^
   static 
   1 warning and 1 error generated.
..


vim +764 include/linux/cgroup.h

   762	
   763	static inline struct cgroup *cgroup_put(void)
 > 764	{}
   765	#endif /* !CONFIG_CGROUPS */
   766	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
