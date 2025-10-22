Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AA2D2481;
	Wed, 22 Oct 2025 20:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165321; cv=none; b=Z3/tHWg8qKXnRNqWjs1Os8/fk4u7/8zDEOjQixzQ5WPkqOwxz3yq8hx1/SP0SBRe5upmRva/xEXWNRALFfLnpNZQkHYvkcpAGW2mrL5LBQvodgQzGkdfgsu5qe0KPmomiB1lu5bys85NPTBkveLoP/cAwzIfNdBXRVpAPWyNnEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165321; c=relaxed/simple;
	bh=PdvJqEIiH2wzUnpafgqRpAg6CaZ53CD2w/KF/eZGP4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7yiUeBWTJ2whYDxgpR+UbzYOpdcrPNQgv9Ydi6fJfX0vkZYj7t3LiThzlO02fSET/joZ4NBdXBlMZGOOvfvTa7UGIgZr/1XTOJ217RPsR7UXiYsa+Xo0leSpAslgujOitcc3kveIPOdngs9D/lo2XAIwRkkqC6LkiOjKR7Vyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2HxDOOG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2HxDOOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761165320; x=1792701320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdvJqEIiH2wzUnpafgqRpAg6CaZ53CD2w/KF/eZGP4I=;
  b=M2HxDOOG0CT/tmF7oQPX5h0rflQOk1lUAkmqUVD84mk9A2Q/oeKsBwJj
   moGwvg1v3rmNDRfvvUwgEtNLA2IqyUxbS9hlgOnBWB0p6hGCkJmfoNoZ+
   PBh79ExB8/7q558jYK60CX7DYnfBBdAWep3WEFsnUXjk6Lv/ogO4qh3lc
   lsWYuEzv5XipCCk1gIdq9KWzRFShNl5S599ZRccadbPmhOHWwBl5yCy+6
   XDpdJ6/NyXcll9NDAijKRGkE/jlvIj/xlGp2/+pJRmddy2uhvci8ob1Du
   XkRFNwm4vksoGumW8qf9dzoNsBWuyFTNbmD1lLjEizU98QbH9ATNeOUSw
   w==;
X-CSE-ConnectionGUID: tAbIIhy5RsOBzqrXFJWpsQ==
X-CSE-MsgGUID: nkXB1rHlStO1kBK/8U4LZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63420801"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63420801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 13:35:19 -0700
X-CSE-ConnectionGUID: LfOpIiFFQ+2PnM7cwYYU9Q==
X-CSE-MsgGUID: /A2fYzvtTXyeFmJdYGZPXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="183558992"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Oct 2025 13:35:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBfYB-000CiO-2M;
	Wed, 22 Oct 2025 20:35:15 +0000
Date: Thu, 23 Oct 2025 04:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:opp/linux-next 2/2] drivers/opp/of.c:1545:3: error:
 cannot jump from this goto statement to its label
