Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F2B1D559;
	Mon, 26 Feb 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943788; cv=none; b=rBJAv3y8YIMuSw/O3wXRUNMls79T0hzZM3yrE24uYEoXtlsJmvGRL+5fqtG9u8jjunCMKVSQ6jFk/9sIPetLqM+mR3ndw2PqWyk7oW7pM1KZ5FzP9O9TqVKMeivCzSK2LcZ9cxa9fdgUHF4pIzCvMnX7w4v4yWQGKIf//IjyBaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943788; c=relaxed/simple;
	bh=Hcf/NvZpH/mt+qo9rXN0h6uQKmQyrr4HjtQJD6+U2BU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VUvdRn5LT9VsdLQy+p1iLWaiMO7oZ6H0iZ2lmptXKqK9XYdg9QHiuqUguJuFiL6qOHfSDw2fYO17dkjDyVf5YJJ6H2fHymgqC9MGfdH2qHcpCXxpXt5i6J/ZxeE+0zZAlG0ABrQwgkkZ2OboTXo+l1K8TDBOkpRz6XCLdRt16q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TjxkX5byVz6K5kG;
	Mon, 26 Feb 2024 18:32:04 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 0C16E140DEC;
	Mon, 26 Feb 2024 18:36:23 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 10:36:22 +0000
Date: Mon, 26 Feb 2024 10:36:21 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Dumitru Ceclan <mitrutzceclan@gmail.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Andy Shevchenko <andy@kernel.org>, "Michael
 Walle" <michael@walle.cc>, Nuno Sa <nuno.sa@analog.com>
Subject: Re: [jic23-iio:testing 136/152] drivers/iio/adc/ad7173.c:854:3:
 warning: variable 'chan_arr' is uninitialized when used here
