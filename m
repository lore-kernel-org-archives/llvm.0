Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6737996C;
	Wed, 20 May 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318772; cv=none; b=YnX+HzarEmWgc86Dlq5yj+piL3xiQEDIO5a0PLzmWhnlpp8iU2T6OCtIyHvPyINV68jN51Af6THHI6is70xe4KAKcDe/y/fM+S4jDUnL/Sp6YxIZbkxnq9lMPc/6rM2iHNblt2O5AeHsiWe6Y6ffQlP0MQjlexoGzlsB6iyfTGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318772; c=relaxed/simple;
	bh=DfRaG4HlY7Nw9SjETzOdJjujIu871I1OunPipoJsBaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MG/dnNsw1aF+j1kuR/RFMotZIfHjaJ6LYN0sAIZC/nmnkhQeMLJjSrkUfch5YUrsnraizCkeVMMMLAWVFtRQqm7P/xboi2I5XP6wqXXqcTZ3lDEciIl2dPau/r+yYOBWt5uvfIKbuiiPxRxPKr1/qCzF2IavR2kX6jUMQ2MS3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVCpOgC2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVCpOgC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318770; x=1810854770;
  h=date:from:to:cc:subject:message-id;
  bh=DfRaG4HlY7Nw9SjETzOdJjujIu871I1OunPipoJsBaQ=;
  b=NVCpOgC29kmVLX6t5d3405klo+exZ6I+VUqtn9E9/OJWliQBI//nP+g+
   CaQKEO2ky7pd7QB43BaVg6HfFQ0GbBjuxg4QPQ/luL5hWR3ZdmbiYyAug
   dbg8c6q/CNbBxwMx88TSoBvXzayIY8BKHHM/AzlSqjMF8GbbvT3nH/DJ1
   ZzDUeOoNddrSRGtHuU7BOEL7J/2WCWIpS5670G5yjRN4+W7GYByDzd9tu
   RCzY0IXZc4WoEFiB0Ryw6ys/0DDQEft366NAln5gOoIomt8wLCBEJA9V2
   XRx/5BEIeqO0HBM58mIhKGaLDpkYDLikYxxeYe0h/iWppdl2Qx4GY2vOL
   g==;
X-CSE-ConnectionGUID: V7M9FR4dSS6a1UonaycPHw==
X-CSE-MsgGUID: 8gEQDLs+SEecJUttMfebVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91623220"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91623220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:12:49 -0700
X-CSE-ConnectionGUID: o8GGoAg7RCewEBMDXvlw6Q==
X-CSE-MsgGUID: /Qa3SvFNR/GHF+kkDNWG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270701263"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 16:12:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq5i-00000000Afd-2uCa;
	Wed, 20 May 2026 23:12:42 +0000
Date: Thu, 21 May 2026 01:12:03 +0200
From: kernel test robot <lkp@intel.com>
To: Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/rtc/rtc-ds1307.c:2189:2: warning: label at end of
 compound statement is a C23 extension
Message-ID: <202605210157.eELhxRWf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fredrik-M-Olsson/dt-bindings-rtc-ds1307-Add-epson-rx8901/20260520-225510
head:   a50253791455c54f790addec67b736ace92384b0
commit: a50253791455c54f790addec67b736ace92384b0 rtc: ds1307: Add driver for Epson RX8901CE
date:   8 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260521/202605210157.eELhxRWf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210157.eELhxRWf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210157.eELhxRWf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-ds1307.c:2189:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    2189 |         }
         |         ^
   1 warning generated.