Message-ID: <202510230410.vPtSOkAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   45a64ff434a027c296d1d5c35f442e51378c9425
commit: 45a64ff434a027c296d1d5c35f442e51378c9425 [2/2] OPP: Initialize scope-based pointers inline
config: arm-randconfig-004-20251022 (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230410.vPtSOkAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230410.vPtSOkAh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/opp/of.c:1545:3: error: cannot jump from this goto statement to its label
    1545 |                 goto register_em;
         |                 ^
   drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
         |                             ^
   drivers/opp/of.c:1539:3: error: cannot jump from this goto statement to its label
    1539 |                 goto failed;
         |                 ^
   drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
         |                             ^
   drivers/opp/of.c:1533:3: error: cannot jump from this goto statement to its label
    1533 |                 goto failed;
         |                 ^
   drivers/opp/of.c:1548:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1548 |         struct device_node *np __free(device_node) = of_node_get(dev->of_node);
         |                             ^
   3 errors generated.


vim +1545 drivers/opp/of.c

32bf8bc9a077680 Lukasz Luba    2022-03-02  1513  
a4f342b9607d8c2 Quentin Perret 2019-02-04  1514  /**
a4f342b9607d8c2 Quentin Perret 2019-02-04  1515   * dev_pm_opp_of_register_em() - Attempt to register an Energy Model
0e0ffa855d1590e Lukasz Luba    2020-05-27  1516   * @dev		: Device for which an Energy Model has to be registered
0e0ffa855d1590e Lukasz Luba    2020-05-27  1517   * @cpus	: CPUs for which an Energy Model has to be registered. For
0e0ffa855d1590e Lukasz Luba    2020-05-27  1518   *		other type of devices it should be set to NULL.
a4f342b9607d8c2 Quentin Perret 2019-02-04  1519   *
a4f342b9607d8c2 Quentin Perret 2019-02-04  1520   * This checks whether the "dynamic-power-coefficient" devicetree property has
a4f342b9607d8c2 Quentin Perret 2019-02-04  1521   * been specified, and tries to register an Energy Model with it if it has.
0e0ffa855d1590e Lukasz Luba    2020-05-27  1522   * Having this property means the voltages are known for OPPs and the EM
0e0ffa855d1590e Lukasz Luba    2020-05-27  1523   * might be calculated.
a4f342b9607d8c2 Quentin Perret 2019-02-04  1524   */
0e0ffa855d1590e Lukasz Luba    2020-05-27  1525  int dev_pm_opp_of_register_em(struct device *dev, struct cpumask *cpus)
a4f342b9607d8c2 Quentin Perret 2019-02-04  1526  {
32bf8bc9a077680 Lukasz Luba    2022-03-02  1527  	struct em_data_callback em_cb;
0e0ffa855d1590e Lukasz Luba    2020-05-27  1528  	int ret, nr_opp;
a4f342b9607d8c2 Quentin Perret 2019-02-04  1529  	u32 cap;
a4f342b9607d8c2 Quentin Perret 2019-02-04  1530  
0e0ffa855d1590e Lukasz Luba    2020-05-27  1531  	if (IS_ERR_OR_NULL(dev)) {
0e0ffa855d1590e Lukasz Luba    2020-05-27  1532  		ret = -EINVAL;
0e0ffa855d1590e Lukasz Luba    2020-05-27  1533  		goto failed;
0e0ffa855d1590e Lukasz Luba    2020-05-27  1534  	}
a4f342b9607d8c2 Quentin Perret 2019-02-04  1535  
0e0ffa855d1590e Lukasz Luba    2020-05-27  1536  	nr_opp = dev_pm_opp_get_opp_count(dev);
0e0ffa855d1590e Lukasz Luba    2020-05-27  1537  	if (nr_opp <= 0) {
0e0ffa855d1590e Lukasz Luba    2020-05-27  1538  		ret = -EINVAL;
0e0ffa855d1590e Lukasz Luba    2020-05-27  1539  		goto failed;
0e0ffa855d1590e Lukasz Luba    2020-05-27  1540  	}
a4f342b9607d8c2 Quentin Perret 2019-02-04  1541  
32bf8bc9a077680 Lukasz Luba    2022-03-02  1542  	/* First, try to find more precised Energy Model in DT */
32bf8bc9a077680 Lukasz Luba    2022-03-02  1543  	if (_of_has_opp_microwatt_property(dev)) {
32bf8bc9a077680 Lukasz Luba    2022-03-02  1544  		EM_SET_ACTIVE_POWER_CB(em_cb, _get_dt_power);
32bf8bc9a077680 Lukasz Luba    2022-03-02 @1545  		goto register_em;

:::::: The code at line 1545 was first introduced by commit
:::::: 32bf8bc9a077680566b2b4f88b9b46e6cc740179 OPP: Add support of "opp-microwatt" for EM registration

:::::: TO: Lukasz Luba <lukasz.luba@arm.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
