Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B811DF991;
	Fri,  4 Jul 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629488; cv=none; b=pCLnIcDXtwUoiC0gg8BNP80Z5cJlYafLJ1EKpFYXb3UNI5A0h2Wl7mKYJ/5bNylGl6FU9Pb9UIPqlIU6qgbR1nTw4Q8aXaJa4FkMJ3mfN+CsEIFw7PP5DRV+GAg+gcAvXtrtCICkLXorVWmnAAjX80wi7/z+VDC2U0NWA0SyerE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629488; c=relaxed/simple;
	bh=CJ8JIKbXJfPK6rmC466QKL4s4DqqoD3hSTlHy6aEudg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXcnmuemEIiDhH6W3Nvtttci+avHAzgdCG86LwuUqN+EZEnvl9jubLU3JVBBrAwjoddKBhPAe1Osc5WqFxZrk0gfrEK9ZWoONS3a76a6mS1TjtK/dB8LnvP/uMjpZOI2ViDm+7RCSDmErk2xKNTCPlzV/lEmleNBZ72RrJJw8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrLh+D/J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrLh+D/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751629487; x=1783165487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CJ8JIKbXJfPK6rmC466QKL4s4DqqoD3hSTlHy6aEudg=;
  b=LrLh+D/JdYAnSUNje75mAsOvJJ2AudIUvdaEZ9zagCmnVJ0d8Ru58IU5
   qhyPDq4QEU1iBATvxQipkniUeMoPdF92jYFuMnCeIvkumwz89ja6oYu1q
   CjBJ2NaHf6ARqVMkSnxwNbfT4PYw8KZ3u/mqoV1LHww51PifAFZ4Rvtco
   5+DiJmxILUskoM+Pi2p5JBGJH8LOoB2XqK/qrRf291SXL962F2dMgbAvL
   3c79RxohVTLCyHpOEJMr+tssQnbmeFzd9GBaNLFfdmVpW1Ik1W/pZVM1W
   wGv+PeXeB1KucE1rL5DCjkMEHAlaro9Eage3gnUIEAtVmmKdkaaY5JlTI
   Q==;
X-CSE-ConnectionGUID: lHfNF0ZVSjKrOt/ZI5csfw==
X-CSE-MsgGUID: v01e9AbdQ4Wy/mvvusKEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79404126"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="79404126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 04:44:46 -0700
X-CSE-ConnectionGUID: 29o8eOgkS1W9fZWzbyADXQ==
X-CSE-MsgGUID: qYoPXODjQXCg2XfKGJjnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154709737"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 04:44:45 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXeqR-0003en-1L;
	Fri, 04 Jul 2025 11:44:43 +0000
Date: Fri, 4 Jul 2025 19:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V3 15/15] platform/x86/intel/pmt: KUNIT test for PMT
 Enhanced Discovery API
Message-ID: <202507041955.XHNndERv-lkp@intel.com>
References: <20250703022832.1302928-16-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703022832.1302928-16-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/MAINTAINERS-Add-link-to-documentation-of-Intel-PMT-ABI/20250703-103720
base:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
patch link:    https://lore.kernel.org/r/20250703022832.1302928-16-david.e.box%40linux.intel.com
patch subject: [PATCH V3 15/15] platform/x86/intel/pmt: KUNIT test for PMT Enhanced Discovery API
config: i386-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041955.XHNndERv-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041955.XHNndERv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041955.XHNndERv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmt/discovery-kunit.c:35:73: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      35 |                 kunit_info(test, "\t\taddr=%p, size=%lu, num_rmids=%u", region->addr, region->size,
         |                                                     ~~~                               ^~~~~~~~~~~~
         |                                                     %zu
   include/kunit/test.h:616:39: note: expanded from macro 'kunit_info'
     616 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   include/kunit/test.h:604:21: note: expanded from macro 'kunit_printk'
     603 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |                                                            ~~~
     604 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:597:21: note: expanded from macro 'kunit_log'
     597 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> drivers/platform/x86/intel/pmt/discovery-kunit.c:35:73: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      35 |                 kunit_info(test, "\t\taddr=%p, size=%lu, num_rmids=%u", region->addr, region->size,
         |                                                     ~~~                               ^~~~~~~~~~~~
         |                                                     %zu
   include/kunit/test.h:616:39: note: expanded from macro 'kunit_info'
     616 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                       ~~~    ^~~~~~~~~~~
   include/kunit/test.h:604:21: note: expanded from macro 'kunit_printk'
     603 |         kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,         \
         |                                                            ~~~
     604 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:599:8: note: expanded from macro 'kunit_log'
     598 |                 kunit_log_append((test_or_suite)->log,  fmt,            \
         |                                                         ~~~
     599 |                                  ##__VA_ARGS__);                        \
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +35 drivers/platform/x86/intel/pmt/discovery-kunit.c

    17	
    18	static void
    19	validate_pmt_regions(struct kunit *test, struct pmt_feature_group *feature_group, int feature_id)
    20	{
    21		int i;
    22	
    23		kunit_info(test, "Feature ID %d [%s] has %d regions.\n", feature_id,
    24			   pmt_feature_names[feature_id], feature_group->count);
    25	
    26		for (i = 0; i < feature_group->count; i++) {
    27			struct telemetry_region *region = &feature_group->regions[i];
    28	
    29			kunit_info(test, "  - Region %d: cdie_mask=%u, package_id=%u, partition=%u, segment=%u,",
    30				   i, region->plat_info.cdie_mask, region->plat_info.package_id,
    31				   region->plat_info.partition, region->plat_info.segment);
    32			kunit_info(test, "\t\tbus=%u, device=%u, function=%u, guid=0x%x,",
    33				   region->plat_info.bus_number, region->plat_info.device_number,
    34				   region->plat_info.function_number, region->guid);
  > 35			kunit_info(test, "\t\taddr=%p, size=%lu, num_rmids=%u", region->addr, region->size,
    36				   region->num_rmids);
    37	
    38	
    39			KUNIT_ASSERT_GE(test, region->plat_info.cdie_mask, 0);
    40			KUNIT_ASSERT_GE(test, region->plat_info.package_id, 0);
    41			KUNIT_ASSERT_GE(test, region->plat_info.partition, 0);
    42			KUNIT_ASSERT_GE(test, region->plat_info.segment, 0);
    43			KUNIT_ASSERT_GE(test, region->plat_info.bus_number, 0);
    44			KUNIT_ASSERT_GE(test, region->plat_info.device_number, 0);
    45			KUNIT_ASSERT_GE(test, region->plat_info.function_number, 0);
    46	
    47			KUNIT_ASSERT_NE(test, region->guid, 0);
    48	
    49			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (__force const void *)region->addr);
    50		}
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
