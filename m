Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2915C0;
	Thu, 31 Aug 2023 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693453442; x=1724989442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kAaZOeNsdL5P/yGFCiqwFfNpIqEhs1nJURY5/4CQBWg=;
  b=Lqao6Tf9TcGu15PAAleGwWr5P5kWG8DZFg543Mo+LCpTL6j0fSgF8MTA
   QbyXuyeUGx8XeeNPFG110WXCIzZXcEkHx9myR3VXmDr8/08MTOpgSQ+E7
   x1B/J3oMf89xWnOaV/V2tn1bDWpjZVVuF1ykNnzQ4aeeQElykXSdrZdYZ
   9d8xNbLyz4uvSbMZuisWLS12W2Jrg2S6yWHAYhfVtlXzNBC1mtH/oQhe/
   ct46P5u+lZ8wjhO4fcObukpbIl6b3iaFvt/Tj9R7HiE87qgG8TEB8ok0l
   w4JXElVe+Y4SjyBQD6hIYLF0WmckhyfgYapmmnqlLjBNi22SuhxwKuhJe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355300781"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="355300781"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 20:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="742472241"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="742472241"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2023 20:44:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbYb9-000AZ2-1G;
	Thu, 31 Aug 2023 03:43:59 +0000
Date: Thu, 31 Aug 2023 11:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:for-kernelci 5/7] drivers/char/tpm/tpm_i2c_nuvoton.c:549:25:
 error: incompatible pointer types passing 'struct device *' to parameter of
 type 'const struct i2c_client *'
Message-ID: <202308311153.mMpnkwUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-kernelci
head:   2f859c7b504dbff5d4770187e5416610db4625e3
commit: ac865741027a59abe81c2e7d30edfd26082751f3 [5/7] Use of_device_get_match_data
config: hexagon-randconfig-r013-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311153.mMpnkwUs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311153.mMpnkwUs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311153.mMpnkwUs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:19:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:23:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_i2c_nuvoton.c:549:25: error: incompatible pointer types passing 'struct device *' to parameter of type 'const struct i2c_client *' [-Werror,-Wincompatible-pointer-types]
           if (i2c_get_match_data(dev))
                                  ^~~
   include/linux/i2c.h:370:57: note: passing argument to parameter 'client' here
   const void *i2c_get_match_data(const struct i2c_client *client);
                                                           ^
   drivers/char/tpm/tpm_i2c_nuvoton.c:527:30: warning: unused variable 'id' [-Wunused-variable]
           const struct i2c_device_id *id = i2c_client_get_device_id(client);
                                       ^
   8 warnings and 1 error generated.
--
   In file included from drivers/mtd/nand/raw/vf610_nfc.c:27:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mtd/nand/raw/vf610_nfc.c:27:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mtd/nand/raw/vf610_nfc.c:27:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mtd/nand/raw/vf610_nfc.c:845:8: error: use of undeclared label 'err_disable_clk'
                   goto err_disable_clk;
                        ^
   6 warnings and 1 error generated.


vim +549 drivers/char/tpm/tpm_i2c_nuvoton.c

   524	
   525	static int i2c_nuvoton_probe(struct i2c_client *client)
   526	{
   527		const struct i2c_device_id *id = i2c_client_get_device_id(client);
   528		int rc;
   529		struct tpm_chip *chip;
   530		struct device *dev = &client->dev;
   531		struct priv_data *priv;
   532		u32 vid = 0;
   533	
   534		rc = get_vid(client, &vid);
   535		if (rc)
   536			return rc;
   537	
   538		dev_info(dev, "VID: %04X DID: %02X RID: %02X\n", (u16) vid,
   539			 (u8) (vid >> 16), (u8) (vid >> 24));
   540	
   541		chip = tpmm_chip_alloc(dev, &tpm_i2c);
   542		if (IS_ERR(chip))
   543			return PTR_ERR(chip);
   544	
   545		priv = devm_kzalloc(dev, sizeof(struct priv_data), GFP_KERNEL);
   546		if (!priv)
   547			return -ENOMEM;
   548	
 > 549		if (i2c_get_match_data(dev))
   550			chip->flags |= TPM_CHIP_FLAG_TPM2;
   551	
   552		init_waitqueue_head(&priv->read_queue);
   553	
   554		/* Default timeouts */
   555		chip->timeout_a = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
   556		chip->timeout_b = msecs_to_jiffies(TPM_I2C_LONG_TIMEOUT);
   557		chip->timeout_c = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
   558		chip->timeout_d = msecs_to_jiffies(TPM_I2C_SHORT_TIMEOUT);
   559	
   560		dev_set_drvdata(&chip->dev, priv);
   561	
   562		/*
   563		 * I2C intfcaps (interrupt capabilitieis) in the chip are hard coded to:
   564		 *   TPM_INTF_INT_LEVEL_LOW | TPM_INTF_DATA_AVAIL_INT
   565		 * The IRQ should be set in the i2c_board_info (which is done
   566		 * automatically in of_i2c_register_devices, for device tree users */
   567		priv->irq = client->irq;
   568		if (client->irq) {
   569			dev_dbg(dev, "%s() priv->irq\n", __func__);
   570			rc = devm_request_irq(dev, client->irq,
   571					      i2c_nuvoton_int_handler,
   572					      IRQF_TRIGGER_LOW,
   573					      dev_name(&chip->dev),
   574					      chip);
   575			if (rc) {
   576				dev_err(dev, "%s() Unable to request irq: %d for use\n",
   577					__func__, priv->irq);
   578				priv->irq = 0;
   579			} else {
   580				chip->flags |= TPM_CHIP_FLAG_IRQ;
   581				/* Clear any pending interrupt */
   582				i2c_nuvoton_ready(chip);
   583				/* - wait for TPM_STS==0xA0 (stsValid, commandReady) */
   584				rc = i2c_nuvoton_wait_for_stat(chip,
   585							       TPM_STS_COMMAND_READY,
   586							       TPM_STS_COMMAND_READY,
   587							       chip->timeout_b,
   588							       NULL);
   589				if (rc == 0) {
   590					/*
   591					 * TIS is in ready state
   592					 * write dummy byte to enter reception state
   593					 * TPM_DATA_FIFO_W <- rc (0)
   594					 */
   595					rc = i2c_nuvoton_write_buf(client,
   596								   TPM_DATA_FIFO_W,
   597								   1, (u8 *) (&rc));
   598					if (rc < 0)
   599						return rc;
   600					/* TPM_STS <- 0x40 (commandReady) */
   601					i2c_nuvoton_ready(chip);
   602				} else {
   603					/*
   604					 * timeout_b reached - command was
   605					 * aborted. TIS should now be in idle state -
   606					 * only TPM_STS_VALID should be set
   607					 */
   608					if (i2c_nuvoton_read_status(chip) !=
   609					    TPM_STS_VALID)
   610						return -EIO;
   611				}
   612			}
   613		}
   614	
   615		return tpm_chip_register(chip);
   616	}
   617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
