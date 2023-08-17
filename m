Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0614F63;
	Thu, 17 Aug 2023 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692282557; x=1723818557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lBMU/XUsR4rGK9ZuT0UNupNVIFbxMfBzxOvqwbK70Q=;
  b=mD+vY7ypTyquJrjmfDBab8JcVocBv5sw6X839ewXhgLEQyhBrj0MWxp/
   Baj3BWHGphuo7UWkLznwlMNBT7ENGRow4PgxQNysTGpHI0af1g00SvkL0
   a4MIka6hRaM8nO7TiEqAInH2qI1ao/0rPKqP772IvIHerCTYuNWc3MUUg
   SPJjLy178Fc2RratZRbYB/TqP79AxnLTi2hy1adV4AJ8OEjtbGD7LiJip
   APydAFwhdbRHMfs8JV9CxHsJ2o6r+IAcL7VvozzgVSc/jodbKBkuzXeAx
   2/FODd8t0ioM3guRucX5Ap1Qdqytnj4Xn/x8lKo/NW1m1MlS0mkDRd3Nn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439198968"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="439198968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 07:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711560479"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="711560479"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 07:14:15 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWdlO-0001Cl-1M;
	Thu, 17 Aug 2023 14:14:14 +0000
Date: Thu, 17 Aug 2023 22:11:15 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 17/25] drivers/base/power/domain.c:694:
 warning: Function parameter or member 'one_dev_probing' not described in
 'genpd_power_off'
