Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4E153824;
	Fri, 13 Sep 2024 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726262613; cv=none; b=Sw+ZzBC/axgUmEDUTbQLGQ4Cl54eTo02Xnuyt1xGyxobAqMRxUmWlki9gR+wWYs9fA3gFoDMnOo+4ELyeLeGOXw8HhxkUFcBWbZYNB5Wl3q3MrTSiQA5/HbLvJ5agtmoopqQHg+n4sbEX4WakMOad8KFccVhNhYc/jMUsfb0Mq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726262613; c=relaxed/simple;
	bh=kgN2i7NsfUPKHMks6Mw32UbeU2Yvq5ArmNtuqvuaYM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVJoj9h8p54ohZruevQHngght1GQ5lHP5l2IS8RCZh4c2Ce3xKZICeDyOdeutiFU6QaBZ2HL4iX41zWV18qDAxMdA2MOWELdkSoMom7OQli3OronUvoMdg8VNg92IH+A+C1Z5ZXEOZTFKcqGoHYsIzzCVyGV7aNpuZAwr/OUcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSYw/Rwg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSYw/Rwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726262611; x=1757798611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kgN2i7NsfUPKHMks6Mw32UbeU2Yvq5ArmNtuqvuaYM8=;
  b=bSYw/Rwg0VaJhGsSTTg+ItfHcaRJfGASokiF5TRGnaYbnZf1B3x2EmLv
   fNkp7bFMTtNigy8nXY+VPSHX3ate8O1Xauc1daX4PNl9bx7VblE9eUbij
   g8MT3Qx1balIA7Y1anaakJ5SD3HaKaWlTyfV3TAaBH8lApHzQ9OwpZlrS
   Jj7985uZi84MgAjhvQfgCnBf549UJT28oB9nLQxEsa/P3j7D8sjXpiOzx
   hfTTaSTRzXchgtA34Y2D0GfVuXpDInG30QAnCguY4oDB7y22dFa53vdVz
   5g6OHg1XP9BwY+VvGVh46xxY7TOM83p66IJs1JDzz7FusRoK9SJyxLlHi
   A==;
X-CSE-ConnectionGUID: hfIRGm5rQH61eNr8EjOnaA==
X-CSE-MsgGUID: KPbuWt/sRbyFik2aiRBkrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25062600"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25062600"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:23:29 -0700
X-CSE-ConnectionGUID: wcD6Tg/0SbWtW7sX5NwBfg==
X-CSE-MsgGUID: Ehnn7tAjQTqDu8DphUsfGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68520817"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 14:23:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spDlE-000728-13;
	Fri, 13 Sep 2024 21:23:24 +0000
Date: Sat, 14 Sep 2024 05:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandru Ardelean <aardelean@baylibre.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jic23@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, lars@metafoo.de,
	michael.hennerich@analog.com, gstols@baylibre.com,
	dlechner@baylibre.com, Alexandru Ardelean <aardelean@baylibre.com>
Subject: Re: [PATCH v6 8/8] iio: adc: ad7606: add support for AD7606C-{16,18}
 parts
Message-ID: <202409140543.VXctRtFP-lkp@intel.com>
References: <20240913135744.152669-9-aardelean@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913135744.152669-9-aardelean@baylibre.com>

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on next-20240913]
[cannot apply to linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Ardelean/iio-adc-ad7606-add-bits-parameter-to-channels-macros/20240913-220501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240913135744.152669-9-aardelean%40baylibre.com
patch subject: [PATCH v6 8/8] iio: adc: ad7606: add support for AD7606C-{16,18} parts
config: i386-buildonly-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140543.VXctRtFP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140543.VXctRtFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140543.VXctRtFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7606.c:39:27: warning: unused variable 'ad7606_18bit_hw_scale_avail' [-Wunused-const-variable]
      39 | static const unsigned int ad7606_18bit_hw_scale_avail[2] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/ad7606_18bit_hw_scale_avail +39 drivers/iio/adc/ad7606.c

    38	
  > 39	static const unsigned int ad7606_18bit_hw_scale_avail[2] = {
    40		38147, 76294
    41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
