Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033696ABC;
	Fri,  1 Sep 2023 08:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693555955; x=1725091955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJ39tTp+W0OBBT/IzTeRIk/6zYS/Rax4UcI4jk27fqY=;
  b=SgBh+8+P2AC8wLvmxQ1SDlH4SDXE5EeJVlSpCZIwnKY/wsJbpjmvdNzc
   KHjhXfHnu+aHvASIpSOfJtaZC999PnXETMi9TyQ0OG+IdNkpZmN1O0jZ4
   OWGUL0WQPK2sFbkh49Q2zIfkoJwxhJoatSiUShxNXCQgR0JMiPOcl6AOj
   EDNZZMLu/xntQNVNqdhy439fq3HtKWlLZ2uUMBGqyYxKLm2fi+a5RvVEB
   gYaETabLUoR6zgVCegFrG63+sPndBXlRoMP8G8daoFSFVgkgA40FlHtd2
   6HwC4f9XSs7a3fR6NC1ZkcNovi5sWrsZSZVcjhregkle+Yl0Ju1KkGvqZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="375068235"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="375068235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 01:12:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883102204"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883102204"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 01:12:34 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbzGX-00015r-0X;
	Fri, 01 Sep 2023 08:12:29 +0000
Date: Fri, 1 Sep 2023 16:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	zev@bewilderbeest.net,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] regulator (max5970): Add hwmon support
Message-ID: <202309011524.JIWSmpfT-lkp@intel.com>
References: <20230830111319.3882281-1-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830111319.3882281-1-Naresh.Solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 35d0d2350d774fecf596cfb2fb050559fe5e1850]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-max5970-Add-hwmon-support/20230831-035843
base:   35d0d2350d774fecf596cfb2fb050559fe5e1850
patch link:    https://lore.kernel.org/r/20230830111319.3882281-1-Naresh.Solanki%409elements.com
patch subject: [PATCH] regulator (max5970): Add hwmon support
config: x86_64-buildonly-randconfig-001-20230901 (https://download.01.org/0day-ci/archive/20230901/202309011524.JIWSmpfT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011524.JIWSmpfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011524.JIWSmpfT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_hwmon_device_register_with_info
   >>> referenced by max5970-regulator.c
   >>>               drivers/regulator/max5970-regulator.o:(max597x_regulator_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
