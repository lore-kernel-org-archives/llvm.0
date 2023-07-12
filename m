Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237B136E
	for <llvm@lists.linux.dev>; Wed, 12 Jul 2023 00:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689121765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HIS0Z/cU+AKJbdeUKT6iTrbHjC1cruwHqVN81WZRpYw=;
	b=Ts294eZDv2mAkHRKLYjDjHLrCDLUMWf2yeXdGdfdYHC/K35vkZ7OH+oh/QsF/6Up+7K7f8
	wV4pWrnFICYljFthDzrwgSQ3zsUf2OHf+Czt7sWLA7qA7VQ5hl0bNQebZXiHykjoATIeb/
	LVpkwXKvdCZ2t1dRitWos1Hfnhux5f8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-U3d5Oq54M8GWmcsSI7J7yg-1; Tue, 11 Jul 2023 20:29:21 -0400
X-MC-Unique: U3d5Oq54M8GWmcsSI7J7yg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B041858290;
	Wed, 12 Jul 2023 00:29:21 +0000 (UTC)
Received: from localhost (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32597492C13;
	Wed, 12 Jul 2023 00:29:19 +0000 (UTC)
Date: Wed, 12 Jul 2023 08:29:16 +0800
From: Baoquan He <bhe@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 86/125] drivers/irqchip/irq-al-fic.c:281:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ZK3z3FeSi9Nlbzjn@MiWiFi-R3L-srv>
References: <202307110516.V0qgum1Q-lkp@intel.com>
 <ZKymIF5NdqXP1ydb@MiWiFi-R3L-srv>
 <20230711172008.GA369569@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230711172008.GA369569@dev-arch.thelio-3990X>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/11/23 at 10:20am, Nathan Chancellor wrote:
> Hi Baoquan,
> 
> On Tue, Jul 11, 2023 at 08:45:20AM +0800, Baoquan He wrote:
> > Hi,
> > 
> > On 07/11/23 at 05:22am, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > > head:   17712b3b36c898462c3d31d4b47bd069e87359c5
> > > commit: 7aeb1874c9d6e390a405529c7eec76d2486f65d8 [86/125] s390: mm: convert to GENERIC_IOREMAP
> > > config: s390-randconfig-r015-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/config)
> > > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > > reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110516.V0qgum1Q-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202307110516.V0qgum1Q-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from drivers/irqchip/irq-al-fic.c:7:
> > >    In file included from include/linux/irq.h:20:
> > >    In file included from include/linux/io.h:13:
> > >    In file included from arch/s390/include/asm/io.h:78:
> > >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      547 |         val = __raw_readb(PCI_IOBASE + addr);
> > 
> > Thanks for reporting. I am not gonna to fix it because Nathan told me
> > there had been a series specifically taking care of the PCI_IOBASE
> > warnings from Niklas. Quote Nathan's words here for reference:
> > 
> > 
> > https://lore.kernel.org/all/20230612160237.GA199007@dev-arch.thelio-3990X/T/#u
> > ===
> > I believe that this series [1] by Niklas Schnelle should take care of
> > the PCI_IOBASE warnings (which are not Hexagon specific), so there is no
> > need to worry about them when they show up in build reports.
> > 
> > [1]: https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/
> > 
> > Cheers,
> > Nathan
> > ===
> > 
> > >          |                           ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
> > >          |                                                         ~~~~~~~~~~ ^
> > >    include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
> > >       37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
> > >          |                                                           ^
> > >    include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
> > >      102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> > >          |                                                      ^
> > >    In file included from drivers/irqchip/irq-al-fic.c:7:
> > >    In file included from include/linux/irq.h:20:
> > >    In file included from include/linux/io.h:13:
> > >    In file included from arch/s390/include/asm/io.h:78:
> > >    include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
> > >          |                                                         ~~~~~~~~~~ ^
> > >    include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
> > >       35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
> > >          |                                                           ^
> > >    include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
> > >      115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
> > >          |                                                      ^
> > >    In file included from drivers/irqchip/irq-al-fic.c:7:
> > >    In file included from include/linux/irq.h:20:
> > >    In file included from include/linux/io.h:13:
> > >    In file included from arch/s390/include/asm/io.h:78:
> > >    include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      584 |         __raw_writeb(value, PCI_IOBASE + addr);
> > >          |                             ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
> > >          |                                                       ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
> > >          |                                                       ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      692 |         readsb(PCI_IOBASE + addr, buffer, count);
> > >          |                ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      700 |         readsw(PCI_IOBASE + addr, buffer, count);
> > >          |                ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      708 |         readsl(PCI_IOBASE + addr, buffer, count);
> > >          |                ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      717 |         writesb(PCI_IOBASE + addr, buffer, count);
> > >          |                 ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      726 |         writesw(PCI_IOBASE + addr, buffer, count);
> > >          |                 ~~~~~~~~~~ ^
> > >    include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> > >      735 |         writesl(PCI_IOBASE + addr, buffer, count);
> > >          |                 ~~~~~~~~~~ ^
> > > >> drivers/irqchip/irq-al-fic.c:281:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > >      281 |         iounmap(base);
> > >          |         ^
> > >    arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
> > >       29 | #define iounmap iounmap
> > >          |                 ^
> > >    drivers/irqchip/irq-al-fic.c:281:2: note: did you mean 'vunmap'?
> > >    arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
> > >       29 | #define iounmap iounmap
> > >          |                 ^
> > >    include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
> > >      167 | extern void vunmap(const void *addr);
> > >          |             ^
> > >    12 warnings and 1 error generated.
> 
> It seems like this was the error that the robot thinks that your patch
> introduced, which seems like it might be legitimate? Is an
> asm-generic/io.h include missing somewhere or is there some prexisting
> issue that is exposed with your patch?

These errors have been there for long time.

In the current linus's tree, as long as CONFIG_PCI is disabled, these
errors can be seen. I don't know why they are reported on my patches
utill now.

You can see in arch/s390/pci/pci.c, ioremap_xx() and iounmap are all
defined there. Only enabling CONFIG_PCI can build and link in pci.o.
Otherwise, all those drivers calling ioremap(), devm_ioremap(), their
variants or wrappers will fail building and trigger errors like this
report. It's not related to my patch. LKP test robot may need provide
a clean base to test posted patches to avoid confusion.

arch/s390/pci/pci.c:
==================
obj-$(CONFIG_PCI)       += pci.o pci_irq.o pci_dma.o pci_clp.o pci_sysfs.o \
                           pci_event.o pci_debug.o pci_insn.o pci_mmio.o \
                           pci_bus.o pci_kvm_hook.o
obj-$(CONFIG_PCI_IOV)   += pci_iov.o

