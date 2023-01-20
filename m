Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635B17E6;
	Fri, 20 Jan 2023 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674210118; x=1705746118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XyT1HyQebNHPSHKbRZII44QqKqxeBiybIZwwJCwDm9c=;
  b=B7GnIgyr3fKKkFHMwYF2Kqeq4ppLCrTCpN3L7obyKcjsBP4M5b4skZyT
   L3GJ50UA0t6waBknWcboLzCR+IcYvhSoJJk9nxrjuo3SWoOWPZRyOQ0Dh
   CzNZ2yyOPO9D4yN4gb7BRZcvJT/loEusS+jsuIK98QefA83e+IQCQmieb
   ior2TAwhaDp3l/B0KpCRZqvMdS1a0s0Dc5u0rNMtSOvTAGP8mEiibOoa9
   mMDZ04blNMloKDOHW65sNDzkSrOd+tzdTEoT9Hf8yVxOH+oofb8uvt+/7
   5C+lUxeZOHGShRiNJyW9tnEOFdOZ7mJvvIVw03lR/r7ob+rB8MVuJIwm7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411781195"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411781195"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638115166"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="638115166"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 02:21:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIoWx-0002TG-0c;
	Fri, 20 Jan 2023 10:21:55 +0000
Date: Fri, 20 Jan 2023 18:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: [madvenka786:orc_v3 20/21] kernel/trace/ftrace.c:2766:13: error:
 redefinition of 'ftrace_instruction_pointer_set'
Message-ID: <202301201855.2M51dYdX-lkp@intel.com>
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
config: s390-randconfig-r044-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201855.2M51dYdX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/madvenka786/linux/commit/1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/trace/ftrace.c:18:
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
   In file included from kernel/trace/ftrace.c:18:
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
   In file included from kernel/trace/ftrace.c:18:
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
   kernel/trace/ftrace.c:299:5: warning: no previous prototype for function '__register_ftrace_function' [-Wmissing-prototypes]
   int __register_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:299:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __register_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:342:5: warning: no previous prototype for function '__unregister_ftrace_function' [-Wmissing-prototypes]
   int __unregister_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __unregister_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:2766:6: warning: attribute declaration must precede definition [-Wignored-attributes]
   void __weak ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
        ^
   include/linux/compiler_attributes.h:373:56: note: expanded from macro '__weak'
   #define __weak                          __attribute__((__weak__))
                                                          ^
   arch/s390/include/asm/ftrace.h:57:29: note: previous definition is here
   static __always_inline void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
                               ^
>> kernel/trace/ftrace.c:2766:13: error: redefinition of 'ftrace_instruction_pointer_set'
   void __weak ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
               ^
   arch/s390/include/asm/ftrace.h:57:29: note: previous definition is here
   static __always_inline void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
                               ^
   kernel/trace/ftrace.c:4004:15: warning: no previous prototype for function 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
                 ^
   kernel/trace/ftrace.c:4004:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
   ^
   static 
   16 warnings and 1 error generated.


vim +/ftrace_instruction_pointer_set +2766 kernel/trace/ftrace.c

  2765	
> 2766	void __weak ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
  2767						   unsigned long pc)
  2768	{
  2769	}
  2770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
