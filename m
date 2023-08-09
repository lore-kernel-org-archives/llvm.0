Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B317AB2;
	Wed,  9 Aug 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580696; x=1723116696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVmStQiZGjUjmcqwHxmael+odiEwKc7oXZLeYLS9kxk=;
  b=lvmI1UcZXUpqOUaqkuc1rCtJ2E0qVYT1WpGKJQXsq49DUED7mJuCeWMi
   7/p+JOhYWXNh2nQ3CwjRtNyIrxYEewkf2HOiHiYyjwHZbij6+dD2cq3si
   kXMotFf7aPGL/JktRzj/JnnpITsWvgtWvC8AvdwUiaMQtjxTpNGFuLwcP
   0nkWpZhIh9XQfJFb/FCGwqP5PFZPolfcb7aCmT/xtpWNxxT/jWBnE0P8u
   Oz249M6ATaI+LKaf2bM1Vui02EXeZA+djml2U53BQIqsmCLjASB3GJopW
   OOGgqoe9otqZj8nmHYUEYRBkzjYRPg7fF2sHlXxJEbXbHYRyXxtLTKZ+c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368554095"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368554095"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731771499"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731771499"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 04:31:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThPX-00064Y-12;
	Wed, 09 Aug 2023 11:31:31 +0000
Date: Wed, 9 Aug 2023 19:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 23/29] kernel/printk/printk_safe.c:46:43: error:
 invalid output constraint '=d' in asm
Message-ID: <202308091947.a3z8vbgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   1f50b51d0f25cf6e93d994fbc0ec9e2f1cb3b911
commit: 541d489f20d057b7f1b262baf28fe2fc3ed39072 [23/29] cpuid workaround
config: hexagon-randconfig-r045-20230809 (https://download.01.org/0day-ci/archive/20230809/202308091947.a3z8vbgj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091947.a3z8vbgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091947.a3z8vbgj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/printk/printk_safe.c:11:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/printk/printk_safe.c:11:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/printk/printk_safe.c:11:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/printk/printk_safe.c:46:43: error: invalid output constraint '=d' in asm
      46 |         asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
         |                                                  ^
>> kernel/printk/printk_safe.c:57:8: error: invalid input constraint 'c' in asm
      57 |                                 :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                    ^
   kernel/printk/printk_safe.c:59:27: error: invalid input constraint 'c' in asm
      59 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
         |                                  ^
   kernel/printk/printk_safe.c:69:17: warning: unused variable 'args' [-Wunused-variable]
      69 |         va_list args;
         |                 ^
>> kernel/printk/printk_safe.c:66:5: warning: no previous prototype for function 'ghcb_printf2' [-Wmissing-prototypes]
      66 | int ghcb_printf2(const char *fmt)
         |     ^
   kernel/printk/printk_safe.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int ghcb_printf2(const char *fmt)
         | ^
         | static 
   kernel/printk/printk_safe.c:96:43: error: invalid output constraint '=d' in asm
      96 |         asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
         |                                                  ^
   kernel/printk/printk_safe.c:107:8: error: invalid input constraint 'c' in asm
     107 |                                 :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                    ^
   kernel/printk/printk_safe.c:109:27: error: invalid input constraint 'c' in asm
     109 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
         |                                  ^
>> kernel/printk/printk_safe.c:82:5: warning: no previous prototype for function 'hv_sev_printf' [-Wmissing-prototypes]
      82 | int hv_sev_printf(const char *fmt, va_list ap)
         |     ^
   kernel/printk/printk_safe.c:82:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      82 | int hv_sev_printf(const char *fmt, va_list ap)
         | ^
         | static 
   kernel/printk/printk_safe.c:120:38: error: invalid output constraint '=d' in asm
     120 |         asm volatile ("rdmsr" : "=a" (low), "=d" (high) : "c" (0xc0010130));
         |                                             ^
   kernel/printk/printk_safe.c:123:12: error: invalid input constraint 'c' in asm
     123 |                       :: "c" (0xc0010130), "a" (val), "d" (0x0));
         |                          ^
   kernel/printk/printk_safe.c:124:27: error: invalid input constraint 'c' in asm
     124 |         asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (low), "d" (high));
         |                                  ^
