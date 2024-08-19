Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDF17557E;
	Mon, 19 Aug 2024 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089318; cv=none; b=E4zuw1ccgkHS+WnhyrAEYeMVmiw1z2fYjbCvNVveMFgyuMDQK3XZG44aIjULxCBn7J/rlIWJxYY6D6gH692c8cqGSWAEsnZWNHCAACm+O3wXpoV2ZFDN7gyAS72kYEezYxv4LYbfQxrHfSv332Nmqp7rSfUTg3HSfRcG/YEbSDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089318; c=relaxed/simple;
	bh=hBI7nZIviTAwOdkkNaw+gLK9uH/3uptX0DGWQejrOrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMv5HMUnI4KsDeQ+Sp3onCjCIFNPe45Eph/XIJyhXtSvj9MQLYC98VwMO0I2O0jmvpHAhM/+txngDt3z68KJb77v6KibVVXBlH/Wct++XzaTbnIAkjG8miTaWUFpzeUf6XKtz4Hf2TbHTrA2whnfN7sPGz73sQDbQjKHD6yuEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLuv32+m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLuv32+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724089316; x=1755625316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBI7nZIviTAwOdkkNaw+gLK9uH/3uptX0DGWQejrOrc=;
  b=JLuv32+mWXWifoD1y/IMnlBUunTL9L3B7u58J9a8Z7qocdmkPk+JXb2c
   g4IAjeU6NboJaEMaPaEfI7vEE4Z1P9aiCoSrc/o1TYCYnkg4Q2wGPTw9/
   cKXLf3I6KNQoV/mQFtAYdJik2DCvU7tvKU/6hgUxClyBFc/i04BJb/zXl
   kQU0q4YIFpJXhXm5SCKsdfwPkuhQ8C+q1PNOPYra1+nNRqmo6BMhrKRun
   Y+CORWDI4DBieajchqljBG9jj5NdZQFieTUb1L8TjGyCFcnImPBpObLed
   w0sMcX+l+FbUWaiINchW8Pbef3BWvKMPfNqPeyDuRE6bAo6Td3RmBAwEc
   g==;
X-CSE-ConnectionGUID: dq0erbKdRZKBPVmR8azCJQ==
X-CSE-MsgGUID: V39BYCbIREWzux5RFtC5uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21974671"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21974671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:41:56 -0700
X-CSE-ConnectionGUID: ruNezrxeRPWGC5DX3kbOJw==
X-CSE-MsgGUID: OT59su+iSbGKBJOohgifRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65134246"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2024 10:41:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg6O8-0009Fi-1A;
	Mon, 19 Aug 2024 17:41:52 +0000
Date: Tue, 20 Aug 2024 01:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/7] i2c: designware: Always provide device ID tables
Message-ID: <202408200343.2LbkR6Jx-lkp@intel.com>
References: <20240819084007.3700433-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819084007.3700433-6-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.11-rc4 next-20240819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-a-while-loop-by-for-loop/20240819-164231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240819084007.3700433-6-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 5/7] i2c: designware: Always provide device ID tables
config: hexagon-randconfig-002-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200343.2LbkR6Jx-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200343.2LbkR6Jx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200343.2LbkR6Jx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:18:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:18:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-platdrv.c:18:
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
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-designware-platdrv.c:449:34: warning: unused variable 'dw_i2c_of_match' [-Wunused-const-variable]
   static const struct of_device_id dw_i2c_of_match[] = {
                                    ^
   drivers/i2c/busses/i2c-designware-platdrv.c:457:36: warning: unused variable 'dw_i2c_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id dw_i2c_acpi_match[] = {
                                      ^
   8 warnings generated.


vim +/dw_i2c_of_match +449 drivers/i2c/busses/i2c-designware-platdrv.c

   448	
 > 449	static const struct of_device_id dw_i2c_of_match[] = {
   450		{ .compatible = "snps,designware-i2c", },
   451		{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
   452		{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
   453		{}
   454	};
   455	MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
