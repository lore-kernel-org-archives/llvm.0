Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD5144D0B;
	Tue, 14 May 2024 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715696693; cv=none; b=d73ASNcofzPWQr4QLcAGQ1O+Gfm/rhnaJAwdYtIPgJoE1kqsL7naX0ZmmkmpvzfJGP5+1P9deyRP9ocDHQdUSc0Rj23wio/uMwDwI5bY2MA1J+zq1vomNmvNhBiumCiuqm/BBSKXBtmF/8hTnvjus5h7+M3JmC6EAcKEceOJm2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715696693; c=relaxed/simple;
	bh=oHRcjP/qGNYm2SUj62olasMA6DBTIu37vwX6cjv9TU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNQy0G5hIHFWAlpf3Og9MVgLBVDdIm1SMdaBao8NoB3Mfi2vGIAUmIT9mCYn/92QYOaSij8kwqnnW0mEUWNXwh6KILeWZfr1Bm98pHYEsTalFLl3g+ASYoukSDnYDS3cWEYSiFhTIcL4tTgolRf+mO/txwkRUODBHT9VnUYe2tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBQzZ/uZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBQzZ/uZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715696691; x=1747232691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oHRcjP/qGNYm2SUj62olasMA6DBTIu37vwX6cjv9TU8=;
  b=DBQzZ/uZRJ83x55CmyxUXv7DqA7KADEkwq02CTqNT3VCXDXlaFWK8ODN
   77UxZ9+egXxmwjBmLjvdaZj2ueyqFxjptMIBt+B3KtjBRXRJGNnQTKcha
   RnrZZZ2Idn0QW/wCoD1wRsUYYJ/NvRkd8UMsfhvAWA/rSGrtJnhrgaGGr
   H3pjQ6lCtzJeuyAtmWkrGVAsNisFGgK4uBhWdj6uv2R/kF3SvlISrHu/u
   Ok+zYN6fYQY101oyTZZvDCaxHW6cttTgbksA+EBwnilD7EzvR6mPwLpih
   IpnGZG7LBqa7djAGTIQ/6HdCXBFL3+eEGKGkXGgaLxq1LB7MMjlDTG8eH
   A==;
X-CSE-ConnectionGUID: ohOrTe1JQpuUjYU2MGDOXg==
X-CSE-MsgGUID: lHsjI6s1T12XLkjiGlIALg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11534019"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11534019"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 07:24:50 -0700
X-CSE-ConnectionGUID: XIiszI1NSTahSlHnwkHR0g==
X-CSE-MsgGUID: CBwyhdfiTDSpApOs0uYWig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31258409"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2024 07:24:49 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6t5C-000BWh-2S;
	Tue, 14 May 2024 14:24:46 +0000
Date: Tue, 14 May 2024 22:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: sbs-manager: Remove class argument from
 i2c_mux_add_adapter()
Message-ID: <202405142129.XXshSQa5-lkp@intel.com>
References: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.9]
[also build test ERROR on linus/master]
[cannot apply to next-20240514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wolfram-Sang/power-supply-sbs-manager-Remove-class-argument-from-i2c_mux_add_adapter/20240514-041536
base:   v6.9
patch link:    https://lore.kernel.org/r/20240513201400.16589-2-wsa%2Brenesas%40sang-engineering.com
patch subject: [PATCH] power: supply: sbs-manager: Remove class argument from i2c_mux_add_adapter()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240514/202405142129.XXshSQa5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405142129.XXshSQa5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405142129.XXshSQa5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/sbs-manager.c:16:
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
   In file included from drivers/power/supply/sbs-manager.c:16:
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
   In file included from drivers/power/supply/sbs-manager.c:16:
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
   In file included from drivers/power/supply/sbs-manager.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/power/supply/sbs-manager.c:361:50: error: too few arguments to function call, expected 4, have 3
     361 |                         ret = i2c_mux_add_adapter(data->muxc, 0, i + 1);
         |                               ~~~~~~~~~~~~~~~~~~~                     ^
   include/linux/i2c-mux.h:58:5: note: 'i2c_mux_add_adapter' declared here
      58 | int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
         |     ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 |                         u32 force_nr, u32 chan_id,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
      60 |                         unsigned int class);
         |                         ~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +361 drivers/power/supply/sbs-manager.c

   317	
   318	static int sbsm_probe(struct i2c_client *client)
   319	{
   320		const struct i2c_device_id *id = i2c_client_get_device_id(client);
   321		struct i2c_adapter *adapter = client->adapter;
   322		struct sbsm_data *data;
   323		struct device *dev = &client->dev;
   324		struct power_supply_desc *psy_desc;
   325		struct power_supply_config psy_cfg = {};
   326		int ret = 0, i;
   327	
   328		/* Device listens only at address 0x0a */
   329		if (client->addr != 0x0a)
   330			return -EINVAL;
   331	
   332		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
   333			return -EPFNOSUPPORT;
   334	
   335		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   336		if (!data)
   337			return -ENOMEM;
   338	
   339		i2c_set_clientdata(client, data);
   340	
   341		data->client = client;
   342		data->is_ltc1760 = !!strstr(id->name, "ltc1760");
   343	
   344		ret  = sbsm_read_word(client, SBSM_CMD_BATSYSINFO);
   345		if (ret < 0)
   346			return ret;
   347		data->supported_bats = ret & SBSM_MASK_BAT_SUPPORTED;
   348		data->muxc = i2c_mux_alloc(adapter, dev, SBSM_MAX_BATS, 0,
   349					   I2C_MUX_LOCKED, &sbsm_select, NULL);
   350		if (!data->muxc)
   351			return dev_err_probe(dev, -ENOMEM, "failed to alloc i2c mux\n");
   352		data->muxc->priv = data;
   353	
   354		ret = devm_add_action_or_reset(dev, sbsm_del_mux_adapter, data);
   355		if (ret)
   356			return ret;
   357	
   358		/* register muxed i2c channels. One for each supported battery */
   359		for (i = 0; i < SBSM_MAX_BATS; ++i) {
   360			if (data->supported_bats & BIT(i)) {
 > 361				ret = i2c_mux_add_adapter(data->muxc, 0, i + 1);
   362				if (ret)
   363					break;
   364			}
   365		}
   366		if (ret)
   367			return dev_err_probe(dev, ret, "failed to register i2c mux channel %d\n", i + 1);
   368	
   369		psy_desc = devm_kmemdup(dev, &sbsm_default_psy_desc, sizeof(*psy_desc), GFP_KERNEL);
   370		if (!psy_desc)
   371			return -ENOMEM;
   372	
   373		psy_desc->name = devm_kasprintf(dev, GFP_KERNEL, "sbsm-%s", dev_name(&client->dev));
   374		if (!psy_desc->name)
   375			return -ENOMEM;
   376	
   377		ret = sbsm_gpio_setup(data);
   378		if (ret < 0)
   379			return ret;
   380	
   381		psy_cfg.drv_data = data;
   382		psy_cfg.of_node = dev->of_node;
   383		data->psy = devm_power_supply_register(dev, psy_desc, &psy_cfg);
   384		if (IS_ERR(data->psy))
   385			return dev_err_probe(dev, PTR_ERR(data->psy),
   386					     "failed to register power supply %s\n", psy_desc->name);
   387	
   388		return 0;
   389	}
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
