Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CFD46B8;
	Thu, 24 Oct 2024 01:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731755; cv=none; b=kwy+Th7sovvFr90H+MhltP9D78y5zFVrSaoLYGbHtZzbX29GbjaQDZp+QYc6+dHS9AuMAeS0fip0r1CLSOAnQiVYQQ7kL4umXP2lB3J7fpwh8zQfIn24+UoqV222fKSjWrqGqX9XlP+uEoZt+nmO5GlRTy8MV684KoJqmS7OUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731755; c=relaxed/simple;
	bh=xcSPOTKoVay8aJNmHQJfC5qPK9/bLslZxFeGjFTYSWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xzx0ckjNKIpFulPJgXA5kCwuocWVEDT0TzhP/n+DV+zhPXrv3J4JUGEXsebxYTbaq/NlWfEjYb4iF/IWUyxHGbH2DW7oggkj3SZ6Ww0jsumPLztPYcqhO0DF7rvpzFhVrlRjOFnOyNAUEAVkresqj8nLGaIk4HSaMI9WMVlQ2sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NykXAS29; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NykXAS29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729731753; x=1761267753;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xcSPOTKoVay8aJNmHQJfC5qPK9/bLslZxFeGjFTYSWw=;
  b=NykXAS29arpL62bpeWdPWuf64JjZ78UYirK0hA9NOuATVDjzNPck494O
   YUTbuL8cXjhcfN4ikDpiT8ZvQG1sgUjv+dhtiZyaid0H0Fo1fhYJNEAIZ
   X29pnUCG8n/yCk5TEWGyDa1XXRzmGs1Oo2m1gnxsala76i9w3yFm7jR3b
   nOEU3hm4ju++iIrJw1JzJkzTc5++A6HdDBDa+Si5Yq8zWiuO2jss8Ey8u
   Y9BfldPdCBhnP+r/CdWKb6vsl6gSUsU4j+xU1l9HhksoOJ3VaL8oEr28J
   SBOrvmTF458/w2bAbLL7F+15JBVI/Pbeag1LAaopOkgbvP+b1xdycbRFU
   g==;
X-CSE-ConnectionGUID: tM5NchlGTYycq5+MgMkNfg==
X-CSE-MsgGUID: MEnfBa3DS92ZwrYWYxTx7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39959191"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="39959191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:02:29 -0700
X-CSE-ConnectionGUID: 51KhsvtTTdmSgtJ3i7BjFQ==
X-CSE-MsgGUID: B6S5sjRdS9+68/0bU9Kg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80535783"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2024 18:02:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mF7-000VmA-36;
	Thu, 24 Oct 2024 01:02:25 +0000
Date: Thu, 24 Oct 2024 09:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/test 3/3] drivers/iio/adc/ad7380.c:851:2:
 error: cannot jump from switch statement to this case label
Message-ID: <202410240802.VMztsHsW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/test
head:   800b10017d81d19743a95725b73d0026e1647bc9
commit: 800b10017d81d19743a95725b73d0026e1647bc9 [3/3] iio: adc: ad7380: use if_not_guard for claim direct
config: arm-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240802.VMztsHsW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240802.VMztsHsW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240802.VMztsHsW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/adc/ad7380.c:27:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/adc/ad7380.c:851:2: error: cannot jump from switch statement to this case label
     851 |         default:
         |         ^
   drivers/iio/adc/ad7380.c:823:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     823 |                 if_not_guard(iio_claim_direct_try, indio_dev)
         |                 ^
   include/linux/cleanup.h:359:24: note: expanded from macro 'if_not_guard'
     359 |         __if_not_guard(_name, __UNIQUE_ID(guard), args)
         |                               ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:17:1: note: expanded from here
      17 | __UNIQUE_ID_guard334
         | ^
   drivers/iio/adc/ad7380.c:847:2: error: cannot jump from switch statement to this case label
     847 |         case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
         |         ^
   drivers/iio/adc/ad7380.c:823:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     823 |                 if_not_guard(iio_claim_direct_try, indio_dev)
         |                 ^
   include/linux/cleanup.h:359:24: note: expanded from macro 'if_not_guard'
     359 |         __if_not_guard(_name, __UNIQUE_ID(guard), args)
         |                               ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:17:1: note: expanded from here
      17 | __UNIQUE_ID_guard334
         | ^
   drivers/iio/adc/ad7380.c:838:2: error: cannot jump from switch statement to this case label
     838 |         case IIO_CHAN_INFO_OFFSET:
         |         ^
   drivers/iio/adc/ad7380.c:823:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     823 |                 if_not_guard(iio_claim_direct_try, indio_dev)
         |                 ^
   include/linux/cleanup.h:359:24: note: expanded from macro 'if_not_guard'
     359 |         __if_not_guard(_name, __UNIQUE_ID(guard), args)
         |                               ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:17:1: note: expanded from here
      17 | __UNIQUE_ID_guard334
         | ^
   drivers/iio/adc/ad7380.c:827:2: error: cannot jump from switch statement to this case label
     827 |         case IIO_CHAN_INFO_SCALE:
         |         ^
   drivers/iio/adc/ad7380.c:823:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     823 |                 if_not_guard(iio_claim_direct_try, indio_dev)
         |                 ^
   include/linux/cleanup.h:359:24: note: expanded from macro 'if_not_guard'
     359 |         __if_not_guard(_name, __UNIQUE_ID(guard), args)
         |                               ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:17:1: note: expanded from here
      17 | __UNIQUE_ID_guard334
         | ^
   drivers/iio/adc/ad7380.c:935:2: error: cannot jump from switch statement to this case label
     935 |         default:
         |         ^
   drivers/iio/adc/ad7380.c:911:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     911 |                 if_not_guard(iio_claim_direct_try, indio_dev)
         |                 ^
   include/linux/cleanup.h:359:24: note: expanded from macro 'if_not_guard'
     359 |         __if_not_guard(_name, __UNIQUE_ID(guard), args)
         |                               ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b


