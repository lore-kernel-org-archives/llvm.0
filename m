Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070191C3E;
	Wed, 21 Jun 2023 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687331947; x=1718867947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWyV50SPgitfephLKRCEFeqXC06wm/hIg9EhQleJn+4=;
  b=RzMmzYxMbDEGv+Lw4bYxWMLFx55TTStR5D9NToNpRNloILRRJ+BWvqZQ
   OKrPhmedUzOZYjkhBNRtfDcpWwTj5LwsV21yhTuDIRfgkWfIrW/ZcP0Sq
   H2QU/WwZzxTP3T2aqX4izCDS7SH13nIqk+G0DnOP5DMXyvQKADd1xGAzt
   ehD/sc3uahS+UjUM1cg/cpJuyWOzae6bj9G9HoqpWacpbJZtteJ0YzxHt
   K+yquZygWu55ae8Yk42Ystu8wUhb+Pdh69yZ8/fQyAdMGMfF+Z82+Z4oY
   TSkPykul9+hWvRoUGK8edxzCXp8906q4iT5uc76kjAnuOUaQIopybRQau
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="358962070"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="358962070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 00:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="708592693"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="708592693"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jun 2023 00:19:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBs7H-0006df-2H;
	Wed, 21 Jun 2023 07:18:59 +0000
Date: Wed, 21 Jun 2023 15:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [jic23-iio:testing 6/10] drivers/iio/adc/max14001.c:135:13: warning:
 result of comparison of constant 18446744073709551615 with expression of
 type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char:
 (unsigned char)0, signed char: (unsigned char)0, unsigned short: (un...
Message-ID: <202306211545.7b6CdqsL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   25e201cc6ff270abc062e13ff912292097cb2827
commit: d3e93b67f934a477c5851d575a2278f07c6242fb [6/10] iio: adc: max14001: New driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306211545.7b6CdqsL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211545.7b6CdqsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211545.7b6CdqsL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/max14001.c:135:13: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsigned long)0, long: (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (unsigned long long)0, default: (mask)))' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           reg_data = FIELD_PREP(mask, val);
                      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:71:53: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   1 warning generated.


vim +135 drivers/iio/adc/max14001.c

   117	
   118	static int max14001_reg_update(struct max14001_state *st,
   119					unsigned int reg_addr,
   120					unsigned int mask,
   121					unsigned int val)
   122	{
   123		int ret;
   124		unsigned int reg_data;
   125	
   126		/* Enable SPI Registers Write */
   127		ret = max14001_write(st, MAX14001_WEN, MAX14001_WRITE_WEN);
   128		if (ret)
   129			return ret;
   130	
   131		ret = max14001_read(st, reg_addr, &reg_data);
   132		if (ret)
   133			return ret;
   134	
 > 135		reg_data = FIELD_PREP(mask, val);
   136	
   137		ret = max14001_write(st, reg_addr, reg_data);
   138		if (ret)
   139			return ret;
   140	
   141		/* Write Verification Register */
   142		ret = max14001_write_verification_reg(st, reg_addr);
   143		if (ret)
   144			return ret;
   145	
   146		/* Disable SPI Registers Write */
   147		return max14001_write(st, MAX14001_WEN, 0);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
