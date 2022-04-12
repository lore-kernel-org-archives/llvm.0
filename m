Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DB1FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 18:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649786906; x=1681322906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dsJHLhCC32DLiBTQOgJpRLvznjNu/aolt3syE4TYNA=;
  b=EZSUtOyzRyzuKrp/qYbUO76tB60BAoBtji1FICiT+NDanxiQ/5jGncEO
   TN94d56vGW1cqWeYT7SKTQFVqg+9vxYt4TNag5sl8fkOArfEwDDIj0+Co
   ojra68TAlMckdSKxzy89fHgGjeQE9XAe9eCEoOabUZ7OhU1nNx6eiVqcq
   9sRnlkhCgMSdJDVaEzmzYp+WsJsLOgAvsLTuXdYm0obJ1sC551kTz94hl
   +pE71B/qTv/iPdi7iZwC7Mn3Y4vLK03gvgbMOiN+nfmuL17yurzy2wb6H
   7ARc+Ehxmg67ohDBa1Wyn5Z2HZ9eL6sfaBblv7z5je50H2Y04rm9ZUomA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262216036"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262216036"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 11:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="699940195"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2022 11:01:11 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neKpC-00032G-An;
	Tue, 12 Apr 2022 18:01:10 +0000
Date: Wed, 13 Apr 2022 02:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 1/8] perf: Consolidate branch sample filter helpers
Message-ID: <202204130118.IRgT5X8j-lkp@intel.com>
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
config: s390-buildonly-randconfig-r002-20220412 (https://download.01.org/0day-ci/archive/20220413/202204130118.IRgT5X8j-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6d93333c8ddf355a33ed0f51718603406412afbb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220412-204141
        git checkout 6d93333c8ddf355a33ed0f51718603406412afbb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from fs/notify/inotify/inotify_user.c:26:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1665:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1670:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1675:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1680:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   include/linux/perf_event.h:1685:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                  ~~~~~  ^
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   6 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:29:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1665:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1670:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1675:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1680:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   include/linux/perf_event.h:1685:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                  ~~~~~  ^
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   12 warnings and 6 errors generated.
--
   In file included from kernel/sched/core.c:13:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/sched/core.c:13:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/sched/core.c:13:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/sched/core.c:13:
   In file included from kernel/sched/sched.h:66:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1665:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1670:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1675:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1680:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   include/linux/perf_event.h:1685:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                  ~~~~~  ^
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   kernel/sched/core.c:3453:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3453:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
   13 warnings and 6 errors generated.
--
   In file included from kernel/sched/loadavg.c:9:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/sched/loadavg.c:9:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/sched/loadavg.c:9:
   In file included from kernel/sched/sched.h:17:
   In file included from include/linux/sched/isolation.h:6:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from kernel/sched/loadavg.c:9:
   In file included from kernel/sched/sched.h:66:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
>> include/linux/perf_event.h:1665:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
                  ~~~~~  ^
   include/linux/perf_event.h:1670:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
                  ~~~~~  ^
   include/linux/perf_event.h:1675:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
                  ~~~~~  ^
   include/linux/perf_event.h:1680:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
                  ~~~~~  ^
   include/linux/perf_event.h:1685:16: error: no member named 'attr' in 'struct perf_event'
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                  ~~~~~  ^
>> include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
   12 warnings and 6 errors generated.
..


vim +1665 include/linux/perf_event.h

  1662	
  1663	static inline bool branch_sample_no_flags(const struct perf_event *event)
  1664	{
> 1665		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_FLAGS;
  1666	}
  1667	
  1668	static inline bool branch_sample_no_cycles(const struct perf_event *event)
  1669	{
  1670		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_NO_CYCLES;
  1671	}
  1672	
  1673	static inline bool branch_sample_type(const struct perf_event *event)
  1674	{
> 1675		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_TYPE_SAVE;
  1676	}
  1677	
  1678	static inline bool branch_sample_hw_index(const struct perf_event *event)
  1679	{
  1680		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_HW_INDEX;
  1681	}
  1682	
  1683	static inline bool branch_sample_priv(const struct perf_event *event)
  1684	{
> 1685		return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
