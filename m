Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364820E4;
	Sun, 26 Mar 2023 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679862894; x=1711398894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2SKWQSmy7SbDivay5LBWiQSTeNxWz5WM9WDlpu4YmYg=;
  b=hLfIlWa5PVMVaiOANe0062bNtyiKvd2zSIn5eMbFjj9ml7GeKfMIH1yE
   IGB948xmX4jKYB45fDXhduS29JhljGo+dnI5N4R5TcjUIEq+hFBAocxNC
   VoqRjR564uUYOfKbTS6ejnpvEUoqMzPcEyg80o1shBbxGuenGNIUnf06p
   uTD++JZGeQiyyA6XtMFHU7vf+FOJdoXvp6Gg1CYkJehFkCZK5Rza/402r
   kIEVgWXdDNefxDsGaHzTUcaSIVyAIVtdbJH8I3/9gwmcfO3dOU1/jTThs
   /xSMvp7hc6dUnvFJRy8EDi81Hn8N2JkccP2v45QlkYi7zXl+6IZX2p0s5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426388052"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="426388052"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 13:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660650319"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="660650319"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2023 13:34:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgX4k-000HLS-2m;
	Sun, 26 Mar 2023 20:34:50 +0000
Date: Mon, 27 Mar 2023 04:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 4973/6819] drivers/base/power/domain.c:654:13:
 error: use of undeclared identifier 'pm_wq'
Message-ID: <202303270431.2GfB6Jso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Akhil,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5dbf24e8b9e6aa0a185d86ce46a7a9c79ebb40f
commit: c11fa1204fe9405d2a82a714d021360b865cf8bc [4973/6819] drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
config: powerpc-randconfig-r002-20230326 (https://download.01.org/0day-ci/archive/20230327/202303270431.2GfB6Jso-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c11fa1204fe9405d2a82a714d021360b865cf8bc
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c11fa1204fe9405d2a82a714d021360b865cf8bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303270431.2GfB6Jso-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/power/domain.c:654:13: error: use of undeclared identifier 'pm_wq'
           queue_work(pm_wq, &genpd->power_off_work);
                      ^
>> drivers/base/power/domain.c:853:26: error: no member named 'ignore_children' in 'struct dev_pm_info'
                   if (!dev || dev->power.ignore_children)
                               ~~~~~~~~~~ ^
>> drivers/base/power/domain.c:3090:17: error: no member named 'runtime_error' in 'struct dev_pm_info'
           if (dev->power.runtime_error)
               ~~~~~~~~~~ ^
>> drivers/base/power/domain.c:3092:22: error: no member named 'disable_depth' in 'struct dev_pm_info'
           else if (dev->power.disable_depth)
                    ~~~~~~~~~~ ^
>> drivers/base/power/domain.c:3094:22: error: no member named 'runtime_status' in 'struct dev_pm_info'
           else if (dev->power.runtime_status < ARRAY_SIZE(status_lookup))
                    ~~~~~~~~~~ ^
   drivers/base/power/domain.c:3095:32: error: no member named 'runtime_status' in 'struct dev_pm_info'
                   p = status_lookup[dev->power.runtime_status];
                                     ~~~~~~~~~~ ^
   6 errors generated.
--
>> drivers/base/power/domain_governor.c:85:18: error: no member named 'ignore_children' in 'struct dev_pm_info'
           if (!dev->power.ignore_children)
                ~~~~~~~~~~ ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
   Depends on [n]: PM [=n]
   Selected by [m]:
   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=m] || QCOM_COMMAND_DB [=m]=n)


vim +/pm_wq +654 drivers/base/power/domain.c