Message-ID: <20240226103621.00002845@Huawei.com>
In-Reply-To: <202402251818.96Ke1Y8O-lkp@intel.com>
References: <202402251818.96Ke1Y8O-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Sun, 25 Feb 2024 18:31:55 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   9dcbd08b27c90256725c9dfe83152e1debe079c9
> commit: ef3626e2264ce730bc57f6c57b7b7049bd8c45c9 [136/152] iio: adc: ad7173: add AD7173 driver
> config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240225/202402251818.96Ke1Y8O-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251818.96Ke1Y8O-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402251818.96Ke1Y8O-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/iio/adc/ad7173.c:16:
>    In file included from include/linux/gpio/driver.h:8:
>    In file included from include/linux/irqchip/chained_irq.h:10:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from drivers/iio/adc/ad7173.c:16:
>    In file included from include/linux/gpio/driver.h:8:
>    In file included from include/linux/irqchip/chained_irq.h:10:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from drivers/iio/adc/ad7173.c:16:
>    In file included from include/linux/gpio/driver.h:8:
>    In file included from include/linux/irqchip/chained_irq.h:10:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:13:
>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      584 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
> >> drivers/iio/adc/ad7173.c:854:3: warning: variable 'chan_arr' is uninitialized when used here [-Wuninitialized]  
>      854 |                 chan_arr[chan_index] = ad7173_temp_iio_channel_template;
>          |                 ^~~~~~~~
>    drivers/iio/adc/ad7173.c:848:32: note: initialize the variable 'chan_arr' to silence this warning
>      848 |         struct iio_chan_spec *chan_arr, *chan;
>          |                                       ^
>          |                                        = NULL
> >> drivers/iio/adc/ad7173.c:855:19: warning: variable 'chans_st_arr' is uninitialized when used here [-Wuninitialized]  
>      855 |                 chan_st_priv = &chans_st_arr[chan_index];
>          |                                 ^~~~~~~~~~~~
>    drivers/iio/adc/ad7173.c:845:37: note: initialize the variable 'chans_st_arr' to silence this warning
>      845 |         struct ad7173_channel *chans_st_arr, *chan_st_priv;
>          |                                            ^
>          |                                             = NULL
>    8 warnings generated.
> 
> 
> vim +/chan_arr +854 drivers/iio/adc/ad7173.c
> 
>    842	
>    843	static int ad7173_fw_parse_channel_config(struct iio_dev *indio_dev)
>    844	{
>    845		struct ad7173_channel *chans_st_arr, *chan_st_priv;
>    846		struct ad7173_state *st = iio_priv(indio_dev);
>    847		struct device *dev = indio_dev->dev.parent;
>    848		struct iio_chan_spec *chan_arr, *chan;
>    849		unsigned int ain[2], chan_index = 0;
>    850		struct fwnode_handle *child;
>    851		int ref_sel, ret;

I think the fix is
			struct iio_chan_spec *chan_arr = indio_dev->channels

I'll fix it up like that unless I hear back with a different fix.

>    852	
>    853		if (st->info->has_temp) {
>  > 854			chan_arr[chan_index] = ad7173_temp_iio_channel_template;
>  > 855			chan_st_priv = &chans_st_arr[chan_index];  
>    856			chan_st_priv->ain =
>    857				AD7173_CH_ADDRESS(chan_arr[chan_index].channel,
>    858						  chan_arr[chan_index].channel2);
>    859			chan_st_priv->cfg.bipolar = false;
>    860			chan_st_priv->cfg.input_buf = true;
>    861			chan_st_priv->cfg.ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
>    862			st->adc_mode |= AD7173_ADC_MODE_REF_EN;
>    863	
>    864			chan_index++;
>    865		}
>    866	
>    867		device_for_each_child_node(dev, child) {
>    868			chan = &chan_arr[chan_index];
>    869			chan_st_priv = &chans_st_arr[chan_index];
>    870			ret = fwnode_property_read_u32_array(child, "diff-channels",
>    871							     ain, ARRAY_SIZE(ain));
>    872			if (ret) {
>    873				fwnode_handle_put(child);
>    874				return ret;
>    875			}
>    876	
>    877			if (ain[0] >= st->info->num_inputs ||
>    878			    ain[1] >= st->info->num_inputs) {
>    879				fwnode_handle_put(child);
>    880				return dev_err_probe(dev, -EINVAL,
>    881					"Input pin number out of range for pair (%d %d).\n",
>    882					ain[0], ain[1]);
>    883			}
>    884	
>    885			ret = fwnode_property_match_property_string(child,
>    886								    "adi,reference-select",
>    887								    ad7173_ref_sel_str,
>    888								    ARRAY_SIZE(ad7173_ref_sel_str));
>    889			if (ret < 0)
>    890				ref_sel = AD7173_SETUP_REF_SEL_INT_REF;
>    891			else
>    892				ref_sel = ret;
>    893	
>    894			if (ref_sel == AD7173_SETUP_REF_SEL_EXT_REF2 &&
>    895			    st->info->id != AD7173_ID) {
>    896				fwnode_handle_put(child);
>    897				return dev_err_probe(dev, -EINVAL,
>    898					"External reference 2 is only available on ad7173-8\n");
>    899			}
>    900	
>    901			ret = ad7173_get_ref_voltage_milli(st, ref_sel);
>    902			if (ret < 0) {
>    903				fwnode_handle_put(child);
>    904				return dev_err_probe(dev, ret,
>    905						     "Cannot use reference %u\n", ref_sel);
>    906			}
>    907			if (ref_sel == AD7173_SETUP_REF_SEL_INT_REF)
>    908				st->adc_mode |= AD7173_ADC_MODE_REF_EN;
>    909			chan_st_priv->cfg.ref_sel = ref_sel;
>    910	
>    911			*chan = ad7173_channel_template;
>    912			chan->address = chan_index;
>    913			chan->scan_index = chan_index;
>    914			chan->channel = ain[0];
>    915			chan->channel2 = ain[1];
>    916			chan->differential = true;
>    917	
>    918			chan_st_priv->ain = AD7173_CH_ADDRESS(ain[0], ain[1]);
>    919			chan_st_priv->chan_reg = chan_index;
>    920			chan_st_priv->cfg.input_buf = true;
>    921			chan_st_priv->cfg.odr = 0;
>    922	
>    923			chan_st_priv->cfg.bipolar = fwnode_property_read_bool(child, "bipolar");
>    924			if (chan_st_priv->cfg.bipolar)
>    925				chan->info_mask_separate |= BIT(IIO_CHAN_INFO_OFFSET);
>    926	
>    927			chan_index++;
>    928		}
>    929		return 0;
>    930	}
>    931	
> 

