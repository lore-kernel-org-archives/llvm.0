Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF44132C1D;
	Wed, 24 Jan 2024 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706124681; cv=none; b=QBZg7ZcRC8fOCudE+U3mF2Nm6hLKL1yHX6DTV/gtOtgrTvzQpWnOWwZgx/Ci1dpNbs3qhTnXUfKml90vnGLLoySEoZV7AO4zQWchDrA7f6kjFTl22uthBTkc3FMaEmibZT2WuDuPbqqu/3ZJ+Dyjn2rOHypAxs4vobH3oAJQPtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706124681; c=relaxed/simple;
	bh=73XVtEBs39drxusx/8gMJe4qsiK1ShG56vNRdf+yKP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UppThfBL7++r089d3qa3dEPJDDxWJt8qT6IU9ac8XtBmrlJ90kXUkxECCv5oFxus0hKHOoBMAGiK9iDhRp/VXsKkQxCuE/hH2q/kMHxuIe0ktpL0KphmjdfuVjTzIr8iFYtw/8MJgb7qgXxhF0FFBOF8jjkfzu/zRM99vmeV884=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNP3UBdM; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNP3UBdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706124675; x=1737660675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73XVtEBs39drxusx/8gMJe4qsiK1ShG56vNRdf+yKP0=;
  b=LNP3UBdMUd88dHCQ8vUxktG2q9XfIitN+QNpRjG/DU6vydBJtm+GyKOC
   sEKPYpK2wUnIdfE52Nu1POYAX0cnhkmjHhkvmU+2mp9cD5B1IasTfER3R
   9DnNmsTM206U4ZP7MnM0C4qW3UgVBMgj02QVNfs5TaexMCSgc2QA4THje
   2Gh/qjj1ESddll0pNZuwEcO0AITzUV97fmogGGavbDrdbEpDLGyKE3Uf9
   657GRSYMM5u2oaYPXCJESoBs7RXPrPx6KcRtg3ZVtIxdeCtTxucEVp+oK
   EN6T+qDAY0pKoHV5DEMgWDHrZeE0LIiIWuDukz2yXjEJHwneLa+OHf7l5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="466229285"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466229285"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 11:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905724627"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905724627"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2024 11:31:13 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSixq-0008Oj-2W;
	Wed, 24 Jan 2024 19:31:10 +0000
Date: Thu, 25 Jan 2024 03:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-6.9-sr-enforcement 1/74]
 drivers/pmdomain/core.c:701: warning: Function parameter or struct member
 'one_dev_probing' not described in 'genpd_power_off'
