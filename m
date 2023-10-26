Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357EE2DF90;
	Thu, 26 Oct 2023 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/sYG1UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698323723; x=1729859723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DIoPWLtOcqdIwIafgzx4Ooxy9UjJ9SD+sC1FwI6+syE=;
  b=B/sYG1UZzvOETN5DY3uyb3rddv+SabJZL6dwsrIhjKtK8rZornoQl4H2
   fQ5CLZqYzeq64nyHef90MbWORRnfdzucn60pE/N03RCUZZ+28NaAMSgz6
   S8gK3VQCzV/pc2zikC0ZieMyv3mS0yf2ugNp8+E2WHgW8B1MvC9iciVXJ
   XGJE68mvm2Xz0wiuYIbheWTclrY0iKMyzLLV3XE5dtzGAis86a79Fm53m
   78kWXekreIVmMJrSGeqsdMlnAumDq9P6wu9dAIGuYJIp1orpbQtlbTdp6
   1IGaUvi6Ra31iozTCsq7AaavoY4GQGZ56vZJ6XAjm5hJiMUTvWqGFW/bF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384735858"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="384735858"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 05:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="1006368162"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="1006368162"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 05:35:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvza2-0009md-1T;
	Thu, 26 Oct 2023 12:35:18 +0000
Date: Thu, 26 Oct 2023 20:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Sitnicki <jakub@cloudflare.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] genirq: Own affinity hint
Message-ID: <202310262054.v57mGz1Z-lkp@intel.com>
References: <20231025141517.375378-1-jakub@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025141517.375378-1-jakub@cloudflare.com>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/genirq-Own-affinity-hint/20231026-001606
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231025141517.375378-1-jakub%40cloudflare.com
patch subject: [PATCH] genirq: Own affinity hint
config: mips-malta_kvm_defconfig (https://download.01.org/0day-ci/archive/20231026/202310262054.v57mGz1Z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262054.v57mGz1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262054.v57mGz1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/irqdesc.c:75:1: warning: unused label 'err_pending_mask' [-Wunused-label]
   err_pending_mask:
   ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_pending_mask +75 kernel/irq/irqdesc.c

    68	
    69	#ifdef CONFIG_GENERIC_PENDING_IRQ
    70		if (!zalloc_cpumask_var_node(&desc->pending_mask, GFP_KERNEL, node))
    71			goto err_pending_mask;
    72	#endif
    73		return 0;
    74	
  > 75	err_pending_mask:
    76	#ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
    77		free_cpumask_var(desc->irq_common_data.effective_affinity);
    78	#endif
    79	err_effective_affinity:
    80		free_cpumask_var(desc->irq_common_data.affinity_hint);
    81	err_affinity_hint:
    82		free_cpumask_var(desc->irq_common_data.affinity);
    83	err_affinity:
    84		return -ENOMEM;
    85	}
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