c8f0ea45169c57 Geert Uytterhoeven 2014-11-10  644  
29e47e2173349e Ulf Hansson        2015-09-02  645  /**
86e12eac1f7f84 Ulf Hansson        2016-12-08  646   * genpd_queue_power_off_work - Queue up the execution of genpd_power_off().
a3d09c73492e57 Moritz Fischer     2016-01-27  647   * @genpd: PM domain to power off.
29e47e2173349e Ulf Hansson        2015-09-02  648   *
86e12eac1f7f84 Ulf Hansson        2016-12-08  649   * Queue up the execution of genpd_power_off() unless it's already been done
29e47e2173349e Ulf Hansson        2015-09-02  650   * before.
29e47e2173349e Ulf Hansson        2015-09-02  651   */
29e47e2173349e Ulf Hansson        2015-09-02  652  static void genpd_queue_power_off_work(struct generic_pm_domain *genpd)
29e47e2173349e Ulf Hansson        2015-09-02  653  {
29e47e2173349e Ulf Hansson        2015-09-02 @654  	queue_work(pm_wq, &genpd->power_off_work);
29e47e2173349e Ulf Hansson        2015-09-02  655  }
29e47e2173349e Ulf Hansson        2015-09-02  656  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  657  /**
1f8728b7adc4c2 Ulf Hansson        2017-02-17  658   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  659   * @genpd: PM domain to power down.
3c64649d1cf9f3 Ulf Hansson        2017-02-17  660   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 Ulf Hansson        2017-02-17  661   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 Ulf Hansson        2017-02-17  662   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 Ulf Hansson        2017-02-17  663   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f Yang Yingliang     2021-05-12  664   * @depth: nesting count for lockdep.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  665   *
1f8728b7adc4c2 Ulf Hansson        2017-02-17  666   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 Ulf Hansson        2017-02-17  667   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  668   */
2da835452a0875 Ulf Hansson        2017-02-17  669  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
2da835452a0875 Ulf Hansson        2017-02-17  670  			   unsigned int depth)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  671  {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  672  	struct pm_domain_data *pdd;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  673  	struct gpd_link *link;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  674  	unsigned int not_suspended = 0;
f63816e43d9044 Ulf Hansson        2020-09-24  675  	int ret;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  676  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  677  	/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  678  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 Ulf Hansson        2017-02-17  679  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  680  	 * (2) System suspend is in progress.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  681  	 */
41e2c8e0060db2 Ulf Hansson        2017-03-20  682  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  683  		return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  684  
ffaa42e8a40b7f Ulf Hansson        2017-03-20  685  	/*
ffaa42e8a40b7f Ulf Hansson        2017-03-20  686  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f Ulf Hansson        2017-03-20  687  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  688  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f Ulf Hansson        2017-03-20  689  	 */
ed61e18a4b4e44 Leonard Crestez    2019-04-30  690  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  691  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 Leonard Crestez    2019-04-30  692  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  693  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  694  
e7d90cfac5510f Ulf Hansson        2022-02-17  695  	/*
e7d90cfac5510f Ulf Hansson        2022-02-17  696  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f Ulf Hansson        2022-02-17  697  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f Ulf Hansson        2022-02-17  698  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f Ulf Hansson        2022-02-17  699  	 * lock to be acquired first.
e7d90cfac5510f Ulf Hansson        2022-02-17  700  	 */
e7d90cfac5510f Ulf Hansson        2022-02-17  701  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f Ulf Hansson        2022-02-17  702  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f Ulf Hansson        2022-02-17  703  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f Ulf Hansson        2022-02-17  704  			return -EBUSY;
e7d90cfac5510f Ulf Hansson        2022-02-17  705  	}
e7d90cfac5510f Ulf Hansson        2022-02-17  706  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  707  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  708  		/*
1f8728b7adc4c2 Ulf Hansson        2017-02-17  709  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 Ulf Hansson        2017-02-17  710  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 Ulf Hansson        2017-02-17  711  		 */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  712  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a Ulf Hansson        2022-05-11  713  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  714  			not_suspended++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  715  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  716  
3c64649d1cf9f3 Ulf Hansson        2017-02-17  717  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  718  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  719  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  720  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 Ulf Hansson        2017-02-17  721  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 Ulf Hansson        2017-02-17  722  			return -EAGAIN;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  723  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  724  
2c9b7f8772033c Ulf Hansson        2018-10-03  725  	/* Default to shallowest state. */
2c9b7f8772033c Ulf Hansson        2018-10-03  726  	if (!genpd->gov)
2c9b7f8772033c Ulf Hansson        2018-10-03  727  		genpd->state_idx = 0;
2c9b7f8772033c Ulf Hansson        2018-10-03  728  
f63816e43d9044 Ulf Hansson        2020-09-24  729  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 Ulf Hansson        2017-02-17  730  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 Ulf Hansson        2017-02-17  731  		return -EBUSY;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  732  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  733  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad Lina Iyer          2020-10-15  734  	if (ret) {
c6a113b52302ad Lina Iyer          2020-10-15  735  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  736  		return ret;
c6a113b52302ad Lina Iyer          2020-10-15  737  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  738  
49f618e1b669ef Ulf Hansson        2020-09-24  739  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 Thara Gopinath     2017-07-14  740  	genpd_update_accounting(genpd);
c6a113b52302ad Lina Iyer          2020-10-15  741  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  742  
8d87ae48ced2df Kees Cook          2020-07-08  743  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  744  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  745  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  746  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  747  		genpd_unlock(link->parent);
1f8728b7adc4c2 Ulf Hansson        2017-02-17  748  	}
1f8728b7adc4c2 Ulf Hansson        2017-02-17  749  
1f8728b7adc4c2 Ulf Hansson        2017-02-17  750  	return 0;
1f8728b7adc4c2 Ulf Hansson        2017-02-17  751  }
1f8728b7adc4c2 Ulf Hansson        2017-02-17  752  
5248051b9afb66 Rafael J. Wysocki  2011-07-01  753  /**
8d87ae48ced2df Kees Cook          2020-07-08  754   * genpd_power_on - Restore power to a given PM domain and its parents.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  755   * @genpd: PM domain to power up.
0106ef5146f9e8 Marek Szyprowski   2016-01-20  756   * @depth: nesting count for lockdep.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  757   *
8d87ae48ced2df Kees Cook          2020-07-08  758   * Restore power to @genpd and all of its parents so that it is possible to
5248051b9afb66 Rafael J. Wysocki  2011-07-01  759   * resume a device belonging to it.
5248051b9afb66 Rafael J. Wysocki  2011-07-01  760   */
86e12eac1f7f84 Ulf Hansson        2016-12-08  761  static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
5248051b9afb66 Rafael J. Wysocki  2011-07-01  762  {
5063ce1571b738 Rafael J. Wysocki  2011-08-08  763  	struct gpd_link *link;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  764  	int ret = 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  765  
41e2c8e0060db2 Ulf Hansson        2017-03-20  766  	if (genpd_status_on(genpd))
3f241775c30365 Rafael J. Wysocki  2011-08-08  767  		return 0;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  768  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  769  	/*
5063ce1571b738 Rafael J. Wysocki  2011-08-08  770  	 * The list is guaranteed not to change while the loop below is being
8d87ae48ced2df Kees Cook          2020-07-08  771  	 * executed, unless one of the parents' .power_on() callbacks fiddles
5063ce1571b738 Rafael J. Wysocki  2011-08-08  772  	 * with it.
5063ce1571b738 Rafael J. Wysocki  2011-08-08  773  	 */
8d87ae48ced2df Kees Cook          2020-07-08  774  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  775  		struct generic_pm_domain *parent = link->parent;
0106ef5146f9e8 Marek Szyprowski   2016-01-20  776  
8d87ae48ced2df Kees Cook          2020-07-08  777  		genpd_sd_counter_inc(parent);
0106ef5146f9e8 Marek Szyprowski   2016-01-20  778  
8d87ae48ced2df Kees Cook          2020-07-08  779  		genpd_lock_nested(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  780  		ret = genpd_power_on(parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  781  		genpd_unlock(parent);
5248051b9afb66 Rafael J. Wysocki  2011-07-01  782  
5063ce1571b738 Rafael J. Wysocki  2011-08-08  783  		if (ret) {
8d87ae48ced2df Kees Cook          2020-07-08  784  			genpd_sd_counter_dec(parent);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  785  			goto err;
5248051b9afb66 Rafael J. Wysocki  2011-07-01  786  		}
5063ce1571b738 Rafael J. Wysocki  2011-08-08  787  	}
5248051b9afb66 Rafael J. Wysocki  2011-07-01  788  
86e12eac1f7f84 Ulf Hansson        2016-12-08  789  	ret = _genpd_power_on(genpd, true);
9e08cf42969709 Rafael J. Wysocki  2011-08-08  790  	if (ret)
9e08cf42969709 Rafael J. Wysocki  2011-08-08  791  		goto err;
0140d8bd47f798 Rafael J. Wysocki  2011-12-01  792  
49f618e1b669ef Ulf Hansson        2020-09-24  793  	genpd->status = GENPD_STATE_ON;
afece3ab9a3640 Thara Gopinath     2017-07-14  794  	genpd_update_accounting(genpd);
afece3ab9a3640 Thara Gopinath     2017-07-14  795  
3f241775c30365 Rafael J. Wysocki  2011-08-08  796  	return 0;
9e08cf42969709 Rafael J. Wysocki  2011-08-08  797  
9e08cf42969709 Rafael J. Wysocki  2011-08-08  798   err:
29e47e2173349e Ulf Hansson        2015-09-02  799  	list_for_each_entry_continue_reverse(link,
8d87ae48ced2df Kees Cook          2020-07-08  800  					&genpd->child_links,
8d87ae48ced2df Kees Cook          2020-07-08  801  					child_node) {
8d87ae48ced2df Kees Cook          2020-07-08  802  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df Kees Cook          2020-07-08  803  		genpd_lock_nested(link->parent, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  804  		genpd_power_off(link->parent, false, depth + 1);
8d87ae48ced2df Kees Cook          2020-07-08  805  		genpd_unlock(link->parent);
29e47e2173349e Ulf Hansson        2015-09-02  806  	}
9e08cf42969709 Rafael J. Wysocki  2011-08-08  807  
3f241775c30365 Rafael J. Wysocki  2011-08-08  808  	return ret;
3f241775c30365 Rafael J. Wysocki  2011-08-08  809  }
3f241775c30365 Rafael J. Wysocki  2011-08-08  810  
ea71c59669f17d Ulf Hansson        2019-10-16  811  static int genpd_dev_pm_start(struct device *dev)
ea71c59669f17d Ulf Hansson        2019-10-16  812  {
ea71c59669f17d Ulf Hansson        2019-10-16  813  	struct generic_pm_domain *genpd = dev_to_genpd(dev);
ea71c59669f17d Ulf Hansson        2019-10-16  814  
ea71c59669f17d Ulf Hansson        2019-10-16  815  	return genpd_start_dev(genpd, dev);
ea71c59669f17d Ulf Hansson        2019-10-16  816  }
ea71c59669f17d Ulf Hansson        2019-10-16  817  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  818  static int genpd_dev_pm_qos_notifier(struct notifier_block *nb,
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  819  				     unsigned long val, void *ptr)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  820  {
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  821  	struct generic_pm_domain_data *gpd_data;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  822  	struct device *dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  823  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  824  	gpd_data = container_of(nb, struct generic_pm_domain_data, nb);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  825  	dev = gpd_data->base.dev;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  826  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  827  	for (;;) {
f38d1a6d002526 Ulf Hansson        2022-05-11  828  		struct generic_pm_domain *genpd = ERR_PTR(-ENODATA);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  829  		struct pm_domain_data *pdd;
66d29d802ef3bf Ulf Hansson        2022-05-11  830  		struct gpd_timing_data *td;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  831  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  832  		spin_lock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  833  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  834  		pdd = dev->power.subsys_data ?
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  835  				dev->power.subsys_data->domain_data : NULL;
b4883ca449473e Viresh Kumar       2017-05-16  836  		if (pdd) {
66d29d802ef3bf Ulf Hansson        2022-05-11  837  			td = to_gpd_data(pdd)->td;
f38d1a6d002526 Ulf Hansson        2022-05-11  838  			if (td) {
66d29d802ef3bf Ulf Hansson        2022-05-11  839  				td->constraint_changed = true;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  840  				genpd = dev_to_genpd(dev);
f38d1a6d002526 Ulf Hansson        2022-05-11  841  			}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  842  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  843  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  844  		spin_unlock_irq(&dev->power.lock);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  845  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  846  		if (!IS_ERR(genpd)) {
35241d12f750d2 Lina Iyer          2016-10-14  847  			genpd_lock(genpd);
f38d1a6d002526 Ulf Hansson        2022-05-11  848  			genpd->gd->max_off_time_changed = true;
35241d12f750d2 Lina Iyer          2016-10-14  849  			genpd_unlock(genpd);
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  850  		}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  851  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  852  		dev = dev->parent;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01 @853  		if (!dev || dev->power.ignore_children)
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  854  			break;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  855  	}
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  856  
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  857  	return NOTIFY_DONE;
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  858  }
6ff7bb0d02f829 Rafael J. Wysocki  2012-05-01  859  

:::::: The code at line 654 was first introduced by commit
:::::: 29e47e2173349ee06bd339f7753821c720d50923 PM / Domains: Try power off masters in error path of __pm_genpd_poweron()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
