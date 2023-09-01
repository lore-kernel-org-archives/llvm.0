Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E4C136;
	Fri,  1 Sep 2023 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693602299; x=1725138299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1WIVQ4Z7LQCKejOg7pncS5p83NHp79nepmutiHbIxUc=;
  b=Omyqo380Wv4jvi5b3knzPKvzs05/qahD0G4kT0U091NScN7inOVaNsGn
   PrnWICk8lWsBQN3fA51lsWV23atwHCqoseS3Y1jDGa6xkA+HGxM3lGQE3
   UMejOu6B4zsmtdf90D7kiT1BysHJS/2elPl1wCrhogvwqkvb2PeNSz4A0
   /vunt138ASZbXSzEYZNBYQx14sbkin+RjayyJ5R1LsdZ5EKHMo9OKpTXU
   v8pdneon+62AnkUoBi38Z1XTXWYZQXpKKriibnVSp43bf0faYfiHhxv9g
   13gRrmG4A/MKVQGZOY4AJ6xOyW1ieHRWL9tyt2lTCoHJWwCRnyq140TgZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366538562"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="366538562"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 14:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="810205534"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="810205534"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2023 14:04:54 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcBK0-0001dv-1g;
	Fri, 01 Sep 2023 21:04:52 +0000
Date: Sat, 2 Sep 2023 05:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Naresh Solanki <naresh.solanki@9elements.com>, broonie@kernel.org,
	zev@bewilderbeest.net, Liam Girdwood <lgirdwood@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Naresh Solanki <Naresh.Solanki@9elements.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] regulator (max5970): Add hwmon support
Message-ID: <202309020434.x0wzOQpo-lkp@intel.com>
References: <20230901093449.838414-1-Naresh.Solanki@9elements.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901093449.838414-1-Naresh.Solanki@9elements.com>

Hi Naresh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 35d0d2350d774fecf596cfb2fb050559fe5e1850]

url:    https://github.com/intel-lab-lkp/linux/commits/Naresh-Solanki/regulator-max5970-Add-hwmon-support/20230901-173611
base:   35d0d2350d774fecf596cfb2fb050559fe5e1850
patch link:    https://lore.kernel.org/r/20230901093449.838414-1-Naresh.Solanki%409elements.com
patch subject: [PATCH v2] regulator (max5970): Add hwmon support
config: x86_64-randconfig-004-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020434.x0wzOQpo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020434.x0wzOQpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020434.x0wzOQpo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/max5970-regulator.c:124:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   default:
                   ^
   drivers/regulator/max5970-regulator.c:124:3: note: insert 'break;' to avoid fall-through
                   default:
                   ^
                   break; 
   1 warning generated.


vim +124 drivers/regulator/max5970-regulator.c

    99	
   100	static umode_t max5970_is_visible(const void *data,
   101					  enum hwmon_sensor_types type,
   102					  u32 attr, int channel)
   103	{
   104		struct max5970_data *ddata = (struct max5970_data *)data;
   105	
   106		if (channel >= ddata->num_switches)
   107			return 0;
   108	
   109		switch (type) {
   110		case hwmon_in:
   111			switch (attr) {
   112			case hwmon_in_input:
   113				return 0444;
   114			default:
   115				break;
   116			}
   117			break;
   118		case hwmon_curr:
   119			switch (attr) {
   120			case hwmon_curr_input:
   121				/* Current measurement requires knowledge of the shunt resistor value. */
   122				if (ddata->shunt_micro_ohms[channel])
   123					return 0444;
 > 124			default:
   125				break;
   126			}
   127			break;
   128		default:
   129			break;
   130		}
   131		return 0;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
