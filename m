Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D38F41;
	Tue, 12 Sep 2023 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694522743; x=1726058743;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JORVoShSUssYanYhIK2ak04tDR05aXZaMKTmOofr+wI=;
  b=R/RRThZ8axKJYihl6VJpOwAzxDAX/cGAYUDO73ZggbvZ9UzEf8Av6no6
   4hB5lllwZVAjr4C0IsZbhRCsKQOhFRtZdNJzjpJcNDxutMkI9PqIAKadY
   q7dNP0udkePPUQ2Rj+xwXPDKnyLZWz1i13153ugg88uTaWfKob/LgEGH2
   KJ1eoZ/bB5EZhU/pS17o0hsX8Wq88i1gWbTmzTojRUjsAFZNghq+u2WIn
   coy/njIabR1QAZNfrWKmSvSo3l35Ze7fvyeDcLXygU/N7eL5tS9VjgLST
   pad9BQBCj5K2dn+1QXUyCjCR8vcUhRz2xsnQIuDS3QzWU+juizXpWYAg6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378274608"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="378274608"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 05:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="858797210"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="858797210"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 05:45:37 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg2lr-0000Nl-0H;
	Tue, 12 Sep 2023 12:45:35 +0000
Date: Tue, 12 Sep 2023 20:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lionel Debieve <lionel.debieve@foss.st.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v2 09/10] hwrng: stm32 - rework power management sequences
Message-ID: <202309122017.GsJspucF-lkp@intel.com>
References: <20230911120203.774632-10-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911120203.774632-10-gatien.chevallier@foss.st.com>

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on robh/for-next herbert-crypto-2.6/master herbert-cryptodev-2.6/master linus/master v6.6-rc1 next-20230912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-rng-introduce-new-compatible-for-STM32MP13x/20230912-051851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20230911120203.774632-10-gatien.chevallier%40foss.st.com
patch subject: [PATCH v2 09/10] hwrng: stm32 - rework power management sequences
config: arm64-randconfig-r003-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122017.GsJspucF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122017.GsJspucF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122017.GsJspucF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/stm32-rng.c:472:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     472 | static const struct __maybe_unused dev_pm_ops stm32_rng_pm_ops = {
         |                     ^
   include/linux/compiler_attributes.h:344:56: note: expanded from macro '__maybe_unused'
     344 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   include/linux/pm.h:286:8: note: previous definition is here
     286 | struct dev_pm_ops {
         |        ^
   1 warning generated.


vim +472 drivers/char/hw_random/stm32-rng.c

   471	
 > 472	static const struct __maybe_unused dev_pm_ops stm32_rng_pm_ops = {
   473		SET_RUNTIME_PM_OPS(stm32_rng_runtime_suspend,
   474				   stm32_rng_runtime_resume, NULL)
   475		SET_SYSTEM_SLEEP_PM_OPS(stm32_rng_suspend,
   476					stm32_rng_resume)
   477	};
   478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
