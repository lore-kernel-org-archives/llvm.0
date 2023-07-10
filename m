Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103C16400;
	Mon, 10 Jul 2023 21:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689024211; x=1720560211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKHnu558VwPxJB2W2qvvF2LjYcwLYKQxH8BoFuszbc4=;
  b=dF4v78ynmZf4G8MIldh8UkUWT+Jdu3xPx/03jZjpvAmYhg0UzEy0mFvZ
   TsHimbLVflhQs/CRvHfC809LlYk+ahQQDip9imnFnL2EApo73YlsFlf4g
   NbvBE5h7hHKfYMbHYgwHS0MN1fk6laXQdCLwwt2g7I96g3gv26MawPyHH
   zaRgS8AiJ8Nx0UpEJmqmaMu5H1NLXfc7fgKd4Ob6dN+DYe6gFABJYExbJ
   fahrQxNHZbO3zAkfjnXJAjBZNIMye0hF3YqECNncFuvMvLUyOjOGhyfAB
   rI6o6Jd6RTL9lwWhyNLwrk9x9j4HzPUQcUNmSymqq77QkiOTOxSUE44KZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428154806"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="428154806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 14:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894937587"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="894937587"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 14:23:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIyLw-000416-0y;
	Mon, 10 Jul 2023 21:23:28 +0000
Date: Tue, 11 Jul 2023 05:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 86/125] drivers/irqchip/irq-al-fic.c:281:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307110516.V0qgum1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   17712b3b36c898462c3d31d4b47bd069e87359c5
commit: 7aeb1874c9d6e390a405529c7eec76d2486f65d8 [86/125] s390: mm: convert to GENERIC_IOREMAP
config: s390-randconfig-r015-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110516.V0qgum1Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-al-fic.c:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/irqchip/irq-al-fic.c:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/irqchip/irq-al-fic.c:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/irqchip/irq-al-fic.c:281:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         iounmap(base);
         |         ^
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   drivers/irqchip/irq-al-fic.c:281:2: note: did you mean 'vunmap'?
   arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
      29 | #define iounmap iounmap
         |                 ^
   include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
     167 | extern void vunmap(const void *addr);
         |             ^
   12 warnings and 1 error generated.


vim +/iounmap +281 drivers/irqchip/irq-al-fic.c

1eb77c3bcdb70f Talel Shenhar 2019-06-10  236  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  237  static int __init al_fic_init_dt(struct device_node *node,
1eb77c3bcdb70f Talel Shenhar 2019-06-10  238  				 struct device_node *parent)
1eb77c3bcdb70f Talel Shenhar 2019-06-10  239  {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  240  	int ret;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  241  	void __iomem *base;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  242  	unsigned int parent_irq;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  243  	struct al_fic *fic;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  244  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  245  	if (!parent) {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  246  		pr_err("%s: unsupported - device require a parent\n",
1eb77c3bcdb70f Talel Shenhar 2019-06-10  247  		       node->name);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  248  		return -EINVAL;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  249  	}
1eb77c3bcdb70f Talel Shenhar 2019-06-10  250  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  251  	base = of_iomap(node, 0);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  252  	if (!base) {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  253  		pr_err("%s: fail to map memory\n", node->name);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  254  		return -ENOMEM;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  255  	}
1eb77c3bcdb70f Talel Shenhar 2019-06-10  256  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  257  	parent_irq = irq_of_parse_and_map(node, 0);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  258  	if (!parent_irq) {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  259  		pr_err("%s: fail to map irq\n", node->name);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  260  		ret = -EINVAL;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  261  		goto err_unmap;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  262  	}
1eb77c3bcdb70f Talel Shenhar 2019-06-10  263  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  264  	fic = al_fic_wire_init(node,
1eb77c3bcdb70f Talel Shenhar 2019-06-10  265  			       base,
1eb77c3bcdb70f Talel Shenhar 2019-06-10  266  			       node->name,
1eb77c3bcdb70f Talel Shenhar 2019-06-10  267  			       parent_irq);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  268  	if (IS_ERR(fic)) {
1eb77c3bcdb70f Talel Shenhar 2019-06-10  269  		pr_err("%s: fail to initialize irqchip (%lu)\n",
1eb77c3bcdb70f Talel Shenhar 2019-06-10  270  		       node->name,
1eb77c3bcdb70f Talel Shenhar 2019-06-10  271  		       PTR_ERR(fic));
1eb77c3bcdb70f Talel Shenhar 2019-06-10  272  		ret = PTR_ERR(fic);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  273  		goto err_irq_dispose;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  274  	}
1eb77c3bcdb70f Talel Shenhar 2019-06-10  275  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  276  	return 0;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  277  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  278  err_irq_dispose:
1eb77c3bcdb70f Talel Shenhar 2019-06-10  279  	irq_dispose_mapping(parent_irq);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  280  err_unmap:
1eb77c3bcdb70f Talel Shenhar 2019-06-10 @281  	iounmap(base);
1eb77c3bcdb70f Talel Shenhar 2019-06-10  282  
1eb77c3bcdb70f Talel Shenhar 2019-06-10  283  	return ret;
1eb77c3bcdb70f Talel Shenhar 2019-06-10  284  }
1eb77c3bcdb70f Talel Shenhar 2019-06-10  285  

:::::: The code at line 281 was first introduced by commit
:::::: 1eb77c3bcdb70f2501f419b3da45b19acaf01072 irqchip/al-fic: Introduce Amazon's Annapurna Labs Fabric Interrupt Controller Driver

:::::: TO: Talel Shenhar <talel@amazon.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
