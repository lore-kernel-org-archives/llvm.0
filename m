Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF07465;
	Mon,  1 May 2023 20:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682972716; x=1714508716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKKuxnHlHHOfLMDWAGdwGaWNiFsG+GVcxFg/oVtMFmI=;
  b=lPZtM7bwfgL7daQ66Dh0A4KxHuGzFumY/NDLTBje/AZTndZKkK91rkH6
   h3PpDtJSTzwxherOrOlTQTewO4Xy5B6cl44xHokdwID84I8VCHTg8MduA
   Sn09aFrPSUmIUmDvh+L5GxzlrJF9SrjVBBLAwRgmHszNuUvUoMOuQU5ln
   hMHmmVNstDiG16x5rmH4uAPmqPIT/whsysiv0b/q/pqxDbpBtM4Jq8CaZ
   nIN8nNgqOK5d5KM8BJV3a/4qnYfQsXkwMCU9p0A4RCA7wwH9giZ53n0u5
   MQSh5XUefyB55KHW2ong7bG/EDQ+oidHNcRWaBWGK0OmSTkIR7rVzQs+y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337352565"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="337352565"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 13:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="690010479"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="690010479"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 13:25:14 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pta5B-0000cX-1D;
	Mon, 01 May 2023 20:25:13 +0000
Date: Tue, 2 May 2023 04:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 4/11]
 kernel/trace/trace_fprobe.c:853:13: error: use of undeclared identifier
 'MODULE_STATE_GOING'
Message-ID: <202305020453.afTJ3VVp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   32e07b49d560e18af3ea10fc794fa755eedceb83
commit: eb808ed99f69516d0c445a8a7eb0cfeb9c818410 [4/11] tracing/probes: Add tracepoint support on fprobe_events
config: s390-buildonly-randconfig-r001-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020453.afTJ3VVp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=eb808ed99f69516d0c445a8a7eb0cfeb9c818410
        git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
        git fetch --no-tags mhiramat topic/fprobe-event-ext
        git checkout eb808ed99f69516d0c445a8a7eb0cfeb9c818410
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020453.afTJ3VVp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_fprobe.c:15:
   In file included from kernel/trace/trace_dynevent.h:14:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/trace/trace_fprobe.c:15:
   In file included from kernel/trace/trace_dynevent.h:14:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/trace/trace_fprobe.c:15:
   In file included from kernel/trace/trace_dynevent.h:14:
   In file included from kernel/trace/trace.h:9:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/trace/trace_fprobe.c:853:13: error: use of undeclared identifier 'MODULE_STATE_GOING'
           if (val != MODULE_STATE_GOING)
                      ^
>> kernel/trace/trace_fprobe.c:858:13: error: incomplete definition of type 'struct tp_module'
                   if (tp_mod->mod == tf->mod) {
                       ~~~~~~^
   kernel/trace/trace_fprobe.c:849:9: note: forward declaration of 'struct tp_module'
           struct tp_module *tp_mod = data;
                  ^
   12 warnings and 2 errors generated.


vim +/MODULE_STATE_GOING +853 kernel/trace/trace_fprobe.c

   845	
   846	static int __tracepoint_probe_module_cb(struct notifier_block *self,
   847						unsigned long val, void *data)
   848	{
   849		struct tp_module *tp_mod = data;
   850		struct trace_fprobe *tf;
   851		struct dyn_event *pos;
   852	
 > 853		if (val != MODULE_STATE_GOING)
   854			return NOTIFY_DONE;
   855	
   856		mutex_lock(&event_mutex);
   857		for_each_trace_fprobe(tf, pos) {
 > 858			if (tp_mod->mod == tf->mod) {
   859				tracepoint_probe_unregister(tf->tpoint,
   860						tf->tpoint->probestub, NULL);
   861				tf->tpoint = NULL;
   862				tf->mod = NULL;
   863			}
   864		}
   865		mutex_unlock(&event_mutex);
   866	
   867		return NOTIFY_DONE;
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
