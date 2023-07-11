Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9050381
	for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 00:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689036329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9aJL0u+yGM/uh4qwyoLZSKsmodsHf/CVnrxTEtn30/8=;
	b=i4Z/FRIG2VPbnk4lFYBVTXT9lCbvW8AdPgREKBtRi/JDY4qMfmvvJmySXoHRpT3tHerdCI
	N5QjjROrJ676rp+h2WsQqS30MyivpGGlj4+sb9qPLuaorZcbQ2ggRdcm5jRbRk1/mh1hZS
	LHupmuu/oHqv4HmMf/bKLSxxuWEklGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-UQLr4YSOMRGtGcSogPAkAw-1; Mon, 10 Jul 2023 20:45:26 -0400
X-MC-Unique: UQLr4YSOMRGtGcSogPAkAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 685DF1C03D87;
	Tue, 11 Jul 2023 00:45:25 +0000 (UTC)
Received: from localhost (ovpn-12-93.pek2.redhat.com [10.72.12.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31ACD40C6CD1;
	Tue, 11 Jul 2023 00:45:23 +0000 (UTC)
Date: Tue, 11 Jul 2023 08:45:20 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 86/125] drivers/irqchip/irq-al-fic.c:281:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ZKymIF5NdqXP1ydb@MiWiFi-R3L-srv>
References: <202307110516.V0qgum1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202307110516.V0qgum1Q-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 07/11/23 at 05:22am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   17712b3b36c898462c3d31d4b47bd069e87359c5
> commit: 7aeb1874c9d6e390a405529c7eec76d2486f65d8 [86/125] s390: mm: convert to GENERIC_IOREMAP
> config: s390-randconfig-r015-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307110516.V0qgum1Q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/irqchip/irq-al-fic.c:7:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val = __raw_readb(PCI_IOBASE + addr);

Thanks for reporting. I am not gonna to fix it because Nathan told me
there had been a series specifically taking care of the PCI_IOBASE
warnings from Niklas. Quote Nathan's words here for reference:


https://lore.kernel.org/all/20230612160237.GA199007@dev-arch.thelio-3990X/T/#u
===
I believe that this series [1] by Niklas Schnelle should take care of
the PCI_IOBASE warnings (which are not Hexagon specific), so there is no
need to worry about them when they show up in build reports.

[1]: https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/

Cheers,
Nathan
===

>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
>      102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
>          |                                                      ^
>    In file included from drivers/irqchip/irq-al-fic.c:7:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
>      115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
>          |                                                      ^
>    In file included from drivers/irqchip/irq-al-fic.c:7:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      584 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      692 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      700 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      708 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      717 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      726 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      735 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
> >> drivers/irqchip/irq-al-fic.c:281:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      281 |         iounmap(base);
>          |         ^
>    arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
>       29 | #define iounmap iounmap
>          |                 ^
>    drivers/irqchip/irq-al-fic.c:281:2: note: did you mean 'vunmap'?
>    arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
>       29 | #define iounmap iounmap
>          |                 ^
>    include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
>      167 | extern void vunmap(const void *addr);
>          |             ^
>    12 warnings and 1 error generated.
> 
> 
> vim +/iounmap +281 drivers/irqchip/irq-al-fic.c
> 
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  236  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  237  static int __init al_fic_init_dt(struct device_node *node,
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  238  				 struct device_node *parent)
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  239  {
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  240  	int ret;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  241  	void __iomem *base;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  242  	unsigned int parent_irq;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  243  	struct al_fic *fic;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  244  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  245  	if (!parent) {
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  246  		pr_err("%s: unsupported - device require a parent\n",
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  247  		       node->name);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  248  		return -EINVAL;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  249  	}
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  250  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  251  	base = of_iomap(node, 0);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  252  	if (!base) {
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  253  		pr_err("%s: fail to map memory\n", node->name);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  254  		return -ENOMEM;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  255  	}
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  256  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  257  	parent_irq = irq_of_parse_and_map(node, 0);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  258  	if (!parent_irq) {
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  259  		pr_err("%s: fail to map irq\n", node->name);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  260  		ret = -EINVAL;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  261  		goto err_unmap;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  262  	}
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  263  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  264  	fic = al_fic_wire_init(node,
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  265  			       base,
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  266  			       node->name,
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  267  			       parent_irq);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  268  	if (IS_ERR(fic)) {
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  269  		pr_err("%s: fail to initialize irqchip (%lu)\n",
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  270  		       node->name,
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  271  		       PTR_ERR(fic));
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  272  		ret = PTR_ERR(fic);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  273  		goto err_irq_dispose;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  274  	}
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  275  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  276  	return 0;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  277  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  278  err_irq_dispose:
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  279  	irq_dispose_mapping(parent_irq);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  280  err_unmap:
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10 @281  	iounmap(base);
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  282  
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  283  	return ret;
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  284  }
> 1eb77c3bcdb70f Talel Shenhar 2019-06-10  285  
> 
> :::::: The code at line 281 was first introduced by commit
> :::::: 1eb77c3bcdb70f2501f419b3da45b19acaf01072 irqchip/al-fic: Introduce Amazon's Annapurna Labs Fabric Interrupt Controller Driver
> 
> :::::: TO: Talel Shenhar <talel@amazon.com>
> :::::: CC: Marc Zyngier <marc.zyngier@arm.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

