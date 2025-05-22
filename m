Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B97645;
	Thu, 22 May 2025 02:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881588; cv=none; b=bBCARYJb6GfFMXDY2aRqQz9+l6w6s71z/38CrktclqKY0olmQnQ+UqaHYBRfZrJPFLkUPC2+oqGjXebvNcewkHy4wGOsTq9oYW3Unr79sVuce5eoDrt544SqX0eu7kn5sNAWxr5NQFMNpGtKYVpIF8BZcS8sW896M2lJQbhkeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881588; c=relaxed/simple;
	bh=JDFFsvt9e6h/hlxDJiEzWmlnk5PQr9VO8B4f/vfHl9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atmCO8nQAiO0S4Xa+PWdqDTNNwWtuaqQFU+di+hrwwr/ndF0xpIwAMKt0agf55e2NhxkiEH4xrAzkSP9+H4H61rqCRsfLhJnbJcU0ROZg6fXgDXG7xmFJHQCTGL/VtgAxkRZtBQPn3E+FEBx7MLhB920+nx+FqcBp82VCgIuQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETGide7K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETGide7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747881587; x=1779417587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JDFFsvt9e6h/hlxDJiEzWmlnk5PQr9VO8B4f/vfHl9w=;
  b=ETGide7KX3pDTv3x4m9d+lUUh+2Khw9+d71VaFYlLYjio3Tlvbitju3n
   nMRznqzszZtvLaVr7BJU4FicwAnJpvr44tpglKV4gi707AJvsZS1Br02a
   9q+XQeI0nZfjfTkScdIvheLREqVCxpxdRpmcWMhKi0PvvKMAeqIJKv/ri
   jtnhkvpKq5hDkL3/2QC8h86qY55sDO12gaMfnKBQX1unPNFlgKxdl+y5G
   mWKK41QJpKcn1PDG/N+NjxVHMSFcm2j/nD8/jr2Kw0gl2L4Md0ypNALKq
   tIUMeLa8fuZF1p2ZDQNVNlU0axip2j4NjAGPWVZJHPaQMRnVhfGoOfWAn
   g==;
X-CSE-ConnectionGUID: PjjTVvuxT8q1UzU65O6f2w==
X-CSE-MsgGUID: hBB8vRQfSFmwi1PcdUtlOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53685020"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53685020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 19:39:45 -0700
X-CSE-ConnectionGUID: klC7IUIBTzuXOR3pMhdSGA==
X-CSE-MsgGUID: luZE50UTT2CVCdG0LG4C7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="163633869"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 May 2025 19:39:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHvqP-000Oqq-1R;
	Thu, 22 May 2025 02:39:41 +0000
Date: Thu, 22 May 2025 10:39:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jelle van der Waa <jvanderwaa@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 109/109]
 drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator
 'charge_types' does not refer to any field in type 'const struct
 power_supply_ext'
Message-ID: <202505221051.khDhUKJ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   b2012b38080e2f92d43eca59e8249c174a27527c
commit: b2012b38080e2f92d43eca59e8249c174a27527c [109/109] platform/x86: ideapad: Expose charge_types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221051.khDhUKJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221051.khDhUKJ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/ideapad-laptop.c:2044:3: error: field designator 'charge_types' does not refer to any field in type 'const struct power_supply_ext'
    2044 |         .charge_types           = (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2045 |                                    BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2044 drivers/platform/x86/ideapad-laptop.c

  2039	
  2040	static const struct power_supply_ext ideapad_battery_ext = {
  2041		.name			= "ideapad_laptop",
  2042		.properties		= ideapad_power_supply_props,
  2043		.num_properties		= ARRAY_SIZE(ideapad_power_supply_props),
> 2044		.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
  2045					   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
  2046		.get_property		= ideapad_psy_ext_get_prop,
  2047		.set_property		= ideapad_psy_ext_set_prop,
  2048		.property_is_writeable	= ideapad_psy_prop_is_writeable,
  2049	};
  2050	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
