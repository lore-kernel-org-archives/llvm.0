Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16731898FB;
	Fri, 18 Oct 2024 23:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293251; cv=none; b=PHm1h+PAfnbk4NYMbJXism6UaIpnwccKTXBA3v1F42vBzKeUF++rBubkGSgI+qV1eW0EcVahQY8xuheShATFAdJ+HFygA2VkrQUWm5TrUmo9bws2th9mKV9Ty/9c/w6RyV2vDy2V59eMFyXVUxpSozbhHEg4kLqPZS7C87Za0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293251; c=relaxed/simple;
	bh=AWtnwbhjNd8wScZTbscHDXlDqWZ315zestAtltuoWI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDIv+2WJH0Lml77VuktzOm1c3RXWm90ClzJHTi0ZCKc4ZP19BHcln5p7BIfvko9ZL/d5wmXcaVcrw6uNvDcnbCLiNgDkTup6Fe6dFYKiM6cQLjWzvdfOPllTEzynCyos2cxtkBcq+GPfE8jYrPhdacjO3+2FEpCR3e9RXkh5t20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8+wFTHx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8+wFTHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729293249; x=1760829249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AWtnwbhjNd8wScZTbscHDXlDqWZ315zestAtltuoWI0=;
  b=R8+wFTHxwd5S1jWyqT8EO/GynzTK3+heI/C4M3ICRJIWOq/E1WkS6DDf
   1kcrk2e0Nw0/lmsCA2HXwgV9yrEgH4Ov1JZE/pNABprNrP3hEcwBw5AO8
   x2q/K+SkurzLZmx2nP8vMm0XM8ltvE1g2M1pbNcbi2vC4UdXLPK28lVOI
   JAtuTHN0pvO3zYaytAWL0Ka1PAvR+eQ5wXF7yaRFzOos7GNHrZjC03Y5A
   lsjaAW5o4oJwzawJaRWf6Rccqsb96BVme28+ZfUecdQiZqmQvBXhXrGL1
   1ygTmYrGpQxEwy0kZCyrRkaIERFCECDxeuF/T3228/9XZMr7U3VhM+Q9G
   g==;
X-CSE-ConnectionGUID: o1FX+T/dTVyl+V+1G7braw==
X-CSE-MsgGUID: eGP1Nt2KS3uVMJT80a1l2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46337936"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="46337936"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 16:14:08 -0700
X-CSE-ConnectionGUID: eD3iWWLASKin3WEr17aQ2Q==
X-CSE-MsgGUID: kXvx81yqS7+DB+Ve/veJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="102304754"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2024 16:14:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1wAX-000OO9-0F;
	Fri, 18 Oct 2024 23:14:05 +0000
Date: Sat, 19 Oct 2024 07:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: George Chan via B4 Relay <devnull+gchan9527.gmail.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 2/3] Input: Add Novatek NT36xxx touchscreen driver
Message-ID: <202410190711.5LZasx1r-lkp@intel.com>
References: <20241015-nt36xxx-v1-2-3919d0bffee6@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-nt36xxx-v1-2-3919d0bffee6@gmail.com>

Hi George,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Chan-via-B4-Relay/dt-bindings-touchscreen-Add-binding-for-Novatek-NT36xxx-series-driver/20241015-205452
base:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
patch link:    https://lore.kernel.org/r/20241015-nt36xxx-v1-2-3919d0bffee6%40gmail.com
patch subject: [PATCH RFC/RFT 2/3] Input: Add Novatek NT36xxx touchscreen driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190711.5LZasx1r-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190711.5LZasx1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190711.5LZasx1r-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/nt36xxx_core.c:359:16: error: call to undeclared function 'irq_data_to_desc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |                ^
   drivers/input/touchscreen/nt36xxx_core.c:359:16: note: did you mean 'irq_to_desc'?
   include/linux/irqnr.h:9:25: note: 'irq_to_desc' declared here
       9 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |                         ^
>> drivers/input/touchscreen/nt36xxx_core.c:359:34: error: call to undeclared function 'irq_get_irq_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |                                  ^
   drivers/input/touchscreen/nt36xxx_core.c:359:34: note: did you mean 'irq_set_irq_wake'?
   include/linux/interrupt.h:489:12: note: 'irq_set_irq_wake' declared here
     489 | extern int irq_set_irq_wake(unsigned int irq, unsigned int on);
         |            ^