>> kernel/printk/printk_safe.c:116:6: warning: no previous prototype for function 'hv_sev_debugbreak' [-Wmissing-prototypes]
     116 | void hv_sev_debugbreak(u32 val)
         |      ^
   kernel/printk/printk_safe.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     116 | void hv_sev_debugbreak(u32 val)
         | ^
         | static 
   10 warnings and 9 errors generated.


vim +46 kernel/printk/printk_safe.c

    30	
    31	static int hv_sev_printf2(const char *fmt)
    32	{
    33		char buf[1024];
    34		int len;
    35		int idx;
    36		int left;
    37		unsigned long flags;
    38		u32 orig_low, orig_high;
    39		u32 low, high;
    40	
    41		//len = vsnprintf(buf, sizeof(buf), fmt, ap);
    42		len = 4;
    43		memcpy(buf, fmt, 0x4);
    44		local_irq_save(flags);
    45		//spin_lock(&printk_lock);
  > 46		asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
    47		for (idx = 0; idx < len; idx += 6) {
    48			left = len - idx;
    49			if (left > 6) left = 6;
    50			low = 0xf03;
    51			high = 0;
    52			memcpy((char *)&low+2, &buf[idx], left == 1 ? 1 : 2);
    53			if (left > 2)
    54				memcpy((char *)&high, &buf[idx+2], left-2);
    55			asm volatile ("wrmsr\n\r"
    56					"rep; vmmcall\n\r"
  > 57					:: "c" (0xc0010130), "a" (low), "d" (high));
    58		}
    59		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
    60		//spin_unlock(&printk_lock);
    61		local_irq_restore(flags);
    62	
    63		return len;
    64	}
    65	
  > 66	int ghcb_printf2(const char *fmt)
    67	{
    68	
    69	        va_list args;
    70	
    71	        int printed = 0;
    72	
    73		//        va_start(args, fmt);
    74	
    75	        printed = hv_sev_printf2(fmt);
    76	
    77		//       va_end(args);
    78	
    79	        return printed;
    80	}
    81	
  > 82	int hv_sev_printf(const char *fmt, va_list ap)
    83	{
    84		char buf[1024];
    85		int len;
    86		int idx;
    87		int left;
    88		unsigned long flags;
    89		u32 orig_low, orig_high;
    90		u32 low, high;
    91	
    92		len = vsnprintf(buf, sizeof(buf), fmt, ap);
    93	
    94		local_irq_save(flags);
    95		spin_lock(&printk_lock);
  > 96		asm volatile ("rdmsr" : "=a" (orig_low), "=d" (orig_high) : "c" (0xc0010130));
    97		for (idx = 0; idx < len; idx += 6) {
    98			left = len - idx;
    99			if (left > 6) left = 6;
   100			low = 0xf03;
   101			high = 0;
   102			memcpy((char *)&low+2, &buf[idx], left == 1 ? 1 : 2);
   103			if (left > 2)
   104				memcpy((char *)&high, &buf[idx+2], left-2);
   105			asm volatile ("wrmsr\n\r"
   106					"rep; vmmcall\n\r"
   107					:: "c" (0xc0010130), "a" (low), "d" (high));
   108		}
   109		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (orig_low), "d" (orig_high));
   110		spin_unlock(&printk_lock);
   111		local_irq_restore(flags);
   112	
   113		return len;
   114	}
   115	
 > 116	void hv_sev_debugbreak(u32 val)
   117	{
   118		u32 low, high;
   119		val = ((val & (u32)0xf) << 12) | (u32)0xf03;
 > 120		asm volatile ("rdmsr" : "=a" (low), "=d" (high) : "c" (0xc0010130));
   121		asm volatile ("wrmsr\n\r"
   122			      "rep; vmmcall\n\r"
   123			      :: "c" (0xc0010130), "a" (val), "d" (0x0));
   124		asm volatile ("wrmsr" :: "c" (0xc0010130), "a" (low), "d" (high));
   125	}
   126	EXPORT_SYMBOL_GPL(hv_sev_debugbreak);
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
