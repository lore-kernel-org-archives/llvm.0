Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD436AAC
	for <llvm@lists.linux.dev>; Thu, 13 Jul 2023 23:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689292762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/jxdIUUY7gs59Ov4EIEGHzVHKB2jMUngDkbYRTbNMI=;
	b=HtAVrIWUx87Gvb5mPx3MVTV40GfZ0IOtLfDtcXYzLiepoVPqdpiG+UfhVYa2IQhw0zquia
	+up1R3fNomlCTt3DsyOMqoCR1n/RqGZZXnfMIjmtVWjQ0UD7VwmyK3cAj0D+PZ/TcgrhiD
	gneFtDshzn/YWtlGA+KjkbAoL4gSVFM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-PToXuKo2OzyCK_V3zcgtNA-1; Thu, 13 Jul 2023 19:59:19 -0400
X-MC-Unique: PToXuKo2OzyCK_V3zcgtNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42E031C04B40;
	Thu, 13 Jul 2023 23:59:19 +0000 (UTC)
Received: from localhost (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC54111E3EA;
	Thu, 13 Jul 2023 23:59:18 +0000 (UTC)
Date: Fri, 14 Jul 2023 07:59:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 93/173] drivers/clk/clk-fixed-mmio.c:33:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ZLCP0s5aRLLOfVYt@MiWiFi-R3L-srv>
References: <202307131033.JgvCSVz4-lkp@intel.com>
 <20230713092618.9a25417dc886b4f61660fe17@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230713092618.9a25417dc886b4f61660fe17@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

On 07/13/23 at 09:26am, Andrew Morton wrote:
> On Thu, 13 Jul 2023 10:57:34 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   e726c62e70a70ae5536caa0aa131c5dce5c6f764
> > commit: 827057ff3ce7554741d431145c3b93f1a54125fc [93/173] s390: mm: convert to GENERIC_IOREMAP
> > config: s390-randconfig-r033-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307131033.JgvCSVz4-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/clk/clk-fixed-mmio.c:13:
> >    In file included from include/linux/io.h:13:
> >    In file included from arch/s390/include/asm/io.h:78:
> >    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >      547 |         val = __raw_readb(PCI_IOBASE + addr);
> >          |                           ~~~~~~~~~~ ^
> 
> Thanks.  When I tried that config I got

These two kinds of errors have been reported many times.

This PCI_IOBASE warning will be fixed by Niklas's patch at below:

https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/


Nathan told this when he reviewed by patch at this sub-thread:
https://lore.kernel.org/all/20230612160237.GA199007@dev-arch.thelio-3990X/T/#u

Quote his words here:
===
I believe that this series [1] by Niklas Schnelle should take care of
the PCI_IOBASE warnings (which are not Hexagon specific), so there is no
need to worry about them when they show up in build reports.

[1]: https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/

Cheers,
Nathan
===



> 
> In file included from ./include/linux/io.h:13,
>                  from drivers/clk/clk-fixed-mmio.c:13:
> drivers/clk/clk-fixed-mmio.c: In function 'fixed_mmio_clk_setup':
> ./arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
>    29 | #define iounmap iounmap
>       |                 ^~~~~~~
> drivers/clk/clk-fixed-mmio.c:33:9: note: in expansion of macro 'iounmap'
>    33 |         iounmap(base);
>       |         ^~~~~~~

These iorempa/iounmap not defined or declared are not related to my
patches. S390 could set CONFIG_PCI=n, however its ioremap/iounmap code
are all defined in arch/s390/pci/pci.c. Means its ioremap/iounmap code
depends on CONFIG_PCI enabling. So those drivers invoking iomem
functions, (e.g ioremap(), devm_ioremap(), etc) all will be failed to
build if CONFIG_PCI=n on s390.

All these errors have been fixed in my another patchset.

https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com/T/#u

> 
> I'll drop the series.

I didn't reply this time because these have been reported repeatedly
recently, I have replied to explain many times in different lkp test
robot. They are all the same two things.

Conclusion:
===========
PCI_IOBASE warning
 - taken care by Niklas's patchset
 - https://lore.kernel.org/20230522105049.1467313-1-schnelle@linux.ibm.com/
ioremap/iounmap/devm_ioremap_xxx not declared
 - existed for very long time, but not caused by my patches, and fixed in my another patchset
 - https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com/T/#u

Thanks