>> drivers/input/touchscreen/nt36xxx_core.c:359:14: error: incompatible integer to pointer conversion assigning to 'struct irq_desc *' from 'int' [-Wint-conversion]
     359 |         desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/touchscreen/nt36xxx_core.c:360:61: error: incomplete definition of type 'struct irq_desc'
     360 |         dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
         |                                                         ~~~~^
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/linux/irqnr.h:9:15: note: forward declaration of 'struct irq_desc'
       9 | extern struct irq_desc *irq_to_desc(unsigned int irq);
         |               ^
>> drivers/input/touchscreen/nt36xxx_core.c:357:21: warning: no previous prototype for function '_debug_irq' [-Wmissing-prototypes]
     357 | void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
         |                     ^
   drivers/input/touchscreen/nt36xxx_core.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     357 | void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
         | ^
         | static 
>> drivers/input/touchscreen/nt36xxx_core.c:479:14: warning: variable 'finger_cnt' set but not used [-Wunused-but-set-variable]
     479 |         int i, ret, finger_cnt = 0;
         |                     ^
>> drivers/input/touchscreen/nt36xxx_core.c:1274:4: error: use of undeclared identifier 'IRQ_TYPE_EDGE_RISING'
    1274 |                         IRQ_TYPE_EDGE_RISING | IRQF_ONESHOT, dev_name(dev), ts);
         |                         ^
   2 warnings and 5 errors generated.


