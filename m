Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344814D28F;
	Sat, 31 Aug 2024 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725092937; cv=none; b=dpiX3u3Wi3xdBKupemdGpiC74fjW16Xs2XzzfMc40sEYdzc04thAlSdjON1k3tSIiYcUjNgK1s6zxAJ2r0Jm512ONJKPJr7NK67F1d88iGojwmTD4WwmigOEJM3+cImidUOVbTxW0IAOODVVoGrWtqRuNOm2oIoDNPXNDd9KhTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725092937; c=relaxed/simple;
	bh=rkNJisPGdptDqdqLnXQ/smzIUcfvIakSjzsrw03LkfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhPikJZIGAZYhF0DGk3Xo+yUU0wipUKZv77odZ22OIJtJbDWbIB4SaeTyX2VDmNdVj44BijPLvHPTYYzx5MD3tnqQ7X8erpBy9jyhmiqGy+7Fmn7pKHm8JQ3ERfSxkQr8NL40lSzO2FCHnDZeUhmI2qficbr3Sv9hHd5S0VdC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+EOVCA1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+EOVCA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725092935; x=1756628935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkNJisPGdptDqdqLnXQ/smzIUcfvIakSjzsrw03LkfU=;
  b=B+EOVCA1dEiS+RmheTKP4nx/Z8SGsCaqLFxbnF0esQUNSvTM8d7jqoIz
   tiGWBVXNek+q9d94xIvBpnwt1itN7zhI0Zrkc4gRajM0cmGqdgoMyZbZ7
   9ijgN/iyeTo8CpEKCcI5gRtWFK4BXy6mwaCTaHyZUY7BQYkAWbdkb510f
   NaraYRNPedBNqS+0tNsc9zgEDH2uujjbRqt8/RQpzcnV+//2308zWdnbo
   v/HU+ABDLJsPvNIAIakdentgjcfTj/1XwAkgv3zKuo8vbmndcTEACBm0P
   4DO3XiubUSYZEmdFolbiLhnAYgc+j94hzq0ltVuT5mIXs813XAwue1txi
   w==;
X-CSE-ConnectionGUID: 9GqbSBpqRcmMfKOJgByENw==
X-CSE-MsgGUID: mQoS0Z4WRiaYp61E+Fz62A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23923584"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23923584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 01:28:54 -0700
X-CSE-ConnectionGUID: 3W+OWVDxQ1GzNcbfC6Y4Cg==
X-CSE-MsgGUID: ngukxttgToCFDDbXLnFeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64476377"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2024 01:28:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skJTV-0002Ss-2c;
	Sat, 31 Aug 2024 08:28:49 +0000
Date: Sat, 31 Aug 2024 16:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] media: i2c: og01a1b: Add support of xvclk supply
 clock in power management
Message-ID: <202408311620.AghElnWZ-lkp@intel.com>
References: <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830063459.3088895-5-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master robh/for-next linus/master sailus-media-tree/master v6.11-rc5 next-20240830]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/media-dt-bindings-Add-OmniVision-OG01A1B-image-sensor/20240830-143737
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240830063459.3088895-5-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH v4 4/6] media: i2c: og01a1b: Add support of xvclk supply clock in power management
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408311620.AghElnWZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311620.AghElnWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311620.AghElnWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/og01a1b.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/og01a1b.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/og01a1b.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/i2c/og01a1b.c:8:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/og01a1b.c:981:42: warning: overflow in expression; result is -397'934'592 with type 'long' [-Winteger-overflow]
     981 |         unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);
         |                               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math.h:37:22: note: expanded from macro 'DIV_ROUND_UP'
      37 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   8 warnings generated.


vim +981 drivers/media/i2c/og01a1b.c

   977	
   978	/* Power/clock management functions */
   979	static int og01a1b_power_on(struct device *dev)
   980	{
 > 981		unsigned long delay = DIV_ROUND_UP(8192 * USEC_PER_SEC, OG01A1B_MCLK);
   982		struct v4l2_subdev *sd = dev_get_drvdata(dev);
   983		struct og01a1b *og01a1b = to_og01a1b(sd);
   984		int ret;
   985	
   986		ret = clk_prepare_enable(og01a1b->xvclk);
   987		if (ret)
   988			return ret;
   989	
   990		if (og01a1b->xvclk)
   991			usleep_range(delay, 2 * delay);
   992	
   993		return 0;
   994	}
   995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
