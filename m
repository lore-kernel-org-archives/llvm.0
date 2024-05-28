Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F79C16F850;
	Tue, 28 May 2024 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902205; cv=none; b=iBcMJJOBABK/dczTNUBR1fX7GvEH6I3Arn8mGuRoBQ7wHC7iU7tAU0D+NK4KmasL1METQZpzDwbtUhzRuwtjCBKhKdnfOWw3jWcQva4ATWxkUFw5pne8K04cOkPVukiu77sRy8pF9HmU0SXeGlLwMiMD1Xcl4EO6agClN3LUszU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902205; c=relaxed/simple;
	bh=tP9LNLHcHcid8pBq2Y+wDHSSdjrKRVd8ZjilPzbswnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYJMJ/R7AZeBb1ZfxAcEJwCQcRKg6LbWJQbc6tfHbiHRgDyTeCmmwBTvRYp7+Qxzka+Vr/kZCmjCGMRwvdqm+KXt/xJOKXVKHiIb1vjkw0KK3DarvWZablsF9QmjVk3WdcTzkaznfHjTPli9inMHFcGeYL14gjGzTaIaCj2vAHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cCCp0jSF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCCp0jSF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716902202; x=1748438202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tP9LNLHcHcid8pBq2Y+wDHSSdjrKRVd8ZjilPzbswnE=;
  b=cCCp0jSFvxZT6u1WvjwYx2FwGvWQWAOjGwFx/+tFdwdoWpQTfKrg1p6m
   4VUeYEZJl5A20Z1Hbn9YQ1iX3bSBJGykTNju0hgdjYS8wdcP10y/7zvd1
   Rz8qoEW5XX3jX/EcuP0cCnlkBjGzhIU1/x54ezccj48CQQA6IdFi6yMwz
   2vTOEElFW/4LXH/7JObW/dAbUkoaSrj+wJnJY8vA1v8KoYMxNoa1o93ke
   jvxThY57w+vxrXnVzW99ENP3SASDcel6rLFxFOPLTg93UYntkAS0tEUZM
   fBc20Cr1H+zEm0lzlaSLRgx28whmINs0mZYUspBOKs7EN+hcomWCgwA1N
   w==;
X-CSE-ConnectionGUID: 551OQc4rT2mCdh2chQTUyw==
X-CSE-MsgGUID: uioFgdQ2RPmWr6vUhqsCsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13016929"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="13016929"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 06:16:40 -0700
X-CSE-ConnectionGUID: oAOqOddLRqGQgH5dTxqg+w==
X-CSE-MsgGUID: 5MmUvP+QSB2ns0Y4VCSVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="34983502"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2024 06:16:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBwgr-000CDP-1B;
	Tue, 28 May 2024 13:16:33 +0000
Date: Tue, 28 May 2024 21:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, frank.li@nxp.com, will@kernel.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, john.g.garry@oracle.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mike.leach@linaro.org, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, alexander.shishkin@linux.intel.com,
	adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v11 2/8] perf: imx_perf: add macro definitions for
 parsing config attr
Message-ID: <202405282055.sHBcNC4i-lkp@intel.com>
References: <20240528160523.1695953-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528160523.1695953-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.10-rc1 next-20240528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/perf-imx_perf-add-macro-definitions-for-parsing-config-attr/20240528-160104
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240528160523.1695953-2-xu.yang_2%40nxp.com
patch subject: [PATCH v11 2/8] perf: imx_perf: add macro definitions for parsing config attr
config: arm-randconfig-003-20240528 (https://download.01.org/0day-ci/archive/20240528/202405282055.sHBcNC4i-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282055.sHBcNC4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282055.sHBcNC4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/perf/fsl_imx9_ddr_perf.c:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/arm/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/perf/fsl_imx9_ddr_perf.c:46:9: warning: 'CONFIG_COUNTER' macro redefined [-Wmacro-redefined]
      46 | #define CONFIG_COUNTER          GENMASK(15, 8)
         |         ^
   ./include/generated/autoconf.h:377:9: note: previous definition is here
     377 | #define CONFIG_COUNTER 1
         |         ^
   2 warnings generated.


vim +/CONFIG_COUNTER +46 drivers/perf/fsl_imx9_ddr_perf.c

    44	
    45	#define CONFIG_EVENT		GENMASK(7, 0)
  > 46	#define CONFIG_COUNTER		GENMASK(15, 8)
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
