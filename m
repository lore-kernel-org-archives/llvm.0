Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E0EDDDA;
	Sun, 25 Feb 2024 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708857225; cv=none; b=g38v1nzFkfywTfi4VWiZMW3r3Gwc6iRA6yEnWSfknkAjkdaQHipUDlvfBcPUn2kgTQIGTOApkFgRKBPW7XgJwo+cW74YA+MtnwBuK6m63yIZ8GZOPmueDNq0rkk1uXDL6jplJmD8jOmnpSuihmgvlx629SHWRNgXAiIWok3ziwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708857225; c=relaxed/simple;
	bh=c1gx4kdC/8VgyKP8uqyMf6AMZboL8Nq1JcFNZu6BOXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0tYBKsjHVxFr84aL8XqKl4CZp27IQt5A2RHb6rerq5uleEcCC5f25vSZnt8P5uq0Mo4H2n40xctDFtd2g/H2Dgh6zmDHEXi1xdooU86g8onnwpDXNzik5fjHxK7TFeJSmAyrtWocrvCI4q2NrNwk3FM80PkdVtjYM2pOgRJ4m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm0xwni5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm0xwni5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708857224; x=1740393224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1gx4kdC/8VgyKP8uqyMf6AMZboL8Nq1JcFNZu6BOXU=;
  b=Hm0xwni58sQw8Ik5XvjfQim3uLUaS60epc7gh3zRlazZz4ygXjADzxkh
   v650cSxY3Ca4VyIutLj4mnZUyA8NaqOHlQv0Jy0yfdeUozdVP2FW5NYgX
   F1S+LaegzknmPKwYcM9sNck87tyb9w1UbWU3TNVnVxZ/55PwhAMkG91Vu
   5gxZRbzapAZ8RIX+rpXwModj8kWOjKdcUAfdpOytuCzDQml64gkH/8MQL
   /7jiPCPrzq4C7xpYc/j1zy6K5ej5CrE+CNaaCo9gVqcUDhvkfnD4Wu07s
   VEv+XtTLFLovxI9YB7jtBkfcg1WXT7OmqirQVZfNteHGI2qghDEMEcxjf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3285546"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="3285546"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 02:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="11061296"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2024 02:33:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reBob-0009Sy-2U;
	Sun, 25 Feb 2024 10:33:03 +0000
Date: Sun, 25 Feb 2024 18:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dumitru Ceclan <mitrutzceclan@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andy@kernel.org>, Michael Walle <michael@walle.cc>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [jic23-iio:testing 136/152] drivers/iio/adc/ad7173.c:854:3: warning:
 variable 'chan_arr' is uninitialized when used here
Message-ID: <202402251818.96Ke1Y8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   9dcbd08b27c90256725c9dfe83152e1debe079c9
commit: ef3626e2264ce730bc57f6c57b7b7049bd8c45c9 [136/152] iio: adc: ad7173: add AD7173 driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240225/202402251818.96Ke1Y8O-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251818.96Ke1Y8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251818.96Ke1Y8O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/ad7173.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ad7173.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/adc/ad7173.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/iio/adc/ad7173.c:854:3: warning: variable 'chan_arr' is uninitialized when used here [-Wuninitialized]
     854 |                 chan_arr[chan_index] = ad7173_temp_iio_channel_template;
         |                 ^~~~~~~~
   drivers/iio/adc/ad7173.c:848:32: note: initialize the variable 'chan_arr' to silence this warning
     848 |         struct iio_chan_spec *chan_arr, *chan;
         |                                       ^
         |                                        = NULL
>> drivers/iio/adc/ad7173.c:855:19: warning: variable 'chans_st_arr' is uninitialized when used here [-Wuninitialized]
     855 |                 chan_st_priv = &chans_st_arr[chan_index];
         |                                 ^~~~~~~~~~~~
   drivers/iio/adc/ad7173.c:845:37: note: initialize the variable 'chans_st_arr' to silence this warning
     845 |         struct ad7173_channel *chans_st_arr, *chan_st_priv;
         |                                            ^
         |                                             = NULL
   8 warnings generated.


