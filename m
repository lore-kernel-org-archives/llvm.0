Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC033D4;
	Sun,  6 Aug 2023 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691323273; x=1722859273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bFk2Uyffzh0qINDT8S6Ck6B2YzcE0j1T2z0vk928D5U=;
  b=X0ng1vWb+I8GFGbWwInr2qnOHpQt17AKHxKWn1Qq/QMO8HSCLvuLbgsj
   MhSoT8cWgZwi6Ebq3ldrdvIcPo5XtwSawsMjU68U3H8fybjBN8VJtVNtm
   IUxBV1SbsiI/V7Rcr0VC/HeySUNnkSZhZnGgUn8S9NLRM2IHu9rR8QNGI
   htrnwzco12Lz0oLgoO9Eo7/EY2pHfFllu44nr8iEhU93l0oE2pbQd9QO/
   E0TLK/eryaVgXmN0iFHdzQ9TfLPtjlO17MN++rrOQH9mAeTixBH0brTu7
   22RL3c2qajiTx8ar1ZLDcdBgk23aJzUr3U9mGb1Jzc5UwCewSBanSRiBy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="369283409"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="369283409"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 05:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="795967972"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="795967972"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2023 05:01:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qScRZ-0004D1-1u;
	Sun, 06 Aug 2023 12:01:09 +0000
Date: Sun, 6 Aug 2023 20:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Windfeldt-Prytz <stefan.windfeldt-prytz@axis.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/iio/light/opt4001.c:215:9: error: call to
 '__compiletime_assert_355' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <202308061902.0gVz6bSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0ab9f34e59e0c01a1c31142e0b336245367fd86
commit: 9a9608418292bb8733805c3f3123dfe0454fadac iio: light: Add support for TI OPT4001 light sensor
date:   3 months ago
config: s390-randconfig-r034-20230806 (https://download.01.org/0day-ci/archive/20230806/202308061902.0gVz6bSe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061902.0gVz6bSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061902.0gVz6bSe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/light/opt4001.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/iio/light/opt4001.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/iio/light/opt4001.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/iio/light/opt4001.c:215:9: error: call to '__compiletime_assert_355' declared with 'error' attribute: FIELD_PREP: value too large for the field
     215 |         reg |= FIELD_PREP(OPT4001_CTRL_CONV_TIME_MASK, chip->int_time);
         |                ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:55:1: note: expanded from here
      55 | __compiletime_assert_355
         | ^
   12 warnings and 1 error generated.


vim +215 drivers/iio/light/opt4001.c

   207	
   208	static int opt4001_set_conf(struct opt4001_chip *chip)
   209	{
   210		struct device *dev = &chip->client->dev;
   211		u16 reg;
   212		int ret;
   213	
   214		reg = FIELD_PREP(OPT4001_CTRL_RANGE_MASK, OPT4001_CTRL_LIGHT_SCALE_AUTO);
 > 215		reg |= FIELD_PREP(OPT4001_CTRL_CONV_TIME_MASK, chip->int_time);
   216		reg |= FIELD_PREP(OPT4001_CTRL_OPER_MODE_MASK, OPT4001_CTRL_OPER_MODE_CONTINUOUS);
   217	
   218		ret = regmap_write(chip->regmap, OPT4001_CTRL, reg);
   219		if (ret)
   220			dev_err(dev, "Failed to set configuration\n");
   221	
   222		return ret;
   223	}
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
