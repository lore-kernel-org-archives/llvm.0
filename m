Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074CCC2E6;
	Mon,  4 Sep 2023 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693859985; x=1725395985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHsRWujWc6dwR4gEjSz694op5MGSJWKuJp88uVaYQ8Q=;
  b=jpyhkJv5qad6k7pbXcsRilsKIms2998wH8w2Dngr5pC7JRdAUXccs463
   eojQQ+4AeMBlA39OVXuHmuywnNF/DRbJOTQsFT/pgMKgFuKCgz2aB8e47
   zEbWalEIVS6EwDvJ8DraJ0PgDmIAsWL1qnBa2iGQMpctYg+KDtZM7IOrk
   DO0bs0dJ0aThOn0sKAvqxRrlDV/qIgISGKOgaz7fNYEOqtJ4m5VMtW4EM
   zftmjA8mBrHb3Ie6uhlnbDCHWI9ymdPbkZWoHFW5r3dHJnlPJ5pu8lkX9
   ynMle3pO2VXtTx9/CZySGEPddWpvE79cEqqIWG1EiVGFWudY9UZNOYxtw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356965565"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="356965565"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 13:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914612672"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="914612672"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 13:39:41 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdGMF-0000on-26;
	Mon, 04 Sep 2023 20:39:39 +0000
Date: Tue, 5 Sep 2023 04:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Foley <pefoley2@pefoley.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: arch/um/drivers/pcap_kern.c:18:6: warning: no previous prototype for
 function 'pcap_init_kern'
Message-ID: <202309050424.0ZPuzTJ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a1415eebeece5a27fb40c0242b171c104ad5727
commit: 2c4d3841a82b88ae8a7b518dc6206f84f68e705a um: Avoid pcap multiple definition errors
date:   7 months ago
config: um-randconfig-r003-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050424.0ZPuzTJ7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050424.0ZPuzTJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050424.0ZPuzTJ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> arch/um/drivers/pcap_kern.c:18:6: warning: no previous prototype for function 'pcap_init_kern' [-Wmissing-prototypes]
   void pcap_init_kern(struct net_device *dev, void *data)
        ^
   arch/um/drivers/pcap_kern.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pcap_init_kern(struct net_device *dev, void *data)
   ^
   static 
   arch/um/drivers/pcap_kern.c:53:5: warning: no previous prototype for function 'pcap_setup' [-Wmissing-prototypes]
   int pcap_setup(char *str, char **mac_out, void *data)
       ^
   arch/um/drivers/pcap_kern.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pcap_setup(char *str, char **mac_out, void *data)
   ^
   static 
   14 warnings generated.


vim +/pcap_init_kern +18 arch/um/drivers/pcap_kern.c

    17	
  > 18	void pcap_init_kern(struct net_device *dev, void *data)
    19	{
    20		struct uml_net_private *pri;
    21		struct pcap_data *ppri;
    22		struct pcap_init *init = data;
    23	
    24		pri = netdev_priv(dev);
    25		ppri = (struct pcap_data *) pri->user;
    26		ppri->host_if = init->host_if;
    27		ppri->promisc = init->promisc;
    28		ppri->optimize = init->optimize;
    29		ppri->filter = init->filter;
    30	
    31		printk("pcap backend, host interface %s\n", ppri->host_if);
    32	}
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
