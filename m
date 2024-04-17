Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C052F6D;
	Wed, 17 Apr 2024 05:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713330867; cv=none; b=r7UIylMEtChGJeB2zHeOJSxMHioa+AW161ySq8lISQ6vmxbCc8iTweflmyLEpIfsCxMw02ggicbcdQuiT4DPJVEbhxlJjESEqfIplD5Pv42yil5E/4Bv0ohDkd5D0t/kLCcunSNC6sv9Csxepm6oleaelFS9y/ASFAgswhfuqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713330867; c=relaxed/simple;
	bh=OXYxASHN2q0NZuBC2yNSExJeppwunAkk6OOnfEOz53Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvQSe8TmiZElsC1laJujXEk9bxZt4/6R2VHvJR6c6D7jFkTAiZRB1XGQRSnxH2RMTAJS9R+OvQ1mqoTvVfEpWdFpZ74Pz+aZx//DszsQO2harje2Sn7HJ9+SKxoqObu5MURnPnfzYEyyFe2bDBZ10znlmr+CZyVueFXjh6XRzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkKD8O3q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkKD8O3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713330866; x=1744866866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OXYxASHN2q0NZuBC2yNSExJeppwunAkk6OOnfEOz53Y=;
  b=jkKD8O3q4S5mbaN+bLhyQlRcTt+pTJSDuGvB7z4lQT2qYF9+kTZHKRMx
   vS0mG28UYpEd9qOCntevdUqmsexUUAqW4QJYqa6Y+28yFcST+M8vCEFRD
   1Jq0E555/oWA4gGqVFkCjITn3wmSyHDBn6C3Bs/VPkjzma2I4k/jiWvdS
   je00C+xgVPY6BVdPtsh5WwOrdBs/uDEO+Mpwpfkvea9QtX1WbcKZi6IJf
   otvYlqMWecGO388nk/IM1t8ROm+YtfF9BfCC5EzKNp19Nk28bmJ7/1gIi
   nIP6rVT+3T2/zFCp7esbCvoDnzY6lAXvpdjrWuNK2eBOMW/mdhNK9ZMXr
   Q==;
X-CSE-ConnectionGUID: C/AlWzLaQ8exJt6W9cKtLw==
X-CSE-MsgGUID: LqwoFST7Qf+xXSDRTjM/0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31286258"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="31286258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 22:14:25 -0700
X-CSE-ConnectionGUID: NB+WMplOTomxcc3PoVv8Bg==
X-CSE-MsgGUID: 0yP54VCMSzaGrTisueQwHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22371985"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Apr 2024 22:14:23 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwxci-00069A-3C;
	Wed, 17 Apr 2024 05:14:20 +0000
Date: Wed, 17 Apr 2024 13:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host 18/19] drivers/hwmon/jc42.c:626:12: error:
 use of undeclared identifier 'I2C_CLASS_SPD'
Message-ID: <202404171340.VkZff1Jq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
head:   08944c074592041873f1cb3e5be5fc3fd4cdc3ad
commit: f7ece6320f6f028873649b9aa836c5bc5abf2cb3 [18/19] i2c: Remove I2C_CLASS_SPD
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240417/202404171340.VkZff1Jq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171340.VkZff1Jq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171340.VkZff1Jq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/jc42.c:18:
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
   In file included from drivers/hwmon/jc42.c:18:
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
   In file included from drivers/hwmon/jc42.c:18:
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
   In file included from drivers/hwmon/jc42.c:18:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/jc42.c:626:12: error: use of undeclared identifier 'I2C_CLASS_SPD'
     626 |         .class          = I2C_CLASS_SPD | I2C_CLASS_HWMON,
         |                           ^
   7 warnings and 1 error generated.


vim +/I2C_CLASS_SPD +626 drivers/hwmon/jc42.c

803deccec25133 Guenter Roeck    2016-07-02  624  
d397276b0c833b Guenter Roeck    2014-04-15  625  static struct i2c_driver jc42_driver = {
eacc48ce3accfc Alison Schofield 2016-07-04 @626  	.class		= I2C_CLASS_SPD | I2C_CLASS_HWMON,
d397276b0c833b Guenter Roeck    2014-04-15  627  	.driver = {
d397276b0c833b Guenter Roeck    2014-04-15  628  		.name	= "jc42",
d397276b0c833b Guenter Roeck    2014-04-15  629  		.pm = JC42_DEV_PM_OPS,
803deccec25133 Guenter Roeck    2016-07-02  630  		.of_match_table = of_match_ptr(jc42_of_ids),
d397276b0c833b Guenter Roeck    2014-04-15  631  	},
1975d167869ef0 Uwe Kleine-König 2023-05-05  632  	.probe		= jc42_probe,
d397276b0c833b Guenter Roeck    2014-04-15  633  	.remove		= jc42_remove,
d397276b0c833b Guenter Roeck    2014-04-15  634  	.id_table	= jc42_id,
d397276b0c833b Guenter Roeck    2014-04-15  635  	.detect		= jc42_detect,
d397276b0c833b Guenter Roeck    2014-04-15  636  	.address_list	= normal_i2c,
d397276b0c833b Guenter Roeck    2014-04-15  637  };
4453d7364d3b1f Guenter Roeck    2010-08-09  638  

:::::: The code at line 626 was first introduced by commit
:::::: eacc48ce3accfc9092594794b009a40f91331b0e hwmon: (jc42) Add I2C_CLASS_HWMON to detection class

:::::: TO: Alison Schofield <amsfield22@gmail.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
