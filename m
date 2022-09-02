Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E957CA55
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662086449; x=1693622449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rbQmJEo55j2XqsxEN/mx4l3iLojlYeK95mtxXgPj61k=;
  b=dyhY5MyUJ+Flqu57BLis9/LMdJjXIdzs5toqlTRXmDhtIu3Nx5o7RjDY
   sENoviSoOFKSCtBsJxQLc6qUHE+26uQBJiYAkxfszH0+wvWjsiQzMTP/p
   m2OaWEy9RY02YVL71jqn6dFDTNPth8oyoh69ZsOoblHfBGhATeQzVVJnT
   lwq3pa3AMpnL6o2cm0Uj0Io9MypUBBl8UMiOcniwf/J5wZC1xZyCzD2oz
   VC2jrb3fPCngBcWXjqi1C0LBNpflqRQ+lnlZS8s/7duHxcYj19JQi0/PH
   vTfP0ozF6DCM8ZOBrFj9388fWF6g0MuaMbXU+52kZTg7PU6t/NZ+efUjR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296660008"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="296660008"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 19:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="589841531"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Sep 2022 19:40:47 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTwbv-00001f-0X;
	Fri, 02 Sep 2022 02:40:47 +0000
Date: Fri, 2 Sep 2022 10:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [RFC PATCH v2 2/2] Fix per client busyness locking
Message-ID: <202209021008.CdocRSC0-lkp@intel.com>
References: <20220901235452.1004146-2-ashutosh.dixit@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901235452.1004146-2-ashutosh.dixit@intel.com>

Hi Ashutosh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Ashutosh-Dixit/i915-pmu-Wire-GuC-backend-to-per-client-busyness/20220902-075534
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220902/202209021008.CdocRSC0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b1db15edb2416229fdde749425de6a6ae7a4b94a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ashutosh-Dixit/i915-pmu-Wire-GuC-backend-to-per-client-busyness/20220902-075534
        git checkout b1db15edb2416229fdde749425de6a6ae7a4b94a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1512:5: warning: no previous prototype for function 'guc_context_update_stats' [-Wmissing-prototypes]
   u64 guc_context_update_stats(struct intel_context *ce, bool pin)
       ^
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1512:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 guc_context_update_stats(struct intel_context *ce, bool pin)
   ^
   static 
   1 warning generated.


vim +/guc_context_update_stats +1512 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

  1511	
> 1512	u64 guc_context_update_stats(struct intel_context *ce, bool pin)
  1513	{
  1514		struct intel_guc *guc = ce_to_guc(ce);
  1515		unsigned long flags;
  1516		u64 ret;
  1517	
  1518		if (pin) {
  1519			intel_context_pin(ce);
  1520		} else {
  1521			/* Return previously computed value */
  1522			spin_lock_irqsave(&guc->timestamp.lock, flags);
  1523			ret = ce->stats.runtime.total + ce->stats.active;
  1524			spin_unlock_irqrestore(&guc->timestamp.lock, flags);
  1525			return ret;
  1526		}
  1527	
  1528		spin_lock_irqsave(&guc->timestamp.lock, flags);
  1529		ret = __guc_context_update_stats(ce);
  1530		spin_unlock_irqrestore(&guc->timestamp.lock, flags);
  1531	
  1532		intel_context_unpin(ce);
  1533		return ret;
  1534	}
  1535	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
