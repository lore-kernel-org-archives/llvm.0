Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C21CB51A;
	Fri, 22 Nov 2024 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732276349; cv=none; b=tHi+f2A6Lj0iyyLdRaPW5V80bz+e+5FWGimLpWOvcR+O3VFUyOhGPAEawSjYp4siF6ecJnU4C8CZWKXmVWfiYN10tKY3MIv2OHbTAwpqQ6Xu3MiAIbRW/HR6ACMykz3XCrk+BEmg6V1oRv7n5kFXSwpo2J7OKMoDo97lGVXoxAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732276349; c=relaxed/simple;
	bh=oHOunADvi+vIy3JhCVGF2ZdiCG/NxMIxl0/zchipkCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9lAfnNvWhPFzOUAs9VxLkK8YYYjxADyHLicjuiHbhsS7WT/bFZDrGWRzUTxKP8K4eEW9balu4vZahcwWF8+DsBlrX2kyQOKp3hA14OtgpXqUKIu6i8kYdTIbfm8plri1Fdlwwxa0weF4wtSzey6qZpM+bl8SevoYuU+kYLWrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mt32fidZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mt32fidZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732276348; x=1763812348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oHOunADvi+vIy3JhCVGF2ZdiCG/NxMIxl0/zchipkCU=;
  b=Mt32fidZ47Pol6uW6WB/V/WwKwJBY78qKMQE+sP05jeyZUPw4hp7Bpvx
   EbR1RoR0p0tQ/K9PG2/HcM45L/HWY6UWriTjko88DtquvyXf/5RvyS+Qf
   K9FppUSNv1YTTtCZvmR8yh9uM/haedYP5UeIDcjK5dlUUcyJaC04AHY8U
   fArFqiXDrnIZQCpcjFw6H3bVy8KPoNOXDypTCRKHMpXGK1V+azsNaJ+pW
   qAlIB45JJxSCbZznuUJxb+fmO8VBtnYkGBOpSEPjks8O08F0IjF+4qdfI
   xz6Dr8DqfG5qtd18KcRQBo/ZAeN/GV7NvkJ19YiN30NSVDrvj8D7kdgOv
   w==;
X-CSE-ConnectionGUID: piw9cYfnTMCCDRFCFAlktg==
X-CSE-MsgGUID: G4vhS193Qiqfj/oPeGCqEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35287351"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="35287351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:52:26 -0800
X-CSE-ConnectionGUID: Lo8E8s5IQAyDBezPcZfrHA==
X-CSE-MsgGUID: sUBvT3y6SrOc4tV2IGsaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90722980"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 03:52:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tESCv-0003sJ-2j;
	Fri, 22 Nov 2024 11:52:17 +0000
Date: Fri, 22 Nov 2024 19:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, lee@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
Message-ID: <202411221902.1IFRsKWS-lkp@intel.com>
References: <20241121064046.3724726-7-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121064046.3724726-7-tmyu0@nuvoton.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on mkl-can-next/testing groeck-staging/hwmon-next abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Yu/mfd-Add-core-driver-for-Nuvoton-NCT6694/20241121-155723
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241121064046.3724726-7-tmyu0%40nuvoton.com
patch subject: [PATCH v2 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411221902.1IFRsKWS-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221902.1IFRsKWS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221902.1IFRsKWS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/nct6694-hwmon.c:263:15: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     263 |                 frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
         |                             ^
>> drivers/hwmon/nct6694-hwmon.c:508:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     508 |                        FIELD_PREP(NCT6694_TIN_HYST_MASK, temp_hyst);
         |                        ^
   2 errors generated.


vim +/FIELD_GET +263 drivers/hwmon/nct6694-hwmon.c

   238	
   239	static int nct6694_temp_read(struct device *dev, u32 attr, int channel,
   240				     long *val)
   241	{
   242		struct nct6694_hwmon_data *data = dev_get_drvdata(dev);
   243		unsigned char temp_en, temp_hyst;
   244		int ret, int_part, frac_part;
   245		signed char temp_max;
   246	
   247		guard(mutex)(&data->lock);
   248	
   249		switch (attr) {
   250		case hwmon_temp_enable:
   251			temp_en = data->hwmon_en[NCT6694_TIN_EN(channel / 8)];
   252			*val = temp_en & BIT(channel % 8) ? 1 : 0;
   253	
   254			return 0;
   255		case hwmon_temp_input:
   256			ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
   257					       NCT6694_TIN_IDX(channel), 2,
   258					       data->xmit_buf);
   259			if (ret)
   260				return ret;
   261	
   262			int_part = sign_extend32(data->xmit_buf[0], 7);
 > 263			frac_part = FIELD_GET(NCT6694_LSB_REG_MASK, data->xmit_buf[1]);
   264			if (int_part < 0)
   265				*val = (int_part + 1) * 1000 - (8 - frac_part) * 125;
   266			else
   267				*val = int_part * 1000 + frac_part * 125;
   268	
   269			return 0;
   270		case hwmon_temp_max:
   271			ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
   272					       NCT6694_HWMON_CMD2_OFFSET,
   273					       NCT6694_HWMON_CMD2_LEN,
   274					       data->xmit_buf);
   275			if (ret)
   276				return ret;
   277	
   278			*val = temp_from_reg(data->xmit_buf[NCT6694_TIN_HL(channel)]);
   279	
   280			return 0;
   281		case hwmon_temp_max_hyst:
   282			ret = nct6694_read_msg(data->nct6694, NCT6694_HWMON_MOD,
   283					       NCT6694_HWMON_CMD2_OFFSET,
   284					       NCT6694_HWMON_CMD2_LEN,
   285					       data->xmit_buf);
   286			if (ret)
   287				return ret;
   288	
   289			temp_max = (signed char)data->xmit_buf[NCT6694_TIN_HL(channel)];
   290			temp_hyst = FIELD_GET(NCT6694_TIN_HYST_MASK,
   291					      data->xmit_buf[NCT6694_TIN_HYST(channel)]);
   292			if (temp_max < 0)
   293				*val = temp_from_reg(temp_max + temp_hyst);
   294			else
   295				*val = temp_from_reg(temp_max - temp_hyst);
   296	
   297			return 0;
   298		case hwmon_temp_max_alarm:
   299			ret = nct6694_read_msg(data->nct6694, NCT6694_RPT_MOD,
   300					       NCT6694_TIN_STS(channel / 8), 1,
   301						   data->xmit_buf);
   302			if (ret)
   303				return ret;
   304	
   305			*val = !!(data->xmit_buf[0] & BIT(channel % 8));
   306	
   307			return 0;
   308		default:
   309			return -EOPNOTSUPP;
   310		}
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