Message-ID: <202401250346.T6Prn9Im-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-6.9-sr-enforcement
head:   e0c44a4a7ce737f32e94c93b6b3466edef6ecfb1
commit: 4ed2cc4904f237890b53d2fa10c40ff6b49dc593 [1/74] Merge branch 'kvm-arm64/asahi-base-6.7' into kvm-arm64/asahi-base-6.8
config: i386-buildonly-randconfig-001-20240124 (https://download.01.org/0day-ci/archive/20240125/202401250346.T6Prn9Im-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401250346.T6Prn9Im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401250346.T6Prn9Im-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:701: warning: Function parameter or struct member 'one_dev_probing' not described in 'genpd_power_off'


vim +701 drivers/pmdomain/core.c

e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  686  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  687  /**
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  688   * genpd_power_off - Remove power from a given PM domain.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  689   * @genpd: PM domain to power down.
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  690   * @one_dev_on: If invoked from genpd's ->runtime_suspend|resume() callback, the
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  691   * RPM status of the releated device is in an intermediate state, not yet turned
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  692   * into RPM_SUSPENDED. This means genpd_power_off() must allow one device to not
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  693   * be RPM_SUSPENDED, while it tries to power off the PM domain.
763663c9715f5f drivers/base/power/domain.c Yang Yingliang  2021-05-12  694   * @depth: nesting count for lockdep.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  695   *
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  696   * If all of the @genpd's devices have been suspended and all of its subdomains
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  697   * have been powered down, remove power from @genpd.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  698   */
2da835452a0875 drivers/base/power/domain.c Ulf Hansson     2017-02-17  699  static int genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  700  			   bool one_dev_probing, unsigned int depth)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17 @701  {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  702  	struct pm_domain_data *pdd;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  703  	struct gpd_link *link;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  704  	unsigned int not_suspended = 0;
f63816e43d9044 drivers/base/power/domain.c Ulf Hansson     2020-09-24  705  	int ret;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  706  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  707  	/*
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  708  	 * Do not try to power off the domain in the following situations:
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  709  	 * (1) The domain is already in the "power off" state.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  710  	 * (2) System suspend is in progress.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  711  	 */
41e2c8e0060db2 drivers/base/power/domain.c Ulf Hansson     2017-03-20  712  	if (!genpd_status_on(genpd) || genpd->prepared_count > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  713  		return 0;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  714  
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  715  	/*
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  716  	 * Abort power off for the PM domain in the following situations:
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  717  	 * (1) The domain is configured as always on.
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  718  	 * (2) When the domain has a subdomain being powered on.
ffaa42e8a40b7f drivers/base/power/domain.c Ulf Hansson     2017-03-20  719  	 */
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  720  	if (genpd_is_always_on(genpd) ||
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  721  			genpd_is_rpm_always_on(genpd) ||
ed61e18a4b4e44 drivers/base/power/domain.c Leonard Crestez 2019-04-30  722  			atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  723  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  724  
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  725  	/*
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  726  	 * The children must be in their deepest (powered-off) states to allow
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  727  	 * the parent to be powered off. Note that, there's no need for
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  728  	 * additional locking, as powering on a child, requires the parent's
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  729  	 * lock to be acquired first.
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  730  	 */
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  731  	list_for_each_entry(link, &genpd->parent_links, parent_node) {
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  732  		struct generic_pm_domain *child = link->child;
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  733  		if (child->state_idx < child->state_count - 1)
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  734  			return -EBUSY;
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  735  	}
e7d90cfac5510f drivers/base/power/domain.c Ulf Hansson     2022-02-17  736  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  737  	list_for_each_entry(pdd, &genpd->dev_list, list_node) {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  738  		/*
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  739  		 * Do not allow PM domain to be powered off, when an IRQ safe
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  740  		 * device is part of a non-IRQ safe domain.
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  741  		 */
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  742  		if (!pm_runtime_suspended(pdd->dev) ||
7a02444b8fc25a drivers/base/power/domain.c Ulf Hansson     2022-05-11  743  			irq_safe_dev_in_sleep_domain(pdd->dev, genpd))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  744  			not_suspended++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  745  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  746  
3c64649d1cf9f3 drivers/base/power/domain.c Ulf Hansson     2017-02-17  747  	if (not_suspended > 1 || (not_suspended == 1 && !one_dev_on))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  748  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  749  
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  750  	/*
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  751  	 * Do not allow PM domain to be powered off if it is marked
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  752  	 * as GENPD_FLAG_DEFER_OFF and there are consumer devices
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  753  	 * which have not probed yet.
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  754  	 */
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  755  	if (genpd_must_defer(genpd, one_dev_probing))
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  756  		return -EBUSY;
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  757  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  758  	if (genpd->gov && genpd->gov->power_down_ok) {
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  759  		if (!genpd->gov->power_down_ok(&genpd->domain))
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  760  			return -EAGAIN;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  761  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  762  
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  763  	/* Default to shallowest state. */
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  764  	if (!genpd->gov)
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  765  		genpd->state_idx = 0;
2c9b7f8772033c drivers/base/power/domain.c Ulf Hansson     2018-10-03  766  
f63816e43d9044 drivers/base/power/domain.c Ulf Hansson     2020-09-24  767  	/* Don't power off, if a child domain is waiting to power on. */
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  768  	if (atomic_read(&genpd->sd_count) > 0)
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  769  		return -EBUSY;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  770  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  771  	ret = _genpd_power_off(genpd, true);
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  772  	if (ret) {
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  773  		genpd->states[genpd->state_idx].rejected++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  774  		return ret;
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  775  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  776  
49f618e1b669ef drivers/base/power/domain.c Ulf Hansson     2020-09-24  777  	genpd->status = GENPD_STATE_OFF;
afece3ab9a3640 drivers/base/power/domain.c Thara Gopinath  2017-07-14  778  	genpd_update_accounting(genpd);
c6a113b52302ad drivers/base/power/domain.c Lina Iyer       2020-10-15  779  	genpd->states[genpd->state_idx].usage++;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  780  
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  781  	list_for_each_entry(link, &genpd->child_links, child_node) {
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  782  		genpd_sd_counter_dec(link->parent);
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  783  		genpd_lock_nested(link->parent, depth + 1);
e3d58ff0b21577 drivers/base/power/domain.c Hector Martin   2023-04-24  784  		genpd_power_off(link->parent, false, false, depth + 1);
8d87ae48ced2df drivers/base/power/domain.c Kees Cook       2020-07-08  785  		genpd_unlock(link->parent);
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  786  	}
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  787  
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  788  	return 0;
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  789  }
1f8728b7adc4c2 drivers/base/power/domain.c Ulf Hansson     2017-02-17  790  

:::::: The code at line 701 was first introduced by commit
:::::: 1f8728b7adc4c2b351cda886a6916087595c9125 PM / Domains: Move genpd_power_off() above genpd_power_on()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
