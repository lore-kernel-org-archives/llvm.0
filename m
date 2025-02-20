Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8180713DBB1;
	Thu, 20 Feb 2025 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071850; cv=none; b=NdEcohu97mCdl5N922n0575G8BQnfaI/0jZNE4JNlzh20a3JGbshRDilVayOf1yBJBWJh4soNmMjfcgjnH+0s1dhvXCLzwYsmCiRf/HLtjFRH7AiEDXgy+un2qOkn95tTMqahvlY43VogH0X+sjUcbkHPKOlMsVDh6KN31Cnw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071850; c=relaxed/simple;
	bh=7CGSKMHde5rIbG0LCV4dYgFBgSrYGZsf7bUx73BQ6NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBXkDXDxwgpM+zZruhhl6AfiZ+itzlc6LnQ+zeCsUKT0QJQz3Dg0OaEmgFCattV4+FHDJn3L81KsuU+dHxxIEMBEjX46liUi1usnObI+WQEsyFWmZSUQaOI+M+KbTkdiEyTQ9nVFSCuwmpq3qHnZg5rnEZkIQekaXnwjLHU8Btk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3zpVf0k; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3zpVf0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740071849; x=1771607849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7CGSKMHde5rIbG0LCV4dYgFBgSrYGZsf7bUx73BQ6NI=;
  b=J3zpVf0kJcsZZznA7P6ESfAlpPnLqM/DfePCYU6HJtJd87N1AN3XUOkj
   VyNIlM4VEstKCJ+4G8cR1dNdjX0NR287DmSDAmt6ZS4aodXCppTKIK8MQ
   tEBDbHfRM6LYbXz6R2IGIjuLd/4LGfgpDPpmHZhYiTbbFJTCkbYibSUS3
   VM32qn2jYW9kcHcg9boyiew4m0mTtf464sJI+zAdgx1GMOnU3j2H0EIGT
   ndI0FgLdBg+GY65SEJL5X6UkhNtDeW/mVT+qcr1CGMcjyPi0NfqxYusW5
   WAMid9UPSEfrwrqjm3XLDRnIIjZwtV834lbFFvzsfcBEIYsrVN3hM+rYZ
   Q==;
X-CSE-ConnectionGUID: H5edvSTRQImi5Z3sEgoTaw==
X-CSE-MsgGUID: FUtD1WhaQGq3SYGqNOPSmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66227617"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="66227617"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 09:17:26 -0800
X-CSE-ConnectionGUID: G3FJM02tRbOugVssdF5ZIg==
X-CSE-MsgGUID: niWiQBFIQH6uYj+yoBl1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116001418"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2025 09:17:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlAAr-0004Zj-2i;
	Thu, 20 Feb 2025 17:17:21 +0000
Date: Fri, 21 Feb 2025 01:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jun Yan <jerrysteve1101@gmail.com>, jic23@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH 1/2] iio: gyro: bmg160_spi: add of_match_table
Message-ID: <202502210125.5IaR1YAL-lkp@intel.com>
References: <20250219150254.24664-2-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219150254.24664-2-jerrysteve1101@gmail.com>

Hi Jun,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.14-rc3 next-20250220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jun-Yan/iio-gyro-bmg160_spi-add-of_match_table/20250219-231024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250219150254.24664-2-jerrysteve1101%40gmail.com
patch subject: [PATCH 1/2] iio: gyro: bmg160_spi: add of_match_table
config: i386-buildonly-randconfig-005-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210125.5IaR1YAL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210125.5IaR1YAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210125.5IaR1YAL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/gyro/bmg160_spi.c:57:3: error: member reference base type 'const struct of_device_id[4]' is not a structure or union
      56 |                 .of_match_table = bmg160_of_match
         |                                   ~~~~~~~~~~~~~~~
      57 |                 .pm     = &bmg160_pm_ops,
         |                 ^~~
   1 error generated.


vim +57 drivers/iio/gyro/bmg160_spi.c

c266686477490d Jun Yan                   2025-02-19  52  
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  53  static struct spi_driver bmg160_spi_driver = {
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  54  	.driver = {
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  55  		.name	= "bmg160_spi",
c266686477490d Jun Yan                   2025-02-19  56  		.of_match_table = bmg160_of_match
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19 @57  		.pm	= &bmg160_pm_ops,
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  58  	},
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  59  	.probe		= bmg160_spi_probe,
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  60  	.remove		= bmg160_spi_remove,
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  61  	.id_table	= bmg160_spi_id,
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  62  };
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  63  module_spi_driver(bmg160_spi_driver);
b1d125cc623639 Markus Schneider-Pargmann 2015-08-19  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
