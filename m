Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820D2F25
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663928267; x=1695464267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ipDrwNgUDibBh5zQCYcr0zyyoV8e4oef6/UcKgvoNQY=;
  b=b255lDWUoJEox0VI2KjowHI50TxT6N9NwSZMEV4hj2xnbzxX4BdPKdJM
   ChfCgpYNxv0xLqKSj8slzJrXqKvprtd/Fb5n8F0+Jw4f92Ll6BLVmYPan
   Kcfa9z+G5C/pnkShcb1X3b++lkMIZHC937e905Rr3mgnx4f7vBiY60M1r
   235iW6FtOynwjo2yJqgBeGN11vDA/EU1zwBY3IWxjneUhVXAgSOKDvK3a
   OS185dARX9M5RWiV/3t6A1+IPP0jvP2bWjArpMnUgW3HnT1L0XLHyODYw
   EcsiI5loyQSw9He3zz3ayS5+YHCcnrkEtijDsWXEZ11Lv5zwyH83IqfF7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386852587"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="386852587"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="622474932"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2022 03:17:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obfke-0005ZI-2T;
	Fri, 23 Sep 2022 10:17:44 +0000
Date: Fri, 23 Sep 2022 18:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] perf: Add xilinx APM support
Message-ID: <202209231814.4mjOQqqi-lkp@intel.com>
References: <20220921080623.22077-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921080623.22077-3-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on soc/for-next]
[also build test WARNING on robh/for-next linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/Add-Add-Xilinx-APM-support/20220921-160807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: hexagon-randconfig-r003-20220922 (https://download.01.org/0day-ci/archive/20220923/202209231814.4mjOQqqi-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d83b0b48e141c96db63f78607b065810e9b39988
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shubhrajyoti-Datta/Add-Add-Xilinx-APM-support/20220921-160807
        git checkout d83b0b48e141c96db63f78607b065810e9b39988
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/perf/xilinx_apm.c:185:54: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ptr += sprintf(ptr, "event=0x%02x\n", (unsigned int)get_event(config));
                                                               ^
   drivers/perf/xilinx_apm.c:37:28: note: expanded from macro 'get_event'
   #define get_event(_config)      FIELD_GET(XAPM_EVENT_MASK, _config)
                                   ^
   drivers/perf/xilinx_apm.c:262:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           hwc->event_base = get_evtype(event->attr.config);
                             ^
   drivers/perf/xilinx_apm.c:38:29: note: expanded from macro 'get_evtype'
   #define get_evtype(_config)     FIELD_GET(XAPM_EVTYPE_MASK, _config)
                                   ^
>> drivers/perf/xilinx_apm.c:443:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                 res->start);
                                 ^~~~~~~~~~
   1 warning and 2 errors generated.


vim +443 drivers/perf/xilinx_apm.c

   336	
   337	static int xapm_perf_probe(struct platform_device *pdev)
   338	{
   339		static struct attribute_group xapm_perf_events_group;
   340		static struct attribute *xapm_perf_events_attrs[17];
   341		struct xapm_perf_priv *priv;
   342		void __iomem *baseaddr;
   343		struct resource *res;
   344		u32 numcounters;
   345		struct pmu *pmu;
   346		u32 mode = 0;
   347		char *name;
   348		int ret, i;
   349		static const struct attribute_group *xapm_perf_groups[] = {
   350			&xapm_perf_format_group,
   351			&xapm_perf_cpumask_group,
   352			&xapm_perf_events_group,
   353			NULL,
   354		};
   355	
   356		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   357		if (!priv)
   358			return -ENOMEM;
   359	
   360		platform_set_drvdata(pdev, priv);
   361		baseaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   362		if (IS_ERR(baseaddr))
   363			return PTR_ERR(baseaddr);
   364	
   365		priv->dev = &pdev->dev;
   366		priv->ioaddr = baseaddr;
   367	
   368		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,num-of-counters",
   369					   &numcounters);
   370		if (ret < 0) {
   371			dev_err(&pdev->dev, "no property xlnx,num-of-counters");
   372			return ret;
   373		}
   374	
   375		priv->clk = devm_clk_get(&pdev->dev, NULL);
   376		if (IS_ERR(priv->clk)) {
   377			if (PTR_ERR(priv->clk) != -EPROBE_DEFER)
   378				dev_err(&pdev->dev, "axi clock error\n");
   379			return PTR_ERR(priv->clk);
   380		}
   381	
   382		priv->cpu = raw_smp_processor_id();
   383	
   384		ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
   385					      "perf/xapm/xapm:online",
   386					      NULL, xapm_perf_offline_cpu);
   387		if (ret < 0)
   388			return ret;
   389	
   390		priv->cpuhp_state = ret;
   391		priv->mode = XAPM_MODE_ADVANCED;
   392	
   393		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,enable-profile", &mode);
   394		if (ret < 0)
   395			dev_info(&pdev->dev, "no property xlnx,enable-profile\n");
   396		else if (mode)
   397			priv->mode = XAPM_MODE_PROFILE;
   398	
   399		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,enable-trace", &mode);
   400		if (ret < 0)
   401			dev_info(&pdev->dev, "no property xlnx,enable-trace\n");
   402		else if (mode)
   403			priv->mode = XAPM_MODE_TRACE;
   404	
   405		ret = clk_prepare_enable(priv->clk);
   406		if (ret) {
   407			dev_err(&pdev->dev, "Unable to enable clock.\n");
   408			goto cpuhp_instance_err;
   409		}
   410		/* Register the pmu instance for cpu hotplug */
   411		ret = cpuhp_state_add_instance_nocalls(priv->cpuhp_state, &priv->node);
   412		if (ret)
   413			goto cpuhp_instance_err;
   414	
   415		for (i = 0; i < numcounters * 2; i++)
   416			xapm_perf_events_attrs[i] = xapm_perf_events_attrs_all[i];
   417		xapm_perf_events_attrs[i] = NULL;
   418	
   419		xapm_perf_events_group.name = "events";
   420		xapm_perf_events_group.attrs = xapm_perf_events_attrs;
   421	
   422		pmu = &priv->pmu;
   423	
   424		pmu->task_ctx_nr =	perf_invalid_context;
   425		pmu->attr_groups =	xapm_perf_groups;
   426		pmu->event_init =	xapm_perf_event_init;
   427		pmu->add =		xapm_perf_event_add;
   428		pmu->del =		xapm_perf_event_del;
   429		pmu->start =		xapm_perf_event_start;
   430		pmu->stop =		xapm_perf_event_stop;
   431		pmu->read =		xapm_perf_event_read;
   432		pmu->capabilities =	PERF_PMU_CAP_NO_INTERRUPT |
   433					PERF_PMU_CAP_NO_EXCLUDE;
   434	
   435		ret = of_property_read_u32(pdev->dev.of_node, "xlnx,num-monitor-slots",
   436					   &priv->maxslots);
   437		if (ret < 0) {
   438			dev_err(&pdev->dev, "no property xlnx,num-monitor-slots");
   439			return ret;
   440		}
   441	
   442		name = devm_kasprintf(priv->dev, GFP_KERNEL, "xapm%llx_counter",
 > 443				      res->start);
   444		ret = perf_pmu_register(pmu, name, -1);
   445		if (ret)
   446			goto pmu_register_err;
   447	
   448		pm_runtime_get_noresume(&pdev->dev);
   449		pm_runtime_set_active(&pdev->dev);
   450		pm_runtime_enable(&pdev->dev);
   451	
   452		return 0;
   453	pmu_register_err:
   454		cpuhp_state_remove_instance_nocalls(priv->cpuhp_state, &priv->node);
   455	cpuhp_instance_err:
   456		cpuhp_remove_multi_state(priv->cpuhp_state);
   457		return ret;
   458	}
   459	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
