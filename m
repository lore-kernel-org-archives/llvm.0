Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067D1EA7C1;
	Mon, 21 Apr 2025 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745277978; cv=none; b=UaVYsxuHi3WPyNcPmyWrDiVrBlpi8vXqouzd2/fGVk2le73dTcHK+xZr/7VXDcZqL3EfiIC2QnmkN3dLNTQsgX72ICxI9f3pVGb1X1Zi/p3e2+yhBY7mCbwpVifBIigQFQ9TVvq98mm2KxKDlyWzjw7tyaM2odF7bjvng8xm8pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745277978; c=relaxed/simple;
	bh=FYDvp8jFaUMcmBOOHClsw8U1ppBUEgvkVEpACWBXnGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+ZV+PvlsR9WRyqVECmg5GqhEjwg7K39zLf1yDYjJy5IBaQ+blmIamICStTVFMnYIe/+zOc3ZQ1PAlSX5WrzP/lT0WYw8MYy1sWZhUOOFq/m9PxSqUnNg3XenfmhuSfVfYjKrPDhn/wTIuXK56GJMatDZSm+XhO0xEl4ne+nyUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SM0QL7J+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM0QL7J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745277977; x=1776813977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FYDvp8jFaUMcmBOOHClsw8U1ppBUEgvkVEpACWBXnGA=;
  b=SM0QL7J+XSFwW5JjgRnbOuy0mymGrLc6dk19WMUnrBySPxpBQt7l5kTt
   6OGRQdPIwiV4li/g0Yr67lPCu0qkgFcG9a1GclKM2VL3+fRU+OuRzuio0
   Ly+89qml+bfAfzgRsb7pf5k6ElogulkxQ4stQu2b1NqAsY+FlbLVRYdEo
   D/m0drdv5ouOcd+V+6KQZfhyLV9FCmdR7/u7BflopHDs+JEcvANIlfnz8
   uwkCSffcUSJrchZVqMmAz6u/uiDn0BwffkwunegBdBunmeGCXKkyGXYL0
   0v89TguPh46K1jsMmv8GjnTWkYBz2FbaSxuzgQmVka+5ZM5r+stis70+2
   w==;
X-CSE-ConnectionGUID: QApHAMBGQEelbyg75uHANQ==
X-CSE-MsgGUID: nTCBRxvQRbKyIibMxOn2Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46829486"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46829486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 16:26:17 -0700
X-CSE-ConnectionGUID: DWZk4aB3R8KJ9euY9izlgQ==
X-CSE-MsgGUID: nCdSsROvSIWUydaGwNRc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="135932727"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Apr 2025 16:26:15 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u70Wj-0000SN-1L;
	Mon, 21 Apr 2025 23:26:13 +0000
Date: Tue, 22 Apr 2025 07:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jijie Shao <shaojijie@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 1/2] net: selftest: add
 net_selftest_custom() interface
Message-ID: <202504220756.HQDY7mTU-lkp@intel.com>
References: <20250421134358.1241851-2-shaojijie@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421134358.1241851-2-shaojijie@huawei.com>

Hi Jijie,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jijie-Shao/net-selftest-add-net_selftest_custom-interface/20250421-215737
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250421134358.1241851-2-shaojijie%40huawei.com
patch subject: [PATCH RFC net-next 1/2] net: selftest: add net_selftest_custom() interface
config: powerpc-randconfig-003-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220756.HQDY7mTU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220756.HQDY7mTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220756.HQDY7mTU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/fec_main.c:42:
>> include/net/selftests.h:77:6: warning: no previous prototype for function 'net_selftest_custom' [-Wmissing-prototypes]
   void net_selftest_custom(struct net_device *ndev, struct net_test *test,
        ^
   include/net/selftests.h:77:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void net_selftest_custom(struct net_device *ndev, struct net_test *test,
   ^
   static 
>> include/net/selftests.h:82:5: warning: no previous prototype for function 'net_selftest_get_count_custom' [-Wmissing-prototypes]
   int net_selftest_get_count_custom(struct net_test *test)
       ^
   include/net/selftests.h:82:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int net_selftest_get_count_custom(struct net_test *test)
   ^
   static 
>> include/net/selftests.h:87:6: warning: no previous prototype for function 'net_selftest_get_strings_custom' [-Wmissing-prototypes]
   void net_selftest_get_strings_custom(struct net_test *test, u8 *data)
        ^
   include/net/selftests.h:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void net_selftest_get_strings_custom(struct net_test *test, u8 *data)
   ^
   static 
   3 warnings generated.


vim +/net_selftest_custom +77 include/net/selftests.h

    76	
  > 77	void net_selftest_custom(struct net_device *ndev, struct net_test *test,
    78				 struct ethtool_test *etest, u64 *buf)
    79	{
    80	}
    81	
  > 82	int net_selftest_get_count_custom(struct net_test *test)
    83	{
    84		return 0;
    85	}
    86	
  > 87	void net_selftest_get_strings_custom(struct net_test *test, u8 *data)
    88	{
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
