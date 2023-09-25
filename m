Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B44479E3;
	Mon, 25 Sep 2023 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695646150; x=1727182150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aP6+oi2AUKO9/FFszEUgqP9Gkh1lk5KyVO++tQLihbc=;
  b=FBadyVPUfb70h50+yobHm8bMbB/TLFv100a4SxfGtNyYv0+BRMTTJv4d
   n6DUf86w1ur20WS4Mgz/eLj/ddv6AC7CEzechPr8TUjJJgSt3APFnIe9c
   bTlmQrYvoeVFCF5lNaeI5jgex74yAGvOWvBarmJ/HHygh1L0FM77wAD4T
   j1Ss94cCI1GCem+dY5AQACVIEccoUPq80hYA49EL1ofJsiV8Wzdao8a2F
   czZAOeaRsm4bFP+AitKQGnQ+KaLIAQe2vYfOW12O6cSrOuvZXN5zek3I2
   OKT9EJsywqsaZNICx4Hf654/9NgqgVyUBSTzXehXeiuYyWFHcPMaeJRcj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384001757"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="384001757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777641887"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="777641887"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2023 05:48:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkl1A-0001WP-11;
	Mon, 25 Sep 2023 12:48:52 +0000
Date: Mon, 25 Sep 2023 20:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ulf-hansson-pm:scmi_perf_v4_opp 22/28] drivers/opp/of.c:1081:28:
 warning: multiple unsequenced modifications to 'val'
Message-ID: <202309252030.nyCLRVuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linaro.org/people/ulf.hansson/linux-pm.git scmi_perf_v4_opp
head:   f9f7850176aef3f594af96ba9286bd1e93460b6f
commit: fcce70ca2008bb9b1786f957f5e64c8ffef7534b [22/28] OPP: Add dev_pm_opp_add_dynamic() to allow more flexibility
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20230925/202309252030.nyCLRVuB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252030.nyCLRVuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252030.nyCLRVuB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/of.c:1081:28: warning: multiple unsequenced modifications to 'val' [-Wunsequenced]
    1081 |                         .freq = be32_to_cpup(val++) * 1000,
         |                                                 ^
    1082 |                         .u_volt = be32_to_cpup(val++),
         |                                                   ~~
   1 warning generated.


vim +/val +1081 drivers/opp/of.c

  1039	
  1040	/* Initializes OPP tables based on old-deprecated bindings */
  1041	static int _of_add_opp_table_v1(struct device *dev, struct opp_table *opp_table)
  1042	{
  1043		const struct property *prop;
  1044		const __be32 *val;
  1045		int nr, ret = 0;
  1046	
  1047		mutex_lock(&opp_table->lock);
  1048		if (opp_table->parsed_static_opps) {
  1049			opp_table->parsed_static_opps++;
  1050			mutex_unlock(&opp_table->lock);
  1051			return 0;
  1052		}
  1053	
  1054		opp_table->parsed_static_opps = 1;
  1055		mutex_unlock(&opp_table->lock);
  1056	
  1057		prop = of_find_property(dev->of_node, "operating-points", NULL);
  1058		if (!prop) {
  1059			ret = -ENODEV;
  1060			goto remove_static_opp;
  1061		}
  1062		if (!prop->value) {
  1063			ret = -ENODATA;
  1064			goto remove_static_opp;
  1065		}
  1066	
  1067		/*
  1068		 * Each OPP is a set of tuples consisting of frequency and
  1069		 * voltage like <freq-kHz vol-uV>.
  1070		 */
  1071		nr = prop->length / sizeof(u32);
  1072		if (nr % 2) {
  1073			dev_err(dev, "%s: Invalid OPP table\n", __func__);
  1074			ret = -EINVAL;
  1075			goto remove_static_opp;
  1076		}
  1077	
  1078		val = prop->value;
  1079		while (nr) {
  1080			struct dev_pm_opp_data data = {
> 1081				.freq = be32_to_cpup(val++) * 1000,
  1082				.u_volt = be32_to_cpup(val++),
  1083			};
  1084	
  1085			ret = _opp_add_v1(opp_table, dev, &data, false);
  1086			if (ret) {
  1087				dev_err(dev, "%s: Failed to add OPP %ld (%d)\n",
  1088					__func__, data.freq, ret);
  1089				goto remove_static_opp;
  1090			}
  1091			nr -= 2;
  1092		}
  1093	
  1094		return 0;
  1095	
  1096	remove_static_opp:
  1097		_opp_remove_all_static(opp_table);
  1098	
  1099		return ret;
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