vim +/irq_data_to_desc +359 drivers/input/touchscreen/nt36xxx_core.c

   356	
 > 357	void __maybe_unused _debug_irq(struct nt36xxx_ts *ts, int line) {
   358	        struct irq_desc *desc;
 > 359	        desc = irq_data_to_desc( irq_get_irq_data(ts->irq));
 > 360	        dev_info(ts->dev, "%d irq_desc depth=%d", line, desc->depth );
   361	}
   362	
   363	#define debug_irq(a) _debug_irq(a, __LINE__)
   364	
   365	static int nt36xxx_eng_reset_idle(struct nt36xxx_ts *ts)
   366	{
   367		int ret;
   368	
   369		if(!ts) {
   370			dev_err(ts->dev, "%s %s empty", __func__, "nt36xxx_ts");
   371			return -EINVAL;
   372		}
   373	
   374		if(!ts->mmap) {
   375			dev_err(ts->dev, "%s %s empty", __func__, "ts->mmap");
   376			return -EINVAL;
   377		}
   378	
   379		if(ts->mmap[MMAP_ENG_RST_ADDR] == 0) {
   380			dev_err(ts->dev, "%s %s empty", __func__, "MMAP_ENG_RST_ADDR");
   381			return -EINVAL;
   382		}
   383	
   384		/* HACK to output something without read */
   385		ret = regmap_write(ts->regmap, ts->mmap[MMAP_ENG_RST_ADDR],
   386						   0x5a);
   387		if (ret) {
   388			dev_err(ts->dev, "%s regmap write error\n", __func__);
   389			return ret;
   390		}
   391	
   392		/* Wait until the MCU resets the fw state */
   393		usleep_range(15000, 16000);
   394	
   395		/* seemed not long enough */
   396		msleep(30);
   397		return ret;
   398	}
   399	
   400	/*
   401	 * nt36xxx_bootloader_reset - Reset MCU to bootloader
   402	 * @ts: Main driver structure
   403	 *
   404	 * Return: Always zero for success, negative number for error
   405	 */
   406	static int nt36xxx_bootloader_reset(struct nt36xxx_ts *ts)
   407	{
   408		int ret = 0;
   409	
   410		//in spi version, need to set page to SWRST_N8_ADDR
   411		if (ts->mmap[MMAP_SWRST_N8_ADDR]) {
   412			ret = regmap_write(ts->regmap, ts->mmap[MMAP_SWRST_N8_ADDR],
   413				   NT36XXX_CMD_BOOTLOADER_RESET);
   414		        if (ret)
   415				return ret;
   416		} else {
   417			pr_info("plz make sure MMAP_SWRST_N8_ADDR is set!\n");
   418			return -EINVAL;
   419		}
   420	
   421		/* MCU has to reboot from bootloader: this is the typical boot time */
   422		msleep(35);
   423	
   424		if (ts->mmap[MMAP_SPI_RD_FAST_ADDR]) {
   425	                ret = regmap_write(ts->regmap, ts->mmap[MMAP_SPI_RD_FAST_ADDR], 0);
   426	                if (ret)
   427	                        return ret;
   428		}
   429	
   430		return ret;
   431	}
   432	
   433	/**
   434	 * nt36xxx_check_reset_state - Check the boot state during reset
   435	 * @ts: Main driver structure
   436	 * @fw_state: Enumeration containing firmware states
   437	 *
   438	 * Return: Always zero for success, negative number for error
   439	 */
   440	static int nt36xxx_check_reset_state(struct nt36xxx_ts *ts,
   441					     enum nt36xxx_fw_state fw_state)
   442	{
   443		u8 buf[8] = { 0 };
   444		int ret = 0, retry = NT36XXX_MAX_FW_RST_RETRY;
   445	
   446		do {
   447			ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR]
   448					 | NT36XXX_EVT_RESET_COMPLETE, buf, 6);
   449			if (likely(ret == 0) &&
   450			    (buf[1] >= fw_state) &&
   451			    (buf[1] <= NT36XXX_STATE_MAX)) {
   452				ret = 0;
   453				break;
   454			}
   455			usleep_range(10000, 11000);
   456		} while (--retry);
   457	
   458		if (!retry) {
   459			dev_err(ts->dev, "Firmware reset failed.\n");
   460			ret = -EBUSY;
   461		}
   462	
   463		return ret;
   464	}
   465	
   466	/**
   467	 * nt36xxx_report - Report touch events
   468	 * @ts: Main driver structure
   469	 *
   470	 * Return: Always zero for success, negative number for error
   471	 */
   472	static void nt36xxx_report(struct nt36xxx_ts *ts)
   473	{
   474		struct nt36xxx_abs_object *obj = &ts->abs_obj;
   475		struct input_dev *input = ts->input;
   476		u8 input_id = 0;
   477		u8 point[POINT_DATA_LEN + 1] = { 0 };
   478		unsigned int ppos = 0;
 > 479		int i, ret, finger_cnt = 0;
   480		uint8_t press_id[TOUCH_MAX_FINGER_NUM] = {0};
   481	
   482		ret = regmap_raw_read(ts->regmap, ts->mmap[MMAP_EVENT_BUF_ADDR],
   483					point, sizeof(point));
   484		if (ret < 0) {
   485			dev_err(ts->dev,
   486				"Cannot read touch point data: %d\n", ret);
   487			goto xfer_error;
   488		}
   489	
   490		/* wdt recovery and esd check */
   491		for (i = 0; i < 7; i++) {
   492			if ((point[i] != 0xFD) && (point[i] != 0xFE) && (point[i] != 0x77)) {
   493				break;
   494			}
   495	
   496			mutex_lock(&ts->lock);
   497			ts->status |= NT36XXX_STATUS_DOWNLOAD_RECOVER;
   498			mutex_unlock(&ts->lock);
   499			goto xfer_error;
   500		}
   501	
   502		for (i = 0; i < TOUCH_MAX_FINGER_NUM; i++) {
   503			ppos = 6 * i + 1;
   504			input_id = point[ppos + 0] >> 3;
   505	
   506			if ((input_id == 0) || (input_id > TOUCH_MAX_FINGER_NUM)) {
   507				continue;
   508			}
   509	
   510			if (((point[ppos] & 0x07) == 0x01) ||
   511			    ((point[ppos] & 0x07) == 0x02)) {
   512				obj->x = (point[ppos + 1] << 4) +
   513					 (point[ppos + 3] >> 4);
   514				obj->y = (point[ppos + 2] << 4) +
   515					 (point[ppos + 3] & 0xf);
   516	
   517				if ((obj->x > ts->prop.max_x) ||
   518				    (obj->y > ts->prop.max_y))
   519					continue;
   520	
   521				obj->tm = point[ppos + 4];
   522				if (obj->tm == 0)
   523					obj->tm = 1;
   524	
   525				obj->z = point[ppos + 5];
   526				if (i < 2) {
   527					obj->z += point[i + 63] << 8;
   528					if (obj->z > TOUCH_MAX_PRESSURE)
   529						obj->z = TOUCH_MAX_PRESSURE;
   530				}
   531	
   532				if (obj->z == 0)
   533					obj->z = 1;
   534	
   535				press_id[input_id - 1] = 1;
   536	
   537				input_mt_slot(input, input_id - 1);
   538				input_mt_report_slot_state(input,
   539							   MT_TOOL_FINGER, true);
   540				touchscreen_report_pos(input, &ts->prop,
   541							obj->x,
   542							obj->y, true);
   543	
   544				input_report_abs(input, ABS_MT_TOUCH_MAJOR, obj->tm);
   545				input_report_abs(input, ABS_MT_PRESSURE, obj->z);
   546	
   547				finger_cnt++;
   548			}
   549		}
   550	
   551		input_mt_sync_frame(input);
   552	
   553		input_sync(input);
   554	
   555	xfer_error:
   556		return;
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
