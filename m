Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5A0849C;
	Sat, 28 Jan 2023 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674942836; x=1706478836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7oU3DJF0JNzMtot3i3RGBhQ/tTptATyWLIXXM7b4k0=;
  b=lknFEVbbHkktQ7tlCb8qjgXHsikTDwckb87x4tOG+6qGAzDczMTtw7p/
   58roh/xdqxtPVdt2GoAsQ73sTr4hqU/hNbIufXuw1Xy30bzLAdoIaaL57
   1zZ+qzci/K0HNXW4hGB3ouwKkTrO/bTP0jhFP2jYIu+UEkutsbRdYwyap
   GM9UJ9inK3kmwLinVCYpShef4ikiboYvbhD4L3ljPncO/TL+9OeMVdGGG
   NP4dCmZqVCQjtYklcBAh+rb6Rh3vlU1OEfIAi1zVZludJDTbYzpduDbUp
   jWE5MEoKwrF1/0G5wuGaIIwr7FCy1z0Euii/dxZHs9HqEbwAzNh+OSqWU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="329467404"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="329467404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 13:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752368319"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="752368319"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 13:53:54 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLt90-00018u-05;
	Sat, 28 Jan 2023 21:53:54 +0000
Date: Sun, 29 Jan 2023 05:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/2] PM: domains: Skip disabling unused domains if
 provider has sync_state
Message-ID: <202301290508.UGRbj8v8-lkp@intel.com>
References: <20230127104054.895129-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127104054.895129-1-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/soc-qcom-rmphpd-Call-the-genpd-unused-power-off-sync-state-callback/20230128-180808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230127104054.895129-1-abel.vesa%40linaro.org
patch subject: [RFC PATCH v2 1/2] PM: domains: Skip disabling unused domains if provider has sync_state
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230129/202301290508.UGRbj8v8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a550a6ee3e0da4ce9e716305c628afa9a9d22362
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/soc-qcom-rmphpd-Call-the-genpd-unused-power-off-sync-state-callback/20230128-180808
        git checkout a550a6ee3e0da4ce9e716305c628afa9a9d22362
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/misc/mei/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/misc/mei/pci-me.c:17:
>> include/linux/pm_domain.h:419:15: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   static inline genpd_power_off_unused_sync_state(struct device *dev) {}
   ~~~~~~~~~~~~~ ^
>> include/linux/pm_domain.h:419:70: error: non-void function does not return a value [-Werror,-Wreturn-type]
   static inline genpd_power_off_unused_sync_state(struct device *dev) {}
                                                                        ^
   2 errors generated.


vim +/int +419 include/linux/pm_domain.h

   418	
 > 419	static inline genpd_power_off_unused_sync_state(struct device *dev) {}
   420	#endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