Message-ID: <202308172244.FPrdz6b2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   945d969e62cc8f2d82da3e8b99f0a5409c8f7873
commit: 67c74b949b17855dd56b5ac5e959d5894d2e1bb1 [17/25] PM: domains: Add a flag to defer power-off until all consumers probe
config: i386-buildonly-randconfig-r004-20230817 (https://download.01.org/0day-ci/archive/20230817/202308172244.FPrdz6b2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172244.FPrdz6b2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172244.FPrdz6b2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/domain.c:694: warning: Function parameter or member 'one_dev_probing' not described in 'genpd_power_off'


vim +694 drivers/base/power/domain.c

67c74b949b1785 Hector Martin   2023-04-24  679  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  680  /**
1f8728b7adc4c2 Ulf Hansson     2017-02-17  681   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  682   * @genpd: PM domain to power down.
3c64649d1cf9f3 Ulf Hansson     2017-02-17  683   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 Ulf Hansson     2017-02-17  684   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 Ulf Hansson     2017-02-17  685   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 Ulf Hansson     2017-02-17  686   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f Yang Yingliang  2021-05-12  687   * @depth: nesting count for lockdep.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  688   *
1f8728b7adc4c2 Ulf Hansson     2017-02-17  689   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 Ulf Hansson     2017-02-17  690   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  691   */
2da835452a0875 Ulf Hansson     2017-02-17  692  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
67c74b949b1785 Hector Martin   2023-04-24  693  			   bool one_dev_probing, unsigned int depth)
1f8728b7adc4c2 Ulf Hansson     2017-02-17 @694  {
1f8728b7adc4c2 Ulf Hansson     2017-02-17  695  	struct pm_domain_data *pdd;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  696  	struct gpd_link *link;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  697  	unsigned int not_suspended = 0;
f63816e43d9044 Ulf Hansson     2020-09-24  698  	int ret;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  699  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  700  	/*
1f8728b7adc4c2 Ulf Hansson     2017-02-17  701  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 Ulf Hansson     2017-02-17  702  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  703  	 * (2) System suspend is in progress.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  704  	 */
41e2c8e0060db2 Ulf Hansson     2017-03-20  705  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 Ulf Hansson     2017-02-17  706  		return 0;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  707  
ffaa42e8a40b7f Ulf Hansson     2017-03-20  708  	/*
ffaa42e8a40b7f Ulf Hansson     2017-03-20  709  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f Ulf Hansson     2017-03-20  710  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f Ulf Hansson     2017-03-20  711  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f Ulf Hansson     2017-03-20  712  	 */
ed61e18a4b4e44 Leonard Crestez 2019-04-30  713  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez 2019-04-30  714  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez 2019-04-30  715  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson     2017-02-17  716  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  717  
e7d90cfac5510f Ulf Hansson     2022-02-17  718  	/*
e7d90cfac5510f Ulf Hansson     2022-02-17  719  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f Ulf Hansson     2022-02-17  720  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f Ulf Hansson     2022-02-17  721  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f Ulf Hansson     2022-02-17  722  	 * lock to be acquired first.
e7d90cfac5510f Ulf Hansson     2022-02-17  723  	 */
e7d90cfac5510f Ulf Hansson     2022-02-17  724  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f Ulf Hansson     2022-02-17  725  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f Ulf Hansson     2022-02-17  726  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f Ulf Hansson     2022-02-17  727  			return -EBUSY;
e7d90cfac5510f Ulf Hansson     2022-02-17  728  	}
e7d90cfac5510f Ulf Hansson     2022-02-17  729  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  730  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 Ulf Hansson     2017-02-17  731  		/*
1f8728b7adc4c2 Ulf Hansson     2017-02-17  732  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 Ulf Hansson     2017-02-17  733  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 Ulf Hansson     2017-02-17  734  		 */
1f8728b7adc4c2 Ulf Hansson     2017-02-17  735  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a Ulf Hansson     2022-05-11  736  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 Ulf Hansson     2017-02-17  737  			not_suspended++;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  738  	}
1f8728b7adc4c2 Ulf Hansson     2017-02-17  739  
3c64649d1cf9f3 Ulf Hansson     2017-02-17  740  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 Ulf Hansson     2017-02-17  741  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  742  
67c74b949b1785 Hector Martin   2023-04-24  743  	/*
67c74b949b1785 Hector Martin   2023-04-24  744  	 * Do not allow PM domain to be powered off if it is marked
67c74b949b1785 Hector Martin   2023-04-24  745  	 * as GENPD_FLAG_DEFER_OFF and there are consumer devices
67c74b949b1785 Hector Martin   2023-04-24  746  	 * which have not probed yet.
67c74b949b1785 Hector Martin   2023-04-24  747  	 */
67c74b949b1785 Hector Martin   2023-04-24  748  	if (genpd_must_defer(genpd, one_dev_probing))
67c74b949b1785 Hector Martin   2023-04-24  749  		return -EBUSY;
67c74b949b1785 Hector Martin   2023-04-24  750  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  751  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 Ulf Hansson     2017-02-17  752  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 Ulf Hansson     2017-02-17  753  			return -EAGAIN;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  754  	}
1f8728b7adc4c2 Ulf Hansson     2017-02-17  755  
2c9b7f8772033c Ulf Hansson     2018-10-03  756  	/* Default to shallowest state. */
2c9b7f8772033c Ulf Hansson     2018-10-03  757  	if (!genpd->gov)
2c9b7f8772033c Ulf Hansson     2018-10-03  758  		genpd->state_idx = 0;
2c9b7f8772033c Ulf Hansson     2018-10-03  759  
f63816e43d9044 Ulf Hansson     2020-09-24  760  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 Ulf Hansson     2017-02-17  761  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson     2017-02-17  762  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  763  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  764  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad Lina Iyer       2020-10-15  765  	if (ret) {
c6a113b52302ad Lina Iyer       2020-10-15  766  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  767  		return ret;
c6a113b52302ad Lina Iyer       2020-10-15  768  	}
1f8728b7adc4c2 Ulf Hansson     2017-02-17  769  
49f618e1b669ef Ulf Hansson     2020-09-24  770  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 Thara Gopinath  2017-07-14  771  	genpd_update_accounting(genpd);
c6a113b52302ad Lina Iyer       2020-10-15  772  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  773  
8d87ae48ced2df Kees Cook       2020-07-08  774  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook       2020-07-08  775  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook       2020-07-08  776  		genpd_lock_nested(link->parent, depth + 1);
67c74b949b1785 Hector Martin   2023-04-24  777  		genpd_power_off(link->parent, false, false, depth + 1);
8d87ae48ced2df Kees Cook       2020-07-08  778  		genpd_unlock(link->parent);
1f8728b7adc4c2 Ulf Hansson     2017-02-17  779  	}
1f8728b7adc4c2 Ulf Hansson     2017-02-17  780  
1f8728b7adc4c2 Ulf Hansson     2017-02-17  781  	return 0;
1f8728b7adc4c2 Ulf Hansson     2017-02-17  782  }
1f8728b7adc4c2 Ulf Hansson     2017-02-17  783  

:::::: The code at line 694 was first introduced by commit
:::::: 1f8728b7adc4c2b351cda886a6916087595c9125 PM / Domains: Move genpd_power_off() above genpd_power_on()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
