Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7637020EE0;
	Tue, 22 Aug 2023 23:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692745849; x=1724281849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3c2oE48QdtSIDfdgYyeQETAU7cBTOr2uHvBC3KHuxjw=;
  b=Oy3H4frHtzWN7hGSdfTaOCk64jYAVPsP0yDveqNjcYvWkIN3gdZv/GoY
   MkMG5Vm6o0aspxFLArbPLPgH/99M+8w5TNyJdfT012m27D0HdjHz/e8p1
   G/WtEX1NYrvzyW3hxLAKDwbJHy24H0ESmJOx1VMCOA6gRDG3pU/WiZQpO
   tEdy/3FffOBhxTBKrbmpmOm5tMep4QC3zrP6giynRnP2PoK4Ir+bPbH1P
   Kl6ZPIXDYxwzF5FPGjruKYFqp8nTm4KTvZO46ZdY+W7b4OOAiryCx6vo1
   VkARoINlR3zUP92YA8dUPZCZGL86+VfbCDKj8j3yAV3bxgno0WlR46Yb0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405015238"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="405015238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 16:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="736414493"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="736414493"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 16:10:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYaWI-0000bs-1u;
	Tue, 22 Aug 2023 23:10:42 +0000
Date: Wed, 23 Aug 2023 07:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	manivannan.sadhasivam@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, helgaas@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_ramkri@quicinc.com, quic_parass@quicinc.com,
	krzysztof.kozlowski@linaro.org,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"(open list:OPERATING PERFORMANCE POINTS (OPP))" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] OPP: Add api to retrieve opps which is at most
 the provided level
Message-ID: <202308230637.gz3wmjrT-lkp@intel.com>
References: <1692717141-32743-4-git-send-email-quic_krichai@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692717141-32743-4-git-send-email-quic_krichai@quicinc.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on robh/for-next rafael-pm/linux-next linus/master v6.5-rc7 next-20230822]
[cannot apply to pci/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-chaitanya-chundru/dt-bindings-pci-qcom-Add-opp-table/20230822-232104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/1692717141-32743-4-git-send-email-quic_krichai%40quicinc.com
patch subject: [PATCH v4 3/4] OPP: Add api to retrieve opps which is at most the provided level
config: x86_64-randconfig-073-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230637.gz3wmjrT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230637.gz3wmjrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230637.gz3wmjrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/opp/core.c:756: warning: Function parameter or member 'level' not described in 'dev_pm_opp_find_level_floor'
>> drivers/opp/core.c:756: warning: Excess function parameter 'freq' description in 'dev_pm_opp_find_level_floor'
   drivers/opp/core.c:2025: warning: Function parameter or member 'opp_table' not described in '_opp_set_supported_hw'
   drivers/opp/core.c:2025: warning: Excess function parameter 'dev' description in '_opp_set_supported_hw'
   drivers/opp/core.c:2068: warning: Function parameter or member 'opp_table' not described in '_opp_set_prop_name'
   drivers/opp/core.c:2068: warning: Excess function parameter 'dev' description in '_opp_set_prop_name'
   drivers/opp/core.c:2109: warning: Function parameter or member 'opp_table' not described in '_opp_set_regulators'
   drivers/opp/core.c:2109: warning: Excess function parameter 'count' description in '_opp_set_regulators'
   drivers/opp/core.c:2213: warning: Function parameter or member 'opp_table' not described in '_opp_set_clknames'
   drivers/opp/core.c:2213: warning: Function parameter or member 'config_clks' not described in '_opp_set_clknames'
   drivers/opp/core.c:2311: warning: Function parameter or member 'opp_table' not described in '_opp_set_config_regulators_helper'
   drivers/opp/core.c:2375: warning: Function parameter or member 'opp_table' not described in '_opp_attach_genpd'
   drivers/opp/core.c:2602: warning: Function parameter or member 'token' not described in 'dev_pm_opp_clear_config'
   drivers/opp/core.c:2602: warning: Excess function parameter 'opp_table' description in 'dev_pm_opp_clear_config'


vim +756 drivers/opp/core.c

   734	
   735	
   736	/**
   737	 * dev_pm_opp_find_level_floor() - Search for a rounded floor freq
   738	 * @dev:	device for which we do this operation
   739	 * @freq:	Start level
   740	 *
   741	 * Search for the matching floor *available* OPP from a starting level
   742	 * for a device.
   743	 *
   744	 * Return: matching *opp and refreshes *level accordingly, else returns
   745	 * ERR_PTR in case of error and should be handled using IS_ERR. Error return
   746	 * values can be:
   747	 * EINVAL:	for bad pointer
   748	 * ERANGE:	no match found for search
   749	 * ENODEV:	if device not found in list of registered devices
   750	 *
   751	 * The callers are required to call dev_pm_opp_put() for the returned OPP after
   752	 * use.
   753	 */
   754	struct dev_pm_opp *dev_pm_opp_find_level_floor(struct device *dev,
   755						      unsigned long *level)
 > 756	{
   757		return _find_key_floor(dev, level, 0, true, _read_level, NULL);
   758	}
   759	EXPORT_SYMBOL_GPL(dev_pm_opp_find_level_floor);
   760	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