vim +851 drivers/iio/adc/ad7380.c

b095217c104bca David Lechner  2024-05-28  808  
b095217c104bca David Lechner  2024-05-28  809  static int ad7380_read_raw(struct iio_dev *indio_dev,
b095217c104bca David Lechner  2024-05-28  810  			   struct iio_chan_spec const *chan,
b095217c104bca David Lechner  2024-05-28  811  			   int *val, int *val2, long info)
b095217c104bca David Lechner  2024-05-28  812  {
b095217c104bca David Lechner  2024-05-28  813  	struct ad7380_state *st = iio_priv(indio_dev);
15b08012852f40 Julien Stephan 2024-05-30  814  	const struct iio_scan_type *scan_type;
15b08012852f40 Julien Stephan 2024-05-30  815  
15b08012852f40 Julien Stephan 2024-05-30  816  	scan_type = iio_get_current_scan_type(indio_dev, chan);
15b08012852f40 Julien Stephan 2024-05-30  817  
15b08012852f40 Julien Stephan 2024-05-30  818  	if (IS_ERR(scan_type))
15b08012852f40 Julien Stephan 2024-05-30  819  		return PTR_ERR(scan_type);
b095217c104bca David Lechner  2024-05-28  820  
b095217c104bca David Lechner  2024-05-28  821  	switch (info) {
b095217c104bca David Lechner  2024-05-28  822  	case IIO_CHAN_INFO_RAW:
800b10017d81d1 David Lechner  2024-10-01  823  		if_not_guard(iio_claim_direct_try, indio_dev)
800b10017d81d1 David Lechner  2024-10-01  824  			return -EBUSY;
800b10017d81d1 David Lechner  2024-10-01  825  
800b10017d81d1 David Lechner  2024-10-01  826  		return ad7380_read_direct(st, chan->scan_index, scan_type, val);
b095217c104bca David Lechner  2024-05-28  827  	case IIO_CHAN_INFO_SCALE:
b095217c104bca David Lechner  2024-05-28  828  		/*
2920b6ee6d69ed David Lechner  2024-05-28  829  		 * According to the datasheet, the LSB size is:
2920b6ee6d69ed David Lechner  2024-05-28  830  		 *    * (2 × VREF) / 2^N, for differential chips
2920b6ee6d69ed David Lechner  2024-05-28  831  		 *    * VREF / 2^N, for pseudo-differential chips
2920b6ee6d69ed David Lechner  2024-05-28  832  		 * where N is the ADC resolution (i.e realbits)
b095217c104bca David Lechner  2024-05-28  833  		 */
b095217c104bca David Lechner  2024-05-28  834  		*val = st->vref_mv;
15b08012852f40 Julien Stephan 2024-05-30  835  		*val2 = scan_type->realbits - chan->differential;
b095217c104bca David Lechner  2024-05-28  836  
b095217c104bca David Lechner  2024-05-28  837  		return IIO_VAL_FRACTIONAL_LOG2;
2920b6ee6d69ed David Lechner  2024-05-28  838  	case IIO_CHAN_INFO_OFFSET:
2920b6ee6d69ed David Lechner  2024-05-28  839  		/*
2920b6ee6d69ed David Lechner  2024-05-28  840  		 * According to IIO ABI, offset is applied before scale,
2920b6ee6d69ed David Lechner  2024-05-28  841  		 * so offset is: vcm_mv / scale
2920b6ee6d69ed David Lechner  2024-05-28  842  		 */
15b08012852f40 Julien Stephan 2024-05-30  843  		*val = st->vcm_mv[chan->channel] * (1 << scan_type->realbits)
2920b6ee6d69ed David Lechner  2024-05-28  844  			/ st->vref_mv;
2920b6ee6d69ed David Lechner  2024-05-28  845  
15b08012852f40 Julien Stephan 2024-05-30  846  		return IIO_VAL_INT;
15b08012852f40 Julien Stephan 2024-05-30  847  	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
15b08012852f40 Julien Stephan 2024-05-30  848  		*val = st->oversampling_ratio;
15b08012852f40 Julien Stephan 2024-05-30  849  
2920b6ee6d69ed David Lechner  2024-05-28  850  		return IIO_VAL_INT;
b095217c104bca David Lechner  2024-05-28 @851  	default:
b095217c104bca David Lechner  2024-05-28  852  		return -EINVAL;
b095217c104bca David Lechner  2024-05-28  853  	}
b095217c104bca David Lechner  2024-05-28  854  }
b095217c104bca David Lechner  2024-05-28  855  

:::::: The code at line 851 was first introduced by commit
:::::: b095217c104bca87d5e24c147b3e37cae921c441 iio: adc: ad7380: new driver for AD7380 ADCs

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