vim +2189 drivers/rtc/rtc-ds1307.c

  1923	
  1924	static int ds1307_probe(struct i2c_client *client)
  1925	{
  1926		const struct i2c_device_id *id = i2c_client_get_device_id(client);
  1927		struct ds1307		*ds1307;
  1928		const void		*match;
  1929		int			err = -ENODEV;
  1930		int			tmp;
  1931		const struct chip_desc	*chip;
  1932		bool			want_irq;
  1933		bool			ds1307_can_wakeup_device = false;
  1934		unsigned char		regs[8];
  1935		struct ds1307_platform_data *pdata = dev_get_platdata(&client->dev);
  1936		int			trickle_charger_setup = 0;
  1937	
  1938		ds1307 = devm_kzalloc(&client->dev, sizeof(struct ds1307), GFP_KERNEL);
  1939		if (!ds1307)
  1940			return -ENOMEM;
  1941	
  1942		dev_set_drvdata(&client->dev, ds1307);
  1943		ds1307->dev = &client->dev;
  1944		ds1307->name = client->name;
  1945	
  1946		ds1307->regmap = devm_regmap_init_i2c(client, &regmap_config);
  1947		if (IS_ERR(ds1307->regmap)) {
  1948			dev_err(ds1307->dev, "regmap allocation failed\n");
  1949			return PTR_ERR(ds1307->regmap);
  1950		}
  1951	
  1952		i2c_set_clientdata(client, ds1307);
  1953	
  1954		match = device_get_match_data(&client->dev);
  1955		if (match) {
  1956			ds1307->type = (uintptr_t)match;
  1957			chip = &chips[ds1307->type];
  1958		} else if (id) {
  1959			chip = &chips[id->driver_data];
  1960			ds1307->type = id->driver_data;
  1961		} else {
  1962			return -ENODEV;
  1963		}
  1964	
  1965		want_irq = client->irq > 0 && chip->alarm;
  1966	
  1967		if (!pdata)
  1968			trickle_charger_setup = ds1307_trickle_init(ds1307, chip);
  1969		else if (pdata->trickle_charger_setup)
  1970			trickle_charger_setup = pdata->trickle_charger_setup;
  1971	
  1972		if (trickle_charger_setup < 0)
  1973			return trickle_charger_setup;
  1974	
  1975		if (trickle_charger_setup && chip->trickle_charger_reg) {
  1976			dev_dbg(ds1307->dev,
  1977				"writing trickle charger info 0x%x to 0x%x\n",
  1978				trickle_charger_setup, chip->trickle_charger_reg);
  1979			regmap_write(ds1307->regmap, chip->trickle_charger_reg,
  1980				     (u8)trickle_charger_setup);
  1981		}
  1982	
  1983	/*
  1984	 * For devices with no IRQ directly connected to the SoC, the RTC chip
  1985	 * can be forced as a wakeup source by stating that explicitly in
  1986	 * the device's .dts file using the "wakeup-source" boolean property.
  1987	 * If the "wakeup-source" property is set, don't request an IRQ.
  1988	 * This will guarantee the 'wakealarm' sysfs entry is available on the device,
  1989	 * if supported by the RTC.
  1990	 */
  1991		if (chip->alarm && device_property_read_bool(&client->dev, "wakeup-source"))
  1992			ds1307_can_wakeup_device = true;
  1993	
  1994		switch (ds1307->type) {
  1995		case ds_1337:
  1996		case ds_1339:
  1997		case ds_1341:
  1998		case ds_3231:
  1999			/* get registers that the "rtc" read below won't read... */
  2000			err = regmap_bulk_read(ds1307->regmap, DS1337_REG_CONTROL,
  2001					       regs, 2);
  2002			if (err) {
  2003				dev_dbg(ds1307->dev, "read error %d\n", err);
  2004				goto exit;
  2005			}
  2006	
  2007			/* oscillator off?  turn it on, so clock can tick. */
  2008			if (regs[0] & DS1337_BIT_nEOSC)
  2009				regs[0] &= ~DS1337_BIT_nEOSC;
  2010	
  2011			/*
  2012			 * Using IRQ or defined as wakeup-source?
  2013			 * Disable the square wave and both alarms.
  2014			 * For some variants, be sure alarms can trigger when we're
  2015			 * running on Vbackup (BBSQI/BBSQW)
  2016			 */
  2017			if (want_irq || ds1307_can_wakeup_device)
  2018				regs[0] |= DS1337_BIT_INTCN | chip->bbsqi_bit;
  2019	
  2020			regmap_write(ds1307->regmap, DS1337_REG_CONTROL,
  2021				     regs[0]);
  2022	
  2023			/* oscillator fault? warn */
  2024			if (regs[1] & DS1337_BIT_OSF) {
  2025				dev_warn(ds1307->dev, "SET TIME!\n");
  2026			}
  2027			break;
  2028	
  2029		case rx_8025:
  2030			err = regmap_bulk_read(ds1307->regmap,
  2031					       RX8025_REG_CTRL1 << 4 | 0x08, regs, 2);
  2032			if (err) {
  2033				dev_dbg(ds1307->dev, "read error %d\n", err);
  2034				goto exit;
  2035			}
  2036	
  2037			/* oscillator off?  turn it on, so clock can tick. */
  2038			if (!(regs[1] & RX8025_BIT_XST)) {
  2039				regs[1] |= RX8025_BIT_XST;
  2040				regmap_write(ds1307->regmap,
  2041					     RX8025_REG_CTRL2 << 4 | 0x08,
  2042					     regs[1]);
  2043				dev_warn(ds1307->dev,
  2044					 "oscillator stop detected - SET TIME!\n");
  2045			}
  2046	
  2047			if (regs[1] & RX8025_BIT_PON) {
  2048				regs[1] &= ~RX8025_BIT_PON;
  2049				regmap_write(ds1307->regmap,
  2050					     RX8025_REG_CTRL2 << 4 | 0x08,
  2051					     regs[1]);
  2052				dev_warn(ds1307->dev, "power-on detected\n");
  2053			}
  2054	
  2055			if (regs[1] & RX8025_BIT_VDET) {
  2056				regs[1] &= ~RX8025_BIT_VDET;
  2057				regmap_write(ds1307->regmap,
  2058					     RX8025_REG_CTRL2 << 4 | 0x08,
  2059					     regs[1]);
  2060				dev_warn(ds1307->dev, "voltage drop detected\n");
  2061			}
  2062	
  2063			/* make sure we are running in 24hour mode */
  2064			if (!(regs[0] & RX8025_BIT_2412)) {
  2065				u8 hour;
  2066	
  2067				/* switch to 24 hour mode */
  2068				regmap_write(ds1307->regmap,
  2069					     RX8025_REG_CTRL1 << 4 | 0x08,
  2070					     regs[0] | RX8025_BIT_2412);
  2071	
  2072				err = regmap_bulk_read(ds1307->regmap,
  2073						       RX8025_REG_CTRL1 << 4 | 0x08,
  2074						       regs, 2);
  2075				if (err) {
  2076					dev_dbg(ds1307->dev, "read error %d\n", err);
  2077					goto exit;
  2078				}
  2079	
  2080				/* correct hour */
  2081				hour = bcd2bin(regs[DS1307_REG_HOUR]);
  2082				if (hour == 12)
  2083					hour = 0;
  2084				if (regs[DS1307_REG_HOUR] & DS1307_BIT_PM)
  2085					hour += 12;
  2086	
  2087				regmap_write(ds1307->regmap,
  2088					     DS1307_REG_HOUR << 4 | 0x08, hour);
  2089			}
  2090			break;
  2091		case ds_1388:
  2092			err = regmap_read(ds1307->regmap, DS1388_REG_CONTROL, &tmp);
  2093			if (err) {
  2094				dev_dbg(ds1307->dev, "read error %d\n", err);
  2095				goto exit;
  2096			}
  2097	
  2098			/* oscillator off?  turn it on, so clock can tick. */
  2099			if (tmp & DS1388_BIT_nEOSC) {
  2100				tmp &= ~DS1388_BIT_nEOSC;
  2101				regmap_write(ds1307->regmap, DS1388_REG_CONTROL, tmp);
  2102			}
  2103			break;
  2104		default:
  2105			break;
  2106		}
  2107	
  2108		/* read RTC registers */
  2109		err = regmap_bulk_read(ds1307->regmap, chip->offset, regs,
  2110				       sizeof(regs));
  2111		if (err) {
  2112			dev_dbg(ds1307->dev, "read error %d\n", err);
  2113			goto exit;
  2114		}
  2115	
  2116		if (ds1307->type == mcp794xx &&
  2117		    !(regs[DS1307_REG_WDAY] & MCP794XX_BIT_VBATEN)) {
  2118			regmap_write(ds1307->regmap, DS1307_REG_WDAY,
  2119				     regs[DS1307_REG_WDAY] |
  2120				     MCP794XX_BIT_VBATEN);
  2121		}
  2122	
  2123		tmp = regs[DS1307_REG_HOUR];
  2124		switch (ds1307->type) {
  2125		case ds_1340:
  2126		case m41t0:
  2127		case m41t00:
  2128		case m41t11:
  2129			/*
  2130			 * NOTE: ignores century bits; fix before deploying
  2131			 * systems that will run through year 2100.
  2132			 */
  2133			break;
  2134		case rx_8025:
  2135			break;
  2136		default:
  2137			if (!(tmp & DS1307_BIT_12HR))
  2138				break;
  2139	
  2140			/*
  2141			 * Be sure we're in 24 hour mode.  Multi-master systems
  2142			 * take note...
  2143			 */
  2144			tmp = bcd2bin(tmp & 0x1f);
  2145			if (tmp == 12)
  2146				tmp = 0;
  2147			if (regs[DS1307_REG_HOUR] & DS1307_BIT_PM)
  2148				tmp += 12;
  2149			regmap_write(ds1307->regmap, chip->offset + DS1307_REG_HOUR,
  2150				     bin2bcd(tmp));
  2151		}
  2152	
  2153		ds1307->rtc = devm_rtc_allocate_device(ds1307->dev);
  2154		if (IS_ERR(ds1307->rtc))
  2155			return PTR_ERR(ds1307->rtc);
  2156	
  2157		if (want_irq || ds1307_can_wakeup_device)
  2158			device_set_wakeup_capable(ds1307->dev, true);
  2159		else
  2160			clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
  2161	
  2162		if (ds1307_can_wakeup_device && !want_irq) {
  2163			dev_info(ds1307->dev,
  2164				 "'wakeup-source' is set, request for an IRQ is disabled!\n");
  2165			/* We cannot support UIE mode if we do not have an IRQ line */
  2166			clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, ds1307->rtc->features);
  2167		}
  2168	
  2169		if (want_irq) {
  2170			err = devm_request_threaded_irq(ds1307->dev, client->irq, NULL,
  2171							chip->irq_handler ?: ds1307_irq,
  2172							IRQF_SHARED | IRQF_ONESHOT,
  2173							ds1307->name, ds1307);
  2174			if (err) {
  2175				client->irq = 0;
  2176				device_set_wakeup_capable(ds1307->dev, false);
  2177				clear_bit(RTC_FEATURE_ALARM, ds1307->rtc->features);
  2178				dev_err(ds1307->dev, "unable to request IRQ!\n");
  2179			} else {
  2180				dev_dbg(ds1307->dev, "got IRQ %d\n", client->irq);
  2181			}
  2182		}
  2183	
  2184		switch (ds1307->type) {
  2185		case rx_8901:
  2186			set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, ds1307->rtc->features);
  2187			break;
  2188		default:
> 2189		}
  2190	
  2191		ds1307->rtc->ops = chip->rtc_ops ?: &ds13xx_rtc_ops;
  2192		err = ds1307_add_frequency_test(ds1307);
  2193		if (err)
  2194			return err;
  2195	
  2196		err = devm_rtc_register_device(ds1307->rtc);
  2197		if (err)
  2198			return err;
  2199	
  2200		if (chip->nvram_size) {
  2201			struct nvmem_config nvmem_cfg = {
  2202				.name = "ds1307_nvram",
  2203				.word_size = 1,
  2204				.stride = 1,
  2205				.size = chip->nvram_size,
  2206				.reg_read = ds1307_nvram_read,
  2207				.reg_write = ds1307_nvram_write,
  2208				.priv = ds1307,
  2209			};
  2210	
  2211			devm_rtc_nvmem_register(ds1307->rtc, &nvmem_cfg);
  2212		}
  2213	
  2214		ds1307_hwmon_register(ds1307);
  2215		ds1307_clks_register(ds1307);
  2216		ds1307_wdt_register(ds1307);
  2217	
  2218		return 0;
  2219	
  2220	exit:
  2221		return err;
  2222	}
  2223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
