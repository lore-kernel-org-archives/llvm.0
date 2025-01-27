Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B663481A3;
	Mon, 27 Jan 2025 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737976555; cv=none; b=lik2yZLqQnB5bVVotuUkHZ1xyuAi7McTIQJHgkTXnhwUyxrRE9Y5qyyKTHB/YTEJ5IhAvMlSycb3U++0cGjvrcQxbf7OrkaoqX2DIJ63cWaglaFpS8blZ/7EGi2f88YFNm/4UVRmnWyD8VKI4+2aFXK8J51PkPBHiLG7reAVCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737976555; c=relaxed/simple;
	bh=dnt5G5cTLN6et5WLfWpNYAoPzrYL0gIYizEfFHiPTp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFQXB+SnJTB8S7yr/KioIimO02pcBo2pjzKpQrdyfHoVmMqcOYxoA0KOVF5hu0hZuDrttAzQ+3MYwHHPi4ikLAxKydKiZEoQRT9aCHF03Tez/2I5/vHHqEdtOkT+2OWJt9E0GS0SnDrOPttfyS3Scfe7xYzpA3kpFXC5emyjJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI3rP9Cy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI3rP9Cy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737976554; x=1769512554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnt5G5cTLN6et5WLfWpNYAoPzrYL0gIYizEfFHiPTp8=;
  b=nI3rP9CyBDGAXlf/k1fb40zb5PSbsS44hb9X85RPDHCdZscJ0gRBfgTg
   /RqnZK0jK4phktVuSUlzKACx0Vc9hByFRe0JV/GTgqY5iG4k6565mvjGO
   NG2zXXb+JhKhjvsHtR05h4VUNcM5B5ZsLqwjVYgf50T6vEtKO7LGdXZOe
   vGWQzkTWHH+VcoOONVfed4nu35SDR05efFOEulyAfjOqeECt7e21wW6xZ
   OET+n8pJvcscOY3IG/AMF8eUD9/Eg9/UdsprcTzMFgUj/mdIgAjpcEG1y
   RVuNcI4UZ1JBiA2OX5h3sUEYRgT60dAKyM1UIJz5xLLg0+qa+yu5Gli2/
   w==;
X-CSE-ConnectionGUID: S0RakxMJSm20LVLhE+PW+w==
X-CSE-MsgGUID: tP5T4sqtS0y/sP+hzZ9qBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38602133"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38602133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 03:15:54 -0800
X-CSE-ConnectionGUID: B0HQc5HGTz2NrWoQIe/KsQ==
X-CSE-MsgGUID: 3xAqkLeoS1G65HTBgIXvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="139283529"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2025 03:15:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcN5o-000ghP-2g;
	Mon, 27 Jan 2025 11:15:48 +0000
Date: Mon, 27 Jan 2025 19:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Basharath Hussain Khaja <basharath@couthit.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v2] of: address: Add kunit test for
 __of_address_resource_bounds()
Message-ID: <202501271803.wd0vg8zR-lkp@intel.com>
References: <20250127-of-address-overflow-v2-1-61b5046044e9@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-of-address-overflow-v2-1-61b5046044e9@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 15e2f65f2ecfeb8e39315522e2b5cfdc5651fc10]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/of-address-Add-kunit-test-for-__of_address_resource_bounds/20250127-165902
base:   15e2f65f2ecfeb8e39315522e2b5cfdc5651fc10
patch link:    https://lore.kernel.org/r/20250127-of-address-overflow-v2-1-61b5046044e9%40linutronix.de
patch subject: [PATCH v2] of: address: Add kunit test for __of_address_resource_bounds()
config: hexagon-randconfig-001-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271803.wd0vg8zR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271803.wd0vg8zR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271803.wd0vg8zR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/of/of_test.c:140:42: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 4294971390 to 4094 [-Wconstant-conversion]
     135 |         {
         |         ~
     136 |                 .start = 0x1000,
     137 |                 .size = 0xffffffff,
     138 |                 .ret = resource_size_32bit() ? -EOVERFLOW : 0,
     139 |                 .res_start = 0x1000,
     140 |                 .res_end = resource_size_32bit() ? 0 : 0x100000ffe,
         |                                                        ^~~~~~~~~~~
   drivers/of/of_test.c:133:42: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
     128 |         {
         |         ~
     129 |                 .start = 0x100000000ULL,
     130 |                 .size = 1,
     131 |                 .ret = resource_size_32bit() ? -EOVERFLOW : 0,
     132 |                 .res_start = resource_size_32bit() ? 0 : 0x100000000,
     133 |                 .res_end = resource_size_32bit() ? 0 : 0x100000000,
         |                                                        ^~~~~~~~~~~
   drivers/of/of_test.c:132:44: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 4294967296 to 0 [-Wconstant-conversion]
     128 |         {
         |         ~
     129 |                 .start = 0x100000000ULL,
     130 |                 .size = 1,
     131 |                 .ret = resource_size_32bit() ? -EOVERFLOW : 0,
     132 |                 .res_start = resource_size_32bit() ? 0 : 0x100000000,
         |                                                          ^~~~~~~~~~~
   3 warnings generated.


vim +140 drivers/of/of_test.c

    74	
    75	static const struct of_address_resource_bounds_case of_address_resource_bounds_cases[] = {
    76		{
    77			.start = 0,
    78			.size = 0,
    79			.ret = 0,
    80			.res_start = 0,
    81			.res_end = -1,
    82		},
    83		{
    84			.start = 0,
    85			.size = 0x1000,
    86			.ret = 0,
    87			.res_start = 0,
    88			.res_end = 0xfff,
    89		},
    90		{
    91			.start = 0x1000,
    92			.size = 0,
    93			.ret = 0,
    94			.res_start = 0x1000,
    95			.res_end = 0xfff,
    96		},
    97		{
    98			.start = 0x1000,
    99			.size = 0x1000,
   100			.ret = 0,
   101			.res_start = 0x1000,
   102			.res_end = 0x1fff,
   103		},
   104		{
   105			.start = 1,
   106			.size = RESOURCE_SIZE_MAX,
   107			.ret = 0,
   108			.res_start = 1,
   109			.res_end = RESOURCE_SIZE_MAX,
   110		},
   111		{
   112			.start = RESOURCE_SIZE_MAX,
   113			.size = 1,
   114			.ret = 0,
   115			.res_start = RESOURCE_SIZE_MAX,
   116			.res_end = RESOURCE_SIZE_MAX,
   117		},
   118		{
   119			.start = 2,
   120			.size = RESOURCE_SIZE_MAX,
   121			.ret = -EOVERFLOW,
   122		},
   123		{
   124			.start = RESOURCE_SIZE_MAX,
   125			.size = 2,
   126			.ret = -EOVERFLOW,
   127		},
   128		{
   129			.start = 0x100000000ULL,
   130			.size = 1,
   131			.ret = resource_size_32bit() ? -EOVERFLOW : 0,
   132			.res_start = resource_size_32bit() ? 0 : 0x100000000,
   133			.res_end = resource_size_32bit() ? 0 : 0x100000000,
   134		},
   135		{
   136			.start = 0x1000,
   137			.size = 0xffffffff,
   138			.ret = resource_size_32bit() ? -EOVERFLOW : 0,
   139			.res_start = 0x1000,
 > 140			.res_end = resource_size_32bit() ? 0 : 0x100000ffe,
   141		},
   142	};
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
