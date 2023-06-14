Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B36101;
	Wed, 14 Jun 2023 09:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A5EC433C8;
	Wed, 14 Jun 2023 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686735685;
	bh=J9D0SV/LYf0sY4w5CZzSATY9xNzKy9ZcUK0yKjPYxtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cnbgxrHlixqbzmoilfAQdDNKRyHVNUXduo5jWAZsTL/uQWBKuPPQal9ryDI+g0T9Z
	 4J10xIOjt6/FcfvE6bN6pftuLJ6EX8pg2UymOjSQ03meyPFi90zBKMRZwcDitztxfh
	 oAVgZ9wHFcA7XrwYrKF5FSy5tES7PerzJ0ClafOYbFxuVKLjngMcWPbTB9j86+K9j/
	 ge9+RSbstyPVHXxbsD+2o7ZZ4vIcQPIoboGZCdYeZZgBFWnqI/fHFsHgvpw2AMpbfs
	 pE4TOi8CjvDjWa7apaROhjIcpGQESkt1UgePuiPGSWHBvXEJLvBUET2oODVSkkiJwd
	 hjamFB3Df5rXA==
Message-ID: <ff92e980-a531-d37e-448d-c85a106a725a@kernel.org>
Date: Wed, 14 Jun 2023 18:41:23 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master 9063/9793] drivers/ata/pata_octeon_cf.c:835:7:
 error: call to undeclared function 'of_property_read_reg'; ISO C99 and later
 do not support implicit function declarations
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>
References: <202306141702.ZaO9V2lk-lkp@intel.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <202306141702.ZaO9V2lk-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/23 18:23, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b16049b21162bb649cdd8519642a35972b7910fe
> commit: d0b2461678b12c08d43eaf6740485e2f2c3aeac6 [9063/9793] ata: Use of_property_read_reg() to parse "reg"
> config: mips-randconfig-r016-20230614 (https://download.01.org/0day-ci/archive/20230614/202306141702.ZaO9V2lk-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips64-linux-gnuabi64
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d0b2461678b12c08d43eaf6740485e2f2c3aeac6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout d0b2461678b12c08d43eaf6740485e2f2c3aeac6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/ata/
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306141702.ZaO9V2lk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/ata/pata_octeon_cf.c:835:7: error: call to undeclared function 'of_property_read_reg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      835 |         rv = of_property_read_reg(node, 0, &reg, NULL);

Rob,

I guess this is missing:

diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index 57b2166a6d5d..ff538b858928 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/irq.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <scsi/scsi_host.h>

I can add that if you want. Or you can send a fix and I will queue it,
whichever is fine.


>          |              ^
>    drivers/ata/pata_octeon_cf.c:959:48: warning: shift count >= width of type [-Wshift-count-overflow]
>      959 |         rv = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>          |                                                       ^~~~~~~~~~~~~~~~
>    include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
>       76 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>          |                                                      ^ ~~~
>    1 warning and 1 error generated.
> 
> 
> vim +/of_property_read_reg +835 drivers/ata/pata_octeon_cf.c
> 
>    801	
>    802	static int octeon_cf_probe(struct platform_device *pdev)
>    803	{
>    804		struct resource *res_cs0, *res_cs1;
>    805	
>    806		bool is_16bit;
>    807		u64 reg;
>    808		struct device_node *node;
>    809		void __iomem *cs0;
>    810		void __iomem *cs1 = NULL;
>    811		struct ata_host *host;
>    812		struct ata_port *ap;
>    813		int irq = 0;
>    814		irq_handler_t irq_handler = NULL;
>    815		void __iomem *base;
>    816		struct octeon_cf_port *cf_port;
>    817		int rv = -ENOMEM;
>    818		u32 bus_width;
>    819	
>    820		node = pdev->dev.of_node;
>    821		if (node == NULL)
>    822			return -EINVAL;
>    823	
>    824		cf_port = devm_kzalloc(&pdev->dev, sizeof(*cf_port), GFP_KERNEL);
>    825		if (!cf_port)
>    826			return -ENOMEM;
>    827	
>    828		cf_port->is_true_ide = of_property_read_bool(node, "cavium,true-ide");
>    829	
>    830		if (of_property_read_u32(node, "cavium,bus-width", &bus_width) == 0)
>    831			is_16bit = (bus_width == 16);
>    832		else
>    833			is_16bit = false;
>    834	
>  > 835		rv = of_property_read_reg(node, 0, &reg, NULL);
>    836		if (rv < 0)
>    837			return rv;
>    838		cf_port->cs0 = upper_32_bits(reg);
>    839	
>    840		if (cf_port->is_true_ide) {
>    841			struct device_node *dma_node;
>    842			dma_node = of_parse_phandle(node,
>    843						    "cavium,dma-engine-handle", 0);
>    844			if (dma_node) {
>    845				struct platform_device *dma_dev;
>    846				dma_dev = of_find_device_by_node(dma_node);
>    847				if (dma_dev) {
>    848					struct resource *res_dma;
>    849					int i;
>    850					res_dma = platform_get_resource(dma_dev, IORESOURCE_MEM, 0);
>    851					if (!res_dma) {
>    852						put_device(&dma_dev->dev);
>    853						of_node_put(dma_node);
>    854						return -EINVAL;
>    855					}
>    856					cf_port->dma_base = (u64)devm_ioremap(&pdev->dev, res_dma->start,
>    857										 resource_size(res_dma));
>    858					if (!cf_port->dma_base) {
>    859						put_device(&dma_dev->dev);
>    860						of_node_put(dma_node);
>    861						return -EINVAL;
>    862					}
>    863	
>    864					i = platform_get_irq(dma_dev, 0);
>    865					if (i > 0) {
>    866						irq = i;
>    867						irq_handler = octeon_cf_interrupt;
>    868					}
>    869					put_device(&dma_dev->dev);
>    870				}
>    871				of_node_put(dma_node);
>    872			}
>    873			res_cs1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>    874			if (!res_cs1)
>    875				return -EINVAL;
>    876	
>    877			cs1 = devm_ioremap(&pdev->dev, res_cs1->start,
>    878						   resource_size(res_cs1));
>    879			if (!cs1)
>    880				return -EINVAL;
>    881	
>    882			rv = of_property_read_reg(node, 1, &reg, NULL);
>    883			if (rv < 0)
>    884				return rv;
>    885			cf_port->cs1 = upper_32_bits(reg);
>    886		}
>    887	
>    888		res_cs0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>    889		if (!res_cs0)
>    890			return -EINVAL;
>    891	
>    892		cs0 = devm_ioremap(&pdev->dev, res_cs0->start,
>    893					   resource_size(res_cs0));
>    894		if (!cs0)
>    895			return rv;
>    896	
>    897		/* allocate host */
>    898		host = ata_host_alloc(&pdev->dev, 1);
>    899		if (!host)
>    900			return rv;
>    901	
>    902		ap = host->ports[0];
>    903		ap->private_data = cf_port;
>    904		pdev->dev.platform_data = cf_port;
>    905		cf_port->ap = ap;
>    906		ap->ops = &octeon_cf_ops;
>    907		ap->pio_mask = ATA_PIO6;
>    908		ap->flags |= ATA_FLAG_NO_ATAPI | ATA_FLAG_PIO_POLLING;
>    909	
>    910		if (!is_16bit) {
>    911			base = cs0 + 0x800;
>    912			ap->ioaddr.cmd_addr	= base;
>    913			ata_sff_std_ports(&ap->ioaddr);
>    914	
>    915			ap->ioaddr.altstatus_addr = base + 0xe;
>    916			ap->ioaddr.ctl_addr	= base + 0xe;
>    917			octeon_cf_ops.sff_data_xfer = octeon_cf_data_xfer8;
>    918		} else if (cf_port->is_true_ide) {
>    919			base = cs0;
>    920			ap->ioaddr.cmd_addr	= base + (ATA_REG_CMD << 1) + 1;
>    921			ap->ioaddr.data_addr	= base + (ATA_REG_DATA << 1);
>    922			ap->ioaddr.error_addr	= base + (ATA_REG_ERR << 1) + 1;
>    923			ap->ioaddr.feature_addr	= base + (ATA_REG_FEATURE << 1) + 1;
>    924			ap->ioaddr.nsect_addr	= base + (ATA_REG_NSECT << 1) + 1;
>    925			ap->ioaddr.lbal_addr	= base + (ATA_REG_LBAL << 1) + 1;
>    926			ap->ioaddr.lbam_addr	= base + (ATA_REG_LBAM << 1) + 1;
>    927			ap->ioaddr.lbah_addr	= base + (ATA_REG_LBAH << 1) + 1;
>    928			ap->ioaddr.device_addr	= base + (ATA_REG_DEVICE << 1) + 1;
>    929			ap->ioaddr.status_addr	= base + (ATA_REG_STATUS << 1) + 1;
>    930			ap->ioaddr.command_addr	= base + (ATA_REG_CMD << 1) + 1;
>    931			ap->ioaddr.altstatus_addr = cs1 + (6 << 1) + 1;
>    932			ap->ioaddr.ctl_addr	= cs1 + (6 << 1) + 1;
>    933			octeon_cf_ops.sff_data_xfer = octeon_cf_data_xfer16;
>    934	
>    935			ap->mwdma_mask	= enable_dma ? ATA_MWDMA4 : 0;
>    936	
>    937			/* True IDE mode needs a timer to poll for not-busy.  */
>    938			hrtimer_init(&cf_port->delayed_finish, CLOCK_MONOTONIC,
>    939				     HRTIMER_MODE_REL);
>    940			cf_port->delayed_finish.function = octeon_cf_delayed_finish;
>    941		} else {
>    942			/* 16 bit but not True IDE */
>    943			base = cs0 + 0x800;
>    944			octeon_cf_ops.sff_data_xfer	= octeon_cf_data_xfer16;
>    945			octeon_cf_ops.softreset		= octeon_cf_softreset16;
>    946			octeon_cf_ops.sff_check_status	= octeon_cf_check_status16;
>    947			octeon_cf_ops.sff_tf_read	= octeon_cf_tf_read16;
>    948			octeon_cf_ops.sff_tf_load	= octeon_cf_tf_load16;
>    949			octeon_cf_ops.sff_exec_command	= octeon_cf_exec_command16;
>    950	
>    951			ap->ioaddr.data_addr	= base + ATA_REG_DATA;
>    952			ap->ioaddr.nsect_addr	= base + ATA_REG_NSECT;
>    953			ap->ioaddr.lbal_addr	= base + ATA_REG_LBAL;
>    954			ap->ioaddr.ctl_addr	= base + 0xe;
>    955			ap->ioaddr.altstatus_addr = base + 0xe;
>    956		}
>    957		cf_port->c0 = ap->ioaddr.ctl_addr;
>    958	
>    959		rv = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>    960		if (rv)
>    961			return rv;
>    962	
>    963		ata_port_desc(ap, "cmd %p ctl %p", base, ap->ioaddr.ctl_addr);
>    964	
>    965		dev_info(&pdev->dev, "version " DRV_VERSION" %d bit%s.\n",
>    966			 is_16bit ? 16 : 8,
>    967			 cf_port->is_true_ide ? ", True IDE" : "");
>    968	
>    969		return ata_host_activate(host, irq, irq_handler,
>    970					 IRQF_SHARED, &octeon_cf_sht);
>    971	}
>    972	
> 

-- 
Damien Le Moal
Western Digital Research

