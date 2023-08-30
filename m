Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BB1FB3;
	Wed, 30 Aug 2023 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693392649; x=1724928649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xZIAz4H04illlGVj1BWzvAHFTUBeqvwxJkL5gpigeyo=;
  b=XYaiHijfWQ+zzFo5MoNfl2WHD4QHJf7bCBg8QGTAJYsdM08Ix54eNswH
   JvaNMKyVCXTZfi6LLUb3YciLjoxTaDynkRQ446CvpjMJZtiKK6ZyYF7AN
   zEHLQKpAt1h7Bj4w9/S8Ue44QF0dU8vYPdUKl4I+0YXu1WedmSNhqAHOa
   pYRBYaxlHNLeEhCOr6m/ElhQErXDRrbXDAbuEUT7W9Fyacb5FUAJuCCOy
   83uKYmKb5dDnXxvw/1/QJYpACXRUnD6UIn3CGaX72DDGpDE0wVoOG5nzg
   HAjINfeP3QqtEJjee3lwY1LEACOvnuP0nUZMZ+A8fn6Q0FNDmqXYneYmI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375566731"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="375566731"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985700320"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="985700320"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 03:50:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbIma-0009k9-24;
	Wed, 30 Aug 2023 10:50:44 +0000
Date: Wed, 30 Aug 2023 18:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	zev@bewilderbeest.net,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] regulator: userspace-consumer: Retrieve supplies
 from DT
Message-ID: <202308301833.WqS6n2RU-lkp@intel.com>
References: <20230829141413.2605621-1-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829141413.2605621-1-Naresh.Solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8950c4a350c188deb5f5b05df3244d4db82fe3d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-userspace-consumer-Retrieve-supplies-from-DT/20230829-222520
base:   8950c4a350c188deb5f5b05df3244d4db82fe3d8
patch link:    https://lore.kernel.org/r/20230829141413.2605621-1-Naresh.Solanki%409elements.com
patch subject: [RESEND PATCH] regulator: userspace-consumer: Retrieve supplies from DT
config: i386-buildonly-randconfig-001-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301833.WqS6n2RU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301833.WqS6n2RU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301833.WqS6n2RU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/userspace-consumer.c:164:2: error: call to undeclared function 'for_each_property_of_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           for_each_property_of_node(pdev->dev.of_node, prop) {
           ^
>> drivers/regulator/userspace-consumer.c:164:52: error: expected ';' after expression
           for_each_property_of_node(pdev->dev.of_node, prop) {
                                                             ^
                                                             ;
   drivers/regulator/userspace-consumer.c:200:3: error: call to undeclared function 'for_each_property_of_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   for_each_property_of_node(pdev->dev.of_node, prop) {
                   ^
   drivers/regulator/userspace-consumer.c:200:53: error: expected ';' after expression
                   for_each_property_of_node(pdev->dev.of_node, prop) {
                                                                     ^
                                                                     ;
   4 errors generated.


vim +/for_each_property_of_node +164 drivers/regulator/userspace-consumer.c

   158	
   159	static int get_num_supplies(struct platform_device *pdev)
   160	{
   161		struct  property *prop;
   162		int num_supplies = 0;
   163	
 > 164		for_each_property_of_node(pdev->dev.of_node, prop) {
   165			const char *prop_name = prop->name;
   166			int len = strlen(prop_name);
   167	
   168			if (len > SUPPLY_SUFFIX_LEN && \
   169			    strcmp(prop_name + len - SUPPLY_SUFFIX_LEN, SUPPLY_SUFFIX) == 0) {
   170				num_supplies++;
   171			}
   172		}
   173		return num_supplies;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
