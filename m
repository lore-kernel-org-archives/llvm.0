Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008ED53B;
	Thu, 14 Dec 2023 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLAe4KiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702538043; x=1734074043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GN22NQP6pMAziWGVyIMCN9j8aXdvqe/Q9qp2AF7ybkA=;
  b=HLAe4KiPGaapf6YePGQldNbkywqQxigqUhU/V98g4sG5N7P218HIB0x2
   xqRJMcSC3megIo5L16SHhUnPIR3u0H6a115SwSfxFFyb5l5WCfCMcstsV
   10EiDBlu1XKfeHfVIetPMpXD6vVfM55h5vNt/Iu0HHsOgfO9vVl0Vj7/i
   ZOyUrWkEN7wigQA2mxE+DecwkH99oFK7tZr/am+izBaNYfGlw08ptVkPz
   54FVkrM7rzJp8FcCFf4qvSqYCqNoOGbgDm93FIMKRFDtHPE2pvWNHkbsV
   B2oAjXwyLSfuifRr10DG9GkHO2csdoVFcf0by/VlOy5Z3QVDZUGbNsjNA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393950395"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393950395"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 23:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="750421412"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="750421412"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2023 23:13:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDfuu-000Lj2-0F;
	Thu, 14 Dec 2023 07:13:56 +0000
Date: Thu, 14 Dec 2023 15:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil R <akhilrajeev@nvidia.com>, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-tegra@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH 3/5] crypto: tegra: Add Tegra Security Engine driver
Message-ID: <202312141448.599zJgqd-lkp@intel.com>
References: <20231213122030.11734-4-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213122030.11734-4-akhilrajeev@nvidia.com>

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on drm/drm-next arm64/for-next/core robh/for-next linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-crypto-Add-Tegra-SE-DT-binding-doc/20231213-202407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20231213122030.11734-4-akhilrajeev%40nvidia.com
patch subject: [PATCH 3/5] crypto: tegra: Add Tegra Security Engine driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231214/202312141448.599zJgqd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141448.599zJgqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141448.599zJgqd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/tegra/tegra-se-main.c:283:51: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     283 |                 dev_err(se->dev, "failed to set %d clock rate", i);
         |                                                                 ^
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/crypto/tegra/tegra-se-main.c:273:7: note: initialize the variable 'i' to silence this warning
     273 |         int i, ret;
         |              ^
         |               = 0
   1 warning generated.


vim +/i +283 drivers/crypto/tegra/tegra-se-main.c

   270	
   271	static int tegra_se_clk_init(struct tegra_se *se)
   272	{
   273		int i, ret;
   274	
   275		se->clk = devm_clk_get(se->dev, NULL);
   276		if (IS_ERR(se->clk)) {
   277			dev_err(se->dev, "failed to get clock\n");
   278			return PTR_ERR(se->clk);
   279		}
   280	
   281		ret = clk_set_rate(se->clk, ULONG_MAX);
   282		if (ret) {
 > 283			dev_err(se->dev, "failed to set %d clock rate", i);
   284			return ret;
   285		}
   286	
   287		ret = clk_prepare_enable(se->clk);
   288		if (ret) {
   289			dev_err(se->dev, "failed to enable clocks\n");
   290			return ret;
   291		}
   292	
   293		return 0;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
