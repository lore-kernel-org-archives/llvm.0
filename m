Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF1173;
	Thu, 30 Mar 2023 00:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680134905; x=1711670905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpHW067FHxZyxfqzz/7G238gWCufopY8ZUT6p7y3+pM=;
  b=m4bsPuOujAcFZDCW1uRMTM3e1WyHfNGLgwp9BAAAD5SSuYTgYyAUHPuw
   7emuCdeSUCWAWo1PIJBAtB4tsl9z3sbFvRhV64PSjxoVPKUM6rWuhtZO3
   BjkA94nObSMWUB/iZ416V/w+s+MtigIhc6q7+nfffvPWIIIkwk6xYbH4L
   g5UnsUgLBeb9dNTNhJmxm6poSKnDJe+OuPmq0goqtCluAT+OlkbRDtOuD
   A0kjn27H9wU0YA7NZI4Ie4z0DQx/yYzvhPcDswv4reoNclCHPArYHsW16
   OyD/I9o6+8RzrAdQSywzIpvi5LoDYxzcKR6l1HJU/22FWwBzQztBnU+DY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338531296"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="338531296"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 17:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714790067"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="714790067"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 17:08:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phfpw-000K4Z-32;
	Thu, 30 Mar 2023 00:08:16 +0000
Date: Thu, 30 Mar 2023 08:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] net: extend drop reasons for multiple subsystems
Message-ID: <202303300823.aqDx9Rc3-lkp@intel.com>
References: <20230329214620.131636-1-johannes@sipsolutions.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329214620.131636-1-johannes@sipsolutions.net>

Hi Johannes,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main horms-ipvs/master net/main net-next/main linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/mac80211-use-the-new-drop-reasons-infrastructure/20230330-054719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230329214620.131636-1-johannes%40sipsolutions.net
patch subject: [RFC PATCH 1/2] net: extend drop reasons for multiple subsystems
config: hexagon-randconfig-r045-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300823.aqDx9Rc3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff46d1291ffa265b9c23249a5132e6824f603ef5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Berg/mac80211-use-the-new-drop-reasons-infrastructure/20230330-054719
        git checkout ff46d1291ffa265b9c23249a5132e6824f603ef5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300823.aqDx9Rc3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/skbuff.c:41:
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
   In file included from net/core/skbuff.c:41:
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
   In file included from net/core/skbuff.c:41:
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
>> net/core/skbuff.c:127:25: error: use of undeclared identifier 'SKB_DROP_REASON_MAX'; did you mean 'SKB_DROP_REASON_XDP'?
           DEFINE_DROP_REASON(FN, FN)
                                  ^
   include/net/dropreason.h:248:2: note: 'SKB_DROP_REASON_XDP' declared here
           SKB_DROP_REASON_XDP,
           ^
   net/core/skbuff.c:127:25: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           DEFINE_DROP_REASON(FN, FN)
           ~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/net/dropreason.h:81:2: note: expanded from macro 'DEFINE_DROP_REASON'
           FNe(MAX)
           ^~~~~~~~
   net/core/skbuff.c:124:49: note: expanded from macro 'FN'
   #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
                                                   ^~~~~~~
   <scratch space>:29:1: note: expanded from here
   "MAX"
   ^~~~~
   net/core/skbuff.c:127:21: note: previous initialization is here
           DEFINE_DROP_REASON(FN, FN)
           ~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/net/dropreason.h:53:2: note: expanded from macro 'DEFINE_DROP_REASON'
           FN(XDP)                         \
           ^~~~~~~
   net/core/skbuff.c:124:49: note: expanded from macro 'FN'
   #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
                                                   ^~~~~~~
   <scratch space>:147:1: note: expanded from here
   "XDP"
   ^~~~~
   7 warnings and 1 error generated.
--
   In file included from net/core/net-traces.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/core/net-traces.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/core/net-traces.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
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
   In file included from net/core/net-traces.c:30:
   In file included from include/trace/events/skb.h:95:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:94:
>> include/trace/events/skb.h:14:24: error: use of undeclared identifier 'SKB_DROP_REASON_MAX'; did you mean 'SKB_DROP_REASON_XDP'?
   DEFINE_DROP_REASON(FN, FN)
                          ^
   include/net/dropreason.h:248:2: note: 'SKB_DROP_REASON_XDP' declared here
           SKB_DROP_REASON_XDP,
           ^
   In file included from net/core/net-traces.c:30:
   In file included from include/trace/events/skb.h:95:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:237:
   include/trace/events/skb.h:48:31: error: use of undeclared identifier 'SKB_DROP_REASON_MAX'; did you mean 'SKB_DROP_REASON_XDP'?
                                      DEFINE_DROP_REASON(FN, FNe)))
                                                             ^
   include/net/dropreason.h:248:2: note: 'SKB_DROP_REASON_XDP' declared here
           SKB_DROP_REASON_XDP,
           ^
   In file included from net/core/net-traces.c:51:
   In file included from include/trace/events/neigh.h:255:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:419:
   include/trace/events/neigh.h:42:20: warning: variable 'pin6' set but not used [-Wunused-but-set-variable]
                   struct in6_addr *pin6;
                                    ^
   7 warnings and 2 errors generated.


vim +127 net/core/skbuff.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  122  
9cb252c4c1c53a Menglong Dong  2022-09-05  123  #undef FN
9cb252c4c1c53a Menglong Dong  2022-09-05  124  #define FN(reason) [SKB_DROP_REASON_##reason] = #reason,
ff46d1291ffa26 Johannes Berg  2023-03-29  125  static const char * const drop_reasons[] = {
0e84afe8ebfbb9 Eric Dumazet   2022-10-29  126  	[SKB_CONSUMED] = "CONSUMED",
9cb252c4c1c53a Menglong Dong  2022-09-05 @127  	DEFINE_DROP_REASON(FN, FN)
9cb252c4c1c53a Menglong Dong  2022-09-05  128  };
ff46d1291ffa26 Johannes Berg  2023-03-29  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
