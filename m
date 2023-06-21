Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426919BD9;
	Wed, 21 Jun 2023 23:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687390287; x=1718926287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uBOUudWppeW1M9M8zs0vuK3w/pADb38hFT5y16ZOGs=;
  b=hz3gaJwDQ6hPDS2971qXM3N6bm0wMEhPFnRSBZiHc+qfCMUnSPy18Tas
   oIi72pyNLWzHv2d4H/jb5iZsuW5CG55WwX3aTraf52fxm/QVDrJdYQ010
   Wf+zSlw0MsH29OcUoBHUEbRpuRWRzi1CLJTKzP7vkMMARaowwOl+gGkOg
   8XQaUUCYExnntr6gpcKaQCiDMqgV5fcOGN21XAh3sXd7yW2sbshyjj7o0
   NHHd15hu9mjZxK5awWlfRSLhvVJLmmILI035ol7pmBIdEZDNf+EKuFlor
   yAfeZg01nX6mec/Zu1t9neZvqVqVPDolxbXfAyduumbROAJueR2UbMyO0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360352024"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="360352024"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 16:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692034377"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; 
   d="scan'208";a="692034377"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2023 16:31:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC7IH-00079v-1e;
	Wed, 21 Jun 2023 23:31:21 +0000
Date: Thu, 22 Jun 2023 07:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 4/4] PM: domains: Add and set generic sync state
 callback
Message-ID: <202306220725.eCSNlXhi-lkp@intel.com>
References: <20230621144019.3219858-5-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621144019.3219858-5-abel.vesa@linaro.org>

Hi Abel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/driver-core-Add-dev_set_drv_sync_state/20230621-224109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230621144019.3219858-5-abel.vesa%40linaro.org
patch subject: [RFC PATCH v5 4/4] PM: domains: Add and set generic sync state callback
config: riscv-randconfig-r024-20230621 (https://download.01.org/0day-ci/archive/20230622/202306220725.eCSNlXhi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220725.eCSNlXhi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220725.eCSNlXhi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:664:6: warning: no previous prototype for function 'pm_genpd_power_off_unused_sync_state' [-Wmissing-prototypes]
     664 | void pm_genpd_power_off_unused_sync_state(struct device *dev)
         |      ^
   drivers/base/power/domain.c:664:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     664 | void pm_genpd_power_off_unused_sync_state(struct device *dev)
         | ^
         | static 
   1 warning generated.


vim +/pm_genpd_power_off_unused_sync_state +664 drivers/base/power/domain.c

   656	
   657	/**
   658	 * pm_genpd_power_off_unused_sync_state - Power off all domains for provider.
   659	 * @dev: Provider's device.
   660	 *
   661	 * Request power off for all unused domains of the provider.
   662	 * This should be used exclusively as sync state callback for genpd providers.
   663	 */
 > 664	void pm_genpd_power_off_unused_sync_state(struct device *dev)
   665	{
   666		struct generic_pm_domain *genpd;
   667	
   668		mutex_lock(&gpd_list_lock);
   669	
   670		list_for_each_entry(genpd, &gpd_list, gpd_list_node)
   671			if (genpd->provider && genpd->provider->dev == dev)
   672				genpd_queue_power_off_work(genpd);
   673	
   674		mutex_unlock(&gpd_list_lock);
   675	}
   676	EXPORT_SYMBOL_GPL(pm_genpd_power_off_unused_sync_state);
   677	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
