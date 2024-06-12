Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F178C16F29C;
	Wed, 12 Jun 2024 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189330; cv=none; b=jg0TDltp27Yp9Cu+8/hN34heI8b4GYrXZv7Sv1uy04svmzlE6FSB53h5pTwIZSKe0/7yRrJaJ52Y7S8afP0SKnyAvglzXZTPk6fFpqDeiZ9/4aCNLInMDbEP6Z7DpXC+Fr5WRlBrMemIOmywlqwb4QgI2YhAtNvzj9bJk++L7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189330; c=relaxed/simple;
	bh=MoK3xP4Ix6k2PYp3yIWUq6zFzJCxSDc3P3cKV5ePzNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Drn8NKq6TY3G/8/uFzS1ZaiHMR+2oESWQHMTnoD3DoMR4RXT9aYBVhTfBXulFh19xTsFJ6r5umfpx0PRoWA7befEUvDD+OcwDkYa1PDiHkgj1rIWamMxmBJr+FoS/mbNm8eqhC/IXWRuJgggIKA02ydwtrAneUSQmMACyCnrr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5xbuPRE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5xbuPRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718189328; x=1749725328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MoK3xP4Ix6k2PYp3yIWUq6zFzJCxSDc3P3cKV5ePzNE=;
  b=a5xbuPREILj2gXuB5cqLBwfexg/lD19GurqtHVxNXZN9ryBfAIS8sUpx
   yUyRHdTnXPGiSB1fwyyIhhUl+G4f1tHXs3WNRZmD6tMbMDnn4oAUXMnWY
   IfvysfQlYIomprBdyJF5IikUZfiTT9FEIflypYvbDMrRc+AP+agLleThs
   Noro1HdlbbDTd/i0GFQ4uF/foT6YyVmMmEch2UPC9qVF6TW4YlhH1+UtD
   UmDPZnmLnZRbdWOywnHEAppUDxc1B2SDub9RTlGQOz/NaZFjaD2PiKa+K
   /OG+Oc1i9Ad9R92H2o23fv8OQBkdk2uwSuZkzrXjzX2flH7bMrJKLJz0F
   Q==;
X-CSE-ConnectionGUID: QyKjwutyQ+u5SoooNC/JJA==
X-CSE-MsgGUID: Fdsxnr1kS1arj1p5W2ouGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25622643"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25622643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 03:48:47 -0700
X-CSE-ConnectionGUID: rAVAxngxRDO5YBV+UBwMkg==
X-CSE-MsgGUID: jbiFhzTrQcafJ2csv5hBmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40457726"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2024 03:48:46 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHLX1-0001Ss-1V;
	Wed, 12 Jun 2024 10:48:43 +0000
Date: Wed, 12 Jun 2024 18:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <202406121833.ard7iXAi-lkp@intel.com>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611150458.684349-1-csokas.bence@prolan.hu>

Hi Bence,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cs-k-s-Bence/rtc-pcf2127-Add-PPS-capability-through-Seconds-Interrupt/20240611-231226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240611150458.684349-1-csokas.bence%40prolan.hu
patch subject: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds Interrupt
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406121833.ard7iXAi-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121833.ard7iXAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121833.ard7iXAi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
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
   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
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
   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rtc/rtc-pcf2127.c:759:13: error: use of undeclared identifier 'pps'
     759 |                 pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
         |                           ^
>> drivers/rtc/rtc-pcf2127.c:1198:12: error: incompatible pointer types passing 'char (*)[32]' to parameter of type 'char *' [-Werror,-Wincompatible-pointer-types]
    1198 |                 snprintf(&pps_info.name, PPS_MAX_NAME_LEN - 1, "%s", dev_name(dev));
         |                          ^~~~~~~~~~~~~~
   include/linux/sprintf.h:12:35: note: passing argument to parameter 'buf' here
      12 | __printf(3, 4) int snprintf(char *buf, size_t size, const char *fmt, ...);
         |                                   ^
   7 warnings and 2 errors generated.


vim +/pps +759 drivers/rtc/rtc-pcf2127.c

   689	
   690	static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
   691	{
   692		struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
   693		struct pps_event_time ts;
   694		unsigned int ctrl2;
   695		int ret = 0;
   696	
   697		/* First of all we get the time stamp... */
   698		pps_get_ts(&ts);
   699	
   700		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
   701		if (ret)
   702			return IRQ_NONE;
   703	
   704		if (pcf2127->cfg->ts_count == 1) {
   705			/* PCF2127/29 */
   706			unsigned int ctrl1;
   707	
   708			ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
   709			if (ret)
   710				return IRQ_NONE;
   711	
   712			if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ_MASK))
   713				return IRQ_NONE;
   714	
   715			if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
   716				pcf2127_rtc_ts_snapshot(dev, 0);
   717	
   718			if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
   719				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
   720					     ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
   721	
   722			if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
   723				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
   724					     ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
   725		} else {
   726			/* PCF2131. */
   727			unsigned int ctrl4;
   728	
   729			ret = regmap_read(pcf2127->regmap, PCF2131_REG_CTRL4, &ctrl4);
   730			if (ret)
   731				return IRQ_NONE;
   732	
   733			if (!(ctrl4 & PCF2131_CTRL4_IRQ_MASK || ctrl2 & PCF2131_CTRL2_IRQ_MASK))
   734				return IRQ_NONE;
   735	
   736			if (ctrl4 & PCF2131_CTRL4_IRQ_MASK) {
   737				int i;
   738				int tsf_bit = PCF2131_BIT_CTRL4_TSF1; /* Start at bit 7. */
   739	
   740				for (i = 0; i < pcf2127->cfg->ts_count; i++) {
   741					if (ctrl4 & tsf_bit)
   742						pcf2127_rtc_ts_snapshot(dev, i);
   743	
   744					tsf_bit = tsf_bit >> 1;
   745				}
   746	
   747				regmap_write(pcf2127->regmap, PCF2131_REG_CTRL4,
   748					     ctrl4 & ~PCF2131_CTRL4_IRQ_MASK);
   749			}
   750	
   751			if (ctrl2 & PCF2131_CTRL2_IRQ_MASK)
   752				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
   753					     ctrl2 & ~PCF2131_CTRL2_IRQ_MASK);
   754		}
   755	
   756		if (ctrl2 & PCF2127_BIT_CTRL2_AF)
   757			rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
   758		else if (ctrl2 & PCF2127_BIT_CTRL2_MSF)
 > 759			pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
   760	
   761		pcf2127_wdt_active_ping(&pcf2127->wdd);
   762	
   763		return IRQ_HANDLED;
   764	}
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
