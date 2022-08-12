Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B62F28
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660343100; x=1691879100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VEgVRf6TYWdVH0mP7ghEBCpBCyfAj9357kruzs7PA0Q=;
  b=cj9Kcfo0GPqjsiNwVVxGgMycl1xMaeYoGxwiYEPvJyOBF72Gb347960F
   7Ft1U7vG6byLnsc89kGYnyJLmbjaR5QlpTOZpTLOPUS3O4r5CRzFtflE1
   nkOgWvYZxHHM1UQDXm3TBrDTk/XfFtLYLTckh6PIxPQhEQace3KCSlD8Y
   0bPu7caItB4qFEYEOgDnEDTgyMfJl+AnGez6iCrGpHl9FiBLGHSQ7+FCu
   TdGT7PLLp/z+IixD7zVIegEsqrGtwjBMyUkchsHZY639DV0LSX8k0R7/H
   /GHF5Xm+N7sTHiD1yHmfrfDADayslVg07AOOVjYQ895r03Hm0l5G/bijl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="274754710"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="274754710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 15:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="851709994"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2022 15:24:58 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMd5O-00010f-0E;
	Fri, 12 Aug 2022 22:24:58 +0000
Date: Sat, 13 Aug 2022 06:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/4] cxl: CXL Performance Monitoring Unit driver
Message-ID: <202208130612.shIDJG3a-lkp@intel.com>
References: <20220812151214.2025-4-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812151214.2025-4-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on next-20220812]
[cannot apply to arm-perf/for-next/perf v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/CXL-3-0-Performance-Monitoring-Unit-support/20220812-231616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 7ebfc85e2cd7b08f518b526173e9a33b56b3913b
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220813/202208130612.shIDJG3a-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4776483ba3a4979cc318906623d23fc1e02148a7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/CXL-3-0-Performance-Monitoring-Unit-support/20220812-231616
        git checkout 4776483ba3a4979cc318906623d23fc1e02148a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/cpmu.c:168:12: warning: address of array 'info->conf_counter_bm' will always evaluate to 'true' [-Wpointer-bool-conversion]
           if (info->conf_counter_bm) {
           ~~  ~~~~~~^~~~~~~~~~~~~~~
   1 warning generated.


vim +168 drivers/cxl/cpmu.c

    91	
    92	/*
    93	 * All CPMU counters are discoverable via the Event Capabilities Registers.
    94	 * Each Event Capability register contains a a VID / GroupID.
    95	 * A counter may then count any combination (by summing) of events in
    96	 * that group which are in the Supported Events Bitmask.
    97	 * However, there are some complexities to the scheme.
    98	 *  - Fixed function counters refer to an Event Capabilities register.
    99	 *    That event capability register is not then used for Configurable
   100	 *    counters.
   101	 * TODO: Support summed events.
   102	 */
   103	static int cpmu_parse_caps(struct device *dev, struct cpmu_info *info)
   104	{
   105		DECLARE_BITMAP(fixed_counter_event_cap_bm, 32) = {0};
   106		void __iomem *base = info->base;
   107		u64 val, eval;
   108		int i;
   109	
   110		val = readq(base + CPMU_CAP_REG);
   111		info->freeze_for_enable = FIELD_GET(CPMU_CAP_WRITEABLE_WHEN_FROZEN, val) &
   112			FIELD_GET(CPMU_CAP_FREEZE, val);
   113		if (!info->freeze_for_enable) {
   114			dev_err(dev, "Driver does not support CPMUs that do not support freeze for enable\n");
   115			return -ENODEV;
   116		}
   117	
   118		info->num_counters = FIELD_GET(CPMU_CAP_NUM_COUNTERS_MSK, val) + 1;
   119		info->counter_width = FIELD_GET(CPMU_CAP_COUNTER_WIDTH_MSK, val);
   120		info->num_event_capabilities = FIELD_GET(CPMU_CAP_NUM_EVN_CAP_REG_SUP_MSK, val) + 1;
   121	
   122		info->filter_hdm = FIELD_GET(CPMU_CAP_FILTERS_SUP_MSK, val);
   123		if (FIELD_GET(CPMU_CAP_INT, val))
   124			info->irq = FIELD_GET(CPMU_CAP_MSI_N_MSK, val);
   125		else
   126			info->irq = -1;
   127	
   128		/* First handle fixed function counters; note if configurable counters found */
   129		for (i = 0; i < info->num_counters; i++) {
   130			struct cpmu_event *cpmu_ev;
   131			u32 events_msk;
   132			u8 group_idx;
   133	
   134			val = readq(base + CPMU_COUNTER_CFG_REG(i));
   135	
   136			if (FIELD_GET(CPMU_COUNTER_CFG_TYPE_MSK, val) ==
   137				CPMU_COUNTER_CFG_TYPE_CONFIGURABLE) {
   138				set_bit(i, info->conf_counter_bm);
   139			}
   140	
   141			if (FIELD_GET(CPMU_COUNTER_CFG_TYPE_MSK, val) !=
   142			    CPMU_COUNTER_CFG_TYPE_FIXED_FUN)
   143				continue;
   144	
   145			/* In this case we know which fields are const */
   146			group_idx = FIELD_GET(CPMU_COUNTER_CFG_EVENT_GRP_ID_IDX_MSK, val);
   147			events_msk = FIELD_GET(CPMU_COUNTER_CFG_EVENTS_MSK, val);
   148			eval = readq(base + CPMU_EVENT_CAP_REG(group_idx));
   149			cpmu_ev = devm_kzalloc(dev, sizeof(*cpmu_ev), GFP_KERNEL);
   150			if (!cpmu_ev)
   151				return -ENOMEM;
   152	
   153			cpmu_ev->vid = FIELD_GET(CPMU_EVENT_CAP_VENDOR_ID_MSK, eval);
   154			cpmu_ev->gid = FIELD_GET(CPMU_EVENT_CAP_GROUP_ID_MSK, eval);
   155			/* For a fixed purpose counter use the events mask from the counter CFG */
   156			cpmu_ev->msk = events_msk;
   157			cpmu_ev->configurable = false;
   158			cpmu_ev->counter_idx = i;
   159			/* This list add is never unwound as all entries deleted on remove */
   160			list_add(&cpmu_ev->node, &info->cpmu_events);
   161			/*
   162			 * Configurable counters must not use an Event Capability registers that
   163			 * is in use for a Fixed counter
   164			 */
   165			set_bit(group_idx, fixed_counter_event_cap_bm);
   166		}
   167	
 > 168		if (info->conf_counter_bm) {
   169			struct cpmu_event *cpmu_ev;
   170			int j;
   171			/* Walk event capabilities unused by fixed counters */
   172			for_each_clear_bit(j, fixed_counter_event_cap_bm,
   173					   info->num_event_capabilities) {
   174				cpmu_ev = devm_kzalloc(dev, sizeof(*cpmu_ev), GFP_KERNEL);
   175				if (!cpmu_ev)
   176					return -ENOMEM;
   177	
   178				eval = readq(base + CPMU_EVENT_CAP_REG(j));
   179				cpmu_ev->vid = FIELD_GET(CPMU_EVENT_CAP_VENDOR_ID_MSK, eval);
   180				cpmu_ev->gid = FIELD_GET(CPMU_EVENT_CAP_GROUP_ID_MSK, eval);
   181				cpmu_ev->msk = FIELD_GET(CPMU_EVENT_CAP_SUPPORTED_EVENTS_MSK, eval);
   182				cpmu_ev->event_idx = j;
   183				cpmu_ev->configurable = true;
   184				list_add(&cpmu_ev->node, &info->cpmu_events);
   185			}
   186		}
   187	
   188		return 0;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
