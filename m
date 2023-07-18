Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA023D9
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689670040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QWJEDqz/K47DCY7+PsL5ETw0UGeTlE8XcxsSbLhdR7Y=;
	b=ZmkAfK/XLAkzbQHwUWstqxfEp8v9V9xYBCY7fQoEDzdo0CfCY4Q4IH8aufBj0XYQ3b7Hm0
	UyXyhQau5q8hvvxT+KCbPWP68gCITHPr/yQjNgi+GejhIp9GtzqfsnudGlRB3R39tu2ZlV
	c5vFyIuHWUpyncXEJQlSd5FwcuFWR1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-i7g2D4vKNsKx1HOtfg0Kpg-1; Tue, 18 Jul 2023 04:47:18 -0400
X-MC-Unique: i7g2D4vKNsKx1HOtfg0Kpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25693185A795;
	Tue, 18 Jul 2023 08:47:18 +0000 (UTC)
Received: from localhost (ovpn-12-39.pek2.redhat.com [10.72.12.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D793E4CD0F8;
	Tue, 18 Jul 2023 08:47:16 +0000 (UTC)
Date: Tue, 18 Jul 2023 16:47:13 +0800
From: "bhe@redhat.com" <bhe@redhat.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
Cc: lkp <lkp@intel.com>, "hch@lst.de" <hch@lst.de>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"rppt@kernel.org" <rppt@kernel.org>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>
Subject: Re: [akpm-mm:mm-unstable 93/173] drivers/clk/clk-fixed-mmio.c:33:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ZLZRkSu94nPrOyBa@MiWiFi-R3L-srv>
References: <202307131033.JgvCSVz4-lkp@intel.com>
 <20230713092618.9a25417dc886b4f61660fe17@linux-foundation.org>
 <ZLCP0s5aRLLOfVYt@MiWiFi-R3L-srv>
 <1a8bdfb49897cd9808f5a1180df0b629d3b9d12c.camel@intel.com>
 <ZLXXh8QUiu0d2GfI@MiWiFi-R3L-srv>
 <36bdd39bfdcf7825d8dbfc7d3c7bb73849d238ca.camel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <36bdd39bfdcf7825d8dbfc7d3c7bb73849d238ca.camel@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 07/18/23 at 06:19am, Liu, Yujie wrote:
> On Tue, 2023-07-18 at 08:06 +0800, bhe@redhat.com wrote:
> > On 07/17/23 at 07:05am, Liu, Yujie wrote:
> > > Hi Baoquan,
> > > 
> > > On Fri, 2023-07-14 at 07:59 +0800, Baoquan He wrote:
> > > > > 
> > > > > In file included from ./include/linux/io.h:13,
> > > > >                  from drivers/clk/clk-fixed-mmio.c:13:
> > > > > drivers/clk/clk-fixed-mmio.c: In function 'fixed_mmio_clk_setup':
> > > > > ./arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
> > > > >    29 | #define iounmap iounmap
> > > > >       |                 ^~~~~~~
> > > > > drivers/clk/clk-fixed-mmio.c:33:9: note: in expansion of macro 'iounmap'
> > > > >    33 |         iounmap(base);
> > > > >       |         ^~~~~~~
> > > > 
> > > > These iorempa/iounmap not defined or declared are not related to my
> > > > patches. S390 could set CONFIG_PCI=n, however its ioremap/iounmap code
> > > > are all defined in arch/s390/pci/pci.c. Means its ioremap/iounmap code
> > > > depends on CONFIG_PCI enabling. So those drivers invoking iomem
> > > > functions, (e.g ioremap(), devm_ioremap(), etc) all will be failed to
> > > > build if CONFIG_PCI=n on s390.
> > > > 
> > > > All these errors have been fixed in my another patchset.
> > > > 
> > > > https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com/T/#u
> > > 
> > > Sorry for the duplicate reports and late reply.
> > > 
> > > We searched the log of kernel test robot and got the following clues
> > > for this case:
> > > 
> > > This is a randconfig build test, so the kconfig happened to set
> > > CONFIG_PCI=n and CONFIG_COMMON_CLK_FIXED_MMIO=y, and it is good to
> > > build the clk-fixed-mmio driver in such case before, but it raises a
> > > build error after applying your patches, so the bot thought that a new
> > > build error was introduced and sent reports to you.
> > > 
> > > == without the patches (v6.5-rc1 as example) ==
> > > 
> > > $ git checkout v6.5-rc1
> > > HEAD is now at 06c2afb862f9 Linux 6.5-rc1
> > > 
> > > $ grep -e CONFIG_PCI -e CONFIG_COMMON_CLK_FIXED_MMIO .config
> > > # CONFIG_PCI is not set
> > > CONFIG_COMMON_CLK_FIXED_MMIO=y
> > > 
> > > $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross LLVM_IAS=1 W=1 ARCH=s390 drivers/clk/clk-fixed-mmio.o
> > > ...
> > > 
> > > $ file drivers/clk/clk-fixed-mmio.o
> > > drivers/clk/clk-fixed-mmio.o: ELF 64-bit MSB relocatable, IBM S/390, version 1 (SYSV), not stripped
> > > 
> > > == with the patches ==
> > > 
> > > $ git checkout b0f683e34a5b
> > > HEAD is now at b0f683e34a5b s390: mm: convert to GENERIC_IOREMAP
> > > 
> > > $ grep -e CONFIG_PCI -e CONFIG_COMMON_CLK_FIXED_MMIO .config
> > > # CONFIG_PCI is not set
> > > CONFIG_COMMON_CLK_FIXED_MMIO=y
> > > 
> > > $ COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ./make.cross LLVM_IAS=1 W=1 ARCH=s390 drivers/clk/clk-fixed-mmio.o
> > > ...
> > > drivers/clk/clk-fixed-mmio.c:33:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> > >    33 |         iounmap(base);
> > >       |         ^
> > > ./arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
> > >    29 | #define iounmap iounmap
> > >       |                 ^
> > > drivers/clk/clk-fixed-mmio.c:33:2: note: did you mean 'vunmap'?
> > > ./arch/s390/include/asm/io.h:29:17: note: expanded from macro 'iounmap'
> > >    29 | #define iounmap iounmap
> > >       |                 ^
> > > ./include/linux/vmalloc.h:167:13: note: 'vunmap' declared here
> > >   167 | extern void vunmap(const void *addr);
> > >       |             ^
> > > 12 warnings and 1 error generated.
> > > make[4]: *** [scripts/Makefile.build:243: drivers/clk/clk-fixed-mmio.o] Error 1
> > > make[3]: *** [scripts/Makefile.build:477: drivers/clk] Error 2
> > > make[3]: Target 'drivers/clk/clk-fixed-mmio.o' not remade because of errors.
> > > make[2]: *** [scripts/Makefile.build:477: drivers] Error 2
> > > make[2]: Target 'drivers/clk/clk-fixed-mmio.o' not remade because of errors.
> > > make[1]: *** [/home/yujie/linux/Makefile:2020: .] Error 2
> > > make[1]: Target 'drivers/clk/clk-fixed-mmio.o' not remade because of errors.
> > > make: *** [Makefile:234: __sub-make] Error 2
> > > make: Target 'drivers/clk/clk-fixed-mmio.o' not remade because of errors.
> > > 
> > > 
> > > After applying the patchset at
> > > https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com,
> > > above situation cannot happen anymore because CONFIG_PCI and
> > > CONFIG_COMMON_CLK_FIXED_MMIO can only be both enabled or both disabled,
> > > so the issue has been resolved.
> > 
> > No, your process may need be improved.
> > 
> > On linus's master branch, you can pass compiling on
> > drivers/clk/clk-fixed-mmio.o, but you absolutely will fail during linking
> > stage. As I have explained, ioremap()/iounmap()/ioremap_xx() are all
> > defined in arch/s390/pci/pci.c. Setting CONFIG_PCI=n will make you not
> > be able to find the implementation of ioremap()/iounmap(). Don't you
> > finish the whole building process of kernel image and modules?
> 
> Sorry I didn't make it very clear in the last mail. We also got the
> failure in link stage when testing on mainline. After applying your
> patch, it became an error in compile stage and won't reach link stage
> anymore. In other words, your patch helped to expose an existing issue
> earlier from linking to compiling. Our bot cannot handle such case very
> well for now since the compiling error and linking error are very
> different. Of course this should be a false positive report and your
> patch should not be blamed for exposing an existing issue. Sorry for
> any misleading or disturbing. We will consider some optimizations for
> similar cases.

I see. Seems there's still room for LKP to differentiate the compiling
issue from the linking issue.

Thanks for these details and your great effort.

> 
> 
> > Please see below building log, the linking is failed. I got a new s390x
> > machine, and git clone linus's tree and build with randconfig from this
> > lkp report. 
> > 
> > When I made below patch and tested, I also only git clone linus's latest
> > kernel tree. I didn't apply any patch. The current lkp report and your
> > checking could be misleading.
> > 
> > [PATCH 0/8] Make several Kconfig options depend on HAS_IOMEM
> > https://lore.kernel.org/all/20230707135852.24292-1-bhe@redhat.com,
> > 
> > =====
> >   AR      drivers/iio/built-in.a
> >   AR      drivers/built-in.a
> >   AR      built-in.a
> >   AR      vmlinux.a
> >   LD      vmlinux.o
> >   OBJCOPY modules.builtin.modinfo
> >   GEN     modules.builtin
> >   MODPOST vmlinux.symvers
> >   UPD     include/generated/utsversion.h
> >   CC      init/version-timestamp.o
> >   LD      .tmp_vmlinux.kallsyms1
> > ld: drivers/clk/clk-fixed-mmio.o: in function `fixed_mmio_clk_setup':
> > clk-fixed-mmio.c:(.text+0x44): undefined reference to `of_iomap'
> > ld: clk-fixed-mmio.c:(.text+0x9c): undefined reference to `iounmap'
> > ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
> > cistpl.c:(.text+0x52a): undefined reference to `ioremap'
> > ld: cistpl.c:(.text+0x602): undefined reference to `iounmap'
> > ld: cistpl.c:(.text+0x650): undefined reference to `iounmap'
> > ld: cistpl.c:(.text+0x668): undefined reference to `ioremap'
> > ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
> > cistpl.c:(.text+0x85c): undefined reference to `iounmap'
> > make[2]: *** [scripts/Makefile.vmlinux:36: vmlinux] Error 1
> > make[1]: *** [/root/linux/Makefile:1238: vmlinux] Error 2
> > make: *** [Makefile:234: __sub-make] Error 2
> > 
> > 
> 

