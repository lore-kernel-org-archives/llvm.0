Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5EAD42;
	Thu, 23 Feb 2023 22:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677191846; x=1708727846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e3t9z/jsq/R9VmCMpvzxJuOZA3CB1y3m1MAys+YiRFE=;
  b=QED9MIuNI5X0FVuvm+5TAzriwN9hKH90UnJrVq7phVjRNzH0DYk6BRyn
   oC8ph4wvIpx3VN4anD23qDh0PMZKdN9rwOtcVwV0YyKNhSegjCcFH0wtu
   +TyQybQ13d0g+m1MZVcMHqt6QECwA0nmwnMiILHZ4SIv4Ckyp8LYXjv+r
   J4fRrTmICmRkgltEyuE9ElZRniRZIelCus4g8lege4sLzSVE3PNcixBWe
   XeD6BTpStfcCXbkuqHX+/NRJP1qERZBhAjog0S9poAcmq6XNjMJSO4RV7
   R1fZu5WF8hYdELUB+9lzGJy6WKezh0iwzcCwDXWNdJqPKDYh+WEax9+hd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332020143"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="332020143"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 14:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="918200639"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="918200639"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 14:37:24 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVKDL-0001rN-2I;
	Thu, 23 Feb 2023 22:37:23 +0000
Date: Fri, 24 Feb 2023 06:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h:135:5: warning: no
 previous prototype for function 'rcu_debug_func_add'
Message-ID: <202302240630.BNuKC8xl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   9617e0851ec17ab3ed416aa8d2aa17029cba7acd
commit: 9617e0851ec17ab3ed416aa8d2aa17029cba7acd [1/1] debug: dynamic lazy wake debug
config: hexagon-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240630.BNuKC8xl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=9617e0851ec17ab3ed416aa8d2aa17029cba7acd
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 9617e0851ec17ab3ed416aa8d2aa17029cba7acd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240630.BNuKC8xl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from kernel/rcu/tree.c:26:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from kernel/rcu/tree.c:70:
>> kernel/rcu/debug.h:135:5: warning: no previous prototype for function 'rcu_debug_func_add' [-Wmissing-prototypes]
   int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/debug.h:135:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
   ^
   static 
>> kernel/rcu/debug.h:140:6: warning: no previous prototype for function 'rcu_debug_set_context' [-Wmissing-prototypes]
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
        ^
   kernel/rcu/debug.h:140:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
   ^
   static 
>> kernel/rcu/debug.h:144:6: warning: no previous prototype for function 'rcu_debug_reset_context' [-Wmissing-prototypes]
   void rcu_debug_reset_context(void)
        ^
   kernel/rcu/debug.h:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_reset_context(void)
   ^
   static 
>> kernel/rcu/debug.h:148:6: warning: no previous prototype for function 'rcu_debug_init' [-Wmissing-prototypes]
   void rcu_debug_init(void)
        ^
   kernel/rcu/debug.h:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_init(void)
   ^
   static 
   10 warnings generated.


vim +/rcu_debug_func_add +135 kernel/rcu/debug.h

   124	
   125	void rcu_debug_init(void)
   126	{
   127		int ret;
   128		pr_info("RCU Lazy CB debugging is turned on, system may be slow.\n");
   129	
   130		ret = register_trace_sched_waking(probe_waking, NULL);
   131		if (ret)
   132			pr_info("RCU: Lazy debug ched_waking probe could not be registered.");
   133	}
   134	#else
 > 135	int rcu_debug_func_add(struct rcu_data *rdp, void* ip_ptr)
   136	{
   137		return -1;
   138	}
   139	
 > 140	void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
   141	{
   142	}
   143	
 > 144	void rcu_debug_reset_context(void)
   145	{
   146	}
   147	
 > 148	void rcu_debug_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
