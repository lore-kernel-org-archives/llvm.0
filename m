Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA3EA4
	for <llvm@lists.linux.dev>; Fri,  7 Jul 2023 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688692543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2io8AIzSMd9wwAQZPfbZcscAtVofF1NxMXwmdTfkZMI=;
	b=A93w9Y+cmsRz2dWj1QM0rsvSIlsN3VFJDdyjKA/vPBpT8hF+BANYa0h/SArrMVHRIa7EzA
	FXly3QwbB75Ffuiqy3Cs4KTKRFiKMXyaRMdHmHLRh9ZHcjsHE4hDtg2AH88wdJJ5nDPuhA
	FGcQy84NwQ3ADapbjIus0UuwuCNues4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-obBqN_cKN8ysfPOLPUvisQ-1; Thu, 06 Jul 2023 21:15:40 -0400
X-MC-Unique: obBqN_cKN8ysfPOLPUvisQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F348628088A0;
	Fri,  7 Jul 2023 01:15:39 +0000 (UTC)
Received: from localhost (ovpn-12-39.pek2.redhat.com [10.72.12.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394B040C206F;
	Fri,  7 Jul 2023 01:15:38 +0000 (UTC)
Date: Fri, 7 Jul 2023 09:15:35 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 105/116] drivers/pcmcia/cistpl.c:72:3:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <ZKdnN1nT2wFfKovf@MiWiFi-R3L-srv>
References: <202307070824.xaZvuODM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202307070824.xaZvuODM-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 07/07/23 at 08:45am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   347e208de0e407689f4e4c596e9e38deafebe4f2
> commit: c594d5c4b6305a57e15aace4baae6bc88277bf01 [105/116] s390: mm: convert to GENERIC_IOREMAP
> config: s390-randconfig-r013-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070824.xaZvuODM-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070824.xaZvuODM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307070824.xaZvuODM-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

This has nothing to do with my patch. The reported error exists in the
current kernel as long as on s390 you set CONFIG_PCI=n and enable driver
Kconfig options like PCMCIA, AL_FIC, ALTERA_TSE, etc which invokes ioremap()
or devm_ioremap_xx, devm_memremap_xx, etc in driver code. Below patch can
fix the one happening in drivers/pcmcia/cistpl.c. I will post patches to
fix these I found when addressing lkp reported error.

From c5c23ce60b06d993588d133a7e706ec0283da004 Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Sat, 6 May 2023 19:16:27 +0800
Subject: [PATCH] pcmcia : make PCMCIA depend on HAS_IOMEM
Content-type: text/plain

On s390 systems (aka mainframes), it has classic channel devices for
networking and permanent storage that are currently even more common
than PCI devices. Hence it could have a fully functional s390 kernel
with CONFIG_PCI=n, then the relevant iomem mapping functions
[including ioremap(), devm_ioremap(), etc.] are not available.

Here let depend PCMCIA on HAS_IOMEM so that it won't be built to
cause below compiling error if PCI is unset.

-------------------------------------------------------
ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
cistpl.c:(.text+0x1202): undefined reference to `ioremap'
ld: cistpl.c:(.text+0x13b0): undefined reference to `iounmap'
ld: cistpl.c:(.text+0x14a6): undefined reference to `iounmap'
ld: cistpl.c:(.text+0x1544): undefined reference to `ioremap'
ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
cistpl.c:(.text+0x3f14): undefined reference to `iounmap'

Besides, many other Kconfig option, e.g IPWIRELESS, PCMCIA_PCNET,
PCMCIA_FMVJ18X, PCMCIA_SMC91C92 which depends on PCMCIA also will
fail to build because of the same reason.

ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/smsc/smc91c92_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/smsc/smc91c92_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/xircom/xirc2ps_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/xircom/xirc2ps_cs.ko] undefined!
ERROR: modpost: "devm_ioremap" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/arcnet/com90xx.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

Signed-off-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/pcmcia/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index e72419d7e72e..dddb235dd020 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -19,6 +19,7 @@ if PCCARD
 
 config PCMCIA
 	tristate "16-bit PCMCIA support"
+	depends on HAS_IOMEM
 	select CRC32
 	default y
 	help
-- 
2.34.1