vim +/chan_arr +854 drivers/iio/adc/ad7173.c

   842	
   843	static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
   844	{
   845		struct ad7173_channel *chans_st_arr, *chan_st_priv;
   846		struct ad7173_state *st = iio_priv(indio_dev);
   847		struct device *dev = indio_dev->dev.parent;
   848		struct iio_chan_spec *chan_arr, *chan;
   849		unsigned int ain[2], chan_index = 0;
   850		struct fwnode_handle *child;
   851		int ref_sel, ret;
   852	
   853		if (st->info->has_temp) {
 > 854			chan_arr[chan_index] = ad7173_temp_iio_channel_template;
 > 855			chan_st_priv = &chans_st_arr[chan_index];
   856			chan_st_priv->ain =
   857				AD7173_CH_ADDRESS(chan_arr[chan_index].channel,
   858						  chan_arr[chan_index].channel2);
   859			chan_st_priv->cfg.bipolar = false;
   860			chan_st_priv->cfg.input_buf = true;
   861			chan_st_priv->cfg.ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
   862			st->adc_mode |= AD7173_ADC_MODE_REF_EN;
   863	
   864			chan_index++;
   865		}
   866	
   867		device_for_each_child_node(dev, child) {
   868			chan = &chan_arr[chan_index];
   869			chan_st_priv = &chans_st_arr[chan_index];
   870			ret = fwnode_property_read_u32_array(child, "diff-channels",
   871							     ain, ARRAY_SIZE(ain));
   872			if (ret) {
   873				fwnode_handle_put(child);
   874				return ret;
   875			}
   876	
   877			if (ain[0] >= st->info->num_inputs ||
   878			    ain[1] >= st->info->num_inputs) {
   879				fwnode_handle_put(child);
   880				return dev_err_probe(dev, -EINVAL,
   881					"Input pin number out of range for pair (%d %d).\n",
   882					ain[0], ain[1]);
   883			}
   884	
   885			ret = fwnode_property_match_property_string(child,
   886								    "adi,reference-select",
   887								    ad7173_ref_sel_str,
   888								    ARRAY_SIZE(ad7173_ref_sel_str));
   889			if (ret < 0)
   890				ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
   891			else
   892				ref_sel = ret;
   893	
   894			if (ref_sel == AD7173_SETUP_REF_SEL_EXT_REF2 &&
   895			    st->info->id != AD7173_ID) {
   896				fwnode_handle_put(child);
   897				return dev_err_probe(dev, -EINVAL,
   898					"External reference 2 is only available on ad7173-8\n");
   899			}
   900	
   901			ret = ad7173_get_ref_voltage_milli(st, ref_sel);
   902			if (ret < 0) {
   903				fwnode_handle_put(child);
   904				return dev_err_probe(dev, ret,
   905						     "Cannot use reference %u\n", ref_sel);
   906			}
   907			if (ref_sel == AD7173_SETUP_REF_SEL_INT_REF)
   908				st->adc_mode |= AD7173_ADC_MODE_REF_EN;
   909			chan_st_priv->cfg.ref_sel = ref_sel;
   910	
   911			*chan = ad7173_channel_template;
   912			chan->address = chan_index;
   913			chan->scan_index = chan_index;
   914			chan->channel = ain[0];
   915			chan->channel2 = ain[1];
   916			chan->differential = true;
   917	
   918			chan_st_priv->ain = AD7173_CH_ADDRESS(ain[0], ain[1]);
   919			chan_st_priv->chan_reg = chan_index;
   920			chan_st_priv->cfg.input_buf = true;
   921			chan_st_priv->cfg.odr = 0;
   922	
   923			chan_st_priv->cfg.bipolar = fwnode_property_read_bool(child, "bipolar");
   924			if (chan_st_priv->cfg.bipolar)
   925				chan->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
   926	
   927			chan_index++;
   928		}
   929		return 0;
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
